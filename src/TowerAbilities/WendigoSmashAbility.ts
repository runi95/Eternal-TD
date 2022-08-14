import { TowerAbility } from "./TowerAbility";

export class WendigoSmashAbility extends TowerAbility {
    public readonly name: string = "Wendigo Smash";
    public readonly description: string = "Smashes the strongest Zeppelin on the map into pieces.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNThunderclap.blp";
    public readonly cooldown: number = 30;
}
