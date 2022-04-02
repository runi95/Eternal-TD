import { TowerUpgrade } from "../TowerUpgrade";

export class StarThrower extends TowerUpgrade {
    public name = "Star Thrower";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNStarfall.blp";
    public cost = 16200;
    public description = "Throw compressed stars at the villagers for even more destructive power!";

    public applyUpgrade(unit: unit): void {
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 3, 0);
        BlzSetUnitWeaponStringField(unit, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, 'Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl');
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0, BlzGetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 150);
    }
}