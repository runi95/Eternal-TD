import { AbsoluteZeroAbility } from "../../../../TowerAbilities/AbsoluteZeroAbility";
import { TowerAbility } from "../../../../TowerAbilities/TowerAbility";
import { ObsidianStatueCustomData } from "../../../../Towers/ObsidianStatue/ObsidianStatue";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class AbsoluteZero extends TowerUpgrade {
    public name = "Absolute Zero";
    public icon = "ReplaceableTextures/CommandButtons/BTNBreathOfFrost.blp";
    public cost = 21600;
    public description = "TODO: Write description";
    public ability?: TowerAbility = new AbsoluteZeroAbility();

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).range += 100;
        (tower.customData as ObsidianStatueCustomData).maxUnitCount += 200;
    }
}
