import { Color } from "../../Utility/Color";
import { Creep } from "../Creep";
import { BlackVillager } from "./BlackVillager";

const fortifiedVillagerTypeId: number = FourCC('u004');
export class FortifiedVillager extends Creep {
    public readonly health: number = 4;
    public readonly unitTypeId: number = fortifiedVillagerTypeId;
    public readonly color: Color = {r: 255, g: 255, b: 255, a: 255};
    protected readonly children: Creep[] = [new BlackVillager(), new BlackVillager()];
}