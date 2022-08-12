import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { MeatWagoCustomData } from "../../MeatWagon";

export class Purge extends TowerUpgrade {
    public name = "Shattering Shells";
    public icon = "ReplaceableTextures/CommandButtons/BTNPurge.blp";
    public cost = 11880;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).hasPurge = true;
    }
}
