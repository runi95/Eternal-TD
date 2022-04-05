import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";

export class Abomination extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [],
        [],
        []
    ];
    public unitTypeId: number = FourCC('h003');
}