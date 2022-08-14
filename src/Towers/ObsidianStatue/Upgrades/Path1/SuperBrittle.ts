import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

const tickTowerAbilityId: number = FourCC('A008');
export class SuperBrittle extends TowerUpgrade {
    public readonly name = "Super Brittle";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNSkeletalLongevity.blp";
    public readonly cost = 30240;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasSuperBrittle = true;
        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.9);
    }
}
