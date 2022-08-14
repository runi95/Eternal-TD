import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class SkeletalHammer extends TowerUpgrade {
    public readonly name = "Skeletal Hammer";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNBash.blp";
    public readonly cost = 3890;
    public readonly description = "TODO: Write description";
    public readonly newUnitTypeId: number = FourCC('h006');

    // TODO: Make sure this upgrade does allow for infinite stuns!
    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 30;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 30);
    }
}
