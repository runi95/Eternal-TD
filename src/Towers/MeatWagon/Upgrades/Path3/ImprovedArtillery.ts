import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ImprovedArtillery extends TowerUpgrade {
    public name = "Improved Artillery";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSpiritLink.blp";
    public cost = 215;
    public description = "TODO: Write description";

    public applyUpgrade(_tower: Tower): void {
        // TODO: Increase damage against purple enemies
    }
}