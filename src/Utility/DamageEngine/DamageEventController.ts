import { RoundCreepController } from "../../Game/RoundCreepController";
import { DamageEngine } from "./DamageEngine";
import { VillagerLethalDamageEvent } from "./DamageEvents/VillagerLethalDamageEvent";

export class DamageEventController {
    constructor(damageEngine: DamageEngine, roundCreepController: RoundCreepController) {
        // Initial damage events
        // damageEngine.addInitialDamageEvent(new MyInitialDamageEvent());

        // Initial damage modification events
        // damageEngine.addInitialDamageModificationEvent(new MyInitialDamageModificationEvent());

        // Final damage modification events
        // damageEngine.addFinalDamageModificationEvent(new MyFinalDamageModificationEvent());

        // After damage events
        // damageEngine.addAfterDamageEvent(new MyAfterDamageEvent());

        // Lethal damage events
        damageEngine.addLethalDamageEvent(new VillagerLethalDamageEvent(roundCreepController));
    }
}
