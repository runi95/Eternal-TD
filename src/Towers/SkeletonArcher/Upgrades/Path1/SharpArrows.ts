import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class SharpArrows extends TowerUpgrade {
    public name = "Sharp Arrows";
    public icon = "ReplaceableTextures/CommandButtons/BTNImprovedBows.blp";
    public cost = 150;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
    }
}
