import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { MeatWagon } from "./Upgrades/MeatWagon";
import { EnhancedEyesight } from "./Upgrades/EnhancedEyesight";
import { LongRangeArrows } from "./Upgrades/LongRangeArrows";
import { QuickShots } from "./Upgrades/QuickShots";
import { RazorSharpArrows } from "./Upgrades/RazorSharpArrows";
import { BurningArcher } from "./Upgrades/BurningArcher";
import { SharpArrows } from "./Upgrades/SharpArrows";
import { TripleShot } from "./Upgrades/TripleShot";
import { VeryQuickShots } from "./Upgrades/VeryQuickShots";
import { CorrosiveAmmo } from "./Upgrades/CorrosiveAmmo";
import { StarThrower } from "./Upgrades/StarThrower";
import { SharpShooter } from "./Upgrades/SharpShooter";
import { BowMaster } from "./Upgrades/BowMaster";

export class SkeletonArcher extends TowerType {
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSkeletonArcher.blp";
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