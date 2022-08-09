import { CreepRegenSystem } from "../../../Creeps/CreepRegenSystem";
import { RegenModifier } from "../../../Creeps/Modifiers/RegenModifier";
import type { DamageEvent } from "../DamageEvent";
import type { GargoyleCustomData } from "../../../Towers/Gargoyle/Gargoyle";
import type { ExtendedDamageInstance } from "../DamageEventController";

const gargoyleUnitTypeId: number = FourCC('h009');
export class ObsidianFormDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.tower === undefined) return;
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.sourceUnitTypeId !== gargoyleUnitTypeId) return;

        const { hasObsidianForm } = (damageInstance.tower.customData as GargoyleCustomData);
        if (!hasObsidianForm) return;

        if (!CreepRegenSystem.REGEN_UNIT_MAP.has(damageInstance.targetUnitId)) return;
        damageInstance.creep.removeModifier(RegenModifier.REGEN_MODIFIER);
        CreepRegenSystem.REGEN_UNIT_MAP.delete(damageInstance.targetUnitId);
    }
}
