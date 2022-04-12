import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

const tickTowerAbilityId: number = FourCC('A008');
export class Overdrive extends TowerUpgrade {
    public name = "Overdrive";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNRegenerationAura.blp";
    public cost = 3455;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as AbominationCustomData).maxUnitCount += 1;

        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.3333);
    }
}