import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { GameMap } from "../../../Game/GameMap";
import { DamageReductionModifier } from "../../../Creeps/Modifiers/DamageReductionModifier";
import type { GargoyleCustomData } from "../../../Towers/Gargoyle/Gargoyle";

const gargoyleUnitTypeId: number = FourCC('h009');
export class DamageReductionDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const tower = GameMap.BUILT_TOWER_MAP.get(globals.DamageEventSourceUnitId);
        if (!tower)
            return;

        if (globals.DamageEventSourceUnitTypeId === gargoyleUnitTypeId) {
            const { hasObsidianForm } = (tower.customData as GargoyleCustomData);
            if (hasObsidianForm) return;
        }

        const creep = GameMap.SPAWNED_CREEP_MAP.get(globals.DamageEventTargetUnitId);
        if (!creep)
            return;

        if (!creep.hasModifier(DamageReductionModifier.DAMAGE_REDUCTION_MODIFIER))
            return;

        globals.DamageEventAmount -= 1;
    }
}
