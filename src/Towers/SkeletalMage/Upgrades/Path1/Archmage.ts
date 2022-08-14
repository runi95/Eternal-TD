import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Archmage extends TowerUpgrade {
    public readonly name = "Archmage";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNSorceressMaster.blp";
    public readonly cost = 34560;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // TODO: Add Dragon's Breath and Shimmer attacks?
        tower.zeppelinVillagerBonusDamage += 6;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 2, 0);
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.5, 0);
    }
}
