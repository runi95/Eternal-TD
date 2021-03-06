import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { ATTACK_TYPE_SIEGE } from "../GameSettings";
import { Point } from "w3ts/handles/point";
import { Group } from "../../Group";
import { GameMap } from "../../../Game/GameMap";
import type { Unit } from "w3ts";
import type { DamageEvent } from "../DamageEvent";
import type { SapperCustomData } from "../../../Towers/Sapper/Sapper";

const sapperUnitTypeId: number = FourCC('h003');
const seaGiantUnitTypeId: number = FourCC('h004');
const wendigoUnitTypeId: number = FourCC('h005');
const skeletalOrcUnitTypeId: number = FourCC('h006');

// 120 splash
export class SapperDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        switch (globals.DamageEventSourceUnitTypeId) {
            case sapperUnitTypeId:
            case seaGiantUnitTypeId:
            case wendigoUnitTypeId:
            case skeletalOrcUnitTypeId:
                break;
            default:
                return;
        }

        if (globals.DamageEventAttackT !== ATTACK_TYPE_SIEGE) {
            return;
        }

        const trig: unit = globals.DamageEventSource as unit;
        const targ: unit = globals.DamageEventTarget as unit;

        const tower = GameMap.BUILT_TOWER_MAP.get(GetHandleId(trig));
        if (tower === undefined) {
            return;
        }

        const { areaOfEffect, maxUnitCount, aoeDamage } = tower.customData as SapperCustomData;

        const loc: Point = new Point(GetUnitX(targ), GetUnitY(targ));
        const grp: Group = Group.fromRange(areaOfEffect, loc);

        let unitCount = 0;
        grp.for((u: Unit) => {
            if (unitCount >= maxUnitCount) {
                return;
            }

            if (u.owner.id !== 23) {
                return;
            }

            if (u.handle === targ) {
                return;
            }

            UnitDamageTarget(trig, u.handle, aoeDamage, true, true, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
        });
        grp.destroy();
        loc.destroy();
    }
}
