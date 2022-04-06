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

export class Abomination extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new LargerRocks(),
            new HeavierRocks(),
            new ReallyBigRocks(),
        ],
        [
            new FasterHurling(),
            new ExcessiveHurling(),
            new Wendigo(),
        ],
        [
            new ExtraRange(),
            new FragBombs(),
            new SeaGiant(),
        ]
    ];
    public unitTypeId: number = FourCC('h003');
}