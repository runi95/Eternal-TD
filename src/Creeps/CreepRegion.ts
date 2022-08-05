import type { Region } from "w3ts/handles/region";
import type { Checkpoint } from "../Utility/Checkpoint";
import type { Unit } from "../../node_modules/w3ts/index";

export class CreepRegion {
    public readonly target_cp_indx: number;
    public readonly region: Region;
    public readonly regionId: number;
    public readonly center: Checkpoint;
    private readonly creepEnterEvents: Map<number, ((u: Unit) => void)> = new Map();

    constructor(regionId: number, target_cp_index: number, region: Region, center: Checkpoint) {
        this.region = region;
        this.regionId = regionId;
        this.target_cp_indx = target_cp_index;
        this.center = center;
    }

    public triggerCreepEnterEvents(u: Unit): void {
        for (const event of this.creepEnterEvents.values()) {
            event(u);
        }
    }

    public addCreepEnterEvent(eventId: number, event: (u: Unit) => void): void {
        this.creepEnterEvents.set(eventId, event);
    }

    public getCreepEnterEvent(eventId: number): ((u: Unit) => void) | undefined {
        return this.creepEnterEvents.get(eventId);
    }

    public removeCreepEnterEvent(eventId: number) {
        this.creepEnterEvents.delete(eventId);
    }
}
