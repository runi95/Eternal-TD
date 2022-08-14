import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const tickTowerAbilityId: number = FourCC('A008');
export class FasterSpread extends TowerUpgrade {
    public readonly name = "Faster Spread";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNPlagueCloud.blp";
    public readonly cost = 160;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75);
    }
}
