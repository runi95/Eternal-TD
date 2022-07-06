import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { StunUtils } from "../../StunUtils";
import { GameMap } from "Game/GameMap";
import { Creep } from "Creeps/Creep";
import { Zeppelin } from "Creeps/Normal/Zeppelin";

const skeletalOrcUnitTypeId: number = FourCC('h006');
const skeletalHammerAbilityId: number = FourCC('A004');
export class SkeletalOrcDamageEvent implements DamageEvent {
    private readonly stunUtils: StunUtils;

    constructor(stunUtils: StunUtils) {
        this.stunUtils = stunUtils;
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

        const skeletalHammerAbilityLevel: number = GetUnitAbilityLevel(globals.DamageEventSource as unit, skeletalHammerAbilityId);
        let stunDuration = 2;
        if (skeletalHammerAbilityLevel === 1) {
            stunDuration = 1;
            const spawnedCreep: Creep = GameMap.SPAWNED_CREEP_MAP.get(globals.DamageEventTargetUnitId as number);
            switch (spawnedCreep.creepBaseUnit.name) {
                case Zeppelin.name:
                    // Skeletal Orc should not stun Zeppelins unless upgraded.
                    return;
            }
        }

        this.stunUtils.stunUnit(globals.DamageEventTarget as unit, stunDuration);
    }
}
