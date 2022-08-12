import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { MeatWagoCustomData } from "../../MeatWagon";

export class BurnyStuff extends TowerUpgrade {
    public name = "Burny Stuff";
    public icon = "ReplaceableTextures/CommandButtons/BTNLiquidFire.blp";
    public cost = 540;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).hasBurnyStuff = true;
    }
}
