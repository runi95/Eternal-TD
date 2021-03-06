import { SapperCustomData } from "../../../Sapper/Sapper";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const skeletalHammerAbilityId: number = FourCC('A004');
export class GreaterHammers extends TowerUpgrade {
    public name = "Greater Hammers";
    public icon = "ReplaceableTextures/CommandButtons/BTNStormHammer.blp";
    public cost = 59400;
    public description = "TODO: Write description";

    // TODO: Make sure this upgrade does allow for infinite stuns!
    public applyUpgrade(tower: Tower): void {
        (tower.customData as SapperCustomData).aoeDamage += 9;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 9, 0);
        BlzSetUnitWeaponStringField(tower.unit.handle, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0, 'Abilities/Weapons/GryphonRiderMissile/GryphonRiderMissile.mdl');
        tower.unit.setAbilityLevel(skeletalHammerAbilityId, 2);
    }
}
