import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const tickTowerAbilityId: number = FourCC('A008');
export class LesserVoidwalker extends TowerUpgrade {
    public readonly name = "Lesser Voidwalker";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNSpiritWolf.blp";
    public readonly cost = 540;
    public readonly description = "TODO: Write description";
    public readonly newUnitTypeId: number = FourCC('h00D');

    public applyUpgrade(tower: Tower): void {
        // Sets the initial tick cooldown to 2.4
        BlzSetAbilityRealLevelField(tower.unit.getAbility(tickTowerAbilityId), ABILITY_RLF_COOLDOWN, 0, 10);
    }
}
