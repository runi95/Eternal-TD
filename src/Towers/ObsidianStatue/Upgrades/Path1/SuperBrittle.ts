import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

const tickTowerAbilityId: number = FourCC('A008');
export class SuperBrittle extends TowerUpgrade {
    public name = "Super Brittle";
    public icon = "ReplaceableTextures/CommandButtons/BTNSkeletalLongevity.blp";
    public cost = 30240;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasSuperBrittle = true;
        const abil: ability = tower.unit.getAbility(tickTowerAbilityId);
        BlzSetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0, BlzGetAbilityRealLevelField(abil, ABILITY_RLF_COOLDOWN, 0) * 0.9);
    }
}