import { TowerAbilityType } from "./TowerAbilityType";

export abstract class TowerAbility {
    public abstract readonly name: string;
    public abstract readonly description: string;
    public abstract readonly icon: string;
    public abstract readonly cooldown: number;
    public abstract readonly abilityType: TowerAbilityType;
}