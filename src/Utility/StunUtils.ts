import { StunnedUnit } from './StunnedUnit';
import { TimerUtils } from './TimerUtils';
import { Timer } from '../JassOverrides/Timer';

export class StunUtils {
    private readonly stunAbilityId: number = FourCC('A003');
    private readonly freezeAbilityId: number = FourCC('A009');
    private readonly stunnedUnits: Map<number, StunnedUnit>;
    private readonly frozenUnits: Map<number, StunnedUnit>;
    private readonly timerUtils: TimerUtils;

    constructor(timerUtils: TimerUtils) {
        this.timerUtils = timerUtils;
        this.stunnedUnits = new Map<number, StunnedUnit>();
        this.frozenUnits = new Map<number, StunnedUnit>();
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
     public freezeUnit(u: unit, duration: number): void {
        const handleId: number = GetHandleIdBJ(u);
        if (this.frozenUnits.has(handleId))
            return;

        if (this.stunnedUnits.has(handleId)) {
            this.stunnedUnits.get(handleId)?.setDuration(0);
        }

        const stunnedUnit: StunnedUnit = new StunnedUnit(u, duration);
        this.frozenUnits.set(handleId, stunnedUnit);
        UnitAddAbility(stunnedUnit.getUnit(), this.freezeAbilityId);
        BlzPauseUnitEx(stunnedUnit.getUnit(), true);
        const t: Timer = this.timerUtils.newTimer();
        t.start(0.05, true, () => {
            stunnedUnit.addDuration(-0.05);
            if (stunnedUnit.getDuration() <= 0) {
                UnitRemoveAbility(stunnedUnit.getUnit(), this.freezeAbilityId);
                BlzPauseUnitEx(stunnedUnit.getUnit(), false);
                this.frozenUnits.delete(handleId);
                this.timerUtils.releaseTimer(t);
            }
        });
    }

    public clearAllStuns(): void {
        this.stunnedUnits.forEach((stunnedUnit: StunnedUnit) => stunnedUnit.setDuration(0));
    }
}
