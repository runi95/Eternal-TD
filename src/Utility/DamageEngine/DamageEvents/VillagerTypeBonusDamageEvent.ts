import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { RoundCreepController } from "Game/RoundCreepController";
import { SpawnedCreep } from "Creeps/SpawnedCreep";
import { CreepType } from "Creeps/CreepType";
import { Tower } from "Towers/Tower";

export class VillagerTypeBonusDamageEvent implements DamageEvent {
    private readonly roundCreepController: RoundCreepController;
    private readonly towers: Map<number, Tower>;
    
    constructor(roundCreepController: RoundCreepController, towers: Map<number, Tower>) {
        this.roundCreepController = roundCreepController;
        this.towers = towers;
    }

    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        const spawnedCreep: SpawnedCreep | undefined = this.roundCreepController.get(globals.DamageEventTargetUnitId);
        if (spawnedCreep === undefined) {
            return;
        }

        const tower: Tower | undefined = this.towers.get(globals.DamageEventSourceUnitId);
        if (tower === undefined) {
            return;
        }

        switch (spawnedCreep.creep.creepType) {
            case CreepType.FORTIFIED:
                globals.DamageEventAmount += tower.fortifiedVillagerBonusDamage;
                break;
            case CreepType.PURPLE:
                globals.DamageEventAmount += tower.purpleVillagerBonusDamage;
                break;
            case CreepType.LARGE:
                globals.DamageEventAmount += tower.largeVillagerBonusDamage;
                break;
            case CreepType.ZEPPELIN:
                globals.DamageEventAmount += tower.zeppelinVillagerBonusDamage;
                break;
            default:
                return;
        }
    }
}
