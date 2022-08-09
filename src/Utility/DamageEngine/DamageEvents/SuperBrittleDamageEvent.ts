import { DamageEvent } from "../DamageEvent";
import { ExtendedDamageInstance } from "../DamageEventController";

const superBrittleBuffId: number = FourCC('B003');
export class SuperBrittleDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (UnitHasBuffBJ(damageInstance.target, superBrittleBuffId)) {
            damageInstance.attackType = ATTACK_TYPE_CHAOS;
            damageInstance.damage += 4;
        }
    }
}
