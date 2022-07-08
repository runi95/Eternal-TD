// import { Debug } from './Generic/Debug';
import { TowerAbilitySystem } from 'TowerAbilities/TowerAbilitySystem';
import { Tower } from 'Towers/Tower';
import { AttackGround } from './Generic/AttackGround';
import { Sell } from './Generic/Sell';

export class Spells {
    private readonly spells: unknown[];

    constructor(towerAbilitySystem: TowerAbilitySystem) {
        this.spells = [
            new Sell(towerAbilitySystem),
            new AttackGround(),
            // new Debug(),
        ];
    }
}
