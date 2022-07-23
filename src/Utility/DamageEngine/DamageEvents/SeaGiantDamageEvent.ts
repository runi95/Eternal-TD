import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { TimerUtils } from "../../TimerUtils";
import { ATTACK_TYPE_SIEGE } from "../GameSettings";
import { Effect } from "w3ts";
import { Point } from "w3ts/handles/point";
import { Group } from "../../Group";
import { GameMap } from "../../../Game/GameMap";
import type { Timer, Unit } from "w3ts";
import type { DamageEvent } from "../DamageEvent";
import type { SapperCustomData } from "../../../Towers/Sapper/Sapper";

const seaGiantUnitTypeId: number = FourCC('h004');
const clusterBombsAbilityId: number = FourCC('A005');
export class SeaGiantDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        if (globals.DamageEventSourceUnitTypeId !== seaGiantUnitTypeId) {
            return;
        }

        if (globals.DamageEventAttackT !== ATTACK_TYPE_SIEGE) {
            return;
        }

        const trig: unit = globals.DamageEventSource as unit;
        const tower = GameMap.BUILT_TOWER_MAP.get(GetHandleId(trig));
        if (tower === undefined) {
            return;
        }

        const clusterBombsLevel: number = GetUnitAbilityLevel(trig, clusterBombsAbilityId);
        const x: number = GetUnitX(globals.DamageEventTarget as unit);
        const y: number = GetUnitY(globals.DamageEventTarget as unit);
        const userData: number = (GetUnitUserData(globals.DamageEventSource as unit) + 1) % 2;
        SetUnitUserData(globals.DamageEventSource as unit, userData);

        const { aoeDamage } = (tower.customData as SapperCustomData)

        let ticks = 21;
        const t: Timer = TimerUtils.newTimer();
        t.start(0.1, true, () => {
            ticks--;

            if (ticks > 12) {
                const loc: Point = new Point(x + 150 * CosBJ(45 * ticks), y + 150 * SinBJ(45 * ticks));
                const effect = new Effect('Objects/Spawnmodels/Human/FragmentationShards/FragBoomSpawn.mdl', loc.x, loc.y)
                effect.destroy()
                const grp: Group = Group.fromRange(150, loc);
                grp.for((u: Unit) => {
                    if (u.owner.id !== 23) {
                        return;
                    }
                    u.damageTarget(u.handle, aoeDamage, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                });
                grp.destroy();
                loc.destroy();
            } else if (clusterBombsLevel === 1 || (clusterBombsLevel === 2 && userData < 1)) {
                TimerUtils.releaseTimer(t);
            } else if (ticks > 7) {
                // Wait...
            } else {
                const loc: Point = new Point(x + 200 * CosBJ(45 * ticks), y + 200 * SinBJ(45 * ticks));
                const effect = new Effect('Abilities/Weapons/CannonTowerMissile/CannonTowerMissile.mdl', loc.x, loc.y)
                effect.destroy()
                const grp: Group = Group.fromRange(340, loc);
                grp.for((u: Unit) => {
                    if (u.owner.id !== 23) {
                        return;
                    }
                    u.damageTarget(u.handle, aoeDamage, true, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                });
                grp.destroy();
                loc.destroy();
            }

            if (ticks <= 0) {
                TimerUtils.releaseTimer(t);
            }
        });
    }
}
