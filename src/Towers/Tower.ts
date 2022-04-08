import { TowerType } from "./TowerType";

export class Tower {
    public pathUpgrades: number[];
    public readonly unit: unit;
    public readonly towerType: TowerType;

    constructor(unit: unit, towerType: TowerType, pathUpgrades: number[] = [0, 0, 0],) {
        this.unit = unit;
        this.towerType = towerType;
        this.pathUpgrades = pathUpgrades;
    }
}