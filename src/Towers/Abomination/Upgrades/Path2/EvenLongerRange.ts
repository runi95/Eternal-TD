import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

export class EvenLongerRange extends TowerUpgrade {
    public readonly name = "Even Longer Range";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNBansheeMaster.blp";
    public readonly cost = 245;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).range += 40;
        (tower.customData as AbominationCustomData).maxUnitCount += 1;
    }
}
