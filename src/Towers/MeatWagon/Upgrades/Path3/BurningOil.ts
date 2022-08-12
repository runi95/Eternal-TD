import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { MeatWagoCustomData } from "../../MeatWagon";

export class BurningOil extends TowerUpgrade {
    public name = "Burning Oil";
    public icon = "ReplaceableTextures/CommandButtons/BTNIncinerate.blp";
    public cost = 43200;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).hasBurningOil = true;
    }
}
