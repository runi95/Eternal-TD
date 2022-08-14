import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class IceShards extends TowerUpgrade {
    public readonly name = "Ice Shards";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNBlizzard.blp";
    public readonly cost = 1620;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasIceShards = true;
        (tower.customData as ObsidianStatueCustomData).range += 50;
    }
}
