import { TowerUpgrade } from "./TowerUpgrade";

export abstract class TowerType {
    public abstract icon: string;
    public abstract unitTypeId: number;
    public abstract upgrades: TowerUpgrade[][];
}