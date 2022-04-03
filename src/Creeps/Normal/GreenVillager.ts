import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { BlueVillager } from "./BlueVillager";

export class GreenVillager extends Creep {
    public speed = 1.8;
    public readonly color: Color = {r: 100, g: 200, b: 100, a: 255};
    protected readonly children: Creep[] = [new BlueVillager()];
}