import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ReallyBigRocks extends TowerUpgrade {
    public name = "Really Big Rocks";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpThree.blp";
    public cost = 1295;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = BlzGetUnitAttackCooldown(tower.unit, 0);
        BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 400);
        BlzSetUnitAttackCooldown(tower.unit, currentCooldown, 0);
        BlzSetUnitBaseDamage(tower.unit, BlzGetUnitBaseDamage(tower.unit, 0) + 1, 0);
    }
}