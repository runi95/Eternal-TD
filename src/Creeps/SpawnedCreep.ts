import { Checkpoint } from "../Game/Checkpoint";
import { Creep } from "./Creep";

export class SpawnedCreep {
    public creep: Creep; // TODO: DO NOT CHANGE THIS VALUE WHEN CREEP "DIES"
    public currentCheckpoint: Checkpoint;
    public currentCheckpointIndex: number;

    constructor(creep: Creep, currentCheckpoint: Checkpoint, currentCheckpointIndex: number) {
        this.creep = creep;
        this.currentCheckpoint = currentCheckpoint;
        this.currentCheckpointIndex = currentCheckpointIndex;
    }
}