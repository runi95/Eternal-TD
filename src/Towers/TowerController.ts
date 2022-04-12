import { GroupInRange } from "../JassOverrides/GroupInRange";
import { Timer } from "../JassOverrides/Timer";
import { Trigger } from "../JassOverrides/Trigger";
import { StunUtils } from "../Utility/StunUtils";
import { TimerUtils } from "../Utility/TimerUtils";
import { AbominationCustomData } from "./Abomination/Abomination";
import { ObsidianStatueCustomData } from "./ObsidianStatue/ObsidianStatue";
import { Tower } from "./Tower";
import { TowerType } from "./TowerType";
import towerTypeMap from "./TowerTypes";
import { TowerUpgrade } from "./TowerUpgrade";

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
            const trig: unit = GetTriggerUnit();

            BlzUnitDisableAbility(trig, attackAbilityId, false, true);
            const unitTypeId: number = GetUnitTypeId(trig);
            const towerType: TowerType | undefined = towerTypeMap.get(unitTypeId);
            if (towerType === undefined) {
                throw new Error(`Invalid argument; no TowerType of unitTypeId ${unitTypeId} exists!`);
            }

            const trigHandleId: number = GetHandleId(trig);
            const tower: Tower = new Tower(trig, towerType);
            tower.towerType.applyInitialUnitValues(trig);
            
            // TODO: Remove towers from this map when the tower is sold
            this.towers.set(trigHandleId, tower);
            this.addTickTower(tower);
        });
        constTrig.registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START);
    }

    public upgradeTower(tower: Tower, upgrade: TowerUpgrade): boolean {
        let isTowerUnitReplaced = false;
        const originalHandleId: number = GetHandleId(tower.unit);
        if (upgrade.newUnitTypeId !== undefined) {
            isTowerUnitReplaced = true;
            const pathUpgrades = tower.pathUpgrades;
            const unit = ReplaceUnitBJ(tower.unit, upgrade.newUnitTypeId, bj_UNIT_STATE_METHOD_DEFAULTS);
            BlzUnitDisableAbility(unit, attackAbilityId, false, true);
            tower.unit = unit;

            this.towers.delete(originalHandleId);
            this.towers.set(GetHandleId(unit), tower);

            tower.towerType.applyInitialUnitValues(unit);
            for (let i = 0; i < pathUpgrades.length; i++) {
                for (let j = 0; j < pathUpgrades[i]; j++) {
                    tower.towerType.upgrades[i][j].applyUpgrade(tower);
                }
            }

            SelectUnitForPlayerSingle(unit, GetTriggerPlayer());
        }

        upgrade.applyUpgrade(tower);

        if (this.tickTowers.has(originalHandleId)) {
            this.timerUtils.releaseTimer(this.tickTowers.get(originalHandleId) as Timer);
            this.tickTowers.delete(originalHandleId);
        }

        if (GetUnitAbilityLevel(tower.unit, tickTowerAbilityId) > 0) {
            this.addTickTower(tower);
        }

        return isTowerUnitReplaced;
    }

    private addTickTower(tower: Tower): void {
        if (GetUnitAbilityLevel(tower.unit, tickTowerAbilityId) > 0) {
            // TODO: Remove towers from this map when the tower is sold
            const t: Timer = this.timerUtils.newTimer();
            const tickFunction = this.getTowerTickFunction(tower.towerType.unitTypeId);
            t.start(BlzGetAbilityRealLevelField(BlzGetUnitAbility(tower.unit, tickTowerAbilityId), ABILITY_RLF_COOLDOWN, 0), true, () => tickFunction(tower));

            this.tickTowers.set(GetHandleId(tower.unit), t);
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

                    const loc = GetUnitLoc(tower.unit);
                    const group = new GroupInRange(range, loc);

                    let unitCount = 0;
                    group.for((u: unit) => {
                        if (unitCount >= realMaxUnitCount)
                            return;

                        if (!UnitAlive(u))
                            return;

                        if (GetPlayerId(GetOwningPlayer(u)) !== 23)
                            return;

                        unitCount++;
                        UnitDamageTargetBJ(tower.unit, u, realDamageAmount, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL);
                    });
                    group.destroy();
                    RemoveLocation(loc);
                };
            case obsidianStatueUnitTypeId:
                return (tower: Tower) => {
                    const { range, maxUnitCount, damageAmount, freezeDuration, hasPermafrost, hasColdSnap, hasReFreeze } = tower.customData as ObsidianStatueCustomData;
                    const loc = GetUnitLoc(tower.unit);
                    const group = new GroupInRange(range, loc);

                    let unitCount = 0;
                    group.for((u: unit) => {
                        if (unitCount >= maxUnitCount)
                            return;

                        if (!UnitAlive(u))
                            return;

                        if (GetPlayerId(GetOwningPlayer(u)) !== 23)
                            return;

                        const unitTypeId: number = GetUnitTypeId(u);
                        if (!hasColdSnap && (unitTypeId === fortifiedUnitTypeId || unitTypeId === invisibilityUnitTypeId))
                                return;

                        unitCount++;
                        UnitDamageTargetBJ(tower.unit, u, damageAmount, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL);
                        this.stunUtils.freezeUnit(u, freezeDuration, hasPermafrost, hasReFreeze);
                    });
                    group.destroy();
                    RemoveLocation(loc);
                };
            default:
                throw new Error(`Invalid argument; no TickFunction exists for Tower of type ${unitTypeId}`);
        }
    }
}