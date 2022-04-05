import { TowerUpgrade } from "../../../TowerUpgrade";

export class BowMaster extends TowerUpgrade {
    public name = "Bow Master";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp";
    public cost = 25380;
    public description = "Bow Master shoots really fast and devestates most Villagers with ease.";

    private readonly sharpShooterAbilityId: number = FourCC('A002');

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 200);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 200);

        BlzSetUnitAttackCooldown(unit, BlzGetUnitAttackCooldown(unit, 0) * 0.7895, 0);
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 3, 0);
        SetUnitAbilityLevel(unit, this.sharpShooterAbilityId, 2);
    }
}