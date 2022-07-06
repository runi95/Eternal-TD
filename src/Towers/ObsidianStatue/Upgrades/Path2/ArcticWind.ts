import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

const arcticWindSlowAuraAbilityId: number = FourCC('A00C');
export class ArcticWind extends TowerUpgrade {
    public name = "Arctic Wind";
    public icon = "ReplaceableTextures/CommandButtons/BTNBrilliance.blp";
    public cost = 3130;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).maxUnitCount += 60;
        tower.unit.addAbility(arcticWindSlowAuraAbilityId);
    }
}
