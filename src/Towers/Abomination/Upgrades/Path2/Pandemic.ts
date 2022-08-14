import { PandemicAbility } from "../../../../TowerAbilities/PandemicAbility";
import { TowerAbility } from "../../../../TowerAbilities/TowerAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Pandemic extends TowerUpgrade {
    public readonly name = "Pandemic";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNPossession.blp";
    public readonly cost = 2915;
    public readonly description = "TODO: Write description";
    public readonly ability: TowerAbility = new PandemicAbility();

    public applyUpgrade(_tower: Tower): void {
        // Function is intentionally left empty
    }
}
