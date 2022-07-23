// import { Debug } from './Generic/Debug';
import { TowerAbilitySystem } from "../TowerAbilities/TowerAbilitySystem";
import { TowerUpgradeSystem } from '../Game/TowerUpgradeSystem';
import { AttackGround } from './Generic/AttackGround';
import { Sell } from './Generic/Sell';

export class Spells {
    private readonly spells: unknown[];

    constructor(towerAbilitySystem: TowerAbilitySystem, towerUpgradeSystem: TowerUpgradeSystem) {
        this.spells = [
            new Sell(towerAbilitySystem, towerUpgradeSystem),
            new AttackGround(),
            // new Debug(),
        ];
    }
}
