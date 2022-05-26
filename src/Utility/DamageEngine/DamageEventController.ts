import { Tower } from "Towers/Tower";
import { RoundCreepController } from "../../Game/RoundCreepController";
import { StunUtils } from "../StunUtils";
import { TimerUtils } from "../TimerUtils";
import { DamageEngine } from "./DamageEngine";
import { FrostWyrmDamageEvent } from "./DamageEvents/FrostWyrmDamageEvent";
import { SapperDamageEvent } from "./DamageEvents/SapperDamageEvent";
import { SeaGiantDamageEvent } from "./DamageEvents/SeaGiantDamageEvent";
import { SkeletalOrcDamageEvent } from "./DamageEvents/SkeletalOrcDamageEvent";
import { VillagerLethalDamageEvent } from "./DamageEvents/VillagerLethalDamageEvent";
import { VillagerTypeBonusDamageEvent } from "./DamageEvents/VillagerTypeBonusDamageEvent";

export class DamageEventController {
    constructor(damageEngine: DamageEngine, roundCreepController: RoundCreepController, timerUtils: TimerUtils, stunUtils: StunUtils, towers: Map<number, Tower>) {
        // Initial damage events
        // damageEngine.addInitialDamageEvent(new MyInitialDamageEvent());

        // Initial damage modification events
        damageEngine.addInitialDamageModificationEvent(new VillagerTypeBonusDamageEvent(roundCreepController, towers));

        // Final damage modification events
        // damageEngine.addFinalDamageModificationEvent(new MyFinalDamageModificationEvent());

        // After damage events
        damageEngine.addAfterDamageEvent(new SapperDamageEvent(towers));
        damageEngine.addAfterDamageEvent(new SeaGiantDamageEvent(timerUtils, towers));
        damageEngine.addAfterDamageEvent(new SkeletalOrcDamageEvent(stunUtils, roundCreepController));
        damageEngine.addAfterDamageEvent(new FrostWyrmDamageEvent(towers, stunUtils)); 

        // Lethal damage events
        damageEngine.addLethalDamageEvent(new VillagerLethalDamageEvent(roundCreepController, stunUtils));
    }
}
