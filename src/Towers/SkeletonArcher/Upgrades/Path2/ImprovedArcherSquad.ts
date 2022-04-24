import { ImprovedArcherSquadAbility } from "TowerAbilities/ImprovedArcherSquadAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ImprovedArcherSquad extends TowerUpgrade {
    public name = "Improved Archer Squad";
    public icon = "ReplaceableTextures/CommandButtons/BTNEnchantedBears.blp";
    public cost = 48600;
    public description = "TODO: Write description";
    public ability = new ImprovedArcherSquadAbility()

    public applyUpgrade(_tower: Tower): void {
        // Intentionally left empty!
    }
}