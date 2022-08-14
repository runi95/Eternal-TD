import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class SemiAutomatic extends TowerUpgrade {
    public readonly name = "Semi-Automatic";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNNecromancerAdept.blp";
    public readonly cost = 3780;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.3333, 0);
    }
}
