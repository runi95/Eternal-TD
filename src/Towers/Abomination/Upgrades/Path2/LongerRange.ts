import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

export class LongerRange extends TowerUpgrade {
    public readonly name = "Longer Range";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNBansheeAdept.blp";
    public readonly cost = 110;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).range += 40;
        (tower.customData as AbominationCustomData).greaterPermanentImmolationAdditionalUnitCount += 3;
    }
}
