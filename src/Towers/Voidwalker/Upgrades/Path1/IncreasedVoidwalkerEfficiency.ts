import { VoidwalkerCustomData } from "Towers/Voidwalker/Voidwalker";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class IncreasedVoidwalkerEfficiency extends TowerUpgrade {
    public name = "Increased Voidwalker Efficiency";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNEngineeringUpgrade.blp";
    public cost = 620;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.6, 0);
        (tower.customData as VoidwalkerCustomData).cooldown *= 0.6;
    }
}