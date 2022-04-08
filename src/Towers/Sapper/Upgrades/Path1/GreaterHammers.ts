import { TowerUpgrade } from "../../../TowerUpgrade";

const skeletalHammerAbilityId: number = FourCC('A004');
export class GreaterHammers extends TowerUpgrade {
    public name = "Greater Hammers";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp";
    public cost = 59400;
    public description = "TODO: Write description";

    // TODO: Make sure this upgrade does allow for infinite stuns!
    public applyUpgrade(unit: unit): void {
        BlzSetUnitWeaponStringField(unit, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, 'Abilities\\Weapons\\GryphonRiderMissile\\GryphonRiderMissile.mdl');
        SetUnitAbilityLevel(unit, skeletalHammerAbilityId, 2);
    }
}