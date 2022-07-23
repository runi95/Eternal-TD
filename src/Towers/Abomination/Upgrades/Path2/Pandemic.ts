import { PandemicAbility } from "../../../../TowerAbilities/PandemicAbility";
import { TowerAbility } from "../../../../TowerAbilities/TowerAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Pandemic extends TowerUpgrade {
    public name = "Pandemic";
    public icon = "ReplaceableTextures/CommandButtons/BTNPossession.blp";
    public cost = 2915;
    public description = "TODO: Write description";
    public ability: TowerAbility = new PandemicAbility();

    public applyUpgrade(_tower: Tower): void {
        // Function is intentionally left empty
    }
}
