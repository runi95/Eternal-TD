import { Point } from "w3ts/handles/point";
import { Group } from "../../Group";
import { StunUtils } from "../../StunUtils";
import { ObsidianStatueCustomData } from "../../../Towers/ObsidianStatue/ObsidianStatue";
import { DefenseTypes } from "../../../Creeps/DefenseTypes";
import { GameMap } from "../../../Game/GameMap";
import { InvisibilityModifier } from "../../../Creeps/Modifiers/InvisibilityModifier";
import { FortifiedVillager } from "../../../Creeps/Normal/FortifiedVillager";
import { Unit } from "w3ts";
import { MapRegionController } from "../../../Game/MapRegionController";
import type { DamageEvent } from "../DamageEvent";
import type { ExtendedDamageInstance } from "../DamageEventController";

const frostWyrmUnitTypeId: number = FourCC('h00G');
export class FrostWyrmDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.tower === undefined) return;
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.sourceUnitTypeId !== frostWyrmUnitTypeId) return;
        if (damageInstance.attackType !== ATTACK_TYPE_NORMAL) return;

        const {
            range,
            maxUnitCount,
            damageAmount,
            freezeDuration,
            hasPermafrost,
            hasReFreeze,
            hasIceShards,
            hasDeepFreeze,
            hasColdSnap,
            hasIcicles,
        } = damageInstance.tower.customData as ObsidianStatueCustomData;

        const targ = Unit.fromHandle(damageInstance.target);
        StunUtils.freezeUnit(targ, freezeDuration, hasPermafrost, hasReFreeze, hasIceShards, hasDeepFreeze);
        if (hasIcicles) {
            const visibleRegions = MapRegionController.getVisibleRegions(targ.x, targ.y, range);
            for (const visibleRegion of visibleRegions) {
                let maxHits = 3;
                visibleRegion.addCreepEnterEvent(damageInstance.sourceUnitId, (u: Unit) => {
                    if (maxHits <= 0) return;
                    if (u === targ) return;
                    if (!u.isAlive()) return;

                    maxHits--;
                    UnitDamageTarget(damageInstance.source, u.handle, 2, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                });
            }
        }

        const loc: Point = new Point(targ.x, targ.y);
        const grp: Group = Group.fromRange(range, loc);

        let unitCount = 0;
        grp.for((u: Unit) => {
            if (unitCount >= maxUnitCount) {
                return;
            }

            if (u.owner.id !== 23) {
                return;
            }

            if (u === targ) {
                return;
            }

            if (!u.isAlive())
                return;

            const unitId = u.id;
            const creep = GameMap.SPAWNED_CREEP_MAP.get(unitId);
            if (creep === undefined) return;
            if (!hasColdSnap && (creep.creepBaseUnit.name === FortifiedVillager.name || creep.hasModifier(InvisibilityModifier.INVISIBILITY_MODIFIER)))
                return;

            if (BlzGetUnitIntegerField(u.handle, UNIT_IF_DEFENSE_TYPE) === DefenseTypes.HEAVY)
                return;

            unitCount++;

            damageInstance.tower.unit.damageTarget(u.handle, damageAmount, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
            StunUtils.freezeUnit(u, freezeDuration, hasPermafrost, hasReFreeze, hasIceShards, hasDeepFreeze);
        });
        grp.destroy();
        loc.destroy();
    }
}
