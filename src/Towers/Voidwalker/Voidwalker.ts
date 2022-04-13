import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { ElementalVoidwalkers } from "./Upgrades/Path1/ElementalVoidwalkers";
import { IncreasedVoidwalkerEfficiency } from "./Upgrades/Path1/IncreasedVoidwalkerEfficiency";
import { LesserVoidwalker } from "./Upgrades/Path1/LesserVoidwalker";
import { MoreVoidwalkers } from "./Upgrades/Path1/MoreVoidwalkers";
import { IncreasedRange } from "./Upgrades/Path2/IncreasedRange";

export interface VoidwalkerCustomData {
    duration: number;
    spread: number;
    cooldown: number;
    additionalRange: number;
    voidwalkerUnitTypeIndex: number;
    voidwalkerUnitTypeIds: (number[] | null);
}

export class Voidwalker extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new LesserVoidwalker(),
            new MoreVoidwalkers(),
            new IncreasedVoidwalkerEfficiency(),
            new ElementalVoidwalkers(),
        ],
        [
            new IncreasedRange(),
        ],
        [
        ]
    ];
    public unitTypeId: number = FourCC('h00C');

    public initializeCustomData(): VoidwalkerCustomData {
        return {
            duration: 25,
            spread: 400,
            cooldown: 0.95,
            additionalRange: 0,
            voidwalkerUnitTypeIndex: 0,
            voidwalkerUnitTypeIds: null,
        };
    }
}