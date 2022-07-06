import { Trigger } from "w3ts";

export abstract class Spell {
    protected readonly abstract abilityId: number;
    private readonly trig: Trigger = new Trigger();

    constructor() {
        this.trig.addCondition(() => this.condition());
        this.trig.addAction(() => this.action());
        this.trig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT);
    }

    protected condition(): boolean {
        return GetSpellAbilityId() === this.abilityId;
    }

    // eslint-disable-next-line
    protected action(): void { }
}
