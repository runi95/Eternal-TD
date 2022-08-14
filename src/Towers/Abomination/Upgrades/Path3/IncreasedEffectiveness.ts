import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

export class IncreasedEffectiveness extends TowerUpgrade {
    public readonly name = "Increased Effectiveness";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNUnholyStrength.blp";
    public readonly cost = 110;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).nonGreaterPermanentImmolationAdditionalUnitCount += 2;
        (tower.customData as AbominationCustomData).greaterPermanentImmolationAdditionalDamageAmount += 2;
    }
}
