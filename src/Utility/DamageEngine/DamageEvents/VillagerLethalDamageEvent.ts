import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { RoundCreepController } from "../../../Game/RoundCreepController";
import { Creep } from "../../../Creeps/Creep";

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
        const lethalAbsDamage: number = Math.floor(Math.abs(globals.LethalDamageHP));
        const [creepsToSummon] = this.findNextCreep(this.roundCreepController.get(globals.DamageEventTargetUnitId as number) as Creep, lethalAbsDamage);
        for (let i = 0; i < creepsToSummon.length; i++) {
            const newCreep: unit = CreateUnit(Player(23), creepsToSummon[i].unitTypeId, x, y, face);
            this.roundCreepController.set(GetHandleId(newCreep), creepsToSummon[i]);
            creepsToSummon[i].apply(newCreep);
            IssuePointOrder(newCreep, 'move', creepsToSummon[i].currentCheckpoint.x, creepsToSummon[i].currentCheckpoint.y);
        }
    }

    private findNextCreep(currentCreep: Creep, damageOverflow: number): [Creep[], number] {        
        if (damageOverflow === 0) {
            return [currentCreep.children, damageOverflow];
        }

        const returnedCreeps: Creep[] = [];
        for (let i = 0; i < currentCreep.children.length; i++) {
            const [remainingCreeps, newOverflowCount] = this.findNextCreep(currentCreep.children[i], damageOverflow - 1);
            returnedCreeps.concat(remainingCreeps);
            damageOverflow = newOverflowCount;
        }

        return [returnedCreeps, damageOverflow];
    }
}
