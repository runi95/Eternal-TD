import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class Embrittlement extends TowerUpgrade {
    public name = "Embrittlement";
    public icon = "ReplaceableTextures/CommandButtons/BTNDarkRitual.blp";
    public cost = 2375;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasEmbrittlement = true;
    }
}