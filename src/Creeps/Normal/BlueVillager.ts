import { CreepBaseUnit } from "../CreepBaseUnit";
import { Color } from "../../Utility/Color";
import { RedVillager } from "./RedVillager";

export class BlueVillager extends CreepBaseUnit {
    public static readonly BLUE_VILLAGER = new BlueVillager();

    public readonly moveSpeed = 210;
    public readonly color: Color = { r: 125, g: 125, b: 255, a: 255 };
    public readonly children: CreepBaseUnit[] = [RedVillager.RED_VILLAGER];
}
