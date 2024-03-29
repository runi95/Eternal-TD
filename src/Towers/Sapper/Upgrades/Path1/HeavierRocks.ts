import { SapperCustomData } from "../../../Sapper/Sapper";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class HeavierRocks extends TowerUpgrade {
    public readonly name = "Heavier Rocks";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNHumanMissileUpTwo.blp";
    public readonly cost = 700;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as SapperCustomData).maxUnitCount += 10;
        (tower.customData as SapperCustomData).aoeDamage += 1;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
    }
}
