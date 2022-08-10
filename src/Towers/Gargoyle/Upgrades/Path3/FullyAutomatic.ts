import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FullyAutomatic extends TowerUpgrade {
    public name = "Fully-Automatic";
    public icon = "ReplaceableTextures/CommandButtons/BTNDevourMagic.blp";
    public cost = 4590;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.zeppelinVillagerBonusDamage += 1;
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.5, 0);
    }
}
