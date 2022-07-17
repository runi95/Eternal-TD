import { CreepModifier } from "Creeps/CreepModifier";
import type { Unit } from "w3ts";

const evasionAbilityId: number = FourCC('A00F');
export class EvasionModifier extends CreepModifier {
    public static readonly EVASION_MODIFIER = new EvasionModifier();

    public readonly icon: string = ""; // TODO: Find icon
    public readonly description: string = ""; // TODO: Write description
    public readonly applyEffect = (unit: Unit) => {
        unit.addAbility(evasionAbilityId);
    };
};
