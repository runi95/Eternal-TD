import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class DeepFreeze extends TowerUpgrade {
    public name = "Deep Freeze";
    public icon = "ReplaceableTextures/CommandButtons/BTNFreezingBreath.blp";
    public cost = 380;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasDeepFreeze = true;
    }
}