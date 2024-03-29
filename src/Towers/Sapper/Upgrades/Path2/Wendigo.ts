import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Wendigo extends TowerUpgrade {
    public readonly name = "Wendigo";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNHumanArtilleryUpOne.blp";
    public readonly cost = 1190;
    public readonly description = "TODO: Write description";
    public readonly newUnitTypeId: number = FourCC('h005');

    public applyUpgrade(tower: Tower): void {
        tower.zeppelinVillagerBonusDamage += 18;
        tower.unit.acquireRange = tower.unit.acquireRange + 50;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 50);
    }
}
