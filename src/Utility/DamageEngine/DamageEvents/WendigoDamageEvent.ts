import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { RoundCreepController } from "../../../Game/RoundCreepController";
import { SpawnedCreep } from "../../../Creeps/SpawnedCreep";
import { CreepType } from "../../../Creeps/CreepType";

const wendigoUnitTypeId: number = FourCC('h005');
export class WendigoDamageEvent implements DamageEvent {
    private readonly roundCreepController: RoundCreepController;
    
    constructor(roundCreepController: RoundCreepController) {
        this.roundCreepController = roundCreepController;
    }

    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        if (globals.DamageEventSourceUnitTypeId !== wendigoUnitTypeId) {
            return;
        }

        const spawnedCreep: SpawnedCreep = this.roundCreepController.get(globals.DamageEventTargetUnitId as number) as SpawnedCreep;
        switch (spawnedCreep.creep.creepType) {
            case CreepType.LARGE:
                globals.DamageEventAmount += 2;
            break;
            case CreepType.ZEPPELIN:
                globals.DamageEventAmount += 19;
            break;
        }
    }
}
