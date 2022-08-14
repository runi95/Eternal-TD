import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class BouncingMissile extends TowerUpgrade {
    public readonly name = "Bouncing Missile";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNAbsorbMagic.blp";
    public readonly cost = 3455;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        BlzSetUnitWeaponBooleanField(tower.unit.handle, UNIT_WEAPON_BF_ATTACKS_ENABLED, 0, false);
        BlzSetUnitWeaponBooleanField(tower.unit.handle, UNIT_WEAPON_BF_ATTACKS_ENABLED, 1, true);
    }
}
