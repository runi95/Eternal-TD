import { TowerUpgrade } from "../../../TowerUpgrade";

export class ExtraRange extends TowerUpgrade {
    public name = "Extra Range";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNDwarvenLongRifle.blp";
    public cost = 215;
    public description = "Increases attack range.";

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 70);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 70);
    }
}