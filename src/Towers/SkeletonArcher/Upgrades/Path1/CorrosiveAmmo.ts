import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class CorrosiveAmmo extends TowerUpgrade {
    public name = "Corrosive Ammo";
    public icon = "ReplaceableTextures/CommandButtons/BTNCorrosiveBreath.blp";
    public cost = 1945;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange * 1.15;


        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1) * 0.15);

        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = tower.unit.getAttackCooldown(0);
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 200);
        tower.unit.setAttackCooldown(currentCooldown, 0)
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
        BlzSetUnitWeaponStringField(tower.unit.handle, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, 'Abilities/Weapons/ChimaeraAcidMissile/ChimaeraAcidMissile.mdl');
        tower.largeVillagerBonusDamage += 2;
    }
}