import { Effect } from "w3ts";

export class Rasterizer {
    private static readonly EFFECTS: Effect[][] = [];

    // Static only class
    protected constructor() { }

    public static DrawRect(x1: number, y1: number, x2: number, y2: number): void {
        const imagePath: string = 'Doodads/Cinematic/FireRockSmall/FireRockSmall.mdx';
        const sfx: Effect[] = [];
        const size = 4;
        for (let x: number = x1; x < x2; x = x + 16) {
            // sfx.push(new Image(imagePath, 16, 16, 0 , x - (size/2), y1 - (size/2),0.00, 0, 0, 0, 2));
            sfx.push(new Effect(imagePath, x, y1));

        }

        for (let y: number = y1; y < y2; y = y + 16) {
            // sfx.push(new Image(imagePath, size, size, 0 , x2 - (size/2), y - (size/2),0.00, 0, 0, 0, 2));
            sfx.push(new Effect(imagePath, x2, y));

        }

        for (let x: number = x1; x < x2; x = x + 16) {
            // sfx.push(new Image(imagePath, size, size, 0 , x - (size/2), y2 - (size/2),0.00, 0, 0, 0, 2));
            sfx.push(new Effect(imagePath, x, y2));

        }
        for (let y: number = y1; y < y2; y = y + 16) {
            // sfx.push(new Image(imagePath, size, size, 0 , x1 - (size/2), y - (size/2),0.00, 0, 0, 0, 1));
            sfx.push(new Effect(imagePath, x1, y));
        }
        this.EFFECTS.push(sfx);
        // sfx.forEach((sfx: Image) => {
        //     img.setRender(true);
        //     img.show(true);
        // });
    }

    public static DrawPoint(x: number, y: number, modelname?: string): void {
        const imagePath: string = modelname || 'war3mapImported/PlasmaLeakMedium.mdx';
        const sfx: Effect[] = [];
        sfx.push(new Effect(imagePath, x, y));
        this.EFFECTS.push(sfx);
    }

    public static RemoveAllDrawings(): void {
        let current = this.EFFECTS.pop();
        while (current) {
            current.forEach((fx) => fx.destroy());
            current = this.EFFECTS.pop();
        }
    }
}
