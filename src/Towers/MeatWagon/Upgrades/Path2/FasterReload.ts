import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FasterReload extends TowerUpgrade {
    public readonly name = "Faster Reload";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNBloodLust.blp";
    public readonly cost = 325;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) + 0.75, 0);
    }
}
