import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { YellowVillager } from "./YellowVillager";

export class PinkVillager extends Creep {
    public speed = 3.5;
    protected readonly children: Creep[] = [new YellowVillager()];
    protected readonly color: Color = {r: 255, g: 125, b: 255, a: 255};
}