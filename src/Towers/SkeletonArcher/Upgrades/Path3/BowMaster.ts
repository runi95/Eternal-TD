import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class BowMaster extends TowerUpgrade {
    public name = "Bow Master";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp";
    public cost = 25380;
    public description = "TODO: Write description";

    private readonly sharpShooterAbilityId: number = FourCC('A002');

    public applyUpgrade(tower: Tower): void {
        SetUnitAcquireRange(tower.unit, GetUnitAcquireRange(tower.unit) + 200);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 200);

        BlzSetUnitAttackCooldown(tower.unit, BlzGetUnitAttackCooldown(tower.unit, 0) * 0.7895, 0);
        BlzSetUnitBaseDamage(tower.unit, BlzGetUnitBaseDamage(tower.unit, 0) + 3, 0);
        SetUnitAbilityLevel(tower.unit, this.sharpShooterAbilityId, 2);
        
        // TODO: Make sure this upgrade can damage any enemy of any type
    }
}