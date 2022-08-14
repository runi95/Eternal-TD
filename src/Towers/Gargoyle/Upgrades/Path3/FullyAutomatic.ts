import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FullyAutomatic extends TowerUpgrade {
    public readonly name = "Fully-Automatic";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNDevourMagic.blp";
    public readonly cost = 4590;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.zeppelinVillagerBonusDamage += 1;
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.5, 0);
    }
}
