import type { TowerType } from "./TowerType";
import type { CreepRegion } from "../Creeps/CreepRegion";
import type { Unit } from "w3ts";
import { MapRegionController } from "../Game/MapRegionController";

export class Tower {
    public readonly towerType: TowerType;
    public readonly pathUpgrades: number[];
    public readonly customData: unknown;
    public readonly visibleRegions: CreepRegion[];
    public unit: Unit;
    public fortifiedVillagerBonusDamage: number = 0;
    public purpleVillagerBonusDamage: number = 0;
    public largeVillagerBonusDamage: number = 0;
    public zeppelinVillagerBonusDamage: number = 0;

    constructor(unit: Unit, towerType: TowerType, visibleRegions: CreepRegion[] = MapRegionController.getVisibleRegions(unit.x, unit.y, unit.acquireRange + 0.5 * MapRegionController.CHECKPOINT_DISTANCE), pathUpgrades: number[] = [0, 0, 0]) {
        this.unit = unit;
        this.towerType = towerType;
        this.pathUpgrades = pathUpgrades;
        this.customData = this.towerType.initializeCustomData();
        this.visibleRegions = visibleRegions;
    }
}
