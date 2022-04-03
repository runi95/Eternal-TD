import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { PinkVillager } from "./PinkVillager";

export class WhiteVillager extends Creep {
    public speed = 2;
    protected readonly children: Creep[] = [new PinkVillager(), new PinkVillager()];
    protected readonly color: Color = {r: 255, g: 255, b: 255, a: 255};
}