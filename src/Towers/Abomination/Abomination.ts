import { GroupInRange } from "../../JassOverrides/GroupInRange";
import { Tower } from "../Tower";
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
    public tick: (tower: Tower) => void = (tower: Tower) => {
        let tickModifier = 14;
        let damageAmount = 1;
        let maxUnitCount = 8;
        if (tower.pathUpgrades[0] > 0) {
            tickModifier -= 3;
        }

        if (tower.pathUpgrades[0] > 1) {
            tickModifier -= 3;
        }

        if (tower.pathUpgrades[0] > 2) {
            damageAmount += 1;
        }

        if (tower.pathUpgrades[0] > 3) {
            damageAmount += 1;
            tickModifier -= 3;
            maxUnitCount += 7;

            if (tower.pathUpgrades[1] > 0) {
                maxUnitCount += 3;
            }
        }

        if (tower.pathUpgrades[0] > 4) {
            damageAmount += 1;
            tickModifier -= 4;
        }

        if (tower.pathUpgrades[1] > 1) {
            maxUnitCount += 1;
        }

        if (tower.pathUpgrades[2] > 0) {
            if (tower.pathUpgrades[0] > 3) {
                damageAmount += 1;
            } else {
                maxUnitCount += 2;
            }
        }

        if (tower.pathUpgrades[2] > 1) {
            if (tower.pathUpgrades[0] > 3) {
                damageAmount += 1;
            } else {
                maxUnitCount += 2;
            }
        }

        if (tower.pathUpgrades[2] > 2) {
            maxUnitCount += 4;
            tickModifier -= 3;
        }

        if (tower.pathUpgrades[2] > 3) {
            maxUnitCount += 1;
            tickModifier -= 3;
        }

        if (tower.pathUpgrades[2] > 4) {
            maxUnitCount += 16;
            tickModifier -= 1;
            damageAmount += 1;
        }

        const userData: number = (GetUnitUserData(tower.unit) + 1) % tickModifier;
        SetUnitUserData(tower.unit, userData);

        if (userData > 0)
            return;

        const loc = GetUnitLoc(tower.unit);
        const group = new GroupInRange(GetUnitAcquireRange(tower.unit), loc);

        let unitCount = 0;
        group.for((u: unit) => {
            if (unitCount >= maxUnitCount)
                return;

            if (!UnitAlive(u))
                return;

            unitCount++;
            UnitDamageTargetBJ(tower.unit, u, damageAmount, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL);
        });
        group.destroy();
        RemoveLocation(loc);
    }
}