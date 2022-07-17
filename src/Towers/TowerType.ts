import type { TowerUpgrade } from "./TowerUpgrade";
import type { Unit } from "w3ts";

export abstract class TowerType {
    public abstract unitTypeId: number;
    public abstract upgrades: TowerUpgrade[][];

    public initializeCustomData(): unknown {
        return;
    }

    public applyInitialUnitValues(_unit: Unit): void {
        return;
    }
}
