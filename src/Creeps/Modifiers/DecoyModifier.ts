import { CreepModifier } from "../CreepModifier";

export class DecoyModifier extends CreepModifier {
    public static readonly DECOY_MODIFIER = new DecoyModifier();
    public static readonly DECOY_UNIT_ID = FourCC('n001');

    public readonly icon: string = ""; // TODO: Find icon
    public readonly description: string = ""; // TODO: Write description
};
