// import { Debug } from './Generic/Debug';
import { AttackGround } from './Generic/AttackGround';
import { Sell } from './Generic/Sell';

export class Spells {
    private readonly spells: unknown[];

    constructor() {
        this.spells = [
            new Sell(),
            new AttackGround(),
            // new Debug(),
        ];
    }
}