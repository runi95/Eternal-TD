import { StunnedUnit } from './StunnedUnit';
import { TimerUtils } from './TimerUtils';
import { Timer } from '../JassOverrides/Timer';
import { FrozenUnit } from './FrozenUnit';

const dummyUnitTypeId: number = FourCC('u007');
const timedLifeBuffId: number = FourCC('BTLF');
const permafrostAbilityId: number = FourCC('A00A');
export class StunUtils {
    private readonly stunAbilityId: number = FourCC('A003');
    private readonly freezeAbilityId: number = FourCC('A009');
    private readonly stunnedUnits: Map<number, StunnedUnit>;
    private readonly frozenUnits: Map<number, FrozenUnit>;
    private readonly timerUtils: TimerUtils;

    constructor(timerUtils: TimerUtils) {
        this.timerUtils = timerUtils;
        this.stunnedUnits = new Map<number, StunnedUnit>();
        this.frozenUnits = new Map<number, FrozenUnit>();
    }

    /**
     * Stun a unit for a certain amount of time
     *
     * @param u - The unit to stun
     * @param duration - The duration (in seconds) to stun the unit for
     */
    public stunUnit(u: unit, duration: number): void {
        const handleId: number = GetHandleIdBJ(u);
        if (this.frozenUnits.has(handleId)) {
            return;
        } else if (this.stunnedUnits.has(handleId)) {
            (this.stunnedUnits.get(handleId) as StunnedUnit).addDuration(duration);
        } else {
            const stunnedUnit: StunnedUnit = new StunnedUnit(u, duration);
            this.stunnedUnits.set(handleId, stunnedUnit);
            UnitAddAbility(stunnedUnit.getUnit(), this.stunAbilityId);
            BlzPauseUnitEx(stunnedUnit.getUnit(), true);
            const t: Timer = this.timerUtils.newTimer();
            t.start(0.05, true, () => {
                stunnedUnit.addDuration(-0.05);
                if (stunnedUnit.getDuration() <= 0) {
                    UnitRemoveAbility(stunnedUnit.getUnit(), this.stunAbilityId);
                    if (!this.frozenUnits.has(handleId)) {
                        BlzPauseUnitEx(stunnedUnit.getUnit(), false);
                    }
                    
                    this.stunnedUnits.delete(handleId);
                    this.timerUtils.releaseTimer(t);
                }
            });
        }
    }

    /**
     * Freeze a unit for a certain amount of time.
     * Any frozen unit overrides stun.
     *
     * @param u - The unit to freeze
     * @param duration - The duration (in seconds) to freeze the unit for
     */
     public freezeUnit(u: unit, duration: number, permafrost: boolean, refreeze: boolean): void {
        const handleId: number = GetHandleIdBJ(u);
        if (this.frozenUnits.has(handleId)) {
            if (refreeze) {
                const frozenUnit: FrozenUnit = new FrozenUnit(u, duration, permafrost);
                if (frozenUnit.getDuration() < duration) {
                    frozenUnit.setDuration(duration);
                }
            }

            return;
        }

        if (this.stunnedUnits.has(handleId)) {
            this.stunnedUnits.get(handleId)?.setDuration(0);
        }

        const frozenUnit: FrozenUnit = new FrozenUnit(u, duration, permafrost);
        this.frozenUnits.set(handleId, frozenUnit);
        UnitAddAbility(frozenUnit.getUnit(), this.freezeAbilityId);
        BlzPauseUnitEx(frozenUnit.getUnit(), true);
        const t: Timer = this.timerUtils.newTimer();
        t.start(0.05, true, () => {
            frozenUnit.addDuration(-0.05);
            if (frozenUnit.getDuration() <= 0) {
                if (frozenUnit.permafrost) {
                    const dummy: unit = CreateUnit(Player(0), dummyUnitTypeId, GetUnitX(frozenUnit.getUnit()), GetUnitY(frozenUnit.getUnit()), bj_UNIT_FACING);
                    UnitAddAbilityBJ(permafrostAbilityId, dummy);
                    UnitApplyTimedLifeBJ(1, timedLifeBuffId, dummy);
                    IssueTargetOrder(dummy, 'slow', frozenUnit.getUnit());
                }
                UnitRemoveAbility(frozenUnit.getUnit(), this.freezeAbilityId);
                BlzPauseUnitEx(frozenUnit.getUnit(), false);
                this.frozenUnits.delete(handleId);
                this.timerUtils.releaseTimer(t);
            }
        });
    }

    public clearAllStuns(): void {
        this.stunnedUnits.forEach((stunnedUnit: StunnedUnit) => stunnedUnit.setDuration(0));
    }
}
