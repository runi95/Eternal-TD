import { MeatWagoCustomData } from "../../../Towers/MeatWagon/MeatWagon";
import { euclideanDistance } from "../../Checkpoint";
import { StunUtils } from "../../StunUtils";
import { DamageEvent } from "../DamageEvent";
import type { ExtendedDamageInstance } from "../DamageEventController";

const meatWagonUnitTypeId: number = FourCC('h00A');
export class MeatWagonShockwaveDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.tower === undefined) return;
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.sourceUnitTypeId !== meatWagonUnitTypeId) return;

        const { hasShockwave, attackTargetPositionX, attackTargetPositionY, stunAOERadius } = (damageInstance.tower.customData as MeatWagoCustomData);
        if (!hasShockwave) return;
        const x = GetUnitX(damageInstance.target);
        const y = GetUnitY(damageInstance.target);
        const dist = euclideanDistance({ x: attackTargetPositionX, y: attackTargetPositionY }, { x, y });
        if (dist > stunAOERadius) {
            damageInstance.damage += 1;
        } else {
            StunUtils.stunUnit(damageInstance.target, 0.5);
        }
    }
}
