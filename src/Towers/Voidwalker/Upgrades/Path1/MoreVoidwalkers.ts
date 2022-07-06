import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const tickTowerAbilityId: number = FourCC('A008');
export class MoreVoidwalkers extends TowerUpgrade {
    public name = "More Voidwalker";
    public icon = "ReplaceableTextures/CommandButtons/BTNPocketFactory.blp";
    public cost = 430;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // Sets the initial tick cooldown to 2.4
        BlzSetAbilityRealLevelField(tower.unit.getAbility(tickTowerAbilityId), ABILITY_RLF_COOLDOWN, 0, 6);
    }
}
