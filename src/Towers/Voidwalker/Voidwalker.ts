import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { LesserVoidwalker } from "./Upgrades/Path1/LesserVoidwalker";

export interface VoidwalkerCustomData {
    duration: number;
    range: number;
}

export class Voidwalker extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new LesserVoidwalker(),
        ],
        [
        ],
        [
        ]
    ];
    public unitTypeId: number = FourCC('h00C');

    public initializeCustomData(): VoidwalkerCustomData {
        return {
            duration: 25,
            range: 400,
        };
    }
}