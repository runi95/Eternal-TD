import { Trigger } from "w3ts";

export class Debug {
    private readonly cast_trig: Trigger = new Trigger();
    private readonly channel_trig: Trigger = new Trigger();
    private readonly effect_trig: Trigger = new Trigger();
    private readonly endcast_trig: Trigger = new Trigger();
    private readonly finish_trig: Trigger = new Trigger();

    constructor() {
        this.cast_trig.addAction(() => this.castAction());
        this.cast_trig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_CAST);

        this.channel_trig.addAction(() => this.channelAction());
        this.channel_trig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_CHANNEL);

        this.effect_trig.addAction(() => this.effectAction());
        this.effect_trig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT);

        this.endcast_trig.addAction(() => this.endcastAction());
        this.endcast_trig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_ENDCAST);

        this.finish_trig.addAction(() => this.finishAction());
        this.finish_trig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SPELL_FINISH);
    }

    private castAction(): void {
        DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, `Cast!`);
    }

    private channelAction(): void {
        DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, `Channel!`);
    }

    private effectAction(): void {
        DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, `Effect!`);
    }

    private endcastAction(): void {
        DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, `Endcast!`);
    }

    private finishAction(): void {
        DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 3, `Finish!`);
    }
}
