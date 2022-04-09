import { TowerUpgrade } from "../../../TowerUpgrade";

export class MaximizeEffectiveness extends TowerUpgrade {
    public name = "Maximize Effectiveness";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNAdvancedUnholyStrength.blp";
    public cost = 485;
    public description = "TODO: Write description";

    public applyUpgrade(_unit: unit): void {
        // NOTE: This function is purposefully left empty because the upgrades happen in Abomination.ts
    }
}