import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { CripplingShot } from "./Upgrades/Path1/CripplingShot";
import { DeadlyShot } from "./Upgrades/Path1/DeadlyShot";
import { FurtherIncreasedDamage } from "./Upgrades/Path1/FurtherIncreasedDamage";
import { IncreasedDamage } from "./Upgrades/Path1/IncreasedDamage";
import { ZeppelinCrasher } from "./Upgrades/Path1/ZeppelinCrasher";
import { BouncingMissile } from "./Upgrades/Path2/BouncingMissile";
import { Commander } from "./Upgrades/Path2/Commander";
import { NightVision } from "./Upgrades/Path2/NightVision";
import { ObsidianForm } from "./Upgrades/Path2/ObsidianForm";
import { WeakSplash } from "./Upgrades/Path2/WeakSplash";
import { EliteDefender } from "./Upgrades/Path3/EliteDefender";
import { EvenFasterFiring } from "./Upgrades/Path3/EvenFasterFiring";
import { FastFiring } from "./Upgrades/Path3/FastFiring";
import { FullyAutomatic } from "./Upgrades/Path3/FullyAutomatic";
import { SemiAutomatic } from "./Upgrades/Path3/SemiAutomatic";

export interface GargoyleCustomData {
    hasSplash: boolean;
    hasIncreasedDamage: boolean;
    hasObsidianForm: boolean;
    areaOfEffect: number;
    maxUnitCount: number;
    aoeDamage: number;
}

export class Gargoyle extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new IncreasedDamage(),
            new FurtherIncreasedDamage(),
            new DeadlyShot(),
            new ZeppelinCrasher(),
            new CripplingShot()
        ],
        [
            new NightVision(),
            new WeakSplash(),
            new BouncingMissile(),
            new ObsidianForm(),
            new Commander()
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

    initializeCustomData(): GargoyleCustomData {
        return {
            hasSplash: false,
            hasIncreasedDamage: false,
            hasObsidianForm: false,
            areaOfEffect: 150,
            maxUnitCount: 10,
            aoeDamage: 1
        };
    }
}
