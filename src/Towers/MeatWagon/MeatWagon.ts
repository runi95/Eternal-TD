import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";

export class MeatWagon extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
        ],
        [
        ],
        [
        ]
    ];
    public unitTypeId: number = FourCC('h00A');
}