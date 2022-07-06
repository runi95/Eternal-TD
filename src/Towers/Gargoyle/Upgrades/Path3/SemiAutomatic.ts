import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class SemiAutomatic extends TowerUpgrade {
    public name = "Semi-Automatic";
    public icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp";
    public cost = 3780;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.3333, 0)
    }
}
