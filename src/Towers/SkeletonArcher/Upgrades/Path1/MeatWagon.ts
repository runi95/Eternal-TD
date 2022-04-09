import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class MeatWagon extends TowerUpgrade {
    public name = "Meat Wagon";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNVorpalBlades.blp";
    public cost = 325;
    public description = "TODO: Write description";
    public newUnitTypeId = FourCC('h001');

    public applyUpgrade(tower: Tower): void {
        SetUnitAcquireRange(tower.unit, GetUnitAcquireRange(tower.unit) + 680);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 680);

        // TODO: Increase damage against Large villagers
    }
}