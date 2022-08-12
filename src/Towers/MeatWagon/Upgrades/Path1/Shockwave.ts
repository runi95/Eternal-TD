import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { MeatWagoCustomData } from "../../MeatWagon";

const attackGroundAbilityId: number = FourCC('A00B');
export class Shockwave extends TowerUpgrade {
    public name = "Shockwave";
    public icon = "ReplaceableTextures/CommandButtons/BTNShockWave.blp";
    public cost = 970;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).hasShockwave = true;
        (tower.customData as MeatWagoCustomData).burnyStuffDamage += 1;
        (tower.customData as MeatWagoCustomData).burnyStuffRate = 0.675;
        const newAreaOfEffect = 450;

        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = tower.unit.getAttackCooldown(0);
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, newAreaOfEffect);
        tower.unit.setAttackCooldown(currentCooldown, 0);

        BlzSetAbilityRealLevelField(BlzGetUnitAbility(tower.unit.handle, attackGroundAbilityId), ABILITY_RLF_AREA_OF_EFFECT, 0, newAreaOfEffect);
    }
}
