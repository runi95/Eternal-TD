import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { ArcaneBlast } from "./Upgrades/Path1/ArcaneBlast";
import { ArcaneMastery } from "./Upgrades/Path1/ArcaneMastery";
import { ArcaneSpike } from "./Upgrades/Path1/ArcaneSpike";
import { Archmage } from "./Upgrades/Path1/Archmage";
import { FasterMagic } from "./Upgrades/Path1/FasterMagic";

export class SkeletalMage extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new FasterMagic(),
            new ArcaneBlast(),
            new ArcaneMastery(),
            new ArcaneSpike(),
            new Archmage(),
        ],
        [
        ],
        [
        ]
    ];
    public unitTypeId: number = FourCC('h00B');
}
