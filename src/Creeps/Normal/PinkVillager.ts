import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { YellowVillager } from "./YellowVillager";

export class PinkVillager extends Creep {
    public speed = 3.5;
    public readonly color: Color = {r: 255, g: 175, b: 255, a: 255};
    protected readonly children: Creep[] = [new YellowVillager()];
}