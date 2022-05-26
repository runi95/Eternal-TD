import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { ColdSnap } from "./Upgrades/Path1/ColdSnap";
import { Permafrost } from "./Upgrades/Path1/Permafrost";
import { EnhancedFreeze } from "./Upgrades/Path2/EnhancedFreeze";
import { LargerRadius } from "./Upgrades/Path3/LargerRadius";
import { ReFreeze } from "./Upgrades/Path3/ReFreeze";
import {Unit} from "w3ts";
import { IceShards } from "./Upgrades/Path1/IceShards";
import { DeepFreeze } from "./Upgrades/Path2/DeepFreeze";
import { FrostWyrm } from "./Upgrades/Path3/FrostWyrm";
import { ArcticWind } from "./Upgrades/Path2/ArcticWind";
import { Embrittlement } from "./Upgrades/Path1/Embrittlement";
import { SuperBrittle } from "./Upgrades/Path1/SuperBrittle";

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
        ],
        [
            new LargerRadius(),
            new ReFreeze(),
            new FrostWyrm(),
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
        };
    }

    public applyInitialUnitValues(unit: Unit): void {
        // Sets the initial tick cooldown to 2.4
        BlzSetAbilityRealLevelField(unit.getAbility(tickTowerAbilityId), ABILITY_RLF_COOLDOWN, 0, 2.4);
    }
}