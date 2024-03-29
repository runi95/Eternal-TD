import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

const tickTowerAbilityId: number = FourCC('A008');
export class EnhancedFreeze extends TowerUpgrade {
    public readonly name = "Enhanced Freeze";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNCloudOfFog.blp";
    public readonly cost = 245;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).freezeDuration = 2.2;

        if (tower.pathUpgrades[2] < 3) {
            const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
            BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.75);
        } else {
            tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.75, 0);
        }
    }
}
