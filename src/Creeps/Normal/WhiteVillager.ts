import { DefenseTypes } from "Creeps/DefenseTypes";
import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { PinkVillager } from "./PinkVillager";

export class WhiteVillager extends Creep {
    public speed = 2;
    public readonly color: Color = {r: 255, g: 255, b: 255, a: 255};
    public defenseType: DefenseTypes = DefenseTypes.HEAVY;
    protected readonly children: Creep[] = [new PinkVillager(), new PinkVillager()];
}