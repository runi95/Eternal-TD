import { Trigger } from '../../JassOverrides/Trigger';

export class Sell {
    private readonly trig: Trigger = new Trigger();
    private readonly orderId: number = String2OrderIdBJ('defend');

    constructor() {
        this.trig.addCondition(() => this.condition());
        this.trig.addAction(() => this.action());
        this.trig.registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_ISSUED_ORDER);
    }

    protected condition(): boolean {
        return GetIssuedOrderIdBJ() === this.orderId;
    }

    private action(): void {
        const trig: unit = GetTriggerUnit();
        const owningPlayer: player = GetOwningPlayer(trig);
        const cost: number = GetUnitGoldCost(GetUnitTypeId(trig));

        SetPlayerState(owningPlayer, PLAYER_STATE_RESOURCE_GOLD, Math.ceil(GetPlayerState(owningPlayer, PLAYER_STATE_RESOURCE_GOLD) + 0.75 * cost));
        RemoveUnit(trig);
    }
}
