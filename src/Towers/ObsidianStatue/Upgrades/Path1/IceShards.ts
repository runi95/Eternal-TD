import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class IceShards extends TowerUpgrade {
    public name = "Ice Shards";
    public icon = "ReplaceableTextures/CommandButtons/BTNBlizzard.blp";
    public cost = 1620;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasIceShards = true;
        (tower.customData as ObsidianStatueCustomData).range += 50;
    }
}
