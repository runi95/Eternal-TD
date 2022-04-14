import {Region} from "w3ts/handles/region";
import {SpawnedCreep} from "./SpawnedCreep";
import {Checkpoint} from "../Utility/Checkpoint";

export class CreepRegion {
    public target_cp_indx: number;
    public region: Region;
    public regionId: number;
    public center: Checkpoint;
    public creeps: Record<string, SpawnedCreep> = {};

    constructor(regionId: number, target_cp_index: number, region: Region, center: Checkpoint) {
        this.region = region;
        this.regionId = regionId;
        this.target_cp_indx = target_cp_index;
        this.center = center;
    }
}