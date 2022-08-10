import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class EliteDefender extends TowerUpgrade {
    public name = "Elite Defender";
    public icon = "ReplaceableTextures/CommandButtons/BTNUnholyAura.blp";
    public cost = 15120;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.zeppelinVillagerBonusDamage += 1;
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.5, 0);
    }
}
