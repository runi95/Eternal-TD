import { Point } from "w3ts/handles/point";
import { Group } from "../../Group";
import type { Unit } from "w3ts";
import type { DamageEvent } from "../DamageEvent";
import type { SapperCustomData } from "../../../Towers/Sapper/Sapper";
import type { ExtendedDamageInstance } from "../DamageEventController";

const sapperUnitTypeId: number = FourCC('h003');
const seaGiantUnitTypeId: number = FourCC('h004');
const wendigoUnitTypeId: number = FourCC('h005');
const skeletalOrcUnitTypeId: number = FourCC('h006');

// 120 splash
export class SapperDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.tower === undefined) return;
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.attackType !== ATTACK_TYPE_SIEGE) return;

        switch (damageInstance.sourceUnitTypeId) {
            case sapperUnitTypeId:
            case seaGiantUnitTypeId:
            case wendigoUnitTypeId:
            case skeletalOrcUnitTypeId:
                break;
            default:
                return;
        }

        const { areaOfEffect, maxUnitCount, aoeDamage } = damageInstance.tower.customData as SapperCustomData;
        const loc: Point = new Point(GetUnitX(damageInstance.target), GetUnitY(damageInstance.target));
        const grp: Group = Group.fromRange(areaOfEffect, loc);

        let unitCount = 0;
        grp.for((u: Unit) => {
            if (unitCount >= maxUnitCount) {
                return;
            }

            if (u.owner.id !== 23) {
                return;
            }

            if (u.id === damageInstance.targetUnitId) {
                return;
            }

            UnitDamageTarget(damageInstance.source, u.handle, aoeDamage, true, true, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
        });
        grp.destroy();
        loc.destroy();
    }
}
