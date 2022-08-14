import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class VeryQuickShots extends TowerUpgrade {
    public readonly name = "Very Quick Shots";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNImprovedStrengthOfTheMoon.blp";
    public readonly cost = 205;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.745, 0);
    }
}
