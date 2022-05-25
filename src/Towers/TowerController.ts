import { StunUtils } from "../Utility/StunUtils";
import { TimerUtils } from "../Utility/TimerUtils";
import { AbominationCustomData } from "./Abomination/Abomination";
import { ObsidianStatueCustomData } from "./ObsidianStatue/ObsidianStatue";
import { Tower } from "./Tower";
import { TowerType } from "./TowerType";
import towerTypeMap from "./TowerTypes";
import { TowerUpgrade } from "./TowerUpgrade";
import {Timer, Trigger, Unit} from "w3ts";
import { VoidwalkerCustomData } from "./Voidwalker/Voidwalker";
import { RandomNumberGenerator } from "Utility/RandomNumberGenerator";
import { DefenseTypes } from "Creeps/DefenseTypes";
import { TowerAbilitySystem } from "TowerAbilities/TowerAbilitySystem";
import { TowerAbility } from "TowerAbilities/TowerAbility";
import { Group } from "Utility/Group";
import { TargetFlags } from "Creeps/TargetFlags";

const attackAbilityId: number = FourCC('Aatk');
const tickTowerAbilityId: number = FourCC('A008');
const fortifiedUnitTypeId: number = FourCC('u004');
const invisibilityUnitTypeId: number = FourCC('u003');
const abominationUnitTypeId: number = FourCC('h007');
const obsidianStatueUnitTypeId: number = FourCC('h008');
const voidwalkerUnitTypeId: number = FourCC('h00C');
const lesserVoidwalkerUnitTypeId: number = FourCC('o000');
const timedLifeBuffId: number = FourCC('BTLF');
export class TowerController {
    private readonly towers: Map<number, Tower>;
    private readonly towerAbilitySystem: TowerAbilitySystem;
    private readonly timerUtils: TimerUtils;
    private readonly stunUtils: StunUtils;
    private readonly randomNumberGenerator: RandomNumberGenerator;
    private readonly tickTowers: Map<number, Timer> = new Map();

    constructor(towerAbilitySystem: TowerAbilitySystem, timerUtils: TimerUtils, stunUtils: StunUtils, randomNumberGenerator: RandomNumberGenerator, towers: Map<number, Tower>) {
        this.towerAbilitySystem = towerAbilitySystem;
        this.timerUtils = timerUtils;
        this.stunUtils = stunUtils;
        this.randomNumberGenerator = randomNumberGenerator;
        this.towers = towers;

        const constTrig: Trigger = new Trigger();
        constTrig.addAction(() => {
            const trig: Unit = Unit.fromEvent();

            trig.disableAbility(attackAbilityId, false, true);
            const unitTypeId: number = trig.typeId;
            const towerType: TowerType | undefined = towerTypeMap.get(unitTypeId);
            if (towerType === undefined) {
                throw new Error(`Invalid argument; no TowerType of unitTypeId ${unitTypeId} exists!`);
            }

            const trigHandleId: number = trig.id;
            const tower: Tower = new Tower(trig, towerType);
            tower.towerType.applyInitialUnitValues(trig);
            
            // TODO: Remove towers from this map when the tower is sold
            this.towers.set(trigHandleId, tower);
            this.addTickTower(tower);
        });
        constTrig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_START);
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

            this.towers.delete(originalHandleId);
            this.towers.set(unit.id, tower);

            tower.towerType.applyInitialUnitValues(unit);
            for (let i = 0; i < pathUpgrades.length; i++) {
                for (let j = 0; j < pathUpgrades[i]; j++) {
                    tower.towerType.upgrades[i][j].applyUpgrade(tower);
                }
            }

            SelectUnitForPlayerSingle(unit.handle, GetTriggerPlayer());
        } else {
            upgrade.applyUpgrade(tower);
        }

        if (this.tickTowers.has(originalHandleId)) {
            this.timerUtils.releaseTimer(this.tickTowers.get(originalHandleId) as Timer);
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
            const t: Timer = this.timerUtils.newTimer();
            const tickFunction = this.getTowerTickFunction(tower.towerType.unitTypeId);
            t.start(BlzGetAbilityRealLevelField(tower.unit.getAbility(tickTowerAbilityId), ABILITY_RLF_COOLDOWN, 0), true, () => tickFunction(tower));

            this.tickTowers.set(tower.unit.id, t);
        }
    }

    private getTowerTickFunction(unitTypeId: number): (tower: Tower) => void {
        switch(unitTypeId) {
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
                    const { range, maxUnitCount, damageAmount, freezeDuration, hasPermafrost, hasColdSnap, hasReFreeze, hasIceShards, hasDeepFreeze } = tower.customData as ObsidianStatueCustomData;
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

                        if (this.stunUtils.getFrozenUnit(u.id) !== undefined && !hasReFreeze)
                            return;

                        const unitTypeId: number = u.typeId;
                        if (!hasColdSnap && (unitTypeId === fortifiedUnitTypeId || unitTypeId === invisibilityUnitTypeId))
                            return;

                        if (BlzGetUnitIntegerField(u.handle, UNIT_IF_DEFENSE_TYPE) === DefenseTypes.HEAVY)
                            return;
    
                        unitCount++;

                        tower.unit.damageTarget(u.handle, damageAmount, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                        // this.stunUtils.freezeUnit(u, freezeDuration, hasPermafrost, hasReFreeze, hasIceShards, hasDeepFreeze);
                        this.stunUtils.freezeUnit(u, 10, hasPermafrost, hasReFreeze, hasIceShards, hasDeepFreeze);
                    });
                    group.destroy();
                    loc.destroy();
                };
            case voidwalkerUnitTypeId:
                return (tower: Tower) => {
                    const { duration, spread, cooldown, additionalRange, voidwalkerUnitTypeIds } = tower.customData as VoidwalkerCustomData;
                    const x: number = tower.unit.x + this.randomNumberGenerator.random(-spread, spread);
                    const y: number = tower.unit.y + this.randomNumberGenerator.random(-spread, spread);

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