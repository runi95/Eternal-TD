import { HireHarpyRoguesAbility } from "../../../../TowerAbilities/HireHarpyRoguesAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class HiredHarpyRogues extends TowerUpgrade {
    public readonly name = "Hired Harpy Rogues";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNBattleRoar.blp";
    public readonly cost = 8640;
    public readonly description = "TODO: Write description";
    public readonly ability = new HireHarpyRoguesAbility();

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.75, 0);
    }
}
