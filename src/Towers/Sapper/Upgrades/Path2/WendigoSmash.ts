import { WendigoSmashAbility } from "../../../../TowerAbilities/WendigoSmashAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class WendigoSmash extends TowerUpgrade {
    public readonly name = "Wendigo Smash";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNThunderclap.blp";
    public readonly cost = 3455;
    public readonly description = "TODO: Write description";
    public readonly ability = new WendigoSmashAbility();

    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 70;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 70);

        tower.zeppelinVillagerBonusDamage += 12;
        tower.largeVillagerBonusDamage += 4;
    }
}
