import { TowerUpgrade } from "../../../TowerUpgrade";

export class IncreasedEffectiveness extends TowerUpgrade {
    public name = "Increased Effectiveness";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNUnholyStrength.blp";
    public cost = 110;
    public description = "TODO: Write description";

    public applyUpgrade(_unit: unit): void {
        // NOTE: This function is purposefully left empty because the upgrades happen in Abomination.ts
    }
}