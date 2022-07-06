import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { Scale } from "Utility/Scale";
import { Color } from "../../Utility/Color";
import { DefenseTypes } from "../DefenseTypes";
import { BlackVillager } from "./BlackVillager";

const fortifiedVillagerSkinTypeId: number = FourCC('hbew');
export class FortifiedVillager extends CreepBaseUnit {
    public static readonly FORTIFIED_VILLAGER = new FortifiedVillager();

    public readonly health: number = 4;
    public readonly unitSkinTypeId: number = fortifiedVillagerSkinTypeId;
    public readonly scale: Scale = { x: 0.73, y: 0.73, z: 0.73 };
    public readonly color: Color = { r: 255, g: 255, b: 255, a: 255 };
    public readonly defenseType: DefenseTypes = DefenseTypes.FORTIFIED;
    public readonly children: CreepBaseUnit[] = [BlackVillager.BLACK_VILLAGER, BlackVillager.BLACK_VILLAGER];
}
