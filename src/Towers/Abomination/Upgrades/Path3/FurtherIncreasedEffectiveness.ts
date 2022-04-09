import { TowerUpgrade } from "../../../TowerUpgrade";

export class FurtherIncreasedEffectiveness extends TowerUpgrade {
    public name = "Further Increased Effectiveness";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNImprovedUnholyStrength.blp";
    public cost = 110;
    public description = "TODO: Write description";

    public applyUpgrade(_unit: unit): void {
        // NOTE: This function is purposefully left empty because the upgrades happen in Abomination.ts
    }
}