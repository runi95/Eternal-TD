import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { CreepType } from "../CreepType";
import { RainbowVillager } from "./RainbowVillager";

const largeVillagerTypeId: number = FourCC('u005');
export class LargeVillager extends Creep {
    public readonly health: number = 20;
    public readonly unitTypeId: number = largeVillagerTypeId;
    public readonly color: Color = {r: 255, g: 255, b: 255, a: 255};
    public readonly creepType: CreepType = CreepType.LARGE;
    protected readonly children: Creep[] = [new RainbowVillager(), new RainbowVillager()];
}