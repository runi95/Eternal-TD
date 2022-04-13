import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class SkeletalHammer extends TowerUpgrade {
    public name = "Skeletal Hammer";
    public icon = "ReplaceableTextures/CommandButtons/BTNBash.blp";
    public cost = 3890;
    public description = "TODO: Write description";
    public newUnitTypeId: number = FourCC('h006');

    // TODO: Make sure this upgrade does allow for infinite stuns!
    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 30;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 30);
    }
}