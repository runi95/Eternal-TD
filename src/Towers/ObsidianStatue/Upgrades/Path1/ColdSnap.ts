import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class ColdSnap extends TowerUpgrade {
    public readonly name = "Cold Snap";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNCrushingWave.blp";
    public readonly cost = 380;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasColdSnap = true;
    }
}
