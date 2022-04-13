import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

const tickTowerAbilityId: number = FourCC('A008');
export class EnhancedFreeze extends TowerUpgrade {
    public name = "Enhanced Freeze";
    public icon = "ReplaceableTextures/CommandButtons/BTNCloudOfFog.blp";
    public cost = 245;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).freezeDuration = 2.2;

        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75);
    }
}