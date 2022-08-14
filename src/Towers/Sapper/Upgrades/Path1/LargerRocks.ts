import { SapperCustomData } from "../../../Sapper/Sapper";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class LargerRocks extends TowerUpgrade {
    public readonly name = "Larger Rocks";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNHumanMissileUpOne.blp";
    public readonly cost = 380;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as SapperCustomData).areaOfEffect += 60;
    }
}
