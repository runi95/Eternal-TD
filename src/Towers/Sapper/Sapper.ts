import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { LargerRocks } from "./Upgrades/Path1/LargerRocks";
import { HeavierRocks } from "./Upgrades/Path1/HeavierRocks";
import { ReallyBigRocks } from "./Upgrades/Path1/ReallyBigRocks";
import { FasterHurling } from "./Upgrades/Path2/FasterHurling";
import { ExcessiveHurling } from "./Upgrades/Path2/ExcessiveHurling";
import { Wendigo } from "./Upgrades/Path2/Wendigo";
import { ExtraRange } from "./Upgrades/Path3/ExtraRange";
import { FragBombs } from "./Upgrades/Path3/FragBombs";
import { SeaGiant } from "./Upgrades/Path3/SeaGiant";
import { SkeletalHammer } from "./Upgrades/Path1/SkeletalHammer";
import { GreaterHammers } from "./Upgrades/Path1/GreaterHammers";
import { RecursiveBombs } from "./Upgrades/Path3/RecursiveBombs";
import { BombBlitz } from "./Upgrades/Path3/BombBlitz";
import { WendigoSmash } from "./Upgrades/Path2/WendigoSmash";
import { ZeppelinCrusher } from "./Upgrades/Path2/ZeppelinCrusher";

export interface SapperCustomData {
    areaOfEffect: number;
    maxUnitCount: number;
    aoeDamage: number;
}

export class Sapper extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new LargerRocks(),
            new HeavierRocks(),
            new ReallyBigRocks(),
            new SkeletalHammer(),
            new GreaterHammers(),
        ],
        [
            new FasterHurling(),
            new ExcessiveHurling(),
            new Wendigo(),
            new WendigoSmash(),
            new ZeppelinCrusher(),
        ],
        [
            new ExtraRange(),
            new FragBombs(),
            new SeaGiant(),
            new RecursiveBombs(),
            new BombBlitz(),
        ]
    ];
    public unitTypeId: number = FourCC('h003');

    initializeCustomData(): SapperCustomData {
        return {
            areaOfEffect: 120,
            maxUnitCount: 13,
            aoeDamage: 1
        };
    }
}
