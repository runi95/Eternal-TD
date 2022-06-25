import { CreepModifier } from "Creeps/CreepModifier";
import { TargetFlags } from "Creeps/TargetFlags";
import { Color } from "Utility/Color";

export class InvisibilityModifier extends CreepModifier {
    public static readonly INVISIBILITY_MODIFIER = new InvisibilityModifier();
    public readonly targetAsOverride = TargetFlags.WARD;
    public readonly colorMask: Color = {r: 1, g: 1, b: 1, a: 0.5};
};