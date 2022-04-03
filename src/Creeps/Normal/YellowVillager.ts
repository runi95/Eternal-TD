import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { GreenVillager } from "./GreenVillager";

export class YellowVillager extends Creep {
    public speed = 3.2;
    public readonly color: Color = {r: 255, g: 255, b: 125, a: 255};
    protected readonly children: Creep[] = [new GreenVillager()];
}