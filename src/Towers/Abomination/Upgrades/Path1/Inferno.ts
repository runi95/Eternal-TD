import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

const tickTowerAbilityId: number = FourCC('A008');
export class Inferno extends TowerUpgrade {
    public readonly name = "Inferno";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNInfernal.blp";
    public readonly cost = 49140;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).range += 120;
        (tower.customData as AbominationCustomData).damageAmount += 1;

        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.2128);
    }
}
