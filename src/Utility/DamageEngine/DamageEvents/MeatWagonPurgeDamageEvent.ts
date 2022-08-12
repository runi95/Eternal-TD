import { CreepDefaults } from "../../../Creeps/CreepDefaults";
import { CreepRegenSystem } from "../../../Creeps/CreepRegenSystem";
import { RegenModifier } from "../../../Creeps/Modifiers/RegenModifier";
import { MeatWagoCustomData } from "../../../Towers/MeatWagon/MeatWagon";
import { DamageEvent } from "../DamageEvent";
import type { ExtendedDamageInstance } from "../DamageEventController";

const meatWagonUnitTypeId: number = FourCC('h00A');
export class MeatWagonPurgeDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.tower === undefined) return;
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.sourceUnitTypeId !== meatWagonUnitTypeId) return;

        const { hasPurge } = (damageInstance.tower.customData as MeatWagoCustomData);
        if (!hasPurge) return;

        if (CreepRegenSystem.REGEN_UNIT_MAP.has(damageInstance.targetUnitId)) {
            damageInstance.creep.removeModifier(RegenModifier.REGEN_MODIFIER);
            CreepRegenSystem.REGEN_UNIT_MAP.delete(damageInstance.targetUnitId);
        }

        if (BlzGetUnitIntegerField(damageInstance.target, UNIT_IF_DEFENSE_TYPE)) {
            BlzSetUnitIntegerField(damageInstance.target, UNIT_IF_DEFENSE_TYPE, CreepDefaults.DEFENSE_TYPE);
        }
    }
}
