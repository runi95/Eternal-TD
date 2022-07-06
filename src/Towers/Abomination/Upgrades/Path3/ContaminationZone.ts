import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

const tickTowerAbilityId: number = FourCC('A008');
export class ContaminationZone extends TowerUpgrade {
    public name = "Contamination Zone";
    public icon = "ReplaceableTextures/CommandButtons/BTNDeathAndDecay.blp";
    public cost = 21600;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).range += 70;
        (tower.customData as AbominationCustomData).maxUnitCount += 16;
        (tower.customData as AbominationCustomData).damageAmount += 1;

        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75);
    }
}
