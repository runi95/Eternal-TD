import { AbsoluteZeroAbility } from "../../../../TowerAbilities/AbsoluteZeroAbility";
import { TowerAbility } from "../../../../TowerAbilities/TowerAbility";
import { ObsidianStatueCustomData } from "../../../../Towers/ObsidianStatue/ObsidianStatue";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class AbsoluteZero extends TowerUpgrade {
    public readonly name = "Absolute Zero";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNIceShard.blp";
    public readonly cost = 21600;
    public readonly description = "TODO: Write description";
    public readonly ability?: TowerAbility = new AbsoluteZeroAbility();

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).range += 100;
        (tower.customData as ObsidianStatueCustomData).maxUnitCount += 200;
    }
}
