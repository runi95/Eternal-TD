import { Point } from "w3ts/handles/point";
import { Group } from "../../Group";
import { GameMap } from "../../../Game/GameMap";
import { FortifiedVillager } from "../../../Creeps/Normal/FortifiedVillager";
import type { Unit } from "w3ts";
import type { DamageEvent } from "../DamageEvent";
import type { GargoyleCustomData } from "../../../Towers/Gargoyle/Gargoyle";
import type { ExtendedDamageInstance } from "../DamageEventController";

const gargoyleUnitTypeId: number = FourCC('h009');
export class GargoyleWeakSplashDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.tower === undefined) return;
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.sourceUnitTypeId !== gargoyleUnitTypeId) return;
        if (!damageInstance.isRanged) return;

        const { hasSplash, hasIncreasedDamage, areaOfEffect, maxUnitCount, aoeDamage } = (damageInstance.tower.customData as GargoyleCustomData);
        if (!hasSplash) return;

        const x: number = GetUnitX(damageInstance.target);
        const y: number = GetUnitY(damageInstance.target);
        const loc: Point = new Point(x, y);
        const grp: Group = Group.fromRange(areaOfEffect, loc);
        let unitCount = 0;
        grp.for((u: Unit) => {
            if (unitCount >= maxUnitCount) return;
            if (u.owner.id !== 23) return;

            const unitId = u.id;
            if (unitId === damageInstance.sourceUnitId) return;

            unitCount++; // We purposefully want to count the immune FortifiedVillager here
            if (!hasIncreasedDamage) {
                const creep = GameMap.SPAWNED_CREEP_MAP.get(unitId);
                if (creep === undefined) return;
                if (creep.creepBaseUnit.name === FortifiedVillager.name) return;
            }

            damageInstance.tower.unit.damageTarget(u.handle, aoeDamage, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
        });
        grp.destroy();
        loc.destroy();
    }
}
