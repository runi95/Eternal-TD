import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

const tickTowerAbilityId: number = FourCC('A008');
export class Enlarge extends TowerUpgrade {
    public name = "Enlarge";
    public icon = "ReplaceableTextures/CommandButtons/BTNUnholyFrenzy.blp";
    public cost = 595;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).range += 30;
        (tower.customData as AbominationCustomData).maxUnitCount += 2;

        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.85);
    }
}