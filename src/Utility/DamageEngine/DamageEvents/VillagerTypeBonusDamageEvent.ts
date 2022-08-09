import { DamageEvent } from "../DamageEvent";
import { FortifiedVillager } from "../../../Creeps/Normal/FortifiedVillager";
import { PurpleVillager } from "../../../Creeps/Normal/PurpleVillager";
import { LargeVillager } from "../../../Creeps/Normal/LargeVillager";
import { Zeppelin } from "../../../Creeps/Normal/Zeppelin";
import type { ExtendedDamageInstance } from "../DamageEventController";

export class VillagerTypeBonusDamageEvent implements DamageEvent {
    public event(damageInstance: ExtendedDamageInstance): void {
        if (damageInstance.targetOwningPlayerId !== 23) return;
        switch (damageInstance.creep.creepBaseUnit.name) {
            case FortifiedVillager.name:
                damageInstance.damage += damageInstance.tower.fortifiedVillagerBonusDamage;
                break;
            case PurpleVillager.name:
                damageInstance.damage += damageInstance.tower.purpleVillagerBonusDamage;
                break;
            case LargeVillager.name:
                damageInstance.damage += damageInstance.tower.largeVillagerBonusDamage;
                break;
            case Zeppelin.name:
                damageInstance.damage += damageInstance.tower.zeppelinVillagerBonusDamage;
                break;
            default:
                return;
        }
    }
}
