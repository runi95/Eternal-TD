import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { GroupInRange } from "../../../JassOverrides/GroupInRange";
import { TimerUtils } from "../../TimerUtils";
import { Timer } from "../../../JassOverrides/Timer";
import { ATTACK_TYPE_SIEGE } from "../GameSettings";

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
                const loc: location = Location(x + 150 * CosBJ(45 * ticks), y + 150 * SinBJ(45 * ticks));
                DestroyEffect(AddSpecialEffectLoc('Objects\\Spawnmodels\\Human\\FragmentationShards\\FragBoomSpawn.mdl', loc));
                const grp: GroupInRange = new GroupInRange(150, loc);
                grp.for((u: unit) => {
                    if (GetPlayerId(GetOwningPlayer(u)) !== 23) {
                        return;
                    }

                    UnitDamageTargetBJ(trig, u, explosiveDamage, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL);
                });
                grp.destroy();
                RemoveLocation(loc);
            } else if (clusterBombsLevel === 1 || (clusterBombsLevel === 2 && userData < 1)) {
                this.timerUtils.releaseTimer(t);
            } else if (ticks > 7) {
                // Wait...
            } else {
                const loc: location = Location(x + 200 * CosBJ(45 * ticks), y + 200 * SinBJ(45 * ticks));
                DestroyEffect(AddSpecialEffectLoc('Abilities\\Weapons\\CannonTowerMissile\\CannonTowerMissile.mdl', loc));
                const grp: GroupInRange = new GroupInRange(340, loc);
                grp.for((u: unit) => {
                    if (GetPlayerId(GetOwningPlayer(u)) !== 23) {
                        return;
                    }

                    UnitDamageTargetBJ(trig, u, explosiveDamage, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL);
                });
                grp.destroy();
                RemoveLocation(loc);
            }

            if (ticks <= 0) {
                this.timerUtils.releaseTimer(t);
            }
        });
    }
}
