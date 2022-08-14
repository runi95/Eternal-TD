import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { GargoyleCustomData } from "../../Gargoyle";

export class DeadlyShot extends TowerUpgrade {
    public readonly name = "Deadly Shot";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNAdvancedCreatureAttack.blp";
    public readonly cost = 3240;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as GargoyleCustomData).aoeDamage += 2;
        tower.largeVillagerBonusDamage += 15;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 13, 0);
    }
}
