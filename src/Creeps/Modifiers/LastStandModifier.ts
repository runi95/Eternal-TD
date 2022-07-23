import { CreepModifier } from "../CreepModifier";

export class LastStandModifier extends CreepModifier {
    public static readonly LAST_STAND_MODIFIER = new LastStandModifier();

    public readonly icon: string = ""; // TODO: Find icon
    public readonly description: string = ""; // TODO: Write description
};
