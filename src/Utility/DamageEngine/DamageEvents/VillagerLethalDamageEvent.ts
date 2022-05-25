import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { RoundCreepController } from "../../../Game/RoundCreepController";
import { SpawnedCreep } from "../../../Creeps/SpawnedCreep";
import { Modifier } from "Creeps/Modifier";
import { FrozenUnit } from "Utility/FrozenUnit";
import { StunUtils } from "Utility/StunUtils";
import { Group } from "Utility/Group";
import { Point, Unit } from "w3ts";

const obsidianStatueUnitTypeId: number = FourCC('h008');
export class VillagerLethalDamageEvent implements DamageEvent {
    private readonly roundCreepController: RoundCreepController;
    private readonly stunUtils: StunUtils;
    
    constructor(roundCreepController: RoundCreepController, stunUtils: StunUtils) {
        this.roundCreepController = roundCreepController;
        this.stunUtils = stunUtils;
    }

    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        const x: number = GetUnitX(globals.DamageEventTarget as unit);
        const y: number = GetUnitY(globals.DamageEventTarget as unit);
        const face: number = GetUnitFacing(globals.DamageEventTarget as unit);
        const spawnedCreep: SpawnedCreep = this.roundCreepController.get(globals.DamageEventTargetUnitId as number) as SpawnedCreep;
        const { spawnedCreeps, overflowingDamage } = spawnedCreep.creep.dealLethalDamage(Math.floor(Math.abs(globals.LethalDamageHP)));

        if (spawnedCreeps.length > 0) {
            for (let i = 0; spawnedCreep.modifiers !== undefined && i < spawnedCreep.modifiers.length; i++) {
                (spawnedCreep.modifiers as Modifier[])[i].transform(spawnedCreeps[0]);
            }
        }

        this.stunUtils.removeStun(globals.DamageEventTargetUnitId);
        const frozenUnit: FrozenUnit = this.stunUtils.getFrozenUnit(globals.DamageEventTargetUnitId);
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
                const group: Group = Group.fromRange(75, new Point(x, y));
                group.for((u: Unit) => {
                    if (count > 2)
                        return;

                    count++;

                    UnitDamageTarget((globals.DamageEventTarget as unit), u.handle, 1, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                });

                group.destroy();
            }
        }

        let i = 0;
        if (spawnedCreeps.length > 0 && spawnedCreep.creep.unitTypeId === spawnedCreeps[0].unitTypeId) {
            i++;
            globals.DamageEventAmount = overflowingDamage;
            spawnedCreep.creep = spawnedCreeps[0];
            spawnedCreeps[0].apply(globals.DamageEventTarget as unit);
            for (let i = 0; spawnedCreep.modifiers !== undefined && i < spawnedCreep.modifiers.length; i++) {
                (spawnedCreep.modifiers as Modifier[])[i].apply(globals.DamageEventTarget as unit);
            }
        }
        for (; i < spawnedCreeps.length; i++) {
            for (let i = 0; spawnedCreep.modifiers !== undefined && i < spawnedCreep.modifiers.length; i++) {
                (spawnedCreep.modifiers as Modifier[])[i].transform(spawnedCreeps[i]);
            }
            const newCreep: unit = CreateUnit(Player(23), spawnedCreeps[i].unitTypeId, x, y, face);
            if (frozenUnit?.hasDeepFreeze && i > 0) {
                this.stunUtils.freezeUnit(Unit.fromHandle(newCreep), frozenUnit.getDuration(), frozenUnit.permafrost, false, frozenUnit.hasIceShards, false);
            }

            const newSpawnedCreep = new SpawnedCreep(spawnedCreeps[i], spawnedCreep.modifiers, spawnedCreep.currentCheckpoint, spawnedCreep.currentCheckpointIndex);
            this.roundCreepController.set(GetHandleId(newCreep), newSpawnedCreep);
            spawnedCreeps[i].apply(newCreep);
            for (let i = 0; spawnedCreep.modifiers !== undefined && i < spawnedCreep.modifiers.length; i++) {
                (spawnedCreep.modifiers as Modifier[])[i].apply(newCreep);
            }
            IssuePointOrder(newCreep, 'move', newSpawnedCreep.currentCheckpoint.x,newSpawnedCreep.currentCheckpoint.y);
        }
    }
}
