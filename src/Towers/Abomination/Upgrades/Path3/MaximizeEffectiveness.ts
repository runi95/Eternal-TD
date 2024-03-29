import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

const tickTowerAbilityId: number = FourCC('A008');
export class MaximizeEffectiveness extends TowerUpgrade {
    public readonly name = "Maximize Effectiveness";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNAdvancedUnholyStrength.blp";
    public readonly cost = 485;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).maxUnitCount += 4;

        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75);
    }
}
