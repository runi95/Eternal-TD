import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

export class LongerRange extends TowerUpgrade {
    public name = "Longer Range";
    public icon = "ReplaceableTextures/CommandButtons/BTNBansheeAdept.blp";
    public cost = 110;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).range += 40;
        (tower.customData as AbominationCustomData).greaterPermanentImmolationAdditionalUnitCount += 3;
    }
}
