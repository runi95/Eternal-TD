import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ArcaneBlast extends TowerUpgrade {
    public name = "Arcane Blast";
    public icon = "ReplaceableTextures/CommandButtons/BTNDispelMagic.blp";
    public cost = 650;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
    }
}
