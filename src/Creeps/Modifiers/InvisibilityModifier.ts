import { CreepModifier } from "../CreepModifier";
import { TargetFlags } from "../TargetFlags";
import { Color } from "../../Utility/Color";

export class InvisibilityModifier extends CreepModifier {
    public static readonly INVISIBILITY_MODIFIER = new InvisibilityModifier();

    public readonly icon: string = ""; // TODO: Find icon
    public readonly description: string = ""; // TODO: Write description
    public readonly targetAsOverride = TargetFlags.WARD;
    public readonly colorMask: Color = { r: 1, g: 1, b: 1, a: 0.5 };
};
