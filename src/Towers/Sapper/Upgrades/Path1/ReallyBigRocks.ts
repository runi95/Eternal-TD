import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ReallyBigRocks extends TowerUpgrade {
    public name = "Really Big Rocks";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpThree.blp";
    public cost = 1295;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = tower.unit.getAttackCooldown(0);
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, 400);
        tower.unit.setAttackCooldown(currentCooldown, 0)
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0)
    }
}