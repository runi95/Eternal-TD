import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { GargoyleCustomData } from "../../Gargoyle";

export class DeadlyShot extends TowerUpgrade {
    public name = "Deadly Shot";
    public icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp";
    public cost = 3240;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as GargoyleCustomData).aoeDamage += 2;
        tower.largeVillagerBonusDamage += 15;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 13, 0);
    }
}
