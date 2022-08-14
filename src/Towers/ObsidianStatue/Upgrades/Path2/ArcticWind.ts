import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

const arcticWindSlowAuraAbilityId: number = FourCC('A00C');
export class ArcticWind extends TowerUpgrade {
    public readonly name = "Arctic Wind";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNBrilliance.blp";
    public readonly cost = 3130;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).maxUnitCount += 60;
        tower.unit.addAbility(arcticWindSlowAuraAbilityId);
    }
}
