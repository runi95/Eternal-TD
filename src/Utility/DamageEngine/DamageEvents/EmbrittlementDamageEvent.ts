import { DamageEvent } from "../DamageEvent";
import type { ExtendedDamageInstance } from "../DamageEventController";

const embrittlementBuffId: number = FourCC('B002');
export class EmbrittlementDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        const playerId: number = damageInstance.targetOwningPlayerId;
        if (playerId !== 23) {
            return;
        }

        if (UnitHasBuffBJ(damageInstance.target, embrittlementBuffId)) {
            damageInstance.attackType = ATTACK_TYPE_CHAOS;
            damageInstance.damage += 1;
        }
    }
}
