import { HireHarpyRoguesAbility } from "TowerAbilities/HireHarpyRoguesAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class HiredHarpyRogues extends TowerUpgrade {
    public name = "Archer Squad";
    public icon = "ReplaceableTextures/CommandButtons/BTNBattleRoar.blp";
    public cost = 8640;
    public description = "TODO: Write description";
    public ability = new HireHarpyRoguesAbility()

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.75, 0);
    }
}