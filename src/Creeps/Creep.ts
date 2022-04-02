import { Checkpoint } from "../Game/Checkpoint";
import { Color } from "../Utility/Color";
import { SpawnedCreep } from "./SpawnedCreep";

export class Creep {
    public health = 1;
    public speed = 1;
    public readonly unitTypeId: number = FourCC('u000');
    protected readonly childrenTypes: typeof Creep[] = [];
    protected readonly color: Color = {r: 255, g: 255, b: 255, a: 255};
    protected readonly spawnedCreep: SpawnedCreep;

    constructor(spawnedCreep: SpawnedCreep) {
        this.spawnedCreep = spawnedCreep;
    }

    public apply(unit: unit): void {
        SetUnitVertexColor(unit, this.color.r, this.color.g, this.color.b, this.color.a);
        SetUnitMoveSpeed(unit, GetUnitMoveSpeed(unit) * this.speed);
        BlzSetUnitMaxHP(unit, this.health);
        SetUnitLifePercentBJ(unit, 100);
    }

    get currentCheckpoint(): Checkpoint {
        return this.spawnedCreep.currentCheckpoint;
    }

    get currentCheckpointIndex(): number {
        return this.spawnedCreep.currentCheckpointIndex;
    }

    public setCheckpoint(currentCheckpoint: Checkpoint, currentCheckpointIndex: number): void {
        this.spawnedCreep.currentCheckpoint = currentCheckpoint;
        this.spawnedCreep.currentCheckpointIndex = currentCheckpointIndex;
    }

    get children(): Creep[] {
        const children = [];
        for (let i = 0; i < this.childrenTypes.length; i++) {
            children.push(new this.childrenTypes[i](this.spawnedCreep));
        }

        return children;
    }
}