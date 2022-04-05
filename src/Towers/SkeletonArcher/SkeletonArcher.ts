import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { MeatWagon } from "./Upgrades/Path1/MeatWagon";
import { EnhancedEyesight } from "./Upgrades/Path3/EnhancedEyesight";
import { LongRangeArrows } from "./Upgrades/Path3/LongRangeArrows";
import { QuickShots } from "./Upgrades/Path2/QuickShots";
import { RazorSharpArrows } from "./Upgrades/Path1/RazorSharpArrows";
import { BurningArcher } from "./Upgrades/Path3/BurningArcher";
import { SharpArrows } from "./Upgrades/Path1/SharpArrows";
import { TripleShot } from "./Upgrades/Path2/TripleShot";
import { VeryQuickShots } from "./Upgrades/Path2/VeryQuickShots";
import { CorrosiveAmmo } from "./Upgrades/Path1/CorrosiveAmmo";
import { StarThrower } from "./Upgrades/Path1/StarThrower";
import { SharpShooter } from "./Upgrades/Path3/SharpShooter";
import { BowMaster } from "./Upgrades/Path3/BowMaster";

export class SkeletonArcher extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new SharpArrows(),
            new RazorSharpArrows(),
            new MeatWagon(),
            new CorrosiveAmmo(),
            new StarThrower(),
        ],
        [
            new QuickShots(),
            new VeryQuickShots(),
            new TripleShot(),
            // TODO: Add Upgrade
            // TODO: Add Upgrade
        ],
        [
            new LongRangeArrows(),
            new EnhancedEyesight(),
            new BurningArcher(),
            new SharpShooter(),
            new BowMaster(),
        ]
    ];
    public unitTypeId: number = FourCC('h000');
}