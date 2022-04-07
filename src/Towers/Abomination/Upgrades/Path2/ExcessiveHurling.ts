import { TowerUpgrade } from "../../../TowerUpgrade";

export class ExcessiveHurling extends TowerUpgrade {
    public name = "Excessive Hurling";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNFlakCannons.blp";
    public cost = 430;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 40);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 40);
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0, BlzGetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 150);
        BlzSetUnitAttackCooldown(unit, BlzGetUnitAttackCooldown(unit, 0) * 0.8, 0);
    }
}