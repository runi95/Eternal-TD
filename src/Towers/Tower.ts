import { TowerType } from "./TowerType";
import { Unit } from "w3ts";
import { CreepRegion } from "../Creeps/CreepRegion";

export class Tower {
    public readonly towerType: TowerType;
    public pathUpgrades: number[];
    public unit: Unit;
    public customData: unknown;
    public visibleRegions: CreepRegion[];
    public fortifiedVillagerBonusDamage: number = 0;
    public purpleVillagerBonusDamage: number = 0;
    public largeVillagerBonusDamage: number = 0;
    public zeppelinVillagerBonusDamage: number = 0;

    constructor(unit: Unit, towerType: TowerType, visibleRegions: CreepRegion[], pathUpgrades: number[] = [0, 0, 0]) {
        this.unit = unit;
        this.towerType = towerType;
        this.pathUpgrades = pathUpgrades;
        this.customData = this.towerType.initializeCustomData();
        this.visibleRegions = visibleRegions;
    }
}
