import test from "ava";
import { Unit } from "w3ts/handles";
import { triggers, timers, Timer, frames } from "./overrides/w3ts/handles";

// These globals HAVE to be declared before the TowerAbilitySystem import!
global.OSKEY_1 = "OSKEY_1";
global.OSKEY_2 = "OSKEY_2";
global.OSKEY_3 = "OSKEY_3";
global.OSKEY_4 = "OSKEY_4";
global.OSKEY_5 = "OSKEY_5";
global.OSKEY_6 = "OSKEY_6";
global.OSKEY_7 = "OSKEY_7";
global.OSKEY_8 = "OSKEY_8";
global.OSKEY_9 = "OSKEY_9";
global.OSKEY_0 = "OSKEY_0";
global.FRAMEPOINT_CENTER = "FRAMEPOINT_CENTER";
global.FRAMEPOINT_BOTTOM = "FRAMEPOINT_BOTTOM";
global.FRAMEPOINT_TOP = "FRAMEPOINT_TOP";
global.FRAMEPOINT_BOTTOMLEFT = "FRAMEPOINT_BOTTOMLEFT";
global.FRAMEPOINT_TOPRIGHT = "FRAMEPOINT_TOPRIGHT";
global.FRAMEEVENT_CONTROL_CLICK = "FRAMEEVENT_CONTROL_CLICK";

import { TowerAbilitySystem } from "../src/TowerAbilities/TowerAbilitySystem";

test.beforeEach(() => {
    triggers.length = 0;
    frames.length = 0;
});

test.serial('Adding a new tower ability should display the ability frame to the player', async t => {
    global.BlzCreateFrame = () => ({});
    global.BlzCreateFrameByType = () => ({});
    global.BlzGetOriginFrame = () => ({});
    global.GetPlayerId = () => 0;
    global.GetLocalPlayer = () => ({});
    global.ORIGIN_FRAME_GAME_UI = undefined;

    const towerAbilitySystem = new TowerAbilitySystem();
    t.is(triggers.length, 1);

    const unit = new Unit(0, 0, 0, 0, 0);
    const tower = {
        internalId: 0,
        towerType: {
            unitTypeId: 0,
            upgrades: [],
            initializeCustomData: () => { },
            applyInitialUnitValues: () => { }
        },
        pathUpgrades: [],
        customData: {},
        visibleRegions: [],
        unit,
        fortifiedVillagerBonusDamage: 0,
        purpleVillagerBonusDamage: 0,
        largeVillagerBonusDamage: 0,
        zeppelinVillagerBonusDamage: 0
    };
    const towerAbility = {
        name: "ABILITY_NAME",
        description: "ABILITY_DESCRIPTION",
        icon: "ABILITY/ICON.blp",
        cooldown: 5
    };

    const backdropFrame = frames[0];
    const buttonFrame = frames[2];
    const tooltipFrame = frames[4];
    t.false(buttonFrame.visible);
    towerAbilitySystem.addTowerAbility(0, tower, towerAbility);
    t.true(buttonFrame.visible);
    t.is(backdropFrame.texFile, towerAbility.icon);
    t.true(tooltipFrame.text !== undefined);
    t.true(tooltipFrame.text !== null);
    t.true(typeof tooltipFrame.text === "string");
    t.true(tooltipFrame.text.length > 0);
    t.true(buttonFrame.visible);
});

test.serial('Adding a new tower ability should automatically start a cooldown timer', async t => {
    global.BlzCreateFrame = () => ({});
    global.BlzCreateFrameByType = () => ({});
    global.BlzGetOriginFrame = () => ({});
    global.GetPlayerId = () => 0;
    global.GetLocalPlayer = () => ({});
    global.ORIGIN_FRAME_GAME_UI = undefined;

    const towerAbilitySystem = new TowerAbilitySystem();
    t.is(triggers.length, 1);

    const unit = new Unit(0, 0, 0, 0, 0);
    const tower = {
        internalId: 0,
        towerType: {
            unitTypeId: 0,
            upgrades: [],
            initializeCustomData: () => { },
            applyInitialUnitValues: () => { }
        },
        pathUpgrades: [],
        customData: {},
        visibleRegions: [],
        unit,
        fortifiedVillagerBonusDamage: 0,
        purpleVillagerBonusDamage: 0,
        largeVillagerBonusDamage: 0,
        zeppelinVillagerBonusDamage: 0
    };
    const towerAbility = {
        name: "ABILITY_NAME",
        description: "ABILITY_DESCRIPTION",
        icon: "ABILITY/ICON.blp",
        cooldown: 5
    };

    let firstTimerIndex: number | null = null;
    let tick = 0;
    Timer.setOnHandleFunc(async (t: Timer) => {
        if (firstTimerIndex === null) {
            firstTimerIndex = t.timerIndex;
        }

        if (t.timerIndex !== firstTimerIndex) {
            return;
        }

        tick++;

        if (tick === 25) {
            await new Promise<void>((resolve, _reject) => setImmediate(() => resolve()));
        }
    });
    const cooldownFrame = frames[1];
    const buttonFrame = frames[2];
    t.false(cooldownFrame.visible);
    t.false(buttonFrame.visible);
    towerAbilitySystem.addTowerAbility(0, tower, towerAbility);
    t.true(cooldownFrame.visible);
    t.true(buttonFrame.visible);
    await new Promise<void>((resolve, _reject) => setImmediate(() => resolve()));
    t.true(cooldownFrame.value > 0);
    await new Promise<void>((resolve, _reject) => setImmediate(() => resolve()));
    t.false(cooldownFrame.visible);
    t.true(buttonFrame.visible);
    t.false(cooldownFrame.value < 100);
});

test.serial('Players should have separate cooldowns when abilities are added', async t => {
    global.BlzCreateFrame = () => ({});
    global.BlzCreateFrameByType = () => ({});
    global.BlzGetOriginFrame = () => ({});
    global.GetPlayerId = (player) => player.id;
    global.ORIGIN_FRAME_GAME_UI = undefined;

    const player1TowerAbilitySystem = new TowerAbilitySystem();
    t.is(triggers.length, 1);

    const unit = new Unit(0, 0, 0, 0, 0);
    const tower = {
        internalId: 0,
        towerType: {
            unitTypeId: 0,
            upgrades: [],
            initializeCustomData: () => { },
            applyInitialUnitValues: () => { }
        },
        pathUpgrades: [],
        customData: {},
        visibleRegions: [],
        unit,
        fortifiedVillagerBonusDamage: 0,
        purpleVillagerBonusDamage: 0,
        largeVillagerBonusDamage: 0,
        zeppelinVillagerBonusDamage: 0
    };
    const towerAbility = {
        name: "ABILITY_NAME",
        description: "ABILITY_DESCRIPTION",
        icon: "ABILITY/ICON.blp",
        cooldown: 5
    };

    const ticks = {};
    Timer.setOnHandleFunc(async (t: Timer) => {
        ticks[t.timerIndex] = (ticks[t.timerIndex] || 0) + 1;
        if (ticks[t.timerIndex] === 25) {
            await new Promise<void>((resolve, _reject) => setImmediate(() => resolve()));
        }
    });
    const player1CooldownFrame = frames[1];

    const currentFrameCount = frames.length;
    const player2TowerAbilitySystem = new TowerAbilitySystem();
    const player2CooldownFrame = frames[currentFrameCount + 1];

    global.GetLocalPlayer = () => ({ id: 0 });
    player1TowerAbilitySystem.addTowerAbility(0, tower, towerAbility);
    global.GetLocalPlayer = () => ({ id: 1 });
    player2TowerAbilitySystem.addTowerAbility(0, tower, towerAbility);

    t.true(player1CooldownFrame.visible);
    t.false(player2CooldownFrame.visible);

    await new Promise<void>((resolve, _reject) => setImmediate(() => resolve()));

    t.true(player1CooldownFrame.value > 0);
    t.false(player2CooldownFrame.value > 0);

    global.GetLocalPlayer = () => ({ id: 0 });
    player1TowerAbilitySystem.addTowerAbility(1, tower, towerAbility);
    global.GetLocalPlayer = () => ({ id: 1 });
    player2TowerAbilitySystem.addTowerAbility(1, tower, towerAbility);

    t.true(player1CooldownFrame.visible);
    t.true(player2CooldownFrame.visible);

    await new Promise<void>((resolve, _reject) => setImmediate(() => resolve()));

    t.false(player1CooldownFrame.visible);
    t.true(player2CooldownFrame.visible);
    t.true(player2CooldownFrame.value > 0);

    await new Promise<void>((resolve, _reject) => setImmediate(() => resolve()));

    t.false(player1CooldownFrame.visible);
    t.false(player2CooldownFrame.visible);
});

test.afterEach(() => {
    global.BlzCreateFrame = undefined;
    global.BlzCreateFrameByType = undefined;
    global.BlzGetOriginFrame = undefined;
    global.GetTriggerPlayer = undefined;
    global.GetPlayerId = undefined;
    global.GetLocalPlayer = undefined;
    global.ORIGIN_FRAME_GAME_UI = undefined;
});
