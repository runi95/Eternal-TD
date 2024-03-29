import { TowerAbility } from "./TowerAbility";

export class PandemicAbility extends TowerAbility {
    public readonly name: string = "Pandemic";
    public readonly description: string = "Releases a pandemic into the world that damages every creep on the map.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNPossession.blp";
    public readonly cooldown: number = 20;
}
