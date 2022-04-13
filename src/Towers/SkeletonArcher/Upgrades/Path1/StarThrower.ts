import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class StarThrower extends TowerUpgrade {
    public name = "Star Thrower";
    public icon = "ReplaceableTextures/CommandButtons/BTNStarfall.blp";
    public cost = 16200;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 3, 0);

        BlzSetUnitWeaponStringField(tower.unit.handle, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, 'Abilities/Weapons/FaerieDragonMissile/FaerieDragonMissile.mdl');
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0, BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 150);

        // TODO: Increase damage against Large villagers
    }
}