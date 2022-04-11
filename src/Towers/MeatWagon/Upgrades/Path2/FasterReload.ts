import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FasterReload extends TowerUpgrade {
    public name = "Faster Reload";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNBloodLust.blp";
    public cost = 325;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) + 0.75, 0);
    }
}