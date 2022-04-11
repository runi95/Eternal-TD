import { TowerType } from "./TowerType";
import {Unit} from "w3ts";

export class Tower {
    public readonly towerType: TowerType;
    public pathUpgrades: number[];
    public unit: Unit;
    public customData: unknown;

    constructor(unit: Unit, towerType: TowerType, pathUpgrades: number[] = [0, 0, 0]) {
        this.unit = unit;
        this.towerType = towerType;
        this.pathUpgrades = pathUpgrades;
        this.customData = this.towerType.initializeCustomData();
    }
}