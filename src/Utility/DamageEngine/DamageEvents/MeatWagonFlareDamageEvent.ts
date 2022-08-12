import { Unit } from "../../../../node_modules/w3ts/index";
import { CreepDefaults } from "../../../Creeps/CreepDefaults";
import { InvisibilityModifier } from "../../../Creeps/Modifiers/InvisibilityModifier";
import { setUnitTargetAs } from "../../../Creeps/TargetFlags";
import { MeatWagoCustomData } from "../../../Towers/MeatWagon/MeatWagon";
import { DamageEvent } from "../DamageEvent";
import type { ExtendedDamageInstance } from "../DamageEventController";

const meatWagonUnitTypeId: number = FourCC('h00A');
export class MeatWagonFlareDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.tower === undefined) return;
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.sourceUnitTypeId !== meatWagonUnitTypeId) return;

        const { hasFlare } = (damageInstance.tower.customData as MeatWagoCustomData);
        if (!hasFlare) return;

        damageInstance.creep.removeInvisibility();
    }
}
