import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { MeatWagoCustomData } from "../../MeatWagon";

const attackGroundAbilityId: number = FourCC('A00B');
export class TheBigOne extends TowerUpgrade {
    public name = "The Big One";
    public icon = "ReplaceableTextures/CommandButtons/BTNAncestralSpirit.blp";
    public cost = 8640;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).stunAOERadius = 300;
        (tower.customData as MeatWagoCustomData).burnyStuffDamage += 3;
        const newAreaOfEffect = 650;

        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 5, 0);

        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = tower.unit.getAttackCooldown(0);
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, newAreaOfEffect);
        tower.unit.setAttackCooldown(currentCooldown, 0);

        BlzSetAbilityRealLevelField(BlzGetUnitAbility(tower.unit.handle, attackGroundAbilityId), ABILITY_RLF_AREA_OF_EFFECT, 0, newAreaOfEffect);
    }
}
