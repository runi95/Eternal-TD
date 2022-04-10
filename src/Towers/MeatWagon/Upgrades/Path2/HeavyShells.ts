import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class HeavyShells extends TowerUpgrade {
    public name = "Heavy Shells";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNEarthquake.blp";
    public cost = 970;
    public description = "TODO: Write description";

    public applyUpgrade(_tower: Tower): void {
        // TODO: Increase damage against Large, Fortified and stunned enemies
    }
}