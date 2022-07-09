import { CreepModifier } from "Creeps/CreepModifier";

export class BlinkModifier extends CreepModifier {
    public static readonly BLINK_DISTANCE = 192;
    public static readonly BLINK_MODIFIER = new BlinkModifier();

    public readonly icon: string = ""; // TODO: Find icon
    public readonly description: string = ""; // TODO: Write description
};
