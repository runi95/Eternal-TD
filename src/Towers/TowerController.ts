import { Timer } from "../JassOverrides/Timer";
import { Trigger } from "../JassOverrides/Trigger";
import { TimerUtils } from "../Utility/TimerUtils";
import { Tower } from "./Tower";
import { TowerType } from "./TowerType";
import towerTypeMap from "./TowerTypes";

const attackAbilityId: number = FourCC('Aatk');

export class TowerController {
    private readonly towers: Map<number, Tower>;
    private readonly timerUtils: TimerUtils;
    private readonly tickTowers: Map<number, Tower> = new Map();

    constructor(timerUtils: TimerUtils, towers: Map<number, Tower>) {
        this.timerUtils = timerUtils;
        this.towers = towers;

        const constTrig: Trigger = new Trigger();
        constTrig.addAction(() => {
            const trig: unit = GetTriggerUnit();

            BlzUnitDisableAbility(trig, attackAbilityId, false, true);
            const unitTypeId: number = GetUnitTypeId(trig);
            const towerType: TowerType | undefined = towerTypeMap.get(unitTypeId);
            if (towerType === undefined) {
                throw new Error(`Invalid argument; no TowerType of unitTypeId ${unitTypeId} exists!`);
            }

            const trigHandleId: number = GetHandleId(trig);
            const tower: Tower = new Tower(trig, towerType);
            this.towers.set(trigHandleId, tower);

            if (towerType.tick !== null) {
                this.tickTowers.set(trigHandleId, tower);
            }

            const t: Timer = this.timerUtils.newTimer();
            t.start(0.1, true, () => {
                this.tickTowers.forEach((tickTower: Tower) => {
                    (tickTower.towerType.tick as ((tower: Tower) => void))(tickTower);
                });
            });
        });
        constTrig.registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START);
    }
}