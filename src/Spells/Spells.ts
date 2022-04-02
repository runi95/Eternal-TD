// import { Debug } from './Generic/Debug';
import { Sell } from './Generic/Sell';

export class Spells {
    private readonly spells: unknown[];

    constructor() {
        this.spells = [
            new Sell(),
            // new Debug(),
        ];
    }
}