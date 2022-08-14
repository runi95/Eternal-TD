import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const attackGroundAbilityId: number = FourCC('A00B');
export class BiggerBlast extends TowerUpgrade {
    public readonly name = "Bigger Blast";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNSmash.blp";
    public readonly cost = 540;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        const newAreaOfEffect = 300;

        // NOTE: For some reason setting UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE also updates the attack cooldown so we have to remember it and re-set the value afterwards. 
        const currentCooldown: number = tower.unit.getAttackCooldown(0);
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, newAreaOfEffect);
        tower.unit.setAttackCooldown(currentCooldown, 0);

        BlzSetAbilityRealLevelField(BlzGetUnitAbility(tower.unit.handle, attackGroundAbilityId), ABILITY_RLF_AREA_OF_EFFECT, 0, newAreaOfEffect);
    }
}
