import {CreepRegion} from "../Creeps/CreepRegion";
import {Trigger, Unit} from "w3ts";
import {Checkpoint, Direction, directionCP} from "../Utility/Checkpoint";
import {Region} from "w3ts/handles/region";
import {Rectangle} from "w3ts/handles/rect";
import {DrawPoint} from "../Utility/Rasterizer";
import {RoundCreepController} from "./RoundCreepController";
import { GameMap } from "./GameMap";

export class MapRegionController {
    regionIds: Record<string, number> = {}
    regions: Record<string, CreepRegion> = {}
    enterTrig: Trigger;
    constructor(creepSpawnCP: Checkpoint, roundCreepController: RoundCreepController, debugEnabled: boolean) {
        let lastCP = creepSpawnCP;
        let rId = 0;
        this.enterTrig = new Trigger();
        GameMap.CHECKPOINTS.forEach((checkpoint, cpIndx) => {
            const direction = directionCP(lastCP, checkpoint);
            switch (direction) {
                case Direction.SOUTH:
                    for (let i = lastCP.y; i > checkpoint.y; i=i-128) {
                        if(debugEnabled) {
                            DrawPoint(lastCP.x, i)
                        }
                        const reg = new Region()
                        const rect = new Rectangle(lastCP.x-128, i-128, lastCP.x+128, i)
                        // this.drawRect(lastCP.x-128, i-128, lastCP.x+128, i);
                        reg.addRect(rect);
                        rect.destroy();
                        this.regionIds[reg.id] = rId;
                        this.regions[reg.id] = new CreepRegion(rId, cpIndx, reg);
                        rId++;
                        this.enterTrig.registerEnterRegion(reg.handle, null);

                    }
                    break;
                case Direction.NORTH:
                    for (let i = lastCP.y+128; i < checkpoint.y; i=i+128) {
                        if(debugEnabled) {
                            DrawPoint(lastCP.x, i)
                        }
                        const reg = new Region()
                        const rect = new Rectangle(lastCP.x-128, i, lastCP.x+128, i+128)
                        // this.drawRect(lastCP.x-128, i, lastCP.x+128, i+128);
                        reg.addRect(rect);
                        rect.destroy();
                        this.regionIds[reg.id] = rId;
                        this.regions[reg.id] = new CreepRegion(rId, cpIndx, reg);
                        rId++;
                        this.enterTrig.registerEnterRegion(reg.handle, null);
                    }
                    break;
                case Direction.EAST:
                    for (let i = lastCP.x+128; i < checkpoint.x; i=i+128) {
                        if(debugEnabled) {
                            DrawPoint(i, lastCP.y)
                        }
                        const reg = new Region()
                        const rect = new Rectangle(i, lastCP.y-128, i+128, lastCP.y+128)
                        // this.drawRect(i, lastCP.y-128, i+128, lastCP.y+128);
                        reg.addRect(rect);
                        rect.destroy();
                        this.regionIds[reg.id] = rId;
                        this.regions[reg.id] = new CreepRegion(rId, cpIndx, reg);
                        rId++;
                        this.enterTrig.registerEnterRegion(reg.handle, null);
                    }
                    break;
                case Direction.WEST:
                    for (let i = lastCP.x-128; i > checkpoint.x; i=i-128) {
                        if(debugEnabled) {
                            DrawPoint(i, lastCP.y)
                        }
                        const reg = new Region()
                        const rect = new Rectangle(i-128, lastCP.y-128, i, lastCP.y+128)
                        // this.drawRect(i-128, lastCP.y-128, i, lastCP.y+128);
                        reg.addRect(rect);
                        rect.destroy();
                        this.regionIds[reg.id] = rId;
                        this.regions[reg.id] = new CreepRegion(rId, cpIndx, reg);
                        rId++;
                        this.enterTrig.registerEnterRegion(reg.handle, null);
                    }
                    break;
            }
            lastCP = checkpoint;
        })
        this.enterTrig.addAction(() => {
            const r = this.regions[Region.fromHandle(GetTriggeringRegion()).id];
            const u = Unit.fromEvent();
            const spawnedCreep = roundCreepController.get(u.id);
            if(GameMap.CHECKPOINTS[r.target_cp_indx] !== spawnedCreep.currentCheckpoint) {
                // print('enter wong wegion')
                return;
            }
            if(spawnedCreep.currentRegion) {
                delete spawnedCreep.currentRegion.creeps[u.id];
            }
            r.creeps[u.id] = spawnedCreep;
            spawnedCreep.currentRegion = r;
            // print(`entred region ${r.regionId}`)
        })
    }

}