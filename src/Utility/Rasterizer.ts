import { Effect, Timer } from "w3ts";
import { TimerUtils } from "./TimerUtils";

export class Rasterizer {
    private static readonly EFFECTS: Effect[] = [];

    // Static only class
    protected constructor() { }

    public static DrawRect(x1: number, y1: number, x2: number, y2: number): void {
        const imagePath: string = 'Doodads/Cinematic/FireRockSmall/FireRockSmall.mdx';
        for (let x: number = x1; x < x2; x = x + 16) {
            this.EFFECTS.push(new Effect(imagePath, x, y1));
        }

        for (let y: number = y1; y < y2; y = y + 16) {
            this.EFFECTS.push(new Effect(imagePath, x2, y));
        }

        for (let x: number = x1; x < x2; x = x + 16) {
            this.EFFECTS.push(new Effect(imagePath, x, y2));
        }

        for (let y: number = y1; y < y2; y = y + 16) {
            this.EFFECTS.push(new Effect(imagePath, x1, y));
        }
    }

    public static DrawPoint(x: number, y: number, modelname?: string): void {
        const imagePath: string = modelname || 'war3mapImported/PlasmaLeakMedium.mdx';
        this.EFFECTS.push(new Effect(imagePath, x, y));
    }

    public static RemoveAllDrawings(): void {
        for (let current = this.EFFECTS.pop(); current !== undefined; current = this.EFFECTS.pop()) {
            current.destroy();
        }
    }
}
