import { Tower } from "./Tower";

export abstract class TowerUpgrade {
    public abstract name: string;
    public abstract icon: string;
    public abstract cost: number;
    public abstract description: string;
    public abstract applyUpgrade(tower: Tower): void;
    
    public newUnitTypeId?: number = undefined;
}