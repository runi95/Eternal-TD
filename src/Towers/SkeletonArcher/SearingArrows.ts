import { TowerUpgrade } from "../TowerUpgrade";

export class SearingArrows extends TowerUpgrade {
    public name = "Searing Arrows";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSearingArrows.blp";
    public cost = 675;
    public description = "Use a long range bow that deals +3 damage per hit.";

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 80);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80);
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 3, 0);
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0, BlzGetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 500);
        BlzSetUnitWeaponStringField(unit, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, 'Abilities\\Weapons\\SearingArrow\\SearingArrowMissile.mdl');
    }
}