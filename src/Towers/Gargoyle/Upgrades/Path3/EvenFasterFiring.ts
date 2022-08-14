import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class EvenFasterFiring extends TowerUpgrade {
    public readonly name = "Even Faster Firing";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNCannibalize.blp";
    public readonly cost = 430;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.7, 0);
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(1) * 0.7, 1);
    }
}
