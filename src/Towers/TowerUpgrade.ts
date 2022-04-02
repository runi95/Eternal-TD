export abstract class TowerUpgrade {
    public abstract name: string;
    public abstract icon: string;
    public abstract cost: number;
    public abstract description: string;
    public abstract applyUpgrade(unit: unit): void
    
    public newUnitTypeId?: number = undefined;
}