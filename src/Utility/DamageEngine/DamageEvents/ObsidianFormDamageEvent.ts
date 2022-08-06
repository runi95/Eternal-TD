import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { GameMap } from "../../../Game/GameMap";
import { CreepRegenSystem } from "../../../Creeps/CreepRegenSystem";
import { RegenModifier } from "../../../Creeps/Modifiers/RegenModifier";
import type { DamageEvent } from "../DamageEvent";
import type { GargoyleCustomData } from "../../../Towers/Gargoyle/Gargoyle";

const gargoyleUnitTypeId: number = FourCC('h009');
export class ObsidianFormDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) return;

        if (globals.DamageEventSourceUnitTypeId !== gargoyleUnitTypeId) return;

        const trig: unit = globals.DamageEventSource as unit;
        const targ: unit = globals.DamageEventTarget as unit;
        const tower = GameMap.BUILT_TOWER_MAP.get(GetHandleId(trig));
        if (tower === undefined) return;

        const { hasObsidianForm } = (tower.customData as GargoyleCustomData);
        if (!hasObsidianForm) return;

        const targUnitId = GetHandleId(targ);
        const creep = GameMap.SPAWNED_CREEP_MAP.get(targUnitId);

        if (!creep) return;
        if (!CreepRegenSystem.REGEN_UNIT_MAP.has(targUnitId)) return;
        creep.removeModifier(RegenModifier.REGEN_MODIFIER);
        CreepRegenSystem.REGEN_UNIT_MAP.delete(targUnitId);
    }
}
