import { RoundCreepController } from "../Game/RoundCreepController";
import { Timer } from "../JassOverrides/Timer";
import { TimerUtils } from "../Utility/TimerUtils";
import { RegenUnit, regenUnitMap } from "./Modifiers/RegenModifier";

export class CreepRegenSystem {
    constructor(timerUtils: TimerUtils, roundCreepController: RoundCreepController) {
        const t: Timer = timerUtils.newTimer();
        t.start(0.1, true, () => {
            regenUnitMap.forEach((value: RegenUnit, key: number) => {
                const roundCreep = roundCreepController.get(key);
                if (roundCreep !== undefined && roundCreep.creep.parent !== null) {
                    value.remainingRegenTicks -= 0.1;
                    if (value.remainingRegenTicks <= 0) {
                        roundCreep.creep = roundCreep.creep.parent;
                        roundCreep.creep.apply(value.unit);
                        value.remainingRegenTicks = 1;
                    }
                }
            });
        });
    }
}