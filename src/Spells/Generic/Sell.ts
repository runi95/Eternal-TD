import { TowerAbilitySystem } from "TowerAbilities/TowerAbilitySystem";
import { Tower } from "Towers/Tower";
import {MapPlayer, Trigger, Unit} from "w3ts";
import {OrderId} from "w3ts/globals/order";

export class Sell {
    private readonly towerAbilitySystem: TowerAbilitySystem;
    private readonly towers: Map<number, Tower>;
    private readonly trig: Trigger = new Trigger();

    constructor(towerAbilitySystem: TowerAbilitySystem, towers: Map<number, Tower>) {
        this.towerAbilitySystem = towerAbilitySystem;
        this.towers = towers;
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
        owningPlayer.setState(PLAYER_STATE_RESOURCE_GOLD, Math.ceil(owningPlayer.getState(PLAYER_STATE_RESOURCE_GOLD) + 0.75 * cost));
        this.towerAbilitySystem.removeTowerAbility(owningPlayer.id, this.towers.get(trig.id));
        this.towerAbilitySystem.render();
        trig.destroy();
    }
}
