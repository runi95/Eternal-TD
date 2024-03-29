import { Trigger } from "w3ts";
import { GameMap } from "../Game/GameMap";
import { Group } from "./Group";
import { Rasterizer } from "./Rasterizer";
import type { MapPlayer, Unit } from "w3ts";
import { Log, LogLevel } from "../lib/Serilog/Serilog";
import { StringSink } from "../lib/Serilog/Sinks/StringSink";
import { GameOptions } from "../Game/GameOptions";

const COMMAND_PREFIX = '-';

export class Commands {
    private readonly gameOptions: GameOptions;
    private readonly player: MapPlayer;

    constructor(gameOptions: GameOptions, player: MapPlayer) {
        this.gameOptions = gameOptions;
        this.player = player;

        const trig = new Trigger();
        trig.addAction(() => this.handleCommand());
        trig.registerPlayerChatEvent(player, '', false);
    }

    private handleCommand(): void {
        const input = GetEventPlayerChatString();
        if (!input.startsWith(COMMAND_PREFIX)) {
            return;
        }
        const parts = input.substring(COMMAND_PREFIX.length).split(' ')
        const command = parts[0].toLowerCase();
        const args = parts.length > 1 ? parts.slice(1) : [];

        switch (command) {
            case "zoom":
            case "cam":
                if (GetLocalPlayer() === this.player.handle) {
                    const amount: number = parseInt(args[0]);
                    if (!amount) {
                        // player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, amount, 1);
                }
                break;
            case "tilt":
                if (GetLocalPlayer() === this.player.handle) {
                    const amount: number = parseInt(args[0]);

                    SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, amount, 1);
                }
                break;
        }

        if (!this.gameOptions.isDebugModeEnabled) return;

        switch (command) {
            case "draw":
                if (args.length === 4) {
                    // const point = Point.fromHandle(this.player.startLocationPoint);
                    Rasterizer.DrawRect(parseInt(args[0]), parseInt(args[1]), parseInt(args[2]), parseInt(args[3]));
                    //     print(`${point.x} ${point.y}, ${point.z}`)
                }
                break;
            case "clear":
                Rasterizer.RemoveAllDrawings()
                break;
            case "coords":
                let hasTowerSelected = false;
                const grp = Group.fromHandle(GetUnitsSelectedAll(this.player.handle));
                grp.for((u: Unit) => {
                    const tower = GameMap.BUILT_TOWER_MAP.get(u.id);
                    if (tower) {
                        print(`${u.x}, ${u.y}`);
                        hasTowerSelected = true;
                        tower.visibleRegions.forEach((reg) => Rasterizer.DrawPoint(reg.center.x, reg.center.y));
                    }
                });

                if (!hasTowerSelected) {
                    print("Please select a tower first");
                }
                break;
            case "zoom":
            case "cam":
                if (GetLocalPlayer() === this.player.handle) {
                    const amount: number = parseInt(args[0]);
                    if (!amount) {
                        // player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, amount, 1);
                }
                break;
            case "tilt":
                if (GetLocalPlayer() === this.player.handle) {
                    const amount: number = parseInt(args[0]);

                    SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, amount, 1);
                }
                break;
            case "round":
            case "wave":
            case "next":
                if (args.length !== 1)
                    break;

                GameMap.ROUND_INDEX = parseInt(args[0]) - 1;
                break;
            case "debug":
                Log.Init([new StringSink(LogLevel.Debug, print)]);
        }
    }
}
