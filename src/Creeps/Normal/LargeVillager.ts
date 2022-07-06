import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { Scale } from "Utility/Scale";
import { Color } from "../../Utility/Color";
import { RainbowVillager } from "./RainbowVillager";

export class LargeVillager extends CreepBaseUnit {
    public static readonly LARGE_VILLAGER = new LargeVillager();

    public readonly health: number = 20;
    public readonly color: Color = { r: 255, g: 255, b: 255, a: 255 };
    public readonly scale: Scale = { x: 1.5, y: 1.5, z: 2 };
    public readonly children: CreepBaseUnit[] = [RainbowVillager.RAINBOW_VILLAGER, RainbowVillager.RAINBOW_VILLAGER];
}
