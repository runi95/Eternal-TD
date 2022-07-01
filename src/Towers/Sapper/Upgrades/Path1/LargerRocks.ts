import { SapperCustomData } from "Towers/Sapper/Sapper";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class LargerRocks extends TowerUpgrade {
    public name = "Larger Rocks";
    public icon = "ReplaceableTextures/CommandButtons/BTNHumanMissileUpOne.blp";
    public cost = 380;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as SapperCustomData).areaOfEffect += 60;
    }
}