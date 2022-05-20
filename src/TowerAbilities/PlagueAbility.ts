import { TowerAbility } from "./TowerAbility";
import { TowerAbilityType } from "./TowerAbilityType";

export class PlagueAbility extends TowerAbility {
    public readonly name: string = "Plague";
    public readonly description: string = "Releases a plague into the world that damages every creep on the map.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNCarrionSwarm.blp";
    public readonly cooldown: number = 20;
    public readonly abilityType: TowerAbilityType = TowerAbilityType.PLAGUE;
}