// import { Debug } from './Generic/Debug';
import { TowerAbilitySystem } from 'TowerAbilities/TowerAbilitySystem';
import { Tower } from 'Towers/Tower';
import { AttackGround } from './Generic/AttackGround';
import { Sell } from './Generic/Sell';

export class Spells {
    private readonly spells: unknown[];

    constructor(towerAbilitySystem: TowerAbilitySystem, towers: Map<number, Tower>) {
        this.spells = [
            new Sell(towerAbilitySystem, towers),
            new AttackGround(),
            // new Debug(),
        ];
    }
}