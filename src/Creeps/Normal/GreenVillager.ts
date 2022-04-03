import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { BlueVillager } from "./BlueVillager";

export class GreenVillager extends Creep {
    public speed = 1.8;
    public readonly color: Color = {r: 125, g: 255, b: 125, a: 255};
    protected readonly children: Creep[] = [new BlueVillager()];
}