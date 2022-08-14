import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { MeatWagoCustomData } from "../../MeatWagon";

export class Purge extends TowerUpgrade {
    public readonly name = "Shattering Shells";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNPurge.blp";
    public readonly cost = 11880;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).hasPurge = true;
    }
}
