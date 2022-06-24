import { MapPlayer } from "w3ts";

export class GameOptions {
    public static readonly IS_DEBUG_MODE_ENABLED: boolean = "Local Player" === MapPlayer.fromIndex(0).name;
}