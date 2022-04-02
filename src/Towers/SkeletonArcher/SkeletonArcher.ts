import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { MeatWagon } from "./MeatWagon";
import { EnhancedEyesight } from "./EnhancedEyesight";
import { LongRangeArrows } from "./LongRangeArrows";
import { QuickShots } from "./QuickShots";
import { RazorSharpArrows } from "./RazorSharpArrows";
import { SearingArrows } from "./SearingArrows";
import { SharpArrows } from "./SharpArrows";
import { TripleShot } from "./TripleShot";
import { VeryQuickShots } from "./VeryQuickShots";
import { CorrosiveAmmo } from "./CorrosiveAmmo";
import { StarThrower } from "./StarThrower";

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
        ],
        [
            new LongRangeArrows(),
            new EnhancedEyesight(),
            new SearingArrows(),
        ]
    ];
    public unitTypeId: number = FourCC('h000');
}