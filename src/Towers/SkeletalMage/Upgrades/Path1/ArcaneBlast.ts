import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ArcaneBlast extends TowerUpgrade {
    public readonly name = "Arcane Blast";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNDispelMagic.blp";
    public readonly cost = 650;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
    }
}
