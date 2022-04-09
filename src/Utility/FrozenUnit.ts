export class FrozenUnit {
    public readonly permafrost: boolean;
    private readonly unit: unit;
    private duration: number;

    constructor(unit: unit, duration: number, permafrost: boolean) {
        this.permafrost = permafrost;
        this.unit = unit;
        this.duration = duration;
    }

    public getUnit(): unit {
        return this.unit;
    }

    public addDuration(duration: number): void {
        this.duration += duration;
    }

    public getDuration(): number {
        return this.duration;
    }

    public setDuration(duration: number): void {
        this.duration = duration;
    }
}
