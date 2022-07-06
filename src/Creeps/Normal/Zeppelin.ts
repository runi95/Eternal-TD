import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { Color } from "../../Utility/Color";
import { LargeVillager } from "./LargeVillager";

const zeppelinTypeId: number = FourCC('u006');
export class Zeppelin extends CreepBaseUnit {
    public static readonly ZEPPELIN = new Zeppelin();

    public readonly health: number = 400;
    public readonly unitTypeId: number = zeppelinTypeId;
    public readonly color: Color = { r: 255, g: 255, b: 255, a: 255 };
    public readonly children: CreepBaseUnit[] = [LargeVillager.LARGE_VILLAGER, LargeVillager.LARGE_VILLAGER, LargeVillager.LARGE_VILLAGER, LargeVillager.LARGE_VILLAGER];
}
