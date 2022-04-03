import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { RedVillager } from "./RedVillager";

export class BlueVillager extends Creep {
    public speed = 1.4;
    public readonly color: Color = {r: 125, g: 125, b: 255, a: 255};
    protected readonly children: Creep[] = [new RedVillager()];
}