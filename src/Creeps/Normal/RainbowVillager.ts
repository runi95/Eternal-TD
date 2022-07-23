import { CreepBaseUnit } from "../CreepBaseUnit";
import { Color } from "../../Utility/Color";
import { ZebraVillager } from "./ZebraVillager";

export class RainbowVillager extends CreepBaseUnit {
    public static readonly RAINBOW_VILLAGER = new RainbowVillager();

    public readonly moveSpeed = 330.0;
    public readonly color: Color = { r: 55, g: 255, b: 255, a: 255 };
    public readonly children: CreepBaseUnit[] = [ZebraVillager.ZEBRA_VILLAGER, ZebraVillager.ZEBRA_VILLAGER];
}
