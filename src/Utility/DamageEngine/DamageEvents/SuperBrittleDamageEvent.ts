import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { ATTACK_TYPE_CHAOS } from "../GameSettings";

const superBrittleBuffId: number = FourCC('B003');
export class SuperBrittleDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        if (UnitHasBuffBJ(globals.DamageEventTarget as unit, superBrittleBuffId)) {
            globals.DamageEventAttackT = ATTACK_TYPE_CHAOS;
            globals.DamageEventAmount += 4;
        }
    }
}
