import { CreepRegion } from "../Creeps/CreepRegion";
import { Trigger, Unit } from "w3ts";
import { Checkpoint, euclideanDistance } from "../Utility/Checkpoint";
import { Region } from "w3ts/handles/region";
import { Rectangle } from "w3ts/handles/rect";
import { GameMap } from "./GameMap";
import { GameOptions } from "./GameOptions";
import { Rasterizer } from "../Utility/Rasterizer";

const DRAW_EVERY_REGION_DEBUG = false;

export class MapRegionController {
    public static readonly REGIONS: Record<string, CreepRegion> = {};
    public static readonly CHECKPOINT_DISTANCE = 128;
    protected static readonly regionLookup: CreepRegion[] = [];
    private readonly enterTrig: Trigger = new Trigger();
    private readonly regionIds: Record<string, number> = {};

    constructor(gameOptions: GameOptions, checkpoints: Checkpoint[] = GameMap.CHECKPOINTS) {
        let lastCP = checkpoints[0];
        let rId = 0;
        for (let cpIndx = 1; cpIndx < checkpoints.length; cpIndx++) {
            const cDist = MapRegionController.CHECKPOINT_DISTANCE;
            const dist = Math.sqrt(Math.pow(checkpoints[cpIndx].x - lastCP.x, 2) + Math.pow(checkpoints[cpIndx].y - lastCP.y, 2)) / cDist;
            const mulX = (checkpoints[cpIndx].x - lastCP.x) / dist;
            const mulY = (checkpoints[cpIndx].y - lastCP.y) / dist;

            for (let i = 0; i < dist; i++) {
                const x = lastCP.x + mulX * i;
                const y = lastCP.y + mulY * i;
                if (gameOptions.isDebugModeEnabled && DRAW_EVERY_REGION_DEBUG) {
                    Rasterizer.DrawPoint(x, y);
                }

                const rect = new Rectangle(x - 0.5 * cDist, y - 0.5 * cDist, x + 0.5 * cDist, y + 0.5 * cDist);
                // this.drawRect(x - 0.5 * cDist, y - 0.5 * cDist, x + 0.5 * cDist, y + 0.5 * cDist);
                const reg = new Region();
                reg.addRect(rect);
                rect.destroy();
                this.regionIds[reg.id] = rId;
                MapRegionController.REGIONS[reg.id] = new CreepRegion(rId, cpIndx, reg, { x, y });
                MapRegionController.regionLookup.push(MapRegionController.REGIONS[reg.id]);
                rId++;
                this.enterTrig.registerEnterRegion(reg.handle, null);
            }
            lastCP = checkpoints[cpIndx];
        }

        this.enterTrig.addAction(() => {
            const currentRegionId: number = Region.fromHandle(GetTriggeringRegion()).id;
            const r = MapRegionController.REGIONS[currentRegionId];
            const spawnedCreep = GameMap.SPAWNED_CREEP_MAP.get(Unit.fromEvent().id);
            if (r.target_cp_indx !== spawnedCreep.nextCheckpointIndex) {
                // if (gameOptions.isDebugModeEnabled) print(`enter wong wegion: expected ${r.target_cp_indx}, got ${spawnedCreep.nextCheckpointIndex}`);
                return;
            }

            spawnedCreep.currentRegionId = currentRegionId;
            if (gameOptions.isDebugModeEnabled) print(`entered region ${r.regionId}`);
        })
    }

    public static getVisibleRegions(unit: Unit): CreepRegion[] {
        return MapRegionController.regionLookup.filter((region) => euclideanDistance({ x: unit.x, y: unit.y }, region.center) <= unit.acquireRange + 0.5 * MapRegionController.CHECKPOINT_DISTANCE);
    }
}
