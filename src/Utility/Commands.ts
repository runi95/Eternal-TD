import { MapPlayer, Trigger, Unit } from "w3ts";
import { DrawPoint, DrawRect, RemoveAllDrawings } from "./Rasterizer";
import { GameMap } from "../Game/GameMap";
import { Group } from "./Group";

const COMMAND_PREFIX = '-';

export class Commands {
    private readonly player: MapPlayer;

    constructor(player: MapPlayer) {
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
            case "draw":
                if (args.length === 4) {
                    // const point = Point.fromHandle(this.player.startLocationPoint);
                    DrawRect(parseInt(args[0]), parseInt(args[1]), parseInt(args[2]), parseInt(args[3]));
                    //     print(`${point.x} ${point.y}, ${point.z}`)
                }
                break;
            case "clear":
                RemoveAllDrawings()
                break;
            case "coords":
                let hasTowerSelected = false;
                const grp = Group.fromHandle(GetUnitsSelectedAll(this.player.handle));
                grp.for((u: Unit) => {
                    const tower = GameMap.BUILT_TOWER_MAP.get(u.id);
                    if (tower) {
                        print(`${u.x}, ${u.y}`);
                        hasTowerSelected = true;
                        tower.visibleRegions.forEach((reg) => DrawPoint(reg.center.x, reg.center.y));
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
        }

    }
}
