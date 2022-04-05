import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { ZebraVillager } from "./ZebraVillager";

export class RainbowVillager extends Creep {
    public speed = 2.2;
    public readonly color: Color = {r: 55, g: 255, b: 255, a: 255};
    protected readonly children: Creep[] = [new ZebraVillager(), new ZebraVillager()];
}