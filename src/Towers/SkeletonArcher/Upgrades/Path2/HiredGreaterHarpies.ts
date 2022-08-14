import { HireGreaterHarpyAbility } from "../../../../TowerAbilities/HireGreaterHarpyAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class HiredGreaterHarpies extends TowerUpgrade {
    public readonly name = "Hired Greater Harpies";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNEnchantedBears.blp";
    public readonly cost = 48600;
    public readonly description = "TODO: Write description";
    public readonly ability = new HireGreaterHarpyAbility()

    public applyUpgrade(_tower: Tower): void {
        // Intentionally left empty!
    }
}
