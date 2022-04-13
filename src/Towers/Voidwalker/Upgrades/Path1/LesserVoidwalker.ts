import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const tickTowerAbilityId: number = FourCC('A008');
export class LesserVoidwalker extends TowerUpgrade {
    public name = "Lesser Voidwalker";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSpiritWolf.blp";
    public cost = 540;
    public description = "TODO: Write description";
    public newUnitTypeId: number = FourCC('h00D');

    public applyUpgrade(tower: Tower): void {
        // Sets the initial tick cooldown to 2.4
        BlzSetAbilityRealLevelField(tower.unit.getAbility(tickTowerAbilityId), ABILITY_RLF_COOLDOWN, 0, 10);
    }
}