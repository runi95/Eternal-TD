import { Tower } from "Towers/Tower";
import { StunUtils } from "../StunUtils";
import { TimerUtils } from "../TimerUtils";
import { DamageEngine } from "./DamageEngine";
import { EmbrittlementDamageEvent } from "./DamageEvents/EmbrittlementDamageEvent";
import { FrostWyrmDamageEvent } from "./DamageEvents/FrostWyrmDamageEvent";
import { SapperDamageEvent } from "./DamageEvents/SapperDamageEvent";
import { SeaGiantDamageEvent } from "./DamageEvents/SeaGiantDamageEvent";
import { SkeletalOrcDamageEvent } from "./DamageEvents/SkeletalOrcDamageEvent";
import { SuperBrittleDamageEvent } from "./DamageEvents/SuperBrittleDamageEvent";
import { VillagerLethalDamageEvent } from "./DamageEvents/VillagerLethalDamageEvent";
import { VillagerTypeBonusDamageEvent } from "./DamageEvents/VillagerTypeBonusDamageEvent";

export class DamageEventController {
    constructor(damageEngine: DamageEngine, timerUtils: TimerUtils, stunUtils: StunUtils, towers: Map<number, Tower>) {
        // Initial damage events
        // damageEngine.addInitialDamageEvent(new MyInitialDamageEvent());

        // Initial damage modification events
        damageEngine.addInitialDamageModificationEvent(new EmbrittlementDamageEvent());
        damageEngine.addInitialDamageModificationEvent(new SuperBrittleDamageEvent());
        damageEngine.addInitialDamageModificationEvent(new VillagerTypeBonusDamageEvent(towers));

        // Final damage modification events
        // damageEngine.addFinalDamageModificationEvent(new MyFinalDamageModificationEvent());

        // After damage events
        damageEngine.addAfterDamageEvent(new SapperDamageEvent(towers));
        damageEngine.addAfterDamageEvent(new SeaGiantDamageEvent(timerUtils, towers));
        damageEngine.addAfterDamageEvent(new SkeletalOrcDamageEvent(stunUtils));
        damageEngine.addAfterDamageEvent(new FrostWyrmDamageEvent(towers, stunUtils)); 

        // Lethal damage events
        damageEngine.addLethalDamageEvent(new VillagerLethalDamageEvent(stunUtils));
    }
}
