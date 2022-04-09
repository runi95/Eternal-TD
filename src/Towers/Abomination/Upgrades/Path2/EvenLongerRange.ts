import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

export class EvenLongerRange extends TowerUpgrade {
    public name = "Even Longer Range";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNBansheeMaster.blp";
    public cost = 245;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).range += 40;
        (tower.customData as AbominationCustomData).maxUnitCount += 1;
    }
}