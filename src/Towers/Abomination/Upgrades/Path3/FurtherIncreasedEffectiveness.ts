import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

export class FurtherIncreasedEffectiveness extends TowerUpgrade {
    public name = "Further Increased Effectiveness";
    public icon = "ReplaceableTextures/CommandButtons/BTNImprovedUnholyStrength.blp";
    public cost = 110;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).nonGreaterPermanentImmolationAdditionalUnitCount += 2;
        (tower.customData as AbominationCustomData).greaterPermanentImmolationAdditionalDamageAmount += 1;
    }
}
