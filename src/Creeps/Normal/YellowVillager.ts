import { CreepBaseUnit } from "../CreepBaseUnit";
import { Color } from "../../Utility/Color";
import { GreenVillager } from "./GreenVillager";

export class YellowVillager extends CreepBaseUnit {
    public static readonly YELLOW_VILLAGER = new YellowVillager();

    public readonly moveSpeed = 480;
    public readonly color: Color = { r: 255, g: 255, b: 75, a: 255 };
    public readonly children: CreepBaseUnit[] = [GreenVillager.GREEN_VILLAGER];
}
