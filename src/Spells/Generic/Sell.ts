import {MapPlayer, Trigger, Unit} from "w3ts";
import {OrderId} from "w3ts/globals/order";

export class Sell {
    private readonly trig: Trigger = new Trigger();

    constructor() {
        this.trig.addCondition(() => this.condition());
        this.trig.addAction(() => this.action());
        this.trig.registerAnyUnitEvent(EVENT_PLAYER_UNIT_ISSUED_ORDER);
    }

    protected condition(): boolean {
        return GetIssuedOrderIdBJ() === OrderId.Defend;
    }

    private action(): void {
        const trig: Unit = Unit.fromEvent();
        const owningPlayer: MapPlayer = trig.owner;
        const cost: number = GetUnitGoldCost(trig.typeId); // Todo: submit pr to w3ts
        owningPlayer.setState(PLAYER_STATE_RESOURCE_GOLD, Math.ceil(owningPlayer.getState(PLAYER_STATE_RESOURCE_GOLD) + 0.75 * cost))
        trig.destroy();
    }
}
