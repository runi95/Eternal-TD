import { DamageEvent } from "../DamageEvent";
import { DamageReductionModifier } from "../../../Creeps/Modifiers/DamageReductionModifier";
import type { GargoyleCustomData } from "../../../Towers/Gargoyle/Gargoyle";
import type { ExtendedDamageInstance } from "../DamageEventController";

const gargoyleUnitTypeId: number = FourCC('h009');
export class DamageReductionDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.sourceUnitTypeId === gargoyleUnitTypeId) {
            const { hasObsidianForm } = (damageInstance.tower.customData as GargoyleCustomData);
            if (hasObsidianForm) return;
        }

        if (!damageInstance.creep.hasModifier(DamageReductionModifier.DAMAGE_REDUCTION_MODIFIER))
            return;

        damageInstance.damage -= 1;
    }
}
