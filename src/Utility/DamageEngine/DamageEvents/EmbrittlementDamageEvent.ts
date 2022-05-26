import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { ATTACK_TYPE_CHAOS } from "../GameSettings";

const embrittlementBuffId: number = FourCC('B002');
export class EmbrittlementDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        if (UnitHasBuffBJ(globals.DamageEventTarget as unit, embrittlementBuffId)) {
            globals.DamageEventAttackT = ATTACK_TYPE_CHAOS;
            globals.DamageEventAmount += 1;
        }
    }
}
