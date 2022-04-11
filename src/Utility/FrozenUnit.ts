import {Unit} from "w3ts";

export class FrozenUnit {
    public readonly permafrost: boolean;
    private readonly unit: Unit;
    private duration: number;

    constructor(unit: Unit, duration: number, permafrost: boolean) {
        this.permafrost = permafrost;
        this.unit = unit;
        this.duration = duration;
    }

    public getUnit(): Unit {
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
