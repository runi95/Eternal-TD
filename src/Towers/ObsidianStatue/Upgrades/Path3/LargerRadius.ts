import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class LargerRadius extends TowerUpgrade {
    public readonly name = "Larger Radius";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNFrostArmor.blp";
    public readonly cost = 190;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).range += 70;
    }
}
