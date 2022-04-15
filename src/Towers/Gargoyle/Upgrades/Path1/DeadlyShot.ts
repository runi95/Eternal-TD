import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class DeadlyShot extends TowerUpgrade {
    public name = "Deadly Shot";
    public icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp";
    public cost = 3240;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.largeVillagerBonusDamage += 15;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 13, 0);
    }
}