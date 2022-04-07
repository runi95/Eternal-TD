import { TowerUpgrade } from "../../../TowerUpgrade";

export class QuickShots extends TowerUpgrade {
    public name = "Quick Shots";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNStrengthOfTheMoon.blp";
    public cost = 110;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        BlzSetUnitAttackCooldown(unit, BlzGetUnitAttackCooldown(unit, 0) * 0.85, 0);
    }
}