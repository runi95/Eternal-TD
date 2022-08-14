import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class DeepFreeze extends TowerUpgrade {
    public readonly name = "Deep Freeze";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNFreezingBreath.blp";
    public readonly cost = 380;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasDeepFreeze = true;
    }
}
