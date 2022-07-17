import { CreepModifier } from "Creeps/CreepModifier";
import { CreepRegenSystem } from "Creeps/CreepRegenSystem";
import type { Unit } from "w3ts";

// TODO: Add some sort of effect to the unit so that it's possible to tell that it's a regen unit.

export class RegenModifier extends CreepModifier {
    public static readonly REGEN_MODIFIER = new RegenModifier();

    public readonly icon: string = ""; // TODO: Find icon
    public readonly description: string = ""; // TODO: Write description
    public readonly applyEffect = (unit: Unit) => CreepRegenSystem.REGEN_UNIT_MAP.set(unit.id, { remainingRegenTicks: 3 });
};
