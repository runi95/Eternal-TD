import { VoidwalkerCustomData } from "../../../Voidwalker/Voidwalker";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class IncreasedVoidwalkerEfficiency extends TowerUpgrade {
    public readonly name = "Increased Voidwalker Efficiency";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNEngineeringUpgrade.blp";
    public readonly cost = 620;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.6, 0);
        (tower.customData as VoidwalkerCustomData).cooldown *= 0.6;
    }
}
