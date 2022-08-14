import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class SharpArrows extends TowerUpgrade {
    public readonly name = "Sharp Arrows";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNImprovedBows.blp";
    public readonly cost = 150;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
    }
}
