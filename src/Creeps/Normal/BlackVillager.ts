import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { PinkVillager } from "./PinkVillager";

export class BlackVillager extends Creep {
    public speed = 1.8;
    public readonly color: Color = {r: 75, g: 75, b: 75, a: 255};
    protected readonly children: Creep[] = [new PinkVillager(), new PinkVillager()];
}