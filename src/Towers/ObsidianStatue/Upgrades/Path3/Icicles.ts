import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class Icicles extends TowerUpgrade {
    public name = "Icicles";
    public icon = "ReplaceableTextures/CommandButtons/BTNColdArrows.blp";
    public cost = 2970;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasIcicles = true;
    }
} 
