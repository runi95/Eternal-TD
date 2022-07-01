import { HireGreaterHarpyAbility } from "TowerAbilities/HireGreaterHarpyAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class HiredGreaterHarpies extends TowerUpgrade {
    public name = "Hired Greater Harpies";
    public icon = "ReplaceableTextures/CommandButtons/BTNEnchantedBears.blp";
    public cost = 48600;
    public description = "TODO: Write description";
    public ability = new HireGreaterHarpyAbility()

    public applyUpgrade(_tower: Tower): void {
        // Intentionally left empty!
    }
}