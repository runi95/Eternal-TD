import {Unit} from "w3ts";

export class FrozenUnit {
    public readonly permafrost: boolean;
    public readonly hasIceShards: boolean;
    private readonly unit: Unit;
    private duration: number;

    constructor(unit: Unit, duration: number, permafrost: boolean, hasIceShards: boolean) {
        this.permafrost = permafrost;
        this.hasIceShards = hasIceShards;
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
