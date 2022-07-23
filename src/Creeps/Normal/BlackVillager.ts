import { CreepBaseUnit } from "../CreepBaseUnit";
import { DefenseTypes } from "../DefenseTypes";
import { Color } from "../../Utility/Color";
import { PinkVillager } from "./PinkVillager";

export class BlackVillager extends CreepBaseUnit {
    public static readonly BLACK_VILLAGER = new BlackVillager();

    public readonly moveSpeed: number = 270.0;
    public readonly color: Color = { r: 35, g: 35, b: 35, a: 255 };
    public readonly defenseType: DefenseTypes = DefenseTypes.UNARMORED;
    public readonly children: CreepBaseUnit[] = [PinkVillager.PINK_VILLAGER, PinkVillager.PINK_VILLAGER];
}
