import { TimerUtils } from "../Utility/TimerUtils";
import { Spells } from "../Spells/Spells";
import { getRoundCreeps } from "./Rounds";
import { DamageEngineGlobals } from "../Utility/DamageEngine/DamageEngineGlobals";
import { DamageEngine } from "../Utility/DamageEngine/DamageEngine";
import { DamageEventController } from "../Utility/DamageEngine/DamageEventController";
import { Checkpoint } from "../Utility/Checkpoint";
import { TowerUpgradeSystem } from "./TowerUpgradeSystem";
import { CreepRegenSystem } from "../Creeps/CreepRegenSystem";
import { TowerController } from "../Towers/TowerController";
import { Effect, MapPlayer, Timer, Trigger } from "w3ts";
import { RandomNumberGenerator } from "Utility/RandomNumberGenerator";
import { Commands } from "../Utility/Commands";
import { MapRegionController } from "./MapRegionController";
import { TowerAbilitySystem } from "../TowerAbilities/TowerAbilitySystem";
import { Sounds } from "Utility/Sounds";
import { GameMap } from "./GameMap";
import { GameOptions } from "./GameOptions";
import { Creep } from "Creeps/Creep";

export class Game {
    private readonly damageEngineGlobals: DamageEngineGlobals;
    private readonly damageEngine: DamageEngine;
    private readonly damageEventController: DamageEventController;
    private readonly creepRegenSystem: CreepRegenSystem;
    private readonly spells: Spells;
    private readonly towerUpgradeSystem: TowerUpgradeSystem;
    private readonly towerAbilitySystem: TowerAbilitySystem;
    private readonly towerController: TowerController;
    private readonly mapRegionController: MapRegionController;
    private readonly builderUnitTypeId: number = FourCC('u001');
    private readonly castleLocation: Checkpoint = { x: -2560, y: 2368 };
    private readonly castleUnitTypeId: number = FourCC('h00H');
    private readonly castleUnit: unit;
    private readonly gameOptions: GameOptions;
    private readonly gameMap: GameMap;

    constructor() {
        this.gameOptions = new GameOptions();
        this.gameMap = new GameMap();
        this.damageEngineGlobals = new DamageEngineGlobals();
        this.damageEngine = new DamageEngine(this.damageEngineGlobals);
        this.damageEventController = new DamageEventController(this.damageEngine);
        this.towerAbilitySystem = new TowerAbilitySystem();
        this.mapRegionController = new MapRegionController(this.gameOptions);
        this.towerController = new TowerController(this.towerAbilitySystem, this.mapRegionController);
        this.towerUpgradeSystem = new TowerUpgradeSystem(this.towerController);

        this.creepRegenSystem = new CreepRegenSystem();

        this.spells = new Spells(this.towerAbilitySystem, this.towerUpgradeSystem);

        this.castleUnit = CreateUnit(Player(23), this.castleUnitTypeId, this.castleLocation.x, this.castleLocation.y, bj_UNIT_FACING);

        const deathTrig: Trigger = new Trigger();
        deathTrig.addAction(() => {
            const trig: unit = GetTriggerUnit();
            const trigHandleId: number = GetHandleId(trig);
            CreepRegenSystem.REGEN_UNIT_MAP.delete(trigHandleId);
            GameMap.SPAWNED_CREEP_MAP.delete(trigHandleId);
        });
        deathTrig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_DEATH);

        const meatWagonAutoAttackGroundTrigger: Trigger = new Trigger();
        const meatWagonUnitTypeId: number = FourCC('h00A');
        const attackAbilityId: number = FourCC('Aatk');
        meatWagonAutoAttackGroundTrigger.addCondition(() => GetUnitTypeId(GetAttacker()) === meatWagonUnitTypeId);
        meatWagonAutoAttackGroundTrigger.addAction(() => {
            const trig: unit = GetTriggerUnit();
            const attacker: unit = GetAttacker();
            const x: number = GetUnitX(trig);
            const y: number = GetUnitY(trig);

            // Not allowed to attack ground if attack is hidden
            BlzUnitDisableAbility(attacker, attackAbilityId, false, false);

            // Issue order to attack ground
            IssuePointOrderById(attacker, 851984, x, y);

            // Hide attack again
            BlzUnitDisableAbility(attacker, attackAbilityId, false, true);
        });
        meatWagonAutoAttackGroundTrigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED)

        for (let i = 0; i < GameMap.CHECKPOINTS.length; i++) {
            const trig: Trigger = new Trigger();
            trig.addCondition(() => GetPlayerId(GetOwningPlayer(GetEnteringUnit())) === 23)

            const checkpoint: Checkpoint = GameMap.CHECKPOINTS[i];
            const nextCheckpointIndex: number = i + 1;
            const isLastCheckpoint: boolean = i === GameMap.CHECKPOINTS.length - 1;
            trig.addAction(() => {
                const enteringUnit: unit = GetEnteringUnit();

                if (isLastCheckpoint) {
                    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, `|cffff0000A life has been lost!|r`);
                    Sounds.LOSE_A_LIFE.start();
                    RemoveUnit(enteringUnit);
                    return;
                }

                const spawnedCreep = GameMap.SPAWNED_CREEP_MAP.get(GetHandleId(enteringUnit));
                // spawnedCreep.currentCheckpoint = nextCheckpoint;
                spawnedCreep.nextCheckpointIndex = nextCheckpointIndex;
                // IssuePointOrder(enteringUnit, 'move', nextCheckpoint.x, nextCheckpoint.y);
            });
            // TODO: PR to w3ts to add this
            TriggerRegisterEnterRectSimple(trig.handle, Rect(checkpoint.x - 32, checkpoint.y - 32, checkpoint.x + 32, checkpoint.y + 32));
        }
    }

    public start(): void {
        for (let i = 0; i < bj_MAX_PLAYERS; i++) {
            if (GetPlayerSlotState(Player(i)) === PLAYER_SLOT_STATE_PLAYING && GetPlayerController(Player(i)) === MAP_CONTROL_USER) {
                GameMap.ONLINE_PLAYER_ID_LIST.push(i);
                new Commands(MapPlayer.fromIndex(i));

                SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 650);
                // SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 9999999);
                FogModifierStart(CreateFogModifierRect(Player(i), FOG_OF_WAR_VISIBLE, GetEntireMapRect(), false, false));
                SetPlayerAlliance(Player(23), Player(i), ALLIANCE_PASSIVE, true);
                const builder = CreateUnit(Player(i), this.builderUnitTypeId, this.gameMap.playableArea.centerX, this.gameMap.playableArea.centerY, bj_UNIT_FACING);
                SelectUnitForPlayerSingle(builder, Player(i));
            }
        }

        const t: Timer = TimerUtils.newTimer();
        t.start(1, false, () => {
            Sounds.START_OF_GAME.start();
            t.start(7, false, () => {
                const eff = new Effect("Units/Demon/Infernal/InfernalBirth.mdl", this.castleLocation.x, this.castleLocation.y);
                eff.destroy();
                t.start(0.5, false, () => {
                    SetWidgetLife(this.castleUnit, 1);
                    Sounds.START_OF_GAME_2.start();
                    this.spawnRounds();
                    TimerUtils.releaseTimer(t);
                });
            });
        });
    }

    private spawnRounds(): void {
        const t: Timer = TimerUtils.newTimer();
        const currentRound = GameMap.ROUND_INDEX;
        const round = getRoundCreeps(currentRound);
        const modifiers = [];
        const availableModifiers = [...GameMap.AVAILABLE_MODIFIERS];
        if (round.newModifier) {
            GameMap.AVAILABLE_MODIFIERS.push(round.newModifier);
            modifiers.push(round.newModifier);
        }

        for (let i = 0; i < GameMap.MAXIMUM_CREEP_MODIFIER_COUNT && availableModifiers.length > 0; i++) {
            const randomModifierIndex = RandomNumberGenerator.random(0, availableModifiers.length);
            modifiers.push(availableModifiers[randomModifierIndex]);
            availableModifiers.splice(randomModifierIndex, 1);
        }

        let creepCount = 0;
        let creepIndex = 0;
        t.start(0.9, true, () => {
            creepCount++;
            const creepSpawnDetails = round.creeps[creepIndex];
            Creep.spawn(creepSpawnDetails.creepType, modifiers);

            if (creepCount >= round.creeps[creepIndex].amount) {
                creepIndex++;
                creepCount = 0;
            }

            if (creepIndex >= round.creeps.length) {
                GameMap.ROUND_INDEX++;
            }

            if (GameMap.ROUND_INDEX !== currentRound) {
                TimerUtils.releaseTimer(t);

                const currentGoldToDistribute = GameMap.PLAYER_GOLD_TO_DISTRIBUTE;
                GameMap.PLAYER_GOLD_TO_DISTRIBUTE = 0;
                const goldPerPlayer = Math.floor(currentGoldToDistribute / GameMap.ONLINE_PLAYER_ID_LIST.length);
                GameMap.PLAYER_GOLD_TO_DISTRIBUTE += currentGoldToDistribute % GameMap.ONLINE_PLAYER_ID_LIST.length;

                for (let i = 0; i < GameMap.ONLINE_PLAYER_ID_LIST.length; i++) {
                    const player = MapPlayer.fromIndex(GameMap.ONLINE_PLAYER_ID_LIST[i]);
                    player.setState(PLAYER_STATE_RESOURCE_GOLD, player.getState(PLAYER_STATE_RESOURCE_GOLD) + goldPerPlayer);
                }

                this.spawnRounds();
            }
        });
    }
}
