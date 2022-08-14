import { TowerAbility } from "../TowerAbilities/TowerAbility";
import { Tower } from "./Tower";

export abstract class TowerUpgrade {
    // Required
    public abstract readonly name: string;
    public abstract readonly icon: string;
    public abstract readonly cost: number;
    public abstract readonly description: string;
    public abstract applyUpgrade(tower: Tower): void;

    // Optional
    public readonly newUnitTypeId?: number = undefined;
    public readonly newUnitSkinTypeId?: number = undefined;
    public readonly ability?: TowerAbility = undefined;
}
