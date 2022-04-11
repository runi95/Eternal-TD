import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { TimerUtils } from "../../TimerUtils";
import { ATTACK_TYPE_SIEGE } from "../GameSettings";
import {Effect, Timer, Unit} from "w3ts";
import {GroupInRange} from "../../GroupInRange";
import {Point} from "w3ts/handles/point";
import {Group} from "../../Group";

const seaGiantUnitTypeId: number = FourCC('h004');
const clusterBombsAbilityId: number = FourCC('A005');
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
        const clusterBombsLevel: number = GetUnitAbilityLevel(trig, clusterBombsAbilityId);
        const x: number = GetUnitX(globals.DamageEventTarget as unit);
        const y: number = GetUnitY(globals.DamageEventTarget as unit);
        const userData: number = (GetUnitUserData(globals.DamageEventSource as unit) + 1) % 2;
        SetUnitUserData(globals.DamageEventSource as unit, userData);
        let explosiveDamage = 1;
        if (clusterBombsLevel === 3) {
            explosiveDamage += 4;
        }

        let ticks = 21;
        const t: Timer = this.timerUtils.newTimer();
        t.start(0.1, true, () => {
            ticks--;

            if (ticks > 12) {
                const loc: Point = new Point(x + 150 * CosBJ(45 * ticks), y + 150 * SinBJ(45 * ticks));
                const effect = new Effect('Objects\\Spawnmodels\\Human\\FragmentationShards\\FragBoomSpawn.mdl',loc.x, loc.y )
                effect.destroy()
                const grp: Group = GroupInRange(150, loc);
                grp.for((u: Unit) => {
                    if (u.owner.id !== 23) {
                        return;
                    }
                    u.damageTarget(u.handle, explosiveDamage, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                });
                grp.destroy();
                loc.destroy();
            } else if (clusterBombsLevel === 1 || (clusterBombsLevel === 2 && userData < 1)) {
                this.timerUtils.releaseTimer(t);
            } else if (ticks > 7) {
                // Wait...
            } else {
                const loc: Point = new Point(x + 200 * CosBJ(45 * ticks), y + 200 * SinBJ(45 * ticks));
                const effect = new Effect('Abilities\\Weapons\\CannonTowerMissile\\CannonTowerMissile.mdl',loc.x, loc.y )
                effect.destroy()
                const grp: Group = GroupInRange(340, loc);
                grp.for((u: Unit) => {
                    if (u.owner.id !== 23) {
                        return;
                    }
                    u.damageTarget(u.handle, explosiveDamage, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                });
                grp.destroy();
                loc.destroy();
            }

            if (ticks <= 0) {
                this.timerUtils.releaseTimer(t);
            }
        });
    }
}
