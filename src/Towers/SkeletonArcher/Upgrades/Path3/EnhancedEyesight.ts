import { TowerUpgrade } from "../../../TowerUpgrade";

export class EnhancedEyesight extends TowerUpgrade {
    public name = "Enhanced Eyesight";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNUltravision.blp";
    public cost = 215;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 80);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80);
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0, BlzGetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 100);
        
        // Allows targetting (wards) units with the invisiblity modifier
        BlzSetUnitWeaponIntegerField(unit, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, 0, 22);
    }
}