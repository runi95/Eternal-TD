import { TowerUpgrade } from "../../../TowerUpgrade";

export class ReallyBigRocks extends TowerUpgrade {
    public name = "Really Big Rocks";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpThree.blp";
    public cost = 1295;
    public description = "Hurl really big rocks at the villagers; even dealing more damage at an ever larger area again!";

    public applyUpgrade(unit: unit): void {
        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = BlzGetUnitAttackCooldown(unit, 0);
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 400);
        BlzSetUnitAttackCooldown(unit, currentCooldown, 0);
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 1, 0);
    }
}