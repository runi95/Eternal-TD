import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class BlackDragonWhelp extends TowerUpgrade {
    public readonly name = "Black Dragon Whelp";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNVorpalBlades.blp";
    public readonly cost = 325;
    public readonly description = "TODO: Write description";
    public readonly newUnitTypeId = FourCC('h001');

    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 680;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 680);
        tower.largeVillagerBonusDamage += 1;
    }
}
