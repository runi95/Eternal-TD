import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class RapidReload extends TowerUpgrade {
    public readonly name = "Rapid Reload";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNBerserkForTrolls.blp";
    public readonly cost = 540;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) + 0.78, 0);
    }
}
