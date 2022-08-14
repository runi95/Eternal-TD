import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class LongRangeArrows extends TowerUpgrade {
    public readonly name = "Long Range Arrows";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNSentinel.blp";
    public readonly cost = 95;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 80;
        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80);
    }
}
