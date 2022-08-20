import { TimerUtils } from "../Utility/TimerUtils";
import { Spells } from "../Spells/Spells";
import { getRoundCreeps } from "./Rounds";
import { DamageEngine } from "../Utility/DamageEngine/DamageEngine";
import { DamageEventController } from "../Utility/DamageEngine/DamageEventController";
import { TowerUpgradeSystem } from "./TowerUpgradeSystem";
import { CreepRegenSystem } from "../Creeps/CreepRegenSystem";
import { TowerController } from "../Towers/TowerController";
import { Effect, MapPlayer, Trigger, FogModifier, Unit } from "w3ts";
import { RandomNumberGenerator } from "../Utility/RandomNumberGenerator";
import { Commands } from "../Utility/Commands";
import { MapRegionController } from "./MapRegionController";
import { TowerAbilitySystem } from "../TowerAbilities/TowerAbilitySystem";
import { Sounds } from "../Utility/Sounds";
import { GameMap } from "./GameMap";
import { GameOptions } from "./GameOptions";
import { Creep } from "../Creeps/Creep";
import type { Checkpoint } from "../Utility/Checkpoint";
import type { Timer } from "w3ts";

const playerColors = [
    "ffff0303",
    "ff0042ff",
    "ff1ce6b9",
    "ff540081",
    "fffffc00",
    "fffe8a0e",
    "ff20c000",
    "ffe55bb0",
    "ff959697",
    "ff7ebff1",
    "ff106246",
    "ff4a2a04",
    "ff9b0000",
    "ff0000c3",
    "ff00eaff",
    "ffbe00fe",
    "ffebcd87",
    "fff8a48b",
    "ffbfff80",
    "ffdcb9eb",
    "ff282828",
    "ffebf0ff",
    "ff00781e",
    "ffa46f33"
];

export class Game {
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
        this.damageEngine = new DamageEngine();
        this.damageEventController = new DamageEventController();
        this.towerAbilitySystem = new TowerAbilitySystem();
        this.mapRegionController = new MapRegionController(this.gameOptions);
        this.towerController = new TowerController(this.towerAbilitySystem);
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
                spawnedCreep.nextCheckpointIndex = nextCheckpointIndex;
            });
            // TODO: PR to w3ts to add this
            TriggerRegisterEnterRectSimple(trig.handle, Rect(checkpoint.x - 32, checkpoint.y - 32, checkpoint.x + 32, checkpoint.y + 32));
        }
    }

    public start(): void {
        const playerLeavesTrig: Trigger = new Trigger();
        playerLeavesTrig.addAction(() => {
            DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 5, `|c${playerColors[GetPlayerId(GetTriggerPlayer())]}${GetPlayerName(GetTriggerPlayer())}|r has left the game!`);
        });

        for (let i = 0; i < bj_MAX_PLAYERS; i++) {
            const player = MapPlayer.fromIndex(i);
            const creepPlayer = MapPlayer.fromIndex(23);
            playerLeavesTrig.registerPlayerEvent(player, EVENT_PLAYER_LEAVE);
            if (player.slotState === PLAYER_SLOT_STATE_PLAYING && player.controller === MAP_CONTROL_USER) {
                GameMap.ONLINE_PLAYER_ID_LIST.push(i);

                new Commands(player);
                this.towerUpgradeSystem.addPlayer(player);

                player.setState(PLAYER_STATE_RESOURCE_GOLD, 650);
                // player.setState(PLAYER_STATE_RESOURCE_GOLD, 9999999);

                const radius = Math.max(Math.abs(this.gameMap.playableArea.maxX - this.gameMap.playableArea.minX), Math.abs(this.gameMap.playableArea.maxY - this.gameMap.playableArea.minY)) / 2;
                const fogModifier = new FogModifier(player, FOG_OF_WAR_VISIBLE, this.gameMap.playableArea.centerX, this.gameMap.playableArea.centerY, radius, false, false);
                fogModifier.start();
                creepPlayer.setAlliance(player, ALLIANCE_PASSIVE, true);
                const builder = new Unit(player, this.builderUnitTypeId, this.gameMap.playableArea.centerX, this.gameMap.playableArea.centerY, bj_UNIT_FACING);
                SelectUnitForPlayerSingle(builder.handle, player.handle);
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

            const currentGoldToDistribute = GameMap.PLAYER_GOLD_TO_DISTRIBUTE;
            if (currentGoldToDistribute > GameMap.ONLINE_PLAYER_ID_LIST.length) {
                GameMap.PLAYER_GOLD_TO_DISTRIBUTE = 0;
                const goldPerPlayer = Math.floor(currentGoldToDistribute / GameMap.ONLINE_PLAYER_ID_LIST.length);
                GameMap.PLAYER_GOLD_TO_DISTRIBUTE += currentGoldToDistribute % GameMap.ONLINE_PLAYER_ID_LIST.length;

                for (let i = 0; i < GameMap.ONLINE_PLAYER_ID_LIST.length; i++) {
                    const player = MapPlayer.fromIndex(GameMap.ONLINE_PLAYER_ID_LIST[i]);
                    player.setState(PLAYER_STATE_RESOURCE_GOLD, player.getState(PLAYER_STATE_RESOURCE_GOLD) + goldPerPlayer);
                }
            }

            if (creepCount >= round.creeps[creepIndex].amount) {
                creepIndex++;
                creepCount = 0;
            }

            if (creepIndex >= round.creeps.length) {
                GameMap.ROUND_INDEX++;
            }

            if (GameMap.ROUND_INDEX !== currentRound) {
                TimerUtils.releaseTimer(t);

                this.spawnRounds();
            }
        });
    }
}
