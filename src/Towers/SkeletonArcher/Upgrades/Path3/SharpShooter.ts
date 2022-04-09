import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class SharpShooter extends TowerUpgrade {
    public name = "Sharp Shooter";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNMarksmanship.blp";
    public cost = 2160;
    public description = "TODO: Write description";

    private readonly sharpShooterAbilityId: number = FourCC('A002');

    public applyUpgrade(tower: Tower): void {
        BlzSetUnitAttackCooldown(tower.unit, BlzGetUnitAttackCooldown(tower.unit, 0) * 0.2133, 0);
        BlzSetUnitBaseDamage(tower.unit, BlzGetUnitBaseDamage(tower.unit, 0) + 3, 0);
        UnitAddAbility(tower.unit, this.sharpShooterAbilityId);
    }
}