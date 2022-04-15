import {MapPlayer} from "w3ts";

export const Players: TDPlayer[] = [];



// @ts-ignore MapPlayer's constructor is private, ignore because f-that.
export class TDPlayer extends MapPlayer {
    gold: number = 10;


    constructor(index: number) {
        super(index);
    }


    /**
     * @override
     */
    public static fromHandle(handle: player): TDPlayer {
        return this.getObject(handle);
    }

    /**
     * @override
     */
    public static fromEnum() {
        return TDPlayer.fromHandle(GetEnumPlayer());
    }

    /**
     * @override
     */
    public static fromEvent() {
        return TDPlayer.fromHandle(GetTriggerPlayer());
    }

    /**
     * @override
     */
    public static fromFilter() {
        return TDPlayer.fromHandle(GetFilterPlayer());
    }

    /**
     * @override
     */
    public static fromIndex(index: number) {
        return this.fromHandle(Player(index));
    }

    /**
     * @async
     * @override
     */
    public static fromLocal() {
        return this.fromHandle(GetLocalPlayer());
    }
}

export function SetupPlayers() {
    for (let i: number = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
        if (GetPlayerSlotState(Player(i)) === PLAYER_SLOT_STATE_PLAYING) {
            if (GetPlayerController(Player(i)) === MAP_CONTROL_USER) {
                Players[i] = new TDPlayer(i);
            }
        }
    }
}