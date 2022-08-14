import { ArtilleryAbility } from "../../../../TowerAbilities/ArtilleryAbility";
import { TowerAbility } from "../../../../TowerAbilities/TowerAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Artillery extends TowerUpgrade {
    public readonly name = "Artillery";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNClusterRockets.blp";
    public readonly cost = 5940;
    public readonly description = "TODO: Write description";
    public readonly ability?: TowerAbility = new ArtilleryAbility();

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.25, 0);
    }
}
