import { Color } from "../Utility/Color";
import { Creep } from "./Creep";
import { RedVillager } from "./RedVillager";

export class BlueVillager extends Creep {
    public speed = 1.4;
    protected readonly childrenTypes: typeof Creep[] = [RedVillager];
    protected readonly color: Color = {r: 125, g: 125, b: 255, a: 255};
}