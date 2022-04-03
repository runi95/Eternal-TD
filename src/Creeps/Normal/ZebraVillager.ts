import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { BlackVillager } from "./BlackVillager";
import { WhiteVillager } from "./WhiteVillager";

export class ZebraVillager extends Creep {
    public speed = 1.8;
    public readonly color: Color = {r: 125, g: 125, b: 125, a: 255};
    protected readonly children: Creep[] = [new BlackVillager(), new WhiteVillager()];
}