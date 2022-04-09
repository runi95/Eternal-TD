import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

const tickTowerAbilityId: number = FourCC('A008');
export class GreaterPermanentImmolation extends TowerUpgrade {
    public name = "Greater Permanent Immolation";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp";
    public cost = 3780;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).damageAmount += 1;
        (tower.customData as AbominationCustomData).maxUnitCount += 7;
        (tower.customData as AbominationCustomData).hasGreaterPermanentImmolation = true;

        const abil: ability = BlzGetUnitAbility(tower.unit, tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.74604);
    }
}