import { TowerUpgrade } from "../../../TowerUpgrade";

export class HeavierRocks extends TowerUpgrade {
    public name = "Heavier Rocks";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpTwo.blp";
    public cost = 700;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = BlzGetUnitAttackCooldown(unit, 0);
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 310);
        BlzSetUnitAttackCooldown(unit, currentCooldown, 0);
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 1, 0);
    }
}