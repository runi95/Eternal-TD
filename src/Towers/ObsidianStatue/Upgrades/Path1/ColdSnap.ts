import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class ColdSnap extends TowerUpgrade {
    public name = "Cold Snap";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNCrushingWave.blp";
    public cost = 380;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasColdSnap = true;
    }
}