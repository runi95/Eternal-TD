import { TowerUpgrade } from "./TowerUpgrade";

export abstract class TowerType {
    public abstract unitTypeId: number;
    public abstract upgrades: TowerUpgrade[][];
    
    public initializeCustomData(): unknown {
        return;
    }

    public applyInitialUnitValues(_unit: unit): void {
        return;
    }
}