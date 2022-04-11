import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class IncreasedDamage extends TowerUpgrade {
    public name = "Increased Damage";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp";
    public cost = 380;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 2, 0);
    }
}