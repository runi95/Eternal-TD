import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FasterHurling extends TowerUpgrade {
    public readonly name = "Faster Hurling";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNDispelMagic.blp";
    public readonly cost = 270;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.75, 0)
    }
}
