import { Checkpoint } from "../Utility/Checkpoint";
import { Creep } from "./Creep";
import {CreepRegion} from "./CreepRegion";

export class SpawnedCreep {
    public creep: Creep; // TODO: DO NOT CHANGE THIS VALUE WHEN CREEP "DIES"
    public currentCheckpoint: Checkpoint;
    public currentRegion: CreepRegion;
    public currentCheckpointIndex: number;

    constructor(creep: Creep, currentCheckpoint: Checkpoint, currentCheckpointIndex: number) {
        this.creep = creep;
        this.currentCheckpoint = currentCheckpoint;
        this.currentCheckpointIndex = currentCheckpointIndex;
    }
}