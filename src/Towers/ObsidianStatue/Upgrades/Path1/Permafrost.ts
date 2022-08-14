import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class Permafrost extends TowerUpgrade {
    public readonly name = "Permafrost";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNSlow.blp";
    public readonly cost = 110;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasPermafrost = true;
    }
}
