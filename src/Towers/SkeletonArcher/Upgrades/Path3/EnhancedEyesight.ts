import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class EnhancedEyesight extends TowerUpgrade {
    public name = "Enhanced Eyesight";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNUltravision.blp";
    public cost = 215;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        SetUnitAcquireRange(tower.unit, GetUnitAcquireRange(tower.unit) + 80);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80);
        BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0, BlzGetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 100);
        
        // Allows targetting (wards) units with the invisiblity modifier
        BlzSetUnitWeaponIntegerField(tower.unit, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, 0, 22);
    }
}