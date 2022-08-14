import { SnowstormAbility } from "../../../../TowerAbilities/SnowstormAbility";
import { TowerAbility } from "../../../../TowerAbilities/TowerAbility";
import { ObsidianStatueCustomData } from "../../../../Towers/ObsidianStatue/ObsidianStatue";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Snowstorm extends TowerUpgrade {
    public readonly name = "Snowstorm";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNGlacier.blp";
    public readonly cost = 3240;
    public readonly description = "TODO: Write description";
    public readonly ability?: TowerAbility = new SnowstormAbility();

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).range += 100;
    }
}
