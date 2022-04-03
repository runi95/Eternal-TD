import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { BlackVillager } from "./BlackVillager";
import { WhiteVillager } from "./WhiteVillager";

export class ZebraVillager extends Creep {
    public speed = 1.8;
    public readonly color: Color = {r: 75, g: 25, b: 25, a: 255};
    protected readonly children: Creep[] = [new BlackVillager(), new WhiteVillager()];
}