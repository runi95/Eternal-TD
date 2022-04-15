import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ArcaneSpike extends TowerUpgrade {
    public name = "Arcane Spike";
    public icon = "ReplaceableTextures/CommandButtons/BTNPriestAdept.blp";
    public cost = 10800;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.zeppelinVillagerBonusDamage += 11;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 2, 0);
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.5, 0);
    }
}