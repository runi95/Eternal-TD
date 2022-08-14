import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { GargoyleCustomData } from "../../Gargoyle";

export class WeakSplash extends TowerUpgrade {
    public readonly name = "Weak Splash";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNExhumeCorpses.blp";
    public readonly cost = 485;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as GargoyleCustomData).hasSplash = true;
    }
}
