import { TimerUtils } from "../Utility/TimerUtils";
import { GameMap } from "../Game/GameMap";
import type { Timer } from "w3ts";

export interface RegenUnit {
    remainingRegenTicks: number;
}

export class CreepRegenSystem {
    public static readonly REGEN_UNIT_MAP: Map<number, RegenUnit> = new Map();

    constructor() {
        const t: Timer = TimerUtils.newTimer();
        t.start(0.1, true, () => {
            CreepRegenSystem.REGEN_UNIT_MAP.forEach((value: RegenUnit, key: number) => {
                const roundCreep = GameMap.SPAWNED_CREEP_MAP.get(key);
                if (roundCreep !== undefined) {
                    value.remainingRegenTicks -= 0.1;
                    if (value.remainingRegenTicks <= 0) {
                        roundCreep.regrow();
                        value.remainingRegenTicks = 1;
                    }
                }
            });
        });
    }
}
