import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { MeatWagoCustomData } from "../../MeatWagon";

export class BurnyStuff extends TowerUpgrade {
    public readonly name = "Burny Stuff";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNBurningOil.blp";
    public readonly cost = 540;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).hasBurnyStuff = true;
    }
}
