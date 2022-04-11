import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class QuickShots extends TowerUpgrade {
    public name = "Quick Shots";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNStrengthOfTheMoon.blp";
    public cost = 110;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.85, 0);

    }
}