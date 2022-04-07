import { TowerUpgrade } from "../../../TowerUpgrade";

export class LargerRocks extends TowerUpgrade {
    public name = "Larger Rocks";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpOne.blp";
    public cost = 380;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = BlzGetUnitAttackCooldown(unit, 0);
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 210);
        BlzSetUnitAttackCooldown(unit, currentCooldown, 0);
    }
}