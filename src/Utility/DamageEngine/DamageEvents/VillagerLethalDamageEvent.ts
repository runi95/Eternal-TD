import { StunUtils } from "../../../Utility/StunUtils";
import { Group } from "../../../Utility/Group";
import { Point } from "w3ts";
import type { Unit } from "w3ts";
import type { DamageEvent } from "../DamageEvent";
import type { FrozenUnit } from "../../../Utility/FrozenUnit";
import type { GargoyleCustomData } from "../../../Towers/Gargoyle/Gargoyle";
import type { ExtendedDamageInstance } from "../DamageEventController";

const obsidianStatueUnitTypeId: number = FourCC('h008');
const gargoyleUnitTypeId: number = FourCC('h009');
export class VillagerLethalDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.targetOwningPlayerId !== 23) return;

        let ignoreModifiers = false;
        if (damageInstance.sourceUnitTypeId === gargoyleUnitTypeId) {
            if (damageInstance.tower !== undefined) {
                const { hasObsidianForm } = (damageInstance.tower.customData as GargoyleCustomData);
                if (hasObsidianForm) {
                    ignoreModifiers = true;
                }
            }
        }

        const overflowingDamage = damageInstance.creep.dealLethalDamage(Math.floor(Math.abs(damageInstance.life)), ignoreModifiers);
        damageInstance.life = overflowingDamage;

        StunUtils.removeStun(damageInstance.targetUnitId);
        const frozenUnit: FrozenUnit = StunUtils.getFrozenUnit(damageInstance.targetUnitId);
        if (frozenUnit !== undefined) {
            if (damageInstance.sourceUnitTypeId !== obsidianStatueUnitTypeId) {
                if (!frozenUnit.hasDeepFreeze || damageInstance.damage > 1) {
                    frozenUnit.setDuration(0);
                }
            }

            if (frozenUnit.hasIceShards) {
                const x = GetUnitX(damageInstance.target);
                const y = GetUnitY(damageInstance.target);

                let count = 0;
                const loc = new Point(x, y);
                const group: Group = Group.fromRange(75, loc);
                group.for((u: Unit) => {
                    if (count > 2)
                        return;

                    count++;

                    UnitDamageTarget((damageInstance.target), u.handle, 1, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                });
                group.destroy();
                loc.destroy();
            }
        }
    }
}
