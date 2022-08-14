import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class SharpShooter extends TowerUpgrade {
    public readonly name = "Sharp Shooter";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNMarksmanship.blp";
    public readonly cost = 2160;
    public readonly description = "TODO: Write description";

    private readonly sharpShooterAbilityId: number = FourCC('A002');

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.2133, 0)
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) * 0.3, 0)
        tower.unit.addAbility(this.sharpShooterAbilityId);
    }
}
