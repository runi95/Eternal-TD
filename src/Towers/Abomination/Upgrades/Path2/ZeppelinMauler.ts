import { TowerUpgrade } from "../../../TowerUpgrade";

export class ZeppelinMauler extends TowerUpgrade {
    public name = "Zeppelin Mauler";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNHumanArtilleryUpOne.blp";
    public cost = 1190;
    public description = "Hurl the rocks at an exceedingly fast pace.";

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 50);

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(unit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 50);

        // TODO: Increase damage against Zeppelins
        // TODO: Increase damage against Large villagers
    }
}