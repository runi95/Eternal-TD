import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class LargerRadius extends TowerUpgrade {
    public name = "Larger Radius";
    public icon = "ReplaceableTextures/CommandButtons/BTNFrostArmor.blp";
    public cost = 190;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).range += 70;
    }
}
