import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { MeatWagoCustomData } from "../../MeatWagon";

export class BurningOil extends TowerUpgrade {
    public readonly name = "Burning Oil";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNIncinerate.blp";
    public readonly cost = 43200;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).hasBurningOil = true;
    }
}
