import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ArcaneMastery extends TowerUpgrade {
    public name = "Arcane Mastery";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSorceressAdept.blp";
    public cost = 1405;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        SetUnitAcquireRange(tower.unit, GetUnitAcquireRange(tower.unit) + 200);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 200);
        BlzSetUnitBaseDamage(tower.unit, BlzGetUnitBaseDamage(tower.unit, 0) + 1, 0);
        BlzSetUnitAttackCooldown(tower.unit, BlzGetUnitAttackCooldown(tower.unit, 0) * 0.5, 0);
    }
}