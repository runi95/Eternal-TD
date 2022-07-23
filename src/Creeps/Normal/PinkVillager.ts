import { CreepBaseUnit } from "../CreepBaseUnit";
import { Color } from "../../Utility/Color";
import { YellowVillager } from "./YellowVillager";

export class PinkVillager extends CreepBaseUnit {
    public static readonly PINK_VILLAGER = new PinkVillager();

    public readonly moveSpeed = 522.0;
    public readonly color: Color = { r: 255, g: 175, b: 255, a: 255 };
    public readonly children: CreepBaseUnit[] = [YellowVillager.YELLOW_VILLAGER];
}
