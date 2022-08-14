import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class Icicles extends TowerUpgrade {
    public readonly name = "Icicles";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNColdArrows.blp";
    public readonly cost = 2970;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasIcicles = true;
    }
} 
