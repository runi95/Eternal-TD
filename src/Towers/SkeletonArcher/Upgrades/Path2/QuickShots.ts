import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class QuickShots extends TowerUpgrade {
    public readonly name = "Quick Shots";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNStrengthOfTheMoon.blp";
    public readonly cost = 110;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.85, 0);
    }
}
