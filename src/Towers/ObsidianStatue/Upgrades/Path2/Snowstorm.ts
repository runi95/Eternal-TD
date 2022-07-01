import { SnowstormAbility } from "TowerAbilities/SnowstormAbility";
import { TowerAbility } from "TowerAbilities/TowerAbility";
import { ObsidianStatueCustomData } from "Towers/ObsidianStatue/ObsidianStatue";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Snowstorm extends TowerUpgrade {
    public name = "Snowstorm";
    public icon = "ReplaceableTextures/CommandButtons/BTNGlacier.blp";
    public cost = 3240;
    public description = "TODO: Write description";
    public ability?: TowerAbility = new SnowstormAbility();

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).range += 100;
    }
}