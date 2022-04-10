import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class BurnyStuff extends TowerUpgrade {
    public name = "Burny Stuff";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNLiquidFire.blp";
    public cost = 540;
    public description = "TODO: Write description";

    public applyUpgrade(_tower: Tower): void {
        // TODO: Add napalm to damaged enemies
    }
}