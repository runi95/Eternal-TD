import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ExtraRange extends TowerUpgrade {
    public readonly name = "Extra Range";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNDwarvenLongRifle.blp";
    public readonly cost = 215;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 70;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 70);
    }
}
