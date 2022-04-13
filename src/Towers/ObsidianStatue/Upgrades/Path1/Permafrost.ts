import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class Permafrost extends TowerUpgrade {
    public name = "Permafrost";
    public icon = "ReplaceableTextures/CommandButtons/BTNSlow.blp";
    public cost = 110;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasPermafrost = true;
    }
}