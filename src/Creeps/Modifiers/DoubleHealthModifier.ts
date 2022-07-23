import { CreepModifier } from "../CreepModifier";

export class DoubleHealthModifier extends CreepModifier {
    public static readonly DOUBLE_HEALTH_MODIFIER = new DoubleHealthModifier();

    public readonly icon: string = ""; // TODO: Find icon
    public readonly description: string = ""; // TODO: Write description
    public readonly healthMultiplier = 2;
};
