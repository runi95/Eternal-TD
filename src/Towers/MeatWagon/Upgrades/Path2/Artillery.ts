import { ArtilleryAbility } from "../../../../TowerAbilities/ArtilleryAbility";
import { TowerAbility } from "../../../../TowerAbilities/TowerAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Artillery extends TowerUpgrade {
    public name = "Artillery";
    public icon = "ReplaceableTextures/CommandButtons/BTNStampede.blp";
    public cost = 5940;
    public description = "TODO: Write description";
    public ability?: TowerAbility = new ArtilleryAbility();

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.25, 0);
    }
}
