import { WendigoSmashAbility } from "../../../../TowerAbilities/WendigoSmashAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class WendigoSmash extends TowerUpgrade {
    public name = "Wendigo Smash";
    public icon = "ReplaceableTextures/CommandButtons/BTNThunderclap.blp";
    public cost = 3455;
    public description = "TODO: Write description";
    public ability = new WendigoSmashAbility();

    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 70;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 70);

        tower.zeppelinVillagerBonusDamage += 12;
        tower.largeVillagerBonusDamage += 4;
    }
}
