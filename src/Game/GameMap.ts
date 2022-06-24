import { Checkpoint } from "Utility/Checkpoint";
import { Rectangle } from "w3ts";

export class GameMap {
    public static readonly CHECKPOINTS: Checkpoint[] = [
        // SPAWN
        {x: -2432, y: 2048},

        {x: -1280, y: 2048},
        {x: -1280, y: 2560},
        {x: -1792, y: 2560},
        {x: -1792, y: 1152},
        {x: -2304, y: 1152},
        {x: -2304, y: 1664},
        {x: -896, y: 1664},
        {x: -896, y: 2304},
        {x: -512, y: 2304},
        {x: -512, y: 1280},
        {x: -1408, y: 1280},
        
        // END
        {x: -1408, y: 640},
    ];

    public readonly playableArea: Rectangle = new Rectangle(-2816, 512, -256, 3072);
}