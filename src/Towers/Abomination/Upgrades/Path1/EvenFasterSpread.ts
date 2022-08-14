import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const tickTowerAbilityId: number = FourCC('A008');
export class EvenFasterSpread extends TowerUpgrade {
    public readonly name = "Even Faster Spread";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp";
    public readonly cost = 325;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.6);
    }
}
