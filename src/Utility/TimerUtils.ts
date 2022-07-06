import { LinkedList } from './LinkedList';
import { Node } from './Node';
import { Timer } from "w3ts";

export class TimerUtils {

    // Settings
    private QUANTITY = 256;
    private MAX_SIZE = 8190;

    // Globals
    private timerQueue: LinkedList<Timer> = new LinkedList<Timer>();

    constructor() {
        for (let i = 0; i < this.QUANTITY; i++) {
            this.timerQueue.add(new Timer());
        }
    }

    public newTimer(): Timer {
        const t: Node<Timer> | undefined = this.timerQueue.pop();
        if (t === undefined) {
            BJDebugMsg('Warning: Exceeded timer QUANTITY, make sure all timers are getting recycled correctly!');
            return new Timer();
        }

        return t.value;
    }

    public releaseTimer(t: Timer): void {
        if (t === undefined) {
            return BJDebugMsg('Warning: attempt to release an undefined timer');
        }

        if (this.timerQueue.getSize() === this.MAX_SIZE) {
            BJDebugMsg('Warning: Timer stack is full, destroying timer!!');
            t.destroy();
            return;
        }

        t.pause();
        this.timerQueue.add(t);
    }
}
