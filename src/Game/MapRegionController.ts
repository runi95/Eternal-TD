import { CreepRegion } from "../Creeps/CreepRegion";
import { Trigger, Unit } from "w3ts";
import { Direction, directionCP, distance2D } from "../Utility/Checkpoint";
import { Region } from "w3ts/handles/region";
import { Rectangle } from "w3ts/handles/rect";
import { GameMap } from "./GameMap";
import { GameOptions } from "./GameOptions";
import { Rasterizer } from "../Utility/Rasterizer";

const DRAW_EVERY_REGION_DEBUG = false;

export class MapRegionController {
    regionIds: Record<string, number> = {}
    regionLookup: CreepRegion[] = []
    regions: Record<string, CreepRegion> = {}
    enterTrig: Trigger;
    constructor(gameOptions: GameOptions) {
        let lastCP = GameMap.CHECKPOINTS[0];
        let rId = 0;
        this.enterTrig = new Trigger();
        for (let cpIndx = 1; cpIndx < GameMap.CHECKPOINTS.length; cpIndx++) {
            const direction = directionCP(lastCP, GameMap.CHECKPOINTS[cpIndx]);
            switch (direction) {
                case Direction.SOUTH:
                    for (let i = lastCP.y; i > GameMap.CHECKPOINTS[cpIndx].y; i = i - 128) {
                        if (gameOptions.isDebugModeEnabled && DRAW_EVERY_REGION_DEBUG) {
                            Rasterizer.DrawPoint(lastCP.x, i)
                        }
                        const reg = new Region();
                        const rect = new Rectangle(lastCP.x - 128, i - 128, lastCP.x + 128, i)
                        // this.drawRect(lastCP.x-128, i-128, lastCP.x+128, i);
                        reg.addRect(rect);
                        rect.destroy();
                        this.regionIds[reg.id] = rId;
                        this.regions[reg.id] = new CreepRegion(rId, cpIndx, reg, { x: lastCP.x, y: i - 64 });
                        this.regionLookup.push(this.regions[reg.id]);
                        rId++;
                        this.enterTrig.registerEnterRegion(reg.handle, null);
                    }
                    break;
                case Direction.NORTH:
                    for (let i = lastCP.y + 128; i < GameMap.CHECKPOINTS[cpIndx].y; i = i + 128) {
                        if (gameOptions.isDebugModeEnabled && DRAW_EVERY_REGION_DEBUG) {
                            Rasterizer.DrawPoint(lastCP.x, i)
                        }
                        const reg = new Region()
                        const rect = new Rectangle(lastCP.x - 128, i, lastCP.x + 128, i + 128)
                        // this.drawRect(lastCP.x-128, i, lastCP.x+128, i+128);
                        reg.addRect(rect);
                        rect.destroy();
                        this.regionIds[reg.id] = rId;
                        this.regions[reg.id] = new CreepRegion(rId, cpIndx, reg, { x: lastCP.x, y: i + 64 });
                        this.regionLookup.push(this.regions[reg.id]);
                        rId++;
                        this.enterTrig.registerEnterRegion(reg.handle, null);
                    }
                    break;
                case Direction.EAST:
                    for (let i = lastCP.x + 128; i < GameMap.CHECKPOINTS[cpIndx].x; i = i + 128) {
                        if (gameOptions.isDebugModeEnabled && DRAW_EVERY_REGION_DEBUG) {
                            Rasterizer.DrawPoint(i, lastCP.y)
                        }
                        const reg = new Region()
                        const rect = new Rectangle(i, lastCP.y - 128, i + 128, lastCP.y + 128)
                        // this.drawRect(i, lastCP.y-128, i+128, lastCP.y+128);
                        reg.addRect(rect);
                        rect.destroy();
                        this.regionIds[reg.id] = rId;
                        this.regions[reg.id] = new CreepRegion(rId, cpIndx, reg, { x: i + 64, y: lastCP.y });
                        this.regionLookup.push(this.regions[reg.id]);
                        rId++;
                        this.enterTrig.registerEnterRegion(reg.handle, null);
                    }
                    break;
                case Direction.WEST:
                    for (let i = lastCP.x - 128; i > GameMap.CHECKPOINTS[cpIndx].x; i = i - 128) {
                        if (gameOptions.isDebugModeEnabled && DRAW_EVERY_REGION_DEBUG) {
                            Rasterizer.DrawPoint(i, lastCP.y)
                        }
                        const reg = new Region()
                        const rect = new Rectangle(i - 128, lastCP.y - 128, i, lastCP.y + 128)
                        // this.drawRect(i-128, lastCP.y-128, i, lastCP.y+128);
                        reg.addRect(rect);
                        rect.destroy();
                        this.regionIds[reg.id] = rId;
                        this.regions[reg.id] = new CreepRegion(rId, cpIndx, reg, { x: i - 64, y: lastCP.y });
                        this.regionLookup.push(this.regions[reg.id]);
                        rId++;
                        this.enterTrig.registerEnterRegion(reg.handle, null);
                    }
                    break;
            }
            lastCP = GameMap.CHECKPOINTS[cpIndx];
        }

        this.enterTrig.addAction(() => {
            const currentRegionId: number = Region.fromHandle(GetTriggeringRegion()).id;
            const r = this.regions[currentRegionId];
            const spawnedCreep = GameMap.SPAWNED_CREEP_MAP.get(Unit.fromEvent().id);
            if (r.target_cp_indx !== spawnedCreep.nextCheckpointIndex) {
                // if (gameOptions.isDebugModeEnabled) print(`enter wong wegion: expected ${r.target_cp_indx}, got ${spawnedCreep.nextCheckpointIndex}`);
                return;
            }

            if (spawnedCreep.currentRegion !== null && this.regions[spawnedCreep.currentRegion]) {
                delete this.regions[spawnedCreep.currentRegion].creeps[spawnedCreep.unitId];
            }
            r.creeps[spawnedCreep.unitId] = spawnedCreep;
            spawnedCreep.currentRegion = currentRegionId;
            if (gameOptions.isDebugModeEnabled) print(`entered region ${r.regionId}`);
        })
    }

    getVisibleRegions(unit: Unit): CreepRegion[] {
        return this.regionLookup.filter((region) => {
            const distance = distance2D({ x: unit.x, y: unit.y }, region.center);
            return (distance <= unit.acquireRange + 64)
        });
    }

}
