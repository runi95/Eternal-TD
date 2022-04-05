import { TowerUpgrade } from "../../../TowerUpgrade";

export class VeryQuickShots extends TowerUpgrade {
    public name = "Very Quick Shots";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNImprovedStrengthOfTheMoon.blp";
    public cost = 205;
    public description = "Attack +27.6% faster!";

    public applyUpgrade(unit: unit): void {
        BlzSetUnitAttackCooldown(unit, BlzGetUnitAttackCooldown(unit, 0) * 0.745, 0);
    }
}