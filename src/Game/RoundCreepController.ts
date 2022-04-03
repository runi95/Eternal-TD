import { SpawnedCreep } from "../Creeps/SpawnedCreep";

export class RoundCreepController {
    private creepMap: Map<number, SpawnedCreep> = new Map<number, SpawnedCreep>();

    public set(unitId: number, creep: SpawnedCreep): void {
        this.creepMap.set(unitId, creep);
    }

    public delete(unitId: number): boolean {
        return this.creepMap.delete(unitId);
    }

    public get(unitId: number): SpawnedCreep | undefined {
        return this.creepMap.get(unitId);
    }

    public clear(): void {
        this.creepMap.clear();
    }
}