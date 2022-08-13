import { AttackTypes } from "../../../AttackTypes";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class HeavyShells extends TowerUpgrade {
    public name = "Heavy Shells";
    public icon = "ReplaceableTextures/CommandButtons/BTNStampede.blp";
    public cost = 970;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        BlzSetUnitWeaponIntegerField(GetEnumUnit(), UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, 0, AttackTypes.CHAOS);
        tower.largeVillagerBonusDamage += 3;
        tower.fortifiedVillagerBonusDamage += 1;
        tower.zeppelinVillagerBonusDamage += 1;

        // TODO: Increase damage against stunned enemies by +2
    }
}
