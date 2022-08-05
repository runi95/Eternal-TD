import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { GargoyleCustomData } from "../../Gargoyle";

export class Splash extends TowerUpgrade {
    public name = "Splash";
    public icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp";
    public cost = 485;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as GargoyleCustomData).hasSplash = true;
    }
}
