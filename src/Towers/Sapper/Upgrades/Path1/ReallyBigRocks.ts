import { SapperCustomData } from "../../../Sapper/Sapper";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ReallyBigRocks extends TowerUpgrade {
    public name = "Really Big Rocks";
    public icon = "ReplaceableTextures/CommandButtons/BTNHumanMissileUpThree.blp";
    public cost = 1295;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as SapperCustomData).areaOfEffect += 90;
        (tower.customData as SapperCustomData).aoeDamage += 1;
        (tower.customData as SapperCustomData).maxUnitCount += 20;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
    }
}
