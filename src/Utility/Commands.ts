import {Game} from "../Game/Game";
import {MapPlayer, Trigger, Unit} from "w3ts";
import {Players} from "w3ts/globals";
import {DrawPoint, DrawRect, RemoveAllDrawings} from "./Rasterizer";
import {MapRegionController} from "../Game/MapRegionController";
import {Tower} from "../Towers/Tower";

const COMMAND_PREFIX = '-';

export class Commands {
    private readonly game: Game;
    private commandTrigger: Trigger;
    private selectedUnit: Unit | undefined;
    private utilityTriggers: Record<string, Trigger> = {};
    private mapRegionController: MapRegionController;
    private readonly towers: Map<number, Tower>;
    constructor(game: Game, mapRegionController: MapRegionController, towers: Map<number, Tower>) {
        this.game = game;
        this.commandTrigger = new Trigger();
        this.mapRegionController = mapRegionController;
        this.towers = towers;

        this.commandTrigger.addAction(() => this.handleCommand());
        Players.forEach((player) => this.commandTrigger.registerPlayerChatEvent(player, '', false))
    }

    private handleCommand(): void {
        const player: MapPlayer | undefined = MapPlayer.fromEvent();
        if (!player) {
            return;
        }
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
                // const point = Point.fromHandle(player.startLocationPoint);
                    DrawRect(parseInt(args[0]), parseInt(args[1]), parseInt(args[2]), parseInt(args[3]));
                //     print(`${point.x} ${point.y}, ${point.z}`)
                }
                break;
            case "clear":
                RemoveAllDrawings()
                break;

            case "coords":
                    if(this.selectedUnit) {
                        print(`${this.selectedUnit.x}, ${this.selectedUnit.y}`);
                        const tower = this.towers.get(this.selectedUnit.id);
                        if(tower) {
                            tower.visibleRegions.forEach((reg) => DrawPoint(reg.center.x, reg.center.y));
                        }
                        break;
                    }
                    if (!this.utilityTriggers[`${player.id}-selectTrigger`]) {
                        const t = new Trigger();
                        t.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SELECTED);
                        t.addAction(() => {
                            this.selectedUnit = Unit.fromEvent();
                            // t.destroy();
                            // this.utilityTriggers[`${player.id}-selectTrigger`] = undefined;
                        })
                        this.utilityTriggers[`${player.id}-selectTrigger`] = t;
                        break;
                    }
                    print("Select a unit first");
                break;
            case "zoom":
            case "cam":
                if (GetLocalPlayer() === player.handle) {
                    const amount: number = parseInt(args[0]);
                    if (!amount) {
                        // player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, amount, 1);
                }
                break;
            case "tilt":
                if (GetLocalPlayer() === player.handle) {
                    const amount: number = parseInt(args[0]);

                    SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, amount, 1);
                }
                break;
        }

    }



}