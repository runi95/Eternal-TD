import { StunUtils } from "../Utility/StunUtils";
import { TimerUtils } from "../Utility/TimerUtils";
import { Tower } from "./Tower";
import { TowerType } from "./TowerType";
import towerTypeMap from "./TowerTypes";
import { Point, Trigger, Unit } from "w3ts";
import { RandomNumberGenerator } from "../Utility/RandomNumberGenerator";
import { DefenseTypes } from "../Creeps/DefenseTypes";
import { TowerAbilitySystem } from "../TowerAbilities/TowerAbilitySystem";
import { Group } from "../Utility/Group";
import { TargetFlags } from "../Creeps/TargetFlags";
import { GameMap } from "../Game/GameMap";
import { InvisibilityModifier } from "../Creeps/Modifiers/InvisibilityModifier";
import { FortifiedVillager } from "../Creeps/Normal/FortifiedVillager";
import { Zeppelin } from "../Creeps/Normal/Zeppelin";
import type { Timer } from "w3ts";
import type { TowerUpgrade } from "./TowerUpgrade";
import type { TowerAbility } from "../TowerAbilities/TowerAbility";
import type { AbominationCustomData } from "./Abomination/Abomination";
import type { ObsidianStatueCustomData } from "./ObsidianStatue/ObsidianStatue";
import type { VoidwalkerCustomData } from "./Voidwalker/Voidwalker";

const attackAbilityId: number = FourCC('Aatk');
const tickTowerAbilityId: number = FourCC('A008');
const dummyUnitTypeId: number = FourCC('u007');
const embrittlementAbilityId: number = FourCC('A00D');
const superBrittleAbilityId: number = FourCC('A00E');
const abominationUnitTypeId: number = FourCC('h007');
const obsidianStatueUnitTypeId: number = FourCC('h008');
const voidwalkerUnitTypeId: number = FourCC('h00C');
const lesserVoidwalkerUnitTypeId: number = FourCC('o000');
const meatWagonUnitTypeId: number = FourCC('h00A');
const timedLifeBuffId: number = FourCC('BTLF');
export class TowerController {
    private readonly towerAbilitySystem: TowerAbilitySystem;
    private readonly tickTowers: Map<number, Timer> = new Map();

    constructor(towerAbilitySystem: TowerAbilitySystem) {
        this.towerAbilitySystem = towerAbilitySystem;

        const constTrig: Trigger = new Trigger();
        constTrig.addAction(() => {
            const trig: Unit = Unit.fromEvent();
            trig.pauseEx(true);

            trig.disableAbility(attackAbilityId, false, true);
            trig.disableAbility(851984, false, true);

            const unitTypeId: number = trig.typeId;
            const towerType: TowerType | undefined = towerTypeMap.get(unitTypeId);
            if (towerType === undefined) {
                throw new Error(`Invalid argument; no TowerType of unitTypeId ${unitTypeId} exists!`);
            }

            if (unitTypeId === meatWagonUnitTypeId) {
                // Added via trigger so that the tower doesn't show up as a "worker" in UI in-game
                trig.addType(UNIT_TYPE_PEON);
            }

            const trigHandleId: number = trig.id;
            const tower: Tower = new Tower(trig, towerType);
            tower.towerType.applyInitialUnitValues(trig);

            GameMap.BUILT_TOWER_MAP.set(trigHandleId, tower);
            GameMap.BUILT_TOWER_INTERNAL_ID_MAP.set(tower.internalId, trigHandleId);
            this.addTickTower(tower);
        });
        constTrig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_START);

        const constEndTrig = new Trigger();
        constEndTrig.addAction(() => {
            const trig: Unit = Unit.fromEvent();
            if (trig.typeId === meatWagonUnitTypeId) {
                trig.issuePointOrder("channel", new Point(GameMap.CHECKPOINTS[0].x, GameMap.CHECKPOINTS[0].y));
            }

            trig.pauseEx(false);
        });
        constEndTrig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH);
    }

    public upgradeTower(tower: Tower, upgrade: TowerUpgrade): boolean {
        let isTowerUnitReplaced = false;
        const originalHandleId: number = tower.unit.id;
        if (upgrade.newUnitTypeId !== undefined) {
            isTowerUnitReplaced = true;
            const pathUpgrades = tower.pathUpgrades;
            const unit = Unit.fromHandle(ReplaceUnitBJ(tower.unit.handle, upgrade.newUnitTypeId, bj_UNIT_STATE_METHOD_DEFAULTS));
            unit.disableAbility(attackAbilityId, false, true);
            tower.unit = unit;

            GameMap.BUILT_TOWER_MAP.delete(originalHandleId);
            const newUnitId = unit.id;
            GameMap.BUILT_TOWER_MAP.set(newUnitId, tower);
            GameMap.BUILT_TOWER_INTERNAL_ID_MAP.set(tower.internalId, newUnitId);

            tower.towerType.applyInitialUnitValues(unit);
            for (let i = 0; i < pathUpgrades.length; i++) {
                for (let j = 0; j < pathUpgrades[i]; j++) {
                    tower.towerType.upgrades[i][j].applyUpgrade(tower);
                }
            }

            SelectUnitForPlayerSingle(unit.handle, GetTriggerPlayer());
        } else if (upgrade.newUnitSkinTypeId !== undefined) {
            tower.unit.skin = upgrade.newUnitSkinTypeId;
        } else {
            upgrade.applyUpgrade(tower);
        }

        if (this.tickTowers.has(originalHandleId)) {
            TimerUtils.releaseTimer(this.tickTowers.get(originalHandleId) as Timer);
            this.tickTowers.delete(originalHandleId);
        }

        if (tower.unit.getAbilityLevel(tickTowerAbilityId) > 0) {
            this.addTickTower(tower);
        }

        if (upgrade.ability !== undefined) {
            this.towerAbilitySystem.addTowerAbility(GetPlayerId(GetOwningPlayer(tower.unit.handle)), tower, upgrade.ability as TowerAbility);
        }

        return isTowerUnitReplaced;
    }

    private addTickTower(tower: Tower): void {
        if (tower.unit.getAbilityLevel(tickTowerAbilityId) > 0) {
            // TODO: Remove towers from this map when the tower is sold
            const t: Timer = TimerUtils.newTimer();
            const tickFunction = this.getTowerTickFunction(tower.towerType.unitTypeId);
            t.start(BlzGetAbilityRealLevelField(tower.unit.getAbility(tickTowerAbilityId), ABILITY_RLF_COOLDOWN, 0), true, () => tickFunction(tower));

            this.tickTowers.set(tower.unit.id, t);
        }
    }

    private getTowerTickFunction(unitTypeId: number): (tower: Tower) => void {
        switch (unitTypeId) {
            // ABOMINATION TICK FUNCTION
            case abominationUnitTypeId:
                return (tower: Tower) => {
                    const {
                        range,
                        maxUnitCount,
                        damageAmount,
                        hasGreaterPermanentImmolation,
                        greaterPermanentImmolationAdditionalUnitCount,
                        greaterPermanentImmolationAdditionalDamageAmount,
                        nonGreaterPermanentImmolationAdditionalUnitCount
                    } = tower.customData as AbominationCustomData;
                    let realMaxUnitCount = maxUnitCount;
                    if (hasGreaterPermanentImmolation) {
                        realMaxUnitCount += greaterPermanentImmolationAdditionalUnitCount;
                    } else {
                        realMaxUnitCount += nonGreaterPermanentImmolationAdditionalUnitCount;
                    }

                    let realDamageAmount = damageAmount;
                    if (hasGreaterPermanentImmolation)
                        realDamageAmount += greaterPermanentImmolationAdditionalDamageAmount;

                    const loc = tower.unit.point;
                    const group: Group = Group.fromRange(range, loc);

                    let unitCount = 0;
                    group.for((u: Unit) => {
                        if (unitCount >= realMaxUnitCount)
                            return;

                        if (!u.isAlive())
                            return;

                        if (u.owner.id !== 23)
                            return;

                        if (BlzGetUnitIntegerField(u.handle, UNIT_IF_TARGETED_AS) === TargetFlags.WARD)
                            return;

                        unitCount++;
                        tower.unit.damageTarget(u.handle, realDamageAmount, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)

                    });
                    group.destroy();
                    loc.destroy();
                };
            case obsidianStatueUnitTypeId:
                return (tower: Tower) => {
                    const {
                        range,
                        maxUnitCount,
                        damageAmount,
                        freezeDuration,
                        hasPermafrost,
                        hasColdSnap,
                        hasReFreeze,
                        hasIceShards,
                        hasDeepFreeze,
                        hasEmbrittlement,
                        hasSuperBrittle,
                    } = tower.customData as ObsidianStatueCustomData;
                    const loc = tower.unit.point;
                    const group: Group = Group.fromRange(range, loc);

                    let unitCount = 0;
                    group.for((u: Unit) => {
                        if (unitCount >= maxUnitCount)
                            return;

                        if (!u.isAlive())
                            return;

                        if (u.owner.id !== 23)
                            return;

                        const unitId = u.id;
                        if (StunUtils.getFrozenUnit(unitId) !== undefined && !hasReFreeze)
                            return;

                        const creep = GameMap.SPAWNED_CREEP_MAP.get(unitId);
                        if (creep === undefined) return;
                        if (!hasColdSnap && (creep.creepBaseUnit.name === FortifiedVillager.name || creep.hasModifier(InvisibilityModifier.INVISIBILITY_MODIFIER)))
                            return;

                        if (BlzGetUnitIntegerField(u.handle, UNIT_IF_DEFENSE_TYPE) === DefenseTypes.HEAVY)
                            return;

                        if (hasEmbrittlement) {
                            const dummy = new Unit(tower.unit.owner, dummyUnitTypeId, u.x, u.y, bj_UNIT_FACING);
                            dummy.addAbility(embrittlementAbilityId);

                            if (hasSuperBrittle) {
                                dummy.incAbilityLevel(embrittlementAbilityId);
                            }

                            dummy.issueTargetOrder("curse", u);
                        }

                        if (creep.creepBaseUnit.name === Zeppelin.name) {
                            if (hasSuperBrittle) {
                                const dummy = new Unit(tower.unit.owner, dummyUnitTypeId, u.x, u.y, bj_UNIT_FACING);
                                dummy.addAbility(superBrittleAbilityId);
                                dummy.issueTargetOrder("slow", u);
                            }

                            return;
                        }

                        unitCount++;
                        tower.unit.damageTarget(u.handle, damageAmount, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                        StunUtils.freezeUnit(u, freezeDuration, hasPermafrost, hasReFreeze, hasIceShards, hasDeepFreeze);
                    });
                    group.destroy();
                    loc.destroy();
                };
            case voidwalkerUnitTypeId:
                return (tower: Tower) => {
                    const { duration, spread, cooldown, additionalRange, voidwalkerUnitTypeIds } = tower.customData as VoidwalkerCustomData;
                    const x: number = tower.unit.x + RandomNumberGenerator.random(-spread, spread);
                    const y: number = tower.unit.y + RandomNumberGenerator.random(-spread, spread);

                    let lesserVoidwalker: Unit;
                    if (voidwalkerUnitTypeIds !== null) {
                        const { voidwalkerUnitTypeIndex } = tower.customData as VoidwalkerCustomData;
                        (tower.customData as VoidwalkerCustomData).voidwalkerUnitTypeIndex = (voidwalkerUnitTypeIndex + 1) % voidwalkerUnitTypeIds.length;
                        lesserVoidwalker = new Unit(tower.unit.owner, voidwalkerUnitTypeIds[voidwalkerUnitTypeIndex], x, y, bj_UNIT_FACING);
                    } else {
                        lesserVoidwalker = new Unit(tower.unit.owner, lesserVoidwalkerUnitTypeId, x, y, bj_UNIT_FACING);
                        if (cooldown > 0.95) {
                            lesserVoidwalker.setAttackCooldown(cooldown, 0);
                        }
                    }

                    lesserVoidwalker.applyTimedLife(timedLifeBuffId, duration);

                    if (additionalRange > 0) {
                        lesserVoidwalker.acquireRange = 450 + additionalRange;

                        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
                        BlzSetUnitWeaponRealField(lesserVoidwalker.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, additionalRange);
                    }
                };
            default:
                throw new Error(`Invalid argument; no TickFunction exists for Tower of type ${unitTypeId}`);
        }
    }
}
