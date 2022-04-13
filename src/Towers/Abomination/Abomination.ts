import { TowerType } from "../TowerType";
import { TowerUpgrade } from "../TowerUpgrade";
import { EvenFasterSpread } from "./Upgrades/Path1/EvenFasterSpread";
import { FasterSpread } from "./Upgrades/Path1/FasterSpread";
import { GreaterPermanentImmolation } from "./Upgrades/Path1/GreaterPermanentImmolation";
import { Inferno } from "./Upgrades/Path1/Inferno";
import { PermanentImmolation } from "./Upgrades/Path1/PermanentImmolation";
import { EvenLongerRange } from "./Upgrades/Path2/EvenLongerRange";
import { LongerRange } from "./Upgrades/Path2/LongerRange";
import { MaximizeEffectiveness } from "./Upgrades/Path3/MaximizeEffectiveness";
import { FurtherIncreasedEffectiveness } from "./Upgrades/Path3/FurtherIncreasedEffectiveness";
import { IncreasedEffectiveness } from "./Upgrades/Path3/IncreasedEffectiveness";
import { Overdrive } from "./Upgrades/Path3/Overdrive";
import { ContaminationZone } from "./Upgrades/Path3/ContaminationZone";
import {Unit} from "w3ts";

export interface AbominationCustomData {
    range: number;
    maxUnitCount: number;
    damageAmount: number;
    hasGreaterPermanentImmolation: boolean;
    greaterPermanentImmolationAdditionalUnitCount: number;
    greaterPermanentImmolationAdditionalDamageAmount: number;
    nonGreaterPermanentImmolationAdditionalUnitCount: number;
}

const tickTowerAbilityId: number = FourCC('A008');

// TODO: Should not be able to target invisible creeps
export class Abomination extends TowerType {
    public upgrades: TowerUpgrade[][] = [
        [
            new FasterSpread(),
            new EvenFasterSpread(),
            new PermanentImmolation(),
            new GreaterPermanentImmolation(),
            new Inferno(),
        ],
        [
            new LongerRange(),
            new EvenLongerRange(),
        ],
        [
            new IncreasedEffectiveness(),
            new FurtherIncreasedEffectiveness(),
            new MaximizeEffectiveness(),
            new Overdrive(),
            new ContaminationZone(),
        ]
    ];
    public unitTypeId: number = FourCC('h007');
    
    public initializeCustomData(): AbominationCustomData {
        return {
            range: 300,
            maxUnitCount: 8,
            damageAmount: 1,
            hasGreaterPermanentImmolation: false,
            greaterPermanentImmolationAdditionalUnitCount: 0,
            greaterPermanentImmolationAdditionalDamageAmount: 0,
            nonGreaterPermanentImmolationAdditionalUnitCount: 0,
        };
    }

    public applyInitialUnitValues(unit: Unit): void {
        // Sets the initial tick cooldown to 1.4
        BlzSetAbilityRealLevelField(unit.getAbility(tickTowerAbilityId), ABILITY_RLF_COOLDOWN, 0, 1.4);
    }
}