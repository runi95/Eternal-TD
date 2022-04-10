import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { WarSong } from "./Upgrades/Path1/WarSong";
import { BiggerBlast } from "./Upgrades/Path1/BiggerBlast";
import { FasterReload } from "./Upgrades/Path2/FasterReload";
import { HeavyShells } from "./Upgrades/Path2/HeavyShells";
import { RapidReload } from "./Upgrades/Path2/RapidReload";
import { BurnyStuff } from "./Upgrades/Path3/BurnyStuff";
import { ImprovedArtillery } from "./Upgrades/Path3/ImprovedArtillery";

export class MeatWagon extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new BiggerBlast(),
            new WarSong(),
        ],
        [
            new FasterReload(),
            new RapidReload(),
            new HeavyShells(),
        ],
        [
            new ImprovedArtillery(),
            new BurnyStuff(),
        ]
    ];
    public unitTypeId: number = FourCC('h00A');
}