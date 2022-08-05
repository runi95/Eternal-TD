import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { ATTACK_TYPE_NORMAL } from "../GameSettings";
import { Point } from "w3ts/handles/point";
import { Group } from "../../Group";
import { StunUtils } from "../../StunUtils";
import { ObsidianStatueCustomData } from "../../../Towers/ObsidianStatue/ObsidianStatue";
import { DefenseTypes } from "../../../Creeps/DefenseTypes";
import { GameMap } from "../../../Game/GameMap";
import { InvisibilityModifier } from "../../../Creeps/Modifiers/InvisibilityModifier";
import { FortifiedVillager } from "../../../Creeps/Normal/FortifiedVillager";
import { Effect, Timer, Unit } from "w3ts";
import type { DamageEvent } from "../DamageEvent";
import { TimerUtils } from "../../TimerUtils";
import { MapRegionController } from "../../../Game/MapRegionController";

const frostWyrmUnitTypeId: number = FourCC('h00G');
const dummyUnitTypeId: number = FourCC('u007');
export class FrostWyrmDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        if (globals.DamageEventSourceUnitTypeId !== frostWyrmUnitTypeId) {
            return;
        }

        if (globals.DamageEventAttackT !== ATTACK_TYPE_NORMAL) {
            return;
        }

        const trig: unit = globals.DamageEventSource as unit;
        const damageEventTarget: unit = globals.DamageEventTarget as unit;

        const tower = GameMap.BUILT_TOWER_MAP.get(GetHandleId(trig));
        if (tower === undefined) {
            return;
        }

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
        } = tower.customData as ObsidianStatueCustomData;

        const targ = Unit.fromHandle(damageEventTarget);
        StunUtils.freezeUnit(targ, freezeDuration, hasPermafrost, hasReFreeze, hasIceShards, hasDeepFreeze);
        if (hasIcicles) {
            const towerUnitId = tower.unit.id;
            const visibleRegions = MapRegionController.getVisibleRegions(targ.x, targ.y, range);
            print(`visibleRegions.length: ${visibleRegions.length}, range: ${range}`);
            for (const visibleRegion of visibleRegions) {
                let maxHits = 3;
                visibleRegion.addCreepEnterEvent(towerUnitId, (u: Unit) => {
                    if (maxHits <= 0) return;
                    if (u === targ) return;
                    if (!u.isAlive()) return;

                    maxHits--;
                    UnitDamageTarget(trig, u.handle, 2, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                });
            }

            // const t: Timer = TimerUtils.newTimer();

            // let tick = 20;
            // let maxHits = 3;
            // t.start(0.1, true, () => {
            //     tick--;

            //     const iciclePoint: Point = new Point(GetUnitX(targ), GetUnitY(targ));
            //     const icicleGroup: Group = Group.fromRange(100, iciclePoint);

            //     icicleGroup.for((u: Unit) => {
            //         if (maxHits <= 0) return;
            //         if (u.owner.id !== 23) return;
            //         if (u.handle === targ) return;
            //         if (!u.isAlive()) return;

            //         maxHits--;
            //         UnitDamageTarget(trig, u.handle, 2, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
            //     });

            //     icicleGroup.destroy();
            //     iciclePoint.destroy();

            //     if (tick <= 0 || maxHits <= 0) {
            //         TimerUtils.releaseTimer(t);
            //     }
            // });
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

            tower.unit.damageTarget(u.handle, damageAmount, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
            StunUtils.freezeUnit(u, freezeDuration, hasPermafrost, hasReFreeze, hasIceShards, hasDeepFreeze);
        });
        grp.destroy();
        loc.destroy();
    }
}
