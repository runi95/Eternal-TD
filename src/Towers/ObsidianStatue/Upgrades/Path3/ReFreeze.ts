import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class ReFreeze extends TowerUpgrade {
    public readonly name = "Re-Freeze";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNFrost.blp";
    public readonly cost = 245;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasReFreeze = true;
    }
}
