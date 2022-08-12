import { Timer } from "../../../../node_modules/w3ts/index";
import { MeatWagoCustomData } from "../../../Towers/MeatWagon/MeatWagon";
import { TimerUtils } from "../../TimerUtils";
import { DamageEvent } from "../DamageEvent";
import type { ExtendedDamageInstance } from "../DamageEventController";

const meatWagonUnitTypeId: number = FourCC('h00A');
export class MeatWagonBurnyStuffDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.tower === undefined) return;
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.sourceUnitTypeId !== meatWagonUnitTypeId) return;

        const { hasBurnyStuff, burnyStuffRate, burnyStuffDamage } = (damageInstance.tower.customData as MeatWagoCustomData);
        if (!hasBurnyStuff) return;

        let ticks = 3;
        const source = damageInstance.source;
        const target = damageInstance.target;
        const eff = AddSpecialEffectTarget('Abilities/Spells/Other/ImmolationRed/ImmolationRedDamage.mdl', target, "chest");
        const t: Timer = TimerUtils.newTimer();
        t.start(burnyStuffRate, true, () => {
            ticks--;

            UnitDamageTarget(source, target, burnyStuffDamage, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_FIRE, WEAPON_TYPE_WHOKNOWS);

            if (ticks <= 0) {
                DestroyEffect(eff);
                TimerUtils.releaseTimer(t);
            }
        });
    }
}
