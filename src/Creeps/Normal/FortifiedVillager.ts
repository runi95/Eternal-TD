import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { Color } from "../../Utility/Color";
import { BlackVillager } from "./BlackVillager";

const fortifiedVillagerTypeId: number = FourCC('u004');
export class FortifiedVillager extends CreepBaseUnit {
    public static readonly FORTIFIED_VILLAGER = new FortifiedVillager();

    public readonly health: number = 4;
    public readonly unitTypeId: number = fortifiedVillagerTypeId;
    public readonly color: Color = {r: 255, g: 255, b: 255, a: 255};
    public readonly children: CreepBaseUnit[] = [BlackVillager.BLACK_VILLAGER, BlackVillager.BLACK_VILLAGER];
}