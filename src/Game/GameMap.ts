import { Checkpoint } from "Utility/Checkpoint";
import { Rectangle } from "w3ts";

export class GameMap {
    public static readonly CHECKPOINTS: Checkpoint[] = [
        // SPAWN
        {x: -2944, y: 2560},

        {x: -1792, y: 2560},
        {x: -1792, y: 3072},
        {x: -2304, y: 3072},
        {x: -2304, y: 1664},
        {x: -2816, y: 1664},
        {x: -2816, y: 2176},
        {x: -1408, y: 2176},
        {x: -1408, y: 2816},
        {x: -1024, y: 2816},
        {x: -1024, y: 1792},
        {x: -1920, y: 1792},
        
        // END
        {x: -1920, y: 1152},
    ];
    public static readonly PLAYABLE_AREA: Rectangle = new Rectangle(-3328, 1024, -768, 3584);
}