import { Creep } from "../Creeps/Creep";

export class RoundCreepController {
    private creepMap: Map<number, Creep> = new Map<number, Creep>();

    public set(unitId: number, creep: Creep): void {
        this.creepMap.set(unitId, creep);
    }

    public delete(unitId: number): boolean {
        return this.creepMap.delete(unitId);
    }

    public get(unitId: number): Creep | undefined {
        return this.creepMap.get(unitId);
    }

    public clear(): void {
        this.creepMap.clear();
    }
}