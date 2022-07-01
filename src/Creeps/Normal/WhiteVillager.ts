import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { DefenseTypes } from "Creeps/DefenseTypes";
import { Color } from "../../Utility/Color";
import { PinkVillager } from "./PinkVillager";

export class WhiteVillager extends CreepBaseUnit {
    public static readonly WHITE_VILLAGER = new WhiteVillager();

    public readonly moveSpeed = 300.0;
    public readonly color: Color = {r: 255, g: 255, b: 255, a: 255};
    public readonly defenseType: DefenseTypes = DefenseTypes.HEAVY;
    public readonly children: CreepBaseUnit[] = [PinkVillager.PINK_VILLAGER, PinkVillager.PINK_VILLAGER];
}