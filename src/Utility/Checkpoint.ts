export interface Checkpoint {
    x: number,
    y: number,
}

export enum Direction {
    NORTH,
    EAST,
    SOUTH,
    WEST
}

export const DEBUG_DIRECTION = [
    'NORTH',
    'EAST',
    'SOUTH',
    'WEST'
]

export function distanceCP(checkpointA: Checkpoint, checkpointB: Checkpoint): number {
    return Math.abs(checkpointA.x - checkpointB.x) + Math.abs(checkpointA.y - checkpointB.y);
}

export function distance2D(cpA: Checkpoint, cpB: Checkpoint): number {
    return Math.sqrt(Math.pow(cpA.x * 1.0 - cpB.x, 2) + Math.pow(cpA.y * 1.0 - cpB.y, 2))

}
export function directionCP(checkpointA: Checkpoint, checkpointB: Checkpoint): Direction {
    const diffA = checkpointA.x - checkpointB.x;
    const diffB = checkpointA.y - checkpointB.y;
    if(diffA !== 0) {
        if(diffA < 0) {
            return Direction.EAST;
        }
        return Direction.WEST;
    }
    if(diffB !== 0) {
        if(diffB > 0) {
            return Direction.SOUTH;
        }
        return Direction.NORTH;
    }
    print('Same points or something, idk')
    return Direction.NORTH;
}

