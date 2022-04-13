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