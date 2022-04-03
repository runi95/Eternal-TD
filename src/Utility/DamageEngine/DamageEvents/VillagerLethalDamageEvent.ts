import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { RoundCreepController } from "../../../Game/RoundCreepController";
import { SpawnedCreep } from "../../../Creeps/SpawnedCreep";

export class VillagerLethalDamageEvent implements DamageEvent {
    private readonly roundCreepController: RoundCreepController;
    
    constructor(roundCreepController: RoundCreepController) {
        this.roundCreepController = roundCreepController;
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

        let i = 0;
        if (spawnedCreeps.length > 0 && spawnedCreep.creep.unitTypeId === spawnedCreeps[0].unitTypeId) {
            i++;
            globals.DamageEventAmount = overflowingDamage;
            spawnedCreep.creep = spawnedCreeps[0];
            spawnedCreeps[0].apply(globals.DamageEventTarget as unit);
        }
        for (; i < spawnedCreeps.length; i++) {
            const newCreep: unit = CreateUnit(Player(23), spawnedCreeps[i].unitTypeId, x, y, face);
            const newSpawnedCreep = new SpawnedCreep(spawnedCreeps[i], spawnedCreep.currentCheckpoint, spawnedCreep.currentCheckpointIndex);
            this.roundCreepController.set(GetHandleId(newCreep), newSpawnedCreep);
            spawnedCreeps[i].apply(newCreep);
            IssuePointOrder(newCreep, 'move', newSpawnedCreep.currentCheckpoint.x,newSpawnedCreep.currentCheckpoint.y);
        }
    }
}
