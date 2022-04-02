import { Checkpoint } from "../Game/Checkpoint";

export class SpawnedCreep {
    public currentCheckpoint: Checkpoint;
    public currentCheckpointIndex: number;

    constructor(currentCheckpoint: Checkpoint, currentCheckpointIndex: number) {
        this.currentCheckpoint = currentCheckpoint;
        this.currentCheckpointIndex = currentCheckpointIndex;
    }
}