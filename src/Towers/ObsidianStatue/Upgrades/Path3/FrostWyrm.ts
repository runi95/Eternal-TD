import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class FrostWyrm extends TowerUpgrade {
    public name = "Frost Wyrm";
    public icon = "ReplaceableTextures/CommandButtons/BTNFrostWyrm.blp";
    public cost = 2105;
    public description = "TODO: Write description";
    public newUnitTypeId = FourCC('h00G');

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).maxUnitCount -= 10;
        (tower.customData as ObsidianStatueCustomData).range -= 70;
        (tower.customData as ObsidianStatueCustomData).damageAmount += 1;
    }
} 