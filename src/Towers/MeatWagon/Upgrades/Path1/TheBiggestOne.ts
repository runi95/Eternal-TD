import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { MeatWagoCustomData } from "../../MeatWagon";

const attackGroundAbilityId: number = FourCC('A00B');
export class TheBiggestOne extends TowerUpgrade {
    public name = "The Biggest One";
    public icon = "ReplaceableTextures/CommandButtons/BTNDisenchant.blp";
    public cost = 30240;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).stunAOERadius = 375;
        (tower.customData as MeatWagoCustomData).burnyStuffDamage += 20;
        tower.largeVillagerBonusDamage += 25;
        tower.zeppelinVillagerBonusDamage += 25;
        const newAreaOfEffect = 800;

        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 18, 0);

        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = tower.unit.getAttackCooldown(0);
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, newAreaOfEffect);
        tower.unit.setAttackCooldown(currentCooldown, 0);

        BlzSetAbilityRealLevelField(BlzGetUnitAbility(tower.unit.handle, attackGroundAbilityId), ABILITY_RLF_AREA_OF_EFFECT, 0, newAreaOfEffect);
    }
}
