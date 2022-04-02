import { Timer } from "../JassOverrides/Timer";
import { Trigger } from "../JassOverrides/Trigger";
import { TimerUtils } from "../Utility/TimerUtils";
import { Spells } from "../Spells/Spells";
import { getRoundCreeps } from "./Rounds";
import { DamageEngineGlobals } from "../Utility/DamageEngine/DamageEngineGlobals";
import { DamageEngine } from "../Utility/DamageEngine/DamageEngine";
import { DamageEventController } from "../Utility/DamageEngine/DamageEventController";
import { RoundCreepController } from "./RoundCreepController";
import { Creep } from "../Creeps/Creep";
import { SpawnedCreep } from "../Creeps/SpawnedCreep";
import { Checkpoint } from "./Checkpoint";
import { GroupInRange } from "../JassOverrides/GroupInRange";
import { TowerSystem } from "./Frames";
import { Tower } from "../Towers/Tower";

export class Game {
    private readonly creepUnitId: number = FourCC('u000');
    private readonly timerUtils: TimerUtils;
    private readonly damageEngineGlobals: DamageEngineGlobals;
    private readonly damageEngine: DamageEngine;
    private readonly damageEventController: DamageEventController;
    private readonly roundCreepController: RoundCreepController;
    private readonly checkpoints: Checkpoint[];
    private readonly spells: Spells;
    private readonly towerSystem: TowerSystem;
    private readonly towers: Map<number, Tower> = new Map();

    constructor() {
        this.timerUtils = new TimerUtils();
        this.spells = new Spells();
        this.damageEngineGlobals = new DamageEngineGlobals();
        this.damageEngine = new DamageEngine(this.timerUtils, this.damageEngineGlobals);
        this.roundCreepController = new RoundCreepController();
        this.damageEventController = new DamageEventController(this.damageEngine, this.roundCreepController);
        this.towerSystem = new TowerSystem(this.towers);

        this.checkpoints = [
            // RED
            {x: -1792, y: 2048},
            {x: -1792, y: 2560},
            {x: -2304, y: 2560},
            {x: -2304, y: 1152},
            {x: -2816, y: 1152},
            {x: -2816, y: 1664},
            {x: -1408, y: 1664},
            {x: -1408, y: 2304},
            {x: -1024, y: 2304},
            {x: -1024, y: 1280},
            {x: -1920, y: 1280},

            // BLUE
            {x: -1920, y: -256},
            {x: -2816, y: -256},
            {x: -2816, y: -1280},
            {x: -2432, y: -1280},
            {x: -2432, y: -640},
            {x: -1024, y: -640},
            {x: -1024, y: -128},
            {x: -1536, y: -128},
            {x: -1536, y: -1536},
            {x: -2048, y: -1536},
            {x: -2048, y: -1024},
            
            // Teal
            {x: 1280, y: -1024},
            {x: 1280, y: -1536},
            {x: 768, y: -1536},
            {x: 768, y: -128},
            {x: 256, y: -128},
            {x: 256, y: -640},
            {x: 1664, y: -640},
            {x: 1664, y: -1280},
            {x: 2048, y: -1280},
            {x: 2048, y: -256},
            {x: 1152, y: -256},

            // Purple
            {x: 1152, y: 1280},
            {x: 256, y: 1280},
            {x: 256, y: 2304},
            {x: 640, y: 2304},
            {x: 640, y: 1664},
            {x: 2048, y: 1664},
            {x: 2048, y: 1152},
            {x: 1536, y: 1152},
            {x: 1536, y: 2560},
            {x: 1024, y: 2560},
            {x: 1024, y: 2048},
            
            // END
            {x: 2528, y: 2048},
        ];

        const constTrig: Trigger = new Trigger();
        constTrig.addAction(() => {
            const trig: unit = GetTriggerUnit();
            this.towers.set(GetHandleId(trig), new Tower(trig));
        });
        constTrig.registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START);

        const trig: Trigger = new Trigger();
        let disableTrig = false;
        let eff: effect;
        let eff2: effect;
        trig.addCondition(() => !disableTrig);
        trig.addAction(() => {
            const trig: unit = GetAttacker();
            const targ: widget = GetTriggerUnit();
            const loc: location = GetUnitLoc(trig);
            const range: number = BlzGetUnitWeaponRealField(trig, UNIT_WEAPON_RF_ATTACK_RANGE, 0);
            const group: GroupInRange = new GroupInRange(range, loc);
            let first: unit | null = null;
            let index = 0;
            group.for((u: unit) => {
                if (GetPlayerId(GetOwningPlayer(u)) !== 23 || !UnitAlive(u)) {
                    return;
                }

                const creep: Creep = this.roundCreepController.get(GetHandleId(u)) as Creep;
                const creepCheckpointIndex = creep.currentCheckpointIndex;
                if (creepCheckpointIndex < index) {
                    return;
                }

                if (first === null) {
                    first = u;
                    index = creepCheckpointIndex;
                    return;
                }

                if (creepCheckpointIndex < index) {
                    return;
                }

                if (creepCheckpointIndex > index) {
                    first = u;
                    index = creepCheckpointIndex;
                    return;
                }

                const checkpoint: Checkpoint = this.checkpoints[index];
                const x: number = GetUnitX(u);
                const y: number = GetUnitY(u);
                const fX: number = GetUnitX(first);
                const fY: number = GetUnitY(first);
                const d: number = Math.sqrt(Pow(x - checkpoint.x, 2) + Pow(y - checkpoint.y, 2));
                const fD: number = Math.sqrt(Pow(fX - checkpoint.x, 2) + Pow(fY - checkpoint.y, 2));

                if (d < fD) {
                    first = u;
                }
            });
            group.destroy();
            RemoveLocation(loc);

            if (first === null) {
                DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, `first === null... :c`);
                return;
            }

            DestroyEffect(eff);
            DestroyEffect(eff2);
            eff = AddSpecialEffectTarget('Abilities\\Spells\\Undead\\Curse\\CurseTarget.mdl', first, 'overhead');
            eff2 = AddSpecialEffectTarget('Units\\Undead\\PlagueCloud\\PlagueCloudtarget.mdl', targ, 'overhead');

            if (first === targ) {
                return;
            }

            // Issue new attack
            disableTrig = true;
            IssueTargetOrderById(trig, 851983, first as unknown as unit);
            disableTrig = false;
        });
        // trig.registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_ATTACKED);
        // BlzEnableSelections(true, false);
        // EnablePreSelect(false, false);
        // EVENT_UNIT_SELECTED
        // EVENT_PLAYER_UNIT_SELECTED

        for (let i = 0; i < this.checkpoints.length; i++) {
            const trig: Trigger = new Trigger();
            trig.addCondition(() => GetPlayerId(GetOwningPlayer(GetEnteringUnit())) === 23)

            const checkpoint: Checkpoint = this.checkpoints[i];
            const nextCheckpointIndex: number = i + 1;
            const nextCheckpoint: Checkpoint | null = i === this.checkpoints.length - 1 ? null : this.checkpoints[nextCheckpointIndex];
            trig.addAction(() => {
                const enteringUnit: unit = GetEnteringUnit();

                if (nextCheckpoint === null) {
                    // DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, `|cffff0000A life has been lost!|r`);
                    return RemoveUnit(enteringUnit);
                }

                (this.roundCreepController.get(GetHandleId(enteringUnit)) as Creep).setCheckpoint(nextCheckpoint, nextCheckpointIndex);
                IssuePointOrder(enteringUnit, 'move', nextCheckpoint.x, nextCheckpoint.y);
            });
            trig.registerEnterRectSimple(Rect(checkpoint.x - 32, checkpoint.y - 32, checkpoint.x + 32, checkpoint.y + 32));
        }
    }

    public start(): void {
        for (let i = 0; i < bj_MAX_PLAYERS; i++) {
            // SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 650);
            SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 9999999);
            FogModifierStart(CreateFogModifierRect(Player(i), FOG_OF_WAR_VISIBLE, GetPlayableMapRect(), false, false));
            SetPlayerAlliance(Player(23), Player(i), ALLIANCE_PASSIVE, true);
        }

        const t: Timer = this.timerUtils.newTimer();
        t.start(10, false, () => {
            this.spawnRounds();
        });
    }

    private spawnRounds(): void {
        const t: Timer = this.timerUtils.newTimer();
        let roundIndex = 0;
        let creepCount = 0;
        let creepIndex = 0;
        let tick = 0;
        t.start(0.03, true, () => {
            const round = getRoundCreeps(roundIndex);
            if (creepIndex >= round.length) {
                creepIndex = 0;
                roundIndex++;
                return;
            }
            
            tick += 0.03;

            const creepSpawnDetails = round[creepIndex];
            if (tick >= creepSpawnDetails.delay) {
                tick = 0;
                creepCount++;
                const creep: unit = CreateUnit(Player(23), this.creepUnitId, -3296, 2049, 0);
                const handleId: number = GetHandleId(creep);
                const initializedCreep = new creepSpawnDetails.creepType(new SpawnedCreep(this.checkpoints[0], 0));
                initializedCreep.apply(creep);
                this.roundCreepController.set(handleId, initializedCreep);
                IssuePointOrder(creep, 'move', this.checkpoints[0].x, this.checkpoints[0].y);

                if (creepCount > creepSpawnDetails.amount) {
                    creepIndex++;
                    creepCount = 0;
                }
            }
        });
    }
}