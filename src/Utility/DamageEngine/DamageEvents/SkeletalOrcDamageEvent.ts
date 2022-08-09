import { DamageEvent } from "../DamageEvent";
import { StunUtils } from "../../StunUtils";
import { GameMap } from "../../../Game/GameMap";
import { Creep } from "../../../Creeps/Creep";
import { Zeppelin } from "../../../Creeps/Normal/Zeppelin";
import type { ExtendedDamageInstance } from "../DamageEventController";

const skeletalOrcUnitTypeId: number = FourCC('h006');
const skeletalHammerAbilityId: number = FourCC('A004');
export class SkeletalOrcDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.targetOwningPlayerId !== 23) return;
        if (damageInstance.sourceUnitTypeId !== skeletalOrcUnitTypeId) return;
        if (damageInstance.damage < 1) return;

        const skeletalHammerAbilityLevel: number = GetUnitAbilityLevel(damageInstance.source, skeletalHammerAbilityId);
        let stunDuration = 2;
        if (skeletalHammerAbilityLevel === 1) {
            stunDuration = 1;
            switch (damageInstance.creep.creepBaseUnit.name) {
                case Zeppelin.name:
                    // Skeletal Orc should not stun Zeppelins unless upgraded.
                    return;
            }
        }

        StunUtils.stunUnit(damageInstance.target, stunDuration);
    }
}
