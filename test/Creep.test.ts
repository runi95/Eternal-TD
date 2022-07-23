import test from "ava";
import { GameMap } from "../src/Game/GameMap";
import { Creep } from "../src/Creeps/Creep";
import { RedVillager } from "../src/Creeps/Normal/RedVillager";

test('Creep.spawn() should add creep to GameMap', t => {
    t.is(GameMap.SPAWNED_CREEP_MAP.size, 0);
    Creep.spawn(RedVillager.RED_VILLAGER);
    t.is(GameMap.SPAWNED_CREEP_MAP.size, 1);
});
