import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { Color } from "../../Utility/Color";
import { BlueVillager } from "./BlueVillager";

export class GreenVillager extends CreepBaseUnit {
    public static readonly GREEN_VILLAGER = new GreenVillager();

    public readonly moveSpeed = 270.0;
    public readonly color: Color = {r: 100, g: 200, b: 100, a: 255};
    public readonly children: CreepBaseUnit[] = [BlueVillager.BLUE_VILLAGER];
}