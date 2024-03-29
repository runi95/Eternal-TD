import { TowerType } from "../TowerType";
import { ColdSnap } from "./Upgrades/Path1/ColdSnap";
import { Permafrost } from "./Upgrades/Path1/Permafrost";
import { EnhancedFreeze } from "./Upgrades/Path2/EnhancedFreeze";
import { LargerRadius } from "./Upgrades/Path3/LargerRadius";
import { ReFreeze } from "./Upgrades/Path3/ReFreeze";
import { IceShards } from "./Upgrades/Path1/IceShards";
import { DeepFreeze } from "./Upgrades/Path2/DeepFreeze";
import { FrostWyrm } from "./Upgrades/Path3/FrostWyrm";
import { ArcticWind } from "./Upgrades/Path2/ArcticWind";
import { Embrittlement } from "./Upgrades/Path1/Embrittlement";
import { SuperBrittle } from "./Upgrades/Path1/SuperBrittle";
import { Snowstorm } from "./Upgrades/Path2/Snowstorm";
import type { Unit } from "w3ts";
import type { TowerUpgrade } from "../TowerUpgrade";
import { AbsoluteZero } from "./Upgrades/Path2/AbsoluteZero";
import { Icicles } from "./Upgrades/Path3/Icicles";
import { IcicleImpale } from "./Upgrades/Path3/IcicleImpale";

export interface ObsidianStatueCustomData {
    range: number;
    maxUnitCount: number;
    damageAmount: number;
    freezeDuration: number;
    hasPermafrost: boolean;
    hasColdSnap: boolean;
    hasReFreeze: boolean;
    hasIceShards: boolean;
    hasDeepFreeze: boolean;
    hasEmbrittlement: boolean;
    hasSuperBrittle: boolean;
    hasIcicles: boolean;
}

const tickTowerAbilityId: number = FourCC('A008');

// TODO: Should not be able to target invisible creeps
export class ObsidianStatue extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new Permafrost(),
            new ColdSnap(),
            new IceShards(),
            new Embrittlement(),
            new SuperBrittle(),
        ],
        [
            new EnhancedFreeze(),
            new DeepFreeze(),
            new ArcticWind(),
            new Snowstorm(),
            new AbsoluteZero()
        ],
        [
            new LargerRadius(),
            new ReFreeze(),
            new FrostWyrm(),
            new Icicles(),
            new IcicleImpale()
        ]
    ];
    public unitTypeId: number = FourCC('h008');

    public initializeCustomData(): ObsidianStatueCustomData {
        return {
            range: 270,
            maxUnitCount: 40,
            damageAmount: 1,
            freezeDuration: 1.5,
            hasPermafrost: false,
            hasColdSnap: false,
            hasReFreeze: false,
            hasIceShards: false,
            hasDeepFreeze: false,
            hasEmbrittlement: false,
            hasSuperBrittle: false,
            hasIcicles: false,
        };
    }

    public applyInitialUnitValues(unit: Unit): void {
        // Sets the initial tick cooldown to 2.4
        BlzSetAbilityRealLevelField(unit.getAbility(tickTowerAbilityId), ABILITY_RLF_COOLDOWN, 0, 2.4);
    }
}
