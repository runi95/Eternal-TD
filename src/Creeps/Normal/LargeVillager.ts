import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { Color } from "../../Utility/Color";
import { RainbowVillager } from "./RainbowVillager";

const largeVillagerTypeId: number = FourCC('u005');
export class LargeVillager extends CreepBaseUnit {
    public static readonly LARGE_VILLAGER = new LargeVillager();

    public readonly health: number = 20;
    public readonly unitTypeId: number = largeVillagerTypeId;
    public readonly color: Color = {r: 255, g: 255, b: 255, a: 255};
    public readonly children: CreepBaseUnit[] = [RainbowVillager.RAINBOW_VILLAGER, RainbowVillager.RAINBOW_VILLAGER];
}