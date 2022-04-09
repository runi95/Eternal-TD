import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class LongRangeArrows extends TowerUpgrade {
    public name = "Long Range Arrows";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSentinel.blp";
    public cost = 95;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        SetUnitAcquireRange(tower.unit, GetUnitAcquireRange(tower.unit) + 80);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80);
    }
}