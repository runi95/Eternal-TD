import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Wendigo extends TowerUpgrade {
    public name = "Wendigo";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNHumanArtilleryUpOne.blp";
    public cost = 1190;
    public description = "TODO: Write description";
    public newUnitTypeId: number = FourCC('h005');

    public applyUpgrade(tower: Tower): void {
        SetUnitAcquireRange(tower.unit, GetUnitAcquireRange(tower.unit) + 50);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 50);
    }
}