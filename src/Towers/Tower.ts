import { TowerType } from "./TowerType";
import towers from "./TowerTypes";

const attackAbilityId: number = FourCC('Aatk');

export class Tower {
    public pathUpgrades: number[];
    public readonly unit: unit;
    public readonly towerType: TowerType;

    constructor(unit: unit, pathUpgrades: number[] = [0, 0, 0]) {
        this.unit = unit;
        this.pathUpgrades = pathUpgrades;

        BlzUnitDisableAbility(unit, attackAbilityId, false, true);
        const unitTypeId: number = GetUnitTypeId(this.unit);
        const towerType: TowerType | undefined = towers.get(unitTypeId);
        if (towerType === undefined) {
            throw new Error(`Invalid argument; no TowerType of unitTypeId ${unitTypeId} exists`);
        }

        this.towerType = towerType;
    }
}