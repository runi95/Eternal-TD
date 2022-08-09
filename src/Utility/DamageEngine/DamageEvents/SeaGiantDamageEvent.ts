import { TimerUtils } from "../../TimerUtils";
import { Effect } from "w3ts";
import { Point } from "w3ts/handles/point";
import { Group } from "../../Group";
import type { Timer, Unit } from "w3ts";
import type { DamageEvent } from "../DamageEvent";
import type { SapperCustomData } from "../../../Towers/Sapper/Sapper";
import type { ExtendedDamageInstance } from "../DamageEventController";

const seaGiantUnitTypeId: number = FourCC('h004');
const clusterBombsAbilityId: number = FourCC('A005');
export class SeaGiantDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.tower === undefined) return;
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.sourceUnitTypeId !== seaGiantUnitTypeId) return;
        if (damageInstance.attackType !== ATTACK_TYPE_SIEGE) return;

        const clusterBombsLevel: number = GetUnitAbilityLevel(damageInstance.source, clusterBombsAbilityId);
        const x: number = GetUnitX(damageInstance.target);
        const y: number = GetUnitY(damageInstance.target);
        const userData: number = (GetUnitUserData(damageInstance.source) + 1) % 2;
        SetUnitUserData(damageInstance.source, userData);

        const { aoeDamage } = (damageInstance.tower.customData as SapperCustomData)

        let ticks = 21;
        const t: Timer = TimerUtils.newTimer();
        t.start(0.1, true, () => {
            ticks--;

            if (ticks > 12) {
                const loc: Point = new Point(x + 150 * CosBJ(45 * ticks), y + 150 * SinBJ(45 * ticks));
                const effect = new Effect('Objects/Spawnmodels/Human/FragmentationShards/FragBoomSpawn.mdl', loc.x, loc.y)
                effect.destroy()
                const grp: Group = Group.fromRange(150, loc);
                grp.for((u: Unit) => {
                    if (u.owner.id !== 23) {
                        return;
                    }
                    u.damageTarget(u.handle, aoeDamage, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                });
                grp.destroy();
                loc.destroy();
            } else if (clusterBombsLevel === 1 || (clusterBombsLevel === 2 && userData < 1)) {
                TimerUtils.releaseTimer(t);
            } else if (ticks > 7) {
                // Wait...
            } else {
                const loc: Point = new Point(x + 200 * CosBJ(45 * ticks), y + 200 * SinBJ(45 * ticks));
                const effect = new Effect('Abilities/Weapons/CannonTowerMissile/CannonTowerMissile.mdl', loc.x, loc.y)
                effect.destroy()
                const grp: Group = Group.fromRange(340, loc);
                grp.for((u: Unit) => {
                    if (u.owner.id !== 23) {
                        return;
                    }
                    u.damageTarget(u.handle, aoeDamage, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                });
                grp.destroy();
                loc.destroy();
            }

            if (ticks <= 0) {
                TimerUtils.releaseTimer(t);
            }
        });
    }
}
