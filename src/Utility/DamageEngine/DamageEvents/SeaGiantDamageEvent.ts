import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { GroupInRange } from "../../../JassOverrides/GroupInRange";
import { TimerUtils } from "../../TimerUtils";
import { Timer } from "../../../JassOverrides/Timer";
import { ATTACK_TYPE_SIEGE } from "../GameSettings";

const seaGiantUnitTypeId: number = FourCC('h004');
export class SeaGiantDamageEvent implements DamageEvent {
    private readonly timerUtils: TimerUtils;
    
    constructor (timerUtils: TimerUtils) {
        this.timerUtils = timerUtils;
    }

    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        if (globals.DamageEventSourceUnitTypeId !== seaGiantUnitTypeId) {
            return;
        }

        if (globals.DamageEventAttackT !== ATTACK_TYPE_SIEGE) {
            return;
        }

        const trig: unit = globals.DamageEventSource as unit;
        const x: number = GetUnitX(globals.DamageEventTarget as unit);
        const y: number = GetUnitY(globals.DamageEventTarget as unit);

        let ticks = 8;
        const t: Timer = this.timerUtils.newTimer();
        t.start(0.1, true, () => {
            ticks--;

            const loc: location = Location(x + 150 * Math.cos(45 * ticks), y + 150 * Math.sin(45 * ticks));
            // DestroyEffect(AddSpecialEffectLoc('Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl', loc));
            DestroyEffect(AddSpecialEffectLoc('Abilities\\Weapons\\CannonTowerMissile\\CannonTowerMissile.mdl', loc));
            const grp: GroupInRange = new GroupInRange(200, loc);
            grp.for((u: unit) => {
                if (GetPlayerId(GetOwningPlayer(u)) !== 23) {
                    return;
                }

                UnitDamageTargetBJ(trig, u, 1, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL);
            });

            if (ticks <= 0) {
                this.timerUtils.releaseTimer(t);
            }
        });
    }
}
