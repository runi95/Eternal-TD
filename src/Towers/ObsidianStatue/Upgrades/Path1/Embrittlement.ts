import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class Embrittlement extends TowerUpgrade {
    public readonly name = "Embrittlement";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNDarkRitual.blp";
    public readonly cost = 2375;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasEmbrittlement = true;
    }
}
