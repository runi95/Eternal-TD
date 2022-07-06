import { VoidwalkerCustomData } from "Towers/Voidwalker/Voidwalker";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class IncreasedRange extends TowerUpgrade {
    public name = "Increased Range";
    public icon = "ReplaceableTextures/CommandButtons/BTNROBOGOBLIN.blp";
    public cost = 270;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as VoidwalkerCustomData).additionalRange += 40;
        (tower.customData as VoidwalkerCustomData).spread += 200;
        tower.unit.acquireRange += 200;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 200);
    }
}
