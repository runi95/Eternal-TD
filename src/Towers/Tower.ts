import { TowerType } from "./TowerType";

export class Tower {
    public readonly towerType: TowerType;
    public pathUpgrades: number[];
    public unit: unit;
    public customData: unknown;

    constructor(unit: unit, towerType: TowerType, pathUpgrades: number[] = [0, 0, 0]) {
        this.unit = unit;
        this.towerType = towerType;
        this.pathUpgrades = pathUpgrades;
        this.customData = this.towerType.initializeCustomData();
    }
}