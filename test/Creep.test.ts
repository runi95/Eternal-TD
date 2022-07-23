import test from "ava";
import { GameMap } from "../src/Game/GameMap";
import { Creep } from "../src/Creeps/Creep";
import { RedVillager } from "../src/Creeps/Normal/RedVillager";
import { BlueVillager } from "../src/Creeps/Normal/BlueVillager";
import { YellowVillager } from "../src/Creeps/Normal/YellowVillager";
import { Unit } from "./overrides/w3ts";

let redVillager: Creep;
let blueVillager: Creep;
test.serial('Spawning a Creep should add the creep to GameMap.SPAWNED_CREEP_MAP', t => {
    t.is(GameMap.SPAWNED_CREEP_MAP.size, 0);
    Creep.spawn(RedVillager.RED_VILLAGER);
    t.is(GameMap.SPAWNED_CREEP_MAP.size, 1);

    const expectedUnitId = 1;
    const next = GameMap.SPAWNED_CREEP_MAP.keys().next();
    const done = next.done;
    const key = next.value;
    t.false(done);
    t.is(key, expectedUnitId);

    redVillager = GameMap.SPAWNED_CREEP_MAP.get(key) as Creep;
    t.not(redVillager, undefined);
    t.is(redVillager.creepBaseUnit, RedVillager.RED_VILLAGER);
    t.is(redVillager.unitId, expectedUnitId);
});

test.serial('Dealing lethal damage to a RedVillager should not spawn any creeps', t => {
    t.is(Unit.UNIT_COUNTER, 1);
    const N = 10;
    for (let i = 0; i < N; i++) {
        t.is(redVillager.dealLethalDamage(i), -1);
        t.is(redVillager.creepBaseUnit, RedVillager.RED_VILLAGER);
    }
    t.is(Unit.UNIT_COUNTER, 1);
});

test.serial('Dealing more than exact lethal damage to a BlueVillager should not transform it', t => {
    const unitCounter = Unit.UNIT_COUNTER;
    Creep.spawn(BlueVillager.BLUE_VILLAGER);
    t.is(Unit.UNIT_COUNTER, unitCounter + 1);

    const expectedUnitId = unitCounter + 1;
    blueVillager = GameMap.SPAWNED_CREEP_MAP.get(expectedUnitId) as Creep;
    t.is(blueVillager.creepBaseUnit, BlueVillager.BLUE_VILLAGER);

    const N = 10;
    for (let i = 0; i < N; i++) {
        t.is(blueVillager.dealLethalDamage(i + 1), -1);
        t.is(blueVillager.creepBaseUnit, BlueVillager.BLUE_VILLAGER);
    }
});

test.serial('Dealing exact lethal damage to a BlueVillager should transform it into a RedVillager', t => {
    t.is(blueVillager.creepBaseUnit, BlueVillager.BLUE_VILLAGER);
    t.is(blueVillager.dealLethalDamage(0), 0);
    t.is(blueVillager.creepBaseUnit, RedVillager.RED_VILLAGER);
});

test.serial('Dealing 1 more than exact lethal damage to a YellowVillager should transform it into a BlueVillager', t => {
    const unitCounter = Unit.UNIT_COUNTER;
    Creep.spawn(YellowVillager.YELLOW_VILLAGER);
    t.is(Unit.UNIT_COUNTER, unitCounter + 1);

    const expectedUnitId = unitCounter + 1;
    const yellowVillager = GameMap.SPAWNED_CREEP_MAP.get(expectedUnitId) as Creep;
    t.is(yellowVillager.creepBaseUnit, YellowVillager.YELLOW_VILLAGER);
    t.is(yellowVillager.dealLethalDamage(1), 0);
    t.is(yellowVillager.creepBaseUnit, BlueVillager.BLUE_VILLAGER);
});
