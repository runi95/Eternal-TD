import { TowerAbility } from "./TowerAbility";

export class SnowstormAbility extends TowerAbility {
    public readonly name: string = "Snowstorm";
    public readonly description: string = "Damages and freezes all creeps for 6 seconds.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNGlacier.blp";
    public readonly cooldown: number = 30;
}
