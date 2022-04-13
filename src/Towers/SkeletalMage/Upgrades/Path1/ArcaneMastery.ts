import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ArcaneMastery extends TowerUpgrade {
    public name = "Arcane Mastery";
    public icon = "ReplaceableTextures/CommandButtons/BTNSorceressAdept.blp";
    public cost = 1405;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 200;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 200);
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.5, 0);
    }
}