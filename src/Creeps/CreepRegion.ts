import {Region} from "w3ts/handles/region";
import { Creep } from "./Creep";

export class CreepRegion {
    public target_cp_indx: number;
    public region: Region;
    public regionId: number;
    public creeps: Record<string, Creep> = {};

    constructor(regionId: number, target_cp_index: number, region: Region) {
        this.region = region;
        this.regionId = regionId;
        this.target_cp_indx = target_cp_index;
    }
}