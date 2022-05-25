import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { RoundCreepController } from "../../../Game/RoundCreepController";
import { SpawnedCreep } from "../../../Creeps/SpawnedCreep";
import { Modifier } from "Creeps/Modifier";
import { FrozenUnit } from "Utility/FrozenUnit";
import { StunUtils } from "Utility/StunUtils";

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
                frozenUnit.setDuration(0);
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
