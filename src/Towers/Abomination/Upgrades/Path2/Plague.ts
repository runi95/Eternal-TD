import { PlagueAbility } from "TowerAbilities/PlagueAbility";
import { TowerAbility } from "TowerAbilities/TowerAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Plague extends TowerUpgrade {
    public name = "Plague";
    public icon = "ReplaceableTextures/CommandButtons/BTNCarrionSwarm.blp";
    public cost = 16200;
    public description = "TODO: Write description";
    public ability: TowerAbility = new PlagueAbility();

    public applyUpgrade(_tower: Tower): void {
        // Function is intentionally left empty
    }
}
