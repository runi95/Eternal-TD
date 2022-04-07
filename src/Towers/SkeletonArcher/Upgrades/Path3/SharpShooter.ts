import { TowerUpgrade } from "../../../TowerUpgrade";

export class SharpShooter extends TowerUpgrade {
    public name = "Sharp Shooter";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNMarksmanship.blp";
    public cost = 2160;
    public description = "TODO: Write description";

    private readonly sharpShooterAbilityId: number = FourCC('A002');

    public applyUpgrade(unit: unit): void {
        BlzSetUnitAttackCooldown(unit, BlzGetUnitAttackCooldown(unit, 0) * 0.2133, 0);
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 3, 0);
        UnitAddAbility(unit, this.sharpShooterAbilityId);
    }
}