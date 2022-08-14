import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ImprovedArtillery extends TowerUpgrade {
    public readonly name = "Improved Artillery";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNSpiritLink.blp";
    public readonly cost = 215;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.purpleVillagerBonusDamage += 1;
    }
}
