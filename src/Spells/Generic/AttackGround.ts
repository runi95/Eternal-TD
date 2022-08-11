import { Spell } from '../Spell';
import { Unit } from "w3ts";
import { OrderId } from "w3ts/globals/order";
import { GameMap } from '../../Game/GameMap';
import { MeatWagoCustomData } from '../../Towers/MeatWagon/MeatWagon';

const attackAbilityId: number = FourCC('Aatk');
export class AttackGround extends Spell {
    protected readonly abilityId: number = FourCC('A00B');

    public action(): void {
        const trig: Unit = Unit.fromEvent();
        const x: number = GetSpellTargetX();
        const y: number = GetSpellTargetY();
        const tower = GameMap.BUILT_TOWER_MAP.get(trig.id);
        if (tower === undefined) return;

        (tower.customData as MeatWagoCustomData).attackTargetPositionX = x;
        (tower.customData as MeatWagoCustomData).attackTargetPositionY = y;

        // Not allowed to attack ground if attack is hidden
        trig.disableAbility(attackAbilityId, false, false);

        // Issue order to attack ground
        trig.issueOrderAt(OrderId.Attackground, x, y);

        // Hide attack again
        trig.disableAbility(attackAbilityId, false, true);
    }
}
