import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { StunUtils } from "Utility/StunUtils";
import { Group } from "Utility/Group";
import { Point } from "w3ts";
import { GameMap } from "Game/GameMap";
import type { Unit } from "w3ts";
import type { DamageEvent } from "../DamageEvent";
import type { FrozenUnit } from "Utility/FrozenUnit";

const obsidianStatueUnitTypeId: number = FourCC('h008');
export class VillagerLethalDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        const spawnedCreep = GameMap.SPAWNED_CREEP_MAP.get(globals.DamageEventTargetUnitId as number);
        const overflowingDamage = spawnedCreep.dealLethalDamage(Math.floor(Math.abs(globals.LethalDamageHP)));
        if (overflowingDamage !== -1) {
            globals.DamageEventAmount = overflowingDamage;
        }

        StunUtils.removeStun(globals.DamageEventTargetUnitId);
        const frozenUnit: FrozenUnit = StunUtils.getFrozenUnit(globals.DamageEventTargetUnitId);
        if (frozenUnit !== undefined) {
            if (globals.DamageEventSourceUnitTypeId !== obsidianStatueUnitTypeId) {
                if (!frozenUnit.hasDeepFreeze || globals.DamageEventAmount > 1) {
                    frozenUnit.setDuration(0);
                }
            }

            if (frozenUnit.hasIceShards) {
                const x = GetUnitX(globals.DamageEventTarget as unit);
                const y = GetUnitY(globals.DamageEventTarget as unit);

                let count = 0;
                const loc = new Point(x, y);
                const group: Group = Group.fromRange(75, loc);
                group.for((u: Unit) => {
                    if (count > 2)
                        return;

                    count++;

                    UnitDamageTarget((globals.DamageEventTarget as unit), u.handle, 1, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                });
                group.destroy();
                loc.destroy();
            }
        }
    }
}
