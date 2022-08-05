import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { Point } from "w3ts/handles/point";
import { Group } from "../../Group";
import { GameMap } from "../../../Game/GameMap";
import type { Unit } from "w3ts";
import type { DamageEvent } from "../DamageEvent";
import type { GargoyleCustomData } from "../../../Towers/Gargoyle/Gargoyle";
import { FortifiedVillager } from "../../../Creeps/Normal/FortifiedVillager";

const gargoyleUnitTypeId: number = FourCC('h009');
export class GargoyleWeakSplashDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) return;
        if (globals.DamageEventSourceUnitTypeId !== gargoyleUnitTypeId) return;
        if (!globals.IsDamageRanged) return;

        const trig: unit = globals.DamageEventSource as unit;
        const targ: unit = globals.DamageEventTarget as unit;
        const tower = GameMap.BUILT_TOWER_MAP.get(GetHandleId(trig));
        if (tower === undefined) return;

        const { hasSplash, hasIncreasedDamage, areaOfEffect, maxUnitCount, aoeDamage } = (tower.customData as GargoyleCustomData);
        if (!hasSplash) return;

        const x: number = GetUnitX(targ);
        const y: number = GetUnitY(targ);
        const loc: Point = new Point(x, y);
        const grp: Group = Group.fromRange(areaOfEffect, loc);
        let unitCount = 0;
        grp.for((u: Unit) => {
            if (unitCount >= maxUnitCount) return;
            if (u.owner.id !== 23) return;

            const unitId = u.id;
            if (unitId === globals.DamageEventSourceUnitId) return;

            unitCount++; // We purposefully want to count the immune FortifiedVillager here
            if (!hasIncreasedDamage) {
                const creep = GameMap.SPAWNED_CREEP_MAP.get(unitId);
                if (creep === undefined) return;
                if (creep.creepBaseUnit.name === FortifiedVillager.name) return;
            }

            u.damageTarget(u.handle, aoeDamage, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
        });
        grp.destroy();
        loc.destroy();
    }
}
