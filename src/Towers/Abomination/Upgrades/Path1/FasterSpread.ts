import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const tickTowerAbilityId: number = FourCC('A008');
export class FasterSpread extends TowerUpgrade {
    public name = "Faster Spread";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNPlagueCloud.blp";
    public cost = 160;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75);
    }
}