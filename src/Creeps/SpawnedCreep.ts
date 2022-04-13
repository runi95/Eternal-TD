import { Checkpoint } from "../Utility/Checkpoint";
import { Creep } from "./Creep";
import {CreepRegion} from "./CreepRegion";
import { Modifier } from "./Modifier";

export class SpawnedCreep {
    public creep: Creep; // TODO: DO NOT CHANGE THIS VALUE WHEN CREEP "DIES"
    public modifiers: (Modifier[] | undefined);
    public currentCheckpoint: Checkpoint;
    public currentRegion: CreepRegion;
    public currentCheckpointIndex: number;

    constructor(creep: Creep, modifiers: (Modifier[] | undefined), currentCheckpoint: Checkpoint, currentCheckpointIndex: number) {
        this.creep = creep;
        this.modifiers = modifiers;
        this.currentCheckpoint = currentCheckpoint;
        this.currentCheckpointIndex = currentCheckpointIndex;
    }
}