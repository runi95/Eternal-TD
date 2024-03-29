import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { GargoyleCustomData } from "../../Gargoyle";

export class IncreasedDamage extends TowerUpgrade {
    public readonly name = "Increased Damage";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNCreatureAttack.blp";
    public readonly cost = 380;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as GargoyleCustomData).hasIncreasedDamage = true;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 2, 0);
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(1) + 2, 1);
    }
}
