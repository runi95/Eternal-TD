import { Tower } from "Towers/Tower";
import { RoundCreepController } from "../../Game/RoundCreepController";
import { StunUtils } from "../StunUtils";
import { TimerUtils } from "../TimerUtils";
import { DamageEngine } from "./DamageEngine";
import { SeaGiantDamageEvent } from "./DamageEvents/SeaGiantDamageEvent";
import { SkeletalOrcDamageEvent } from "./DamageEvents/SkeletalOrcDamageEvent";
import { VillagerLethalDamageEvent } from "./DamageEvents/VillagerLethalDamageEvent";
import { VillagerTypeBonusDamageEvent } from "./DamageEvents/VillagerTypeBonusDamageEvent";
import { WendigoDamageEvent } from "./DamageEvents/WendigoDamageEvent";

export class DamageEventController {
    constructor(damageEngine: DamageEngine, roundCreepController: RoundCreepController, timerUtils: TimerUtils, stunUtils: StunUtils, towers: Map<number, Tower>) {
        // Initial damage events
        // damageEngine.addInitialDamageEvent(new MyInitialDamageEvent());

        // Initial damage modification events
        damageEngine.addInitialDamageModificationEvent(new VillagerTypeBonusDamageEvent(roundCreepController, towers));
        damageEngine.addInitialDamageModificationEvent(new WendigoDamageEvent(roundCreepController));
        damageEngine.addInitialDamageModificationEvent(new SeaGiantDamageEvent(timerUtils));

        // Final damage modification events
        // damageEngine.addFinalDamageModificationEvent(new MyFinalDamageModificationEvent());

        // After damage events
        // damageEngine.addAfterDamageEvent(new MyAfterDamageEvent());
        damageEngine.addAfterDamageEvent(new SkeletalOrcDamageEvent(stunUtils, roundCreepController));

        // Lethal damage events
        damageEngine.addLethalDamageEvent(new VillagerLethalDamageEvent(roundCreepController));
    }
}
