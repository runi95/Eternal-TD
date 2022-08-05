import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { GargoyleCustomData } from "../../Gargoyle";

export class FurtherIncreasedDamage extends TowerUpgrade {
    public name = "Further Increased Damage";
    public icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp";
    public cost = 1620;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as GargoyleCustomData).aoeDamage += 1;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 3, 0);
    }
}
