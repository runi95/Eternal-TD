import { TowerAbility } from "./TowerAbility";

export class EarthquakeAbility extends TowerAbility {
    public readonly name: string = "Earthquake";
    public readonly description: string = "Increases attack speed by 400% and area of effect by +15% for 8 seconds.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNEarthquake.blp";
    public readonly cooldown: number = 60;
}
