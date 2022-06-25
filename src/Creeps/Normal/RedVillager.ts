import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { Color } from "Utility/Color";

export class RedVillager extends CreepBaseUnit {
    public static readonly RED_VILLAGER = new RedVillager();

    public readonly color: Color = {r: 255, g: 125, b: 125, a: 255};
}