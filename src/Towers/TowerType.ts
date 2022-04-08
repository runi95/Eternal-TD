import { Tower } from "./Tower";
import { TowerUpgrade } from "./TowerUpgrade";

export abstract class TowerType {
    public abstract unitTypeId: number;
    public abstract upgrades: TowerUpgrade[][];

    public tick: ((tower: Tower) => void) | null = null;
}