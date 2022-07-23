import { CreepBaseUnit } from "../CreepBaseUnit";
import { Color } from "../../Utility/Color";
import { BlackVillager } from "./BlackVillager";
import { WhiteVillager } from "./WhiteVillager";

export class ZebraVillager extends CreepBaseUnit {
    public static readonly ZEBRA_VILLAGER = new ZebraVillager();

    public readonly moveSpeed = 270.0;
    public readonly color: Color = { r: 125, g: 125, b: 125, a: 255 };
    public readonly children: CreepBaseUnit[] = [BlackVillager.BLACK_VILLAGER, WhiteVillager.WHITE_VILLAGER];

}
