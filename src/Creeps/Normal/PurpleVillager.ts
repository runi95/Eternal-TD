import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { DefenseTypes } from "Creeps/DefenseTypes";
import { Color } from "../../Utility/Color";
import { PinkVillager } from "./PinkVillager";

export class PurpleVillager extends CreepBaseUnit {
    public static readonly PURPLE_VILLAGER = new PurpleVillager();

    public readonly moveSpeed = 450.0;
    public readonly color: Color = {r: 255, g: 75, b: 255, a: 255};
    public readonly defenseType: DefenseTypes = DefenseTypes.DIVINE;
    public readonly children: CreepBaseUnit[] = [PinkVillager.PINK_VILLAGER, PinkVillager.PINK_VILLAGER];
}