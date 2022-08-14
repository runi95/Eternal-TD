import { PlagueAbility } from "../../../../TowerAbilities/PlagueAbility";
import { TowerAbility } from "../../../../TowerAbilities/TowerAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Plague extends TowerUpgrade {
    public readonly name = "Plague";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNCarrionSwarm.blp";
    public readonly cost = 16200;
    public readonly description = "TODO: Write description";
    public readonly ability: TowerAbility = new PlagueAbility();

    public applyUpgrade(_tower: Tower): void {
        // Function is intentionally left empty
    }
}
