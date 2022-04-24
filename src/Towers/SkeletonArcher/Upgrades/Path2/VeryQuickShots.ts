import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class VeryQuickShots extends TowerUpgrade {
    public name = "Very Quick Shots";
    public icon = "ReplaceableTextures/CommandButtons/BTNImprovedStrengthOfTheMoon.blp";
    public cost = 205;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.745, 0);
    }
}