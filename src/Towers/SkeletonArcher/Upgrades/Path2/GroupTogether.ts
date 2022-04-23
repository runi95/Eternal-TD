import { GroupTogetherAbility } from "TowerAbilities/GroupTogetherAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class GroupTogether extends TowerUpgrade {
    public name = "GroupTogether";
    public icon = "ReplaceableTextures/CommandButtons/BTNEnchantedBears.blp";
    public cost = 8640;
    public description = "TODO: Write description";
    public ability = new GroupTogetherAbility()

    public applyUpgrade(_tower: Tower): void {
        // Intentionally left empty!
    }
}