import {TimerUtils} from "../Utility/TimerUtils";
import {Spells} from "../Spells/Spells";
import {getRoundCreeps} from "./Rounds";
import {DamageEngineGlobals} from "../Utility/DamageEngine/DamageEngineGlobals";
import {DamageEngine} from "../Utility/DamageEngine/DamageEngine";
import {DamageEventController} from "../Utility/DamageEngine/DamageEventController";
import {RoundCreepController} from "./RoundCreepController";
import {SpawnedCreep} from "../Creeps/SpawnedCreep";
import {Checkpoint} from "../Utility/Checkpoint";
import {TowerUpgradeSystem} from "./TowerUpgradeSystem";
import {Tower} from "../Towers/Tower";
import {Modifier} from "../Creeps/Modifier";
import {CreepRegenSystem} from "../Creeps/CreepRegenSystem";
import {regenUnitMap} from "../Creeps/Modifiers/RegenModifier"
import {StunUtils} from "../Utility/StunUtils";
import {TowerController} from "../Towers/TowerController";
import {Effect, MapPlayer, Rectangle, Region, Timer, Trigger} from "w3ts";
import { RandomNumberGenerator } from "Utility/RandomNumberGenerator";
import {Commands} from "../Utility/Commands";
import {MapRegionController} from "./MapRegionController";
import { TowerAbilitySystem } from "../TowerAbilities/TowerAbilitySystem";
import { Sounds } from "Utility/Sounds";
import { GameMap } from "./GameMap";

export class Game {
    public roundIndex: number = 0;
    private readonly debugEnabled: boolean;
    private readonly timerUtils: TimerUtils;
    private readonly damageEngineGlobals: DamageEngineGlobals;
    private readonly damageEngine: DamageEngine;
    private readonly damageEventController: DamageEventController;
    private readonly roundCreepController: RoundCreepController;
    private readonly creepRegenSystem: CreepRegenSystem;
    private readonly stunUtils: StunUtils;
    private readonly spells: Spells;
    private readonly towerUpgradeSystem: TowerUpgradeSystem;
    private readonly towerAbilitySystem: TowerAbilitySystem;
    private readonly randomNumberGenerator: RandomNumberGenerator;
    private readonly commandHandler: Commands;
    private readonly towerController: TowerController;
    private readonly towers: Map<number, Tower> = new Map();
    private readonly mapRegionController: MapRegionController;
    private readonly playableArea: Rectangle = new Rectangle(-3328, 1024, -768, 3584);
    private readonly builderUnitTypeId: number = FourCC('u001');
    private readonly castleLocation: Checkpoint = {x: -3008, y: 2944};
    private readonly castleUnitTypeId: number = FourCC('h00H');
    private readonly castleUnit: unit;

    constructor() {
        this.debugEnabled = "Local Player" === MapPlayer.fromIndex(0).name;
        this.timerUtils = new TimerUtils();
        this.damageEngineGlobals = new DamageEngineGlobals();
        this.damageEngine = new DamageEngine(this.timerUtils, this.damageEngineGlobals);
        this.roundCreepController = new RoundCreepController();
        this.stunUtils = new StunUtils(this.timerUtils);
        this.damageEventController = new DamageEventController(this.damageEngine, this.roundCreepController, this.timerUtils, this.stunUtils, this.towers);
        this.randomNumberGenerator = new RandomNumberGenerator();
        this.towerAbilitySystem = new TowerAbilitySystem(this.timerUtils, this.towers, this.stunUtils);
        this.towerController = new TowerController(this.towerAbilitySystem, this.timerUtils, this.stunUtils, this.randomNumberGenerator, this.towers);
        this.towerUpgradeSystem = new TowerUpgradeSystem(this.towerController, this.towers);
        this.creepRegenSystem = new CreepRegenSystem(this.timerUtils, this.roundCreepController);
        this.spells = new Spells(this.towerAbilitySystem, this.towers);
        this.commandHandler = new Commands(this);

        this.castleUnit = CreateUnit(Player(23), this.castleUnitTypeId, this.castleLocation.x, this.castleLocation.y, bj_UNIT_FACING);

        this.mapRegionController = new MapRegionController(this.roundCreepController, this.debugEnabled);

        const deathTrig: Trigger = new Trigger();
        deathTrig.addAction(() => {
            const trig: unit = GetTriggerUnit();
            const trigHandleId: number = GetHandleId(trig);
            regenUnitMap.delete(trigHandleId);
            this.roundCreepController.delete(trigHandleId);
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
            const nextCheckpoint: Checkpoint | null = i === GameMap.CHECKPOINTS.length - 1 ? null : GameMap.CHECKPOINTS[nextCheckpointIndex];
            trig.addAction(() => {
                const enteringUnit: unit = GetEnteringUnit();

                if (nextCheckpoint === null) {
                    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, `|cffff0000A life has been lost!|r`);
                    Sounds.LOSE_A_LIFE.start();
                    return RemoveUnit(enteringUnit);
                }

                const spawnedCreep: SpawnedCreep = this.roundCreepController.get(GetHandleId(enteringUnit)) as SpawnedCreep;
                spawnedCreep.currentCheckpoint = nextCheckpoint;
                spawnedCreep.currentCheckpointIndex = nextCheckpointIndex;
                IssuePointOrder(enteringUnit, 'move', nextCheckpoint.x, nextCheckpoint.y);
            });
            // TODO: PR to w3ts to add this
            TriggerRegisterEnterRectSimple(trig.handle, Rect(checkpoint.x - 32, checkpoint.y - 32, checkpoint.x + 32, checkpoint.y + 32));
        }
    }

    public start(): void {
        for (let i = 0; i < bj_MAX_PLAYERS; i++) {
            if (GetPlayerSlotState(Player(i)) === PLAYER_SLOT_STATE_PLAYING && GetPlayerController(Player(i)) === MAP_CONTROL_USER) {
                // SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 650);
                SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 9999999);
                FogModifierStart(CreateFogModifierRect(Player(i), FOG_OF_WAR_VISIBLE, GetEntireMapRect(), false, false));
                SetPlayerAlliance(Player(23), Player(i), ALLIANCE_PASSIVE, true);
                const builder = CreateUnit(Player(i), this.builderUnitTypeId, this.playableArea.centerX, this.playableArea.centerY, bj_UNIT_FACING);
                SelectUnitForPlayerSingle(builder, Player(i));
            }
        }

        const t: Timer = this.timerUtils.newTimer();
        t.start(1, false, () => {
            Sounds.START_OF_GAME.start();
            t.start(7, false, () => {
                const eff = new Effect("Units/Demon/Infernal/InfernalBirth.mdl", this.castleLocation.x, this.castleLocation.y);
                eff.destroy();
                t.start(0.5, false, () => {
                    SetWidgetLife(this.castleUnit, 1);
                    Sounds.START_OF_GAME_2.start();
                    this.spawnRounds();
                    this.timerUtils.releaseTimer(t);
                });
            });
        });
    }

    private spawnRounds(): void {
        const t: Timer = this.timerUtils.newTimer();
        let creepCount = 0;
        let creepIndex = 0;
        let tick = 0;
        t.start(0.03, true, () => {
            const round = getRoundCreeps(this.roundIndex);
            if (creepIndex >= round.length) {
                creepIndex = 0;
                this.roundIndex++;
                return;
            }
            
            tick += 0.03;

            const creepSpawnDetails = round[creepIndex];
            if (tick >= creepSpawnDetails.delay) {
                tick = 0;
                creepCount++;
                const initializedCreepType = new creepSpawnDetails.creepType();
                for (let i = 0; creepSpawnDetails.modifiers !== undefined && i < creepSpawnDetails.modifiers.length; i++) {
                    (creepSpawnDetails.modifiers as Modifier[])[i].transform(initializedCreepType);
                }

                const creep: unit = CreateUnit(Player(23), initializedCreepType.unitTypeId, GameMap.CHECKPOINTS[0].x, GameMap.CHECKPOINTS[0].y, 0);
                SetUnitExploded(creep, true);
                const handleId: number = GetHandleId(creep);
                initializedCreepType.apply(creep);
                for (let i = 0; creepSpawnDetails.modifiers !== undefined && i < creepSpawnDetails.modifiers.length; i++) {
                    (creepSpawnDetails.modifiers as Modifier[])[i].apply(creep);
                }
                this.roundCreepController.set(handleId, new SpawnedCreep(initializedCreepType, creepSpawnDetails.modifiers, GameMap.CHECKPOINTS[0], 0));
                IssuePointOrder(creep, 'move', GameMap.CHECKPOINTS[0].x, GameMap.CHECKPOINTS[0].y);

                if (creepCount >= creepSpawnDetails.amount) {
                    creepIndex++;
                    creepCount = 0;
                }
            }
        });
    }
}