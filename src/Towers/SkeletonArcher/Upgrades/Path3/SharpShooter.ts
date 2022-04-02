import { TowerUpgrade } from "../../../TowerUpgrade";

export class SharpShooter extends TowerUpgrade {
    public name = "Sharp Shooter";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNMarksmanship.blp";
    public cost = 2160;
    public description = "Sharp Shooter attacks faster and and does powerful Critical Hits every few shots that do a lot more damage.";

    private readonly sharpShooterAbilityId: number = FourCC('A002');

    public applyUpgrade(unit: unit): void {
        BlzSetUnitAttackCooldown(unit, BlzGetUnitAttackCooldown(unit, 0) / 1.2666, 0);
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 3, 0);
        UnitAddAbility(unit, this.sharpShooterAbilityId);
    }
}