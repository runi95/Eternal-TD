import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { DeadlyShot } from "./Upgrades/Path1/DeadlyShot";
import { FurtherIncreasedDamage } from "./Upgrades/Path1/FurtherIncreasedDamage";
import { IncreasedDamage } from "./Upgrades/Path1/IncreasedDamage";
import { NightVision } from "./Upgrades/Path2/NightVision";
import { EliteDefender } from "./Upgrades/Path3/EliteDefender";
import { EvenFasterFiring } from "./Upgrades/Path3/EvenFasterFiring";
import { FastFiring } from "./Upgrades/Path3/FastFiring";
import { FullyAutomatic } from "./Upgrades/Path3/FullyAutomatic";
import { SemiAutomatic } from "./Upgrades/Path3/SemiAutomatic";

export class Gargoyle extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new IncreasedDamage(),
            new FurtherIncreasedDamage(),
            new DeadlyShot(),
        ],
        [
            new NightVision(),
        ],
        [
            new FastFiring(),
            new EvenFasterFiring(),
            new SemiAutomatic(),
            new FullyAutomatic(),
            new EliteDefender(),
        ]
    ];
    public unitTypeId: number = FourCC('h009');
}