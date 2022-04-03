import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { PinkVillager } from "./PinkVillager";

export class PurpleVillager extends Creep {
    public speed = 3;
    public readonly color: Color = {r: 255, g: 75, b: 255, a: 255};
    protected readonly children: Creep[] = [new PinkVillager(), new PinkVillager()];
}