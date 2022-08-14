import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class EliteDefender extends TowerUpgrade {
    public readonly name = "Elite Defender";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNUnholyAura.blp";
    public readonly cost = 15120;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.zeppelinVillagerBonusDamage += 1;
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.5, 0);
    }
}
