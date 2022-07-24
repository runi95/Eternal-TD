export interface Checkpoint {
    x: number,
    y: number,
}

export const euclideanDistance = (a: Checkpoint, b: Checkpoint): number => Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2));
