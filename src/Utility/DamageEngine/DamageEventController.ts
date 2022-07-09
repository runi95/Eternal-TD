import { StunUtils } from "../StunUtils";
import { TimerUtils } from "../TimerUtils";
import { DamageEngine } from "./DamageEngine";
import { DamageReductionDamageEvent } from "./DamageEvents/DamageReductionDamageEvent";
import { EmbrittlementDamageEvent } from "./DamageEvents/EmbrittlementDamageEvent";
import { FrostWyrmDamageEvent } from "./DamageEvents/FrostWyrmDamageEvent";
import { SapperDamageEvent } from "./DamageEvents/SapperDamageEvent";
import { SeaGiantDamageEvent } from "./DamageEvents/SeaGiantDamageEvent";
import { SkeletalOrcDamageEvent } from "./DamageEvents/SkeletalOrcDamageEvent";
import { SuperBrittleDamageEvent } from "./DamageEvents/SuperBrittleDamageEvent";
import { VillagerLethalDamageEvent } from "./DamageEvents/VillagerLethalDamageEvent";
import { VillagerTypeBonusDamageEvent } from "./DamageEvents/VillagerTypeBonusDamageEvent";

export class DamageEventController {
    constructor(damageEngine: DamageEngine, timerUtils: TimerUtils, stunUtils: StunUtils) {
        // Initial damage events
        // damageEngine.addInitialDamageEvent(new MyInitialDamageEvent());

        // Initial damage modification events
        damageEngine.addInitialDamageModificationEvent(new EmbrittlementDamageEvent());
        damageEngine.addInitialDamageModificationEvent(new SuperBrittleDamageEvent());
        damageEngine.addInitialDamageModificationEvent(new VillagerTypeBonusDamageEvent());

        // Final damage modification events
        damageEngine.addFinalDamageModificationEvent(new DamageReductionDamageEvent());

        // After damage events
        damageEngine.addAfterDamageEvent(new SapperDamageEvent());
        damageEngine.addAfterDamageEvent(new SeaGiantDamageEvent(timerUtils));
        damageEngine.addAfterDamageEvent(new SkeletalOrcDamageEvent(stunUtils));
        damageEngine.addAfterDamageEvent(new FrostWyrmDamageEvent(stunUtils));

        // Lethal damage events
        damageEngine.addLethalDamageEvent(new VillagerLethalDamageEvent(stunUtils));
    }
}
