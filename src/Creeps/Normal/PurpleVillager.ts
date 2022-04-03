import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { PinkVillager } from "./PinkVillager";

export class PurpleVillager extends Creep {
    public speed = 3;
    protected readonly children: Creep[] = [new PinkVillager(), new PinkVillager()];
    protected readonly color: Color = {r: 255, g: 125, b: 255, a: 255};
}