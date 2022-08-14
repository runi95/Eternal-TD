import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

const tickTowerAbilityId: number = FourCC('A008');
export class GreaterPermanentImmolation extends TowerUpgrade {
    public readonly name = "Greater Permanent Immolation";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNDeathCoil.blp";
    public readonly cost = 3780;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).damageAmount += 1;
        (tower.customData as AbominationCustomData).maxUnitCount += 7;
        (tower.customData as AbominationCustomData).hasGreaterPermanentImmolation = true;

        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.74604);
    }
}
