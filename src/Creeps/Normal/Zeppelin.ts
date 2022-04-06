import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { CreepType } from "../CreepType";
import { LargeVillager } from "./LargeVillager";

const zeppelinTypeId: number = FourCC('u006');
export class Zeppelin extends Creep {
    public readonly health: number = 400;
    public readonly unitTypeId: number = zeppelinTypeId;
    public readonly color: Color = {r: 255, g: 255, b: 255, a: 255};
    public readonly creepType: CreepType = CreepType.ZEPPELIN;
    protected readonly children: Creep[] = [new LargeVillager(), new LargeVillager(), new LargeVillager(), new LargeVillager()];
}