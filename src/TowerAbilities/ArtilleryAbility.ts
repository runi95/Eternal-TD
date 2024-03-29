import { TowerAbility } from "./TowerAbility";

export class ArtilleryAbility extends TowerAbility {
    public readonly name: string = "Artillery";
    public readonly description: string = "Increases attack speed by 400% and area of effect by +15% for 8 seconds.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNClusterRockets.blp";
    public readonly cooldown: number = 60;
}
