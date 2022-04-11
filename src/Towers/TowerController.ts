import { StunUtils } from "../Utility/StunUtils";
import { TimerUtils } from "../Utility/TimerUtils";
import { AbominationCustomData } from "./Abomination/Abomination";
import { ObsidianStatueCustomData } from "./ObsidianStatue/ObsidianStatue";
import { Tower } from "./Tower";
import { TowerType } from "./TowerType";
import towerTypeMap from "./TowerTypes";
import { TowerUpgrade } from "./TowerUpgrade";
import {Timer, Trigger, Unit} from "w3ts";
import {GroupInRange} from "../Utility/GroupInRange";

const attackAbilityId: number = FourCC('Aatk');
const tickTowerAbilityId: number = FourCC('A008');
const fortifiedUnitTypeId: number = FourCC('u004');
const invisibilityUnitTypeId: number = FourCC('u003');
const abominationUnitTypeId: number = FourCC('h007');
const obsidianStatueUnitTypeId: number = FourCC('h008');

export class TowerController {
    private readonly towers: Map<number, Tower>;
    private readonly timerUtils: TimerUtils;
    private readonly stunUtils: StunUtils;
    private readonly tickTowers: Map<number, Timer> = new Map();

    constructor(timerUtils: TimerUtils, stunUtils: StunUtils, towers: Map<number, Tower>) {
        this.timerUtils = timerUtils;
        this.stunUtils = stunUtils;
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

            // TODO: What happens if an attack / missile is mid-air while unit replace happens?
            this.towers.delete(originalHandleId);
            this.towers.set(unit.id, tower);

            tower.towerType.applyInitialUnitValues(unit);
            for (let i = 0; i < pathUpgrades.length; i++) {
                for (let j = 0; j < pathUpgrades[i]; j++) {
                    tower.towerType.upgrades[i][j].applyUpgrade(tower);
                }
            }

            SelectUnitForPlayerSingle(unit.handle, GetTriggerPlayer());
        }

        upgrade.applyUpgrade(tower);

        if (this.tickTowers.has(originalHandleId)) {
            this.timerUtils.releaseTimer(this.tickTowers.get(originalHandleId) as Timer);
            this.tickTowers.delete(originalHandleId);
        }

        if (tower.unit.getAbilityLevel(tickTowerAbilityId) > 0) {
            this.addTickTower(tower);
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
                    const group = GroupInRange(range, loc);

                    let unitCount = 0;
                    group.for((u: Unit) => {
                        if (unitCount >= realMaxUnitCount)
                            return;

                        if (!u.isAlive())
                            return;

                        if (u.owner.id !== 23)
                            return;

                        unitCount++;
                        tower.unit.damageTarget(u.handle, realDamageAmount, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)

                    });
                    group.destroy();
                    loc.destroy();
                };
            case obsidianStatueUnitTypeId:
                return (tower: Tower) => {
                    const { range, maxUnitCount, damageAmount, freezeDuration, hasPermafrost, hasColdSnap, hasReFreeze } = tower.customData as ObsidianStatueCustomData;
                    const loc = tower.unit.point;
                    const group = GroupInRange(range, loc);

                    let unitCount = 0;
                    group.for((u: Unit) => {
                        if (unitCount >= maxUnitCount)
                            return;

                        if (!u.isAlive())
                            return;

                        if (u.owner.id !== 23)
                            return;

                        const unitTypeId: number = u.typeId;
                        if (!hasColdSnap && (unitTypeId === fortifiedUnitTypeId || unitTypeId === invisibilityUnitTypeId))
                                return;

                        unitCount++;
                        tower.unit.damageTarget(u.handle, damageAmount, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                        this.stunUtils.freezeUnit(u, freezeDuration, hasPermafrost, hasReFreeze);
                    });
                    group.destroy();
                    loc.destroy();
                };
            default:
                throw new Error(`Invalid argument; no TickFunction exists for Tower of type ${unitTypeId}`);
        }
    }
}