import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const commanderAbilityId = FourCC('S000');
export class Commander extends TowerUpgrade {
    public name = "Commander";
    public icon = "ReplaceableTextures/CommandButtons/BTNCommandAura.dds";
    public cost = 14040;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.54, 0);
        tower.unit.addAbility(commanderAbilityId);
        tower.unit.hideAbility(commanderAbilityId, true);
    }
}
