import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class BurningArcher extends TowerUpgrade {
    public name = "Burning Archer";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSearingArrows.blp";
    public cost = 675;
    public description = "TODO: Write description";
    public newUnitTypeId = FourCC('h002');

    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 80;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80);
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 2, 0)
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0, BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 500);
    }
}