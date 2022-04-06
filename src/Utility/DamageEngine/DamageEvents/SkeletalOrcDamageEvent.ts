import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { StunUtils } from "../../StunUtils";
import { RoundCreepController } from "../../../Game/RoundCreepController";
import { SpawnedCreep } from "../../../Creeps/SpawnedCreep";
import { CreepType } from "../../../Creeps/CreepType";

const skeletalOrcUnitTypeId: number = FourCC('h006');
export class SkeletalOrcDamageEvent implements DamageEvent {
    private readonly stunUtils: StunUtils;
    private readonly roundCreepController: RoundCreepController;
    
    constructor(stunUtils: StunUtils, roundCreepController: RoundCreepController) {
        this.stunUtils = stunUtils;
        this.roundCreepController = roundCreepController;
    }

    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        if (globals.DamageEventSourceUnitTypeId !== skeletalOrcUnitTypeId) {
            return;
        }

        if (globals.DamageEventAmount < 1) {
            return;
        }

        const spawnedCreep: SpawnedCreep = this.roundCreepController.get(globals.DamageEventTargetUnitId as number) as SpawnedCreep;
        switch (spawnedCreep.creep.creepType) {
            case CreepType.ZEPPELIN:
                // Skeletal Orc should not stun Zeppelins.
            return;
        }

        this.stunUtils.stunUnit(globals.DamageEventTarget as unit, 1);
    }
}
