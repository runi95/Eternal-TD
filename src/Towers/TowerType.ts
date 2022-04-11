import { TowerUpgrade } from "./TowerUpgrade";
import {Unit} from "w3ts";

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