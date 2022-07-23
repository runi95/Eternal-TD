import test from "ava";
import { GameMap } from "../src/Game/GameMap";
import { Creep } from "../src/Creeps/Creep";
import { RedVillager } from "../src/Creeps/Normal/RedVillager";

test('Creep.spawn() should add creep to GameMap', t => {
    t.is(GameMap.SPAWNED_CREEP_MAP.size, 0);
    Creep.spawn(RedVillager.RED_VILLAGER);
    t.is(GameMap.SPAWNED_CREEP_MAP.size, 1);

    const expectedUnitId = 1;
    const next = GameMap.SPAWNED_CREEP_MAP.keys().next();
    const done = next.done;
    const key = next.value;
    t.false(done);
    t.is(key, expectedUnitId);

    const creep = GameMap.SPAWNED_CREEP_MAP.get(key) as Creep;
    t.not(creep, undefined);
    t.is(creep.creepBaseUnit, RedVillager.RED_VILLAGER);
    t.is(creep.unitId, expectedUnitId);
});
