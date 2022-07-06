import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class ReFreeze extends TowerUpgrade {
    public name = "Re-Freeze";
    public icon = "ReplaceableTextures/CommandButtons/BTNFrost.blp";
    public cost = 245;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasReFreeze = true;
    }
}
