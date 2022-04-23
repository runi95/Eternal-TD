import { Tower } from "Towers/Tower";

export abstract class TowerAbility {
    public abstract readonly name: string;
    public abstract readonly icon: string;
    public abstract readonly cooldown: number;
    public abstract applyAbilityEffect(tower: Tower): void;
}