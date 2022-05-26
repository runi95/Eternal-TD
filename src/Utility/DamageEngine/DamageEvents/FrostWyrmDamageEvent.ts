import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { ATTACK_TYPE_NORMAL, ATTACK_TYPE_SIEGE } from "../GameSettings";
import {Unit} from "w3ts";
import {Point} from "w3ts/handles/point";
import {Group} from "../../Group";
import { Tower } from "Towers/Tower";
import { StunUtils } from "Utility/StunUtils";
import { ObsidianStatueCustomData } from "Towers/ObsidianStatue/ObsidianStatue";
import { DefenseTypes } from "Creeps/DefenseTypes";

const frostWyrmUnitTypeId: number = FourCC('h00G');
const fortifiedUnitTypeId: number = FourCC('u004');
const invisibilityUnitTypeId: number = FourCC('u003');
export class FrostWyrmDamageEvent implements DamageEvent {
    private readonly towers: Map<number, Tower>;
    private readonly stunUtils: StunUtils

    constructor(towers: Map<number, Tower>, stunUtils: StunUtils) {
        this.towers = towers;
        this.stunUtils = stunUtils;
    }

    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        if (globals.DamageEventSourceUnitTypeId !== frostWyrmUnitTypeId) {
            return;
        }

        if (globals.DamageEventAttackT !== ATTACK_TYPE_NORMAL) {
            return;
        }

        const trig: unit = globals.DamageEventSource as unit;
        const targ: unit = globals.DamageEventTarget as unit;

        const tower = this.towers.get(GetHandleId(trig));
        if (tower === undefined) {
            return;
        }

        const {
            range,
            maxUnitCount,
            damageAmount,
            freezeDuration,
            hasPermafrost,
            hasReFreeze,
            hasIceShards,
            hasDeepFreeze,
            hasColdSnap,
        } = tower.customData as ObsidianStatueCustomData;

        const loc: Point = new Point(GetUnitX(targ), GetUnitY(targ));
        const grp: Group = Group.fromRange(range, loc);

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

            if (!u.isAlive())
                return;

            const unitTypeId: number = u.typeId;
            if (!hasColdSnap && (unitTypeId === fortifiedUnitTypeId || unitTypeId === invisibilityUnitTypeId))
                return;

            if (BlzGetUnitIntegerField(u.handle, UNIT_IF_DEFENSE_TYPE) === DefenseTypes.HEAVY)
                return;

            unitCount++;

            tower.unit.damageTarget(u.handle, damageAmount, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
            this.stunUtils.freezeUnit(u, freezeDuration, hasPermafrost, hasReFreeze, hasIceShards, hasDeepFreeze);
        });
        grp.destroy();
        loc.destroy();
    }
}
