import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { GameMap } from "../../../Game/GameMap";
import { DamageReductionModifier } from "../../../Creeps/Modifiers/DamageReductionModifier";

export class DamageReductionDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const tower = GameMap.BUILT_TOWER_MAP.get(globals.DamageEventSourceUnitId);
        if (!tower)
            return;

        const creep = GameMap.SPAWNED_CREEP_MAP.get(globals.DamageEventTargetUnitId);
        if (!creep)
            return;

        if (!creep.hasModifier(DamageReductionModifier.DAMAGE_REDUCTION_MODIFIER))
            return;

        globals.DamageEventAmount -= 1;
    }
}
