import test from "ava";
import { Unit } from "w3ts";
import { GameOptions } from "../src/Game/GameOptions";
import { MapRegionController } from "../src/Game/MapRegionController";
import { Checkpoint } from "../src/Utility/Checkpoint";

test('Should create a set of regions with a given distance between them from each checkpoint to the next', t => {
    const gameOptions = new GameOptions();
    const distances = 3 * MapRegionController.CHECKPOINT_DISTANCE;
    const checkpoints = [{
        x: -distances,
        y: -distances
    }, {
        x: distances,
        y: -distances
    }, {
        x: distances,
        y: distances
    }, {
        x: -distances,
        y: distances
    }, {
        x: -distances,
        y: -distances
    }];
    new MapRegionController(gameOptions, checkpoints);
    const regionCheckpoints: Checkpoint[] = [];
    for (const key in MapRegionController.REGIONS) {
        regionCheckpoints.push(MapRegionController.REGIONS[key].center);
    }

    t.snapshot(regionCheckpoints);
});

test('getVisibleRegions() should only retrive regions within range of the given unit', t => {
    const x = -640.0;
    const y = 2176.0;

    const gameOptions = new GameOptions();
    new MapRegionController(gameOptions);
    const unit = new Unit(0, 0, x, y, 0);
    const acquireRange = 320.0;
    unit.acquireRange = acquireRange;
    const visibleRegions = MapRegionController.getVisibleRegions(unit);

    for (const visibleRegion of visibleRegions) {
        const dist = Math.sqrt(Math.pow(x - visibleRegion.center.x, 2) + Math.pow(y - visibleRegion.center.y, 2));
        t.assert(dist <= acquireRange + 0.5 * MapRegionController.CHECKPOINT_DISTANCE, `${dist} <= ${acquireRange + 0.5 * MapRegionController.CHECKPOINT_DISTANCE}`);
    }
});
