import { CreepModifier } from "../CreepModifier";

export class DamageReductionModifier extends CreepModifier {
    public static readonly DAMAGE_REDUCTION_MODIFIER = new DamageReductionModifier();

    public readonly icon: string = ""; // TODO: Find icon
    public readonly description: string = ""; // TODO: Write description
};
