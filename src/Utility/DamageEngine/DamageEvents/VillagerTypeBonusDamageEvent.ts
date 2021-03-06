import { DamageEvent } from "../DamageEvent";
import { DamageEngineGlobals } from "../DamageEngineGlobals";
import { GameMap } from "../../../Game/GameMap";
import { Creep } from "../../../Creeps/Creep";
import { FortifiedVillager } from "../../../Creeps/Normal/FortifiedVillager";
import { PurpleVillager } from "../../../Creeps/Normal/PurpleVillager";
import { LargeVillager } from "../../../Creeps/Normal/LargeVillager";
import { Zeppelin } from "../../../Creeps/Normal/Zeppelin";
import type { Tower } from "../../../Towers/Tower";

export class VillagerTypeBonusDamageEvent implements DamageEvent {
    public event(globals: DamageEngineGlobals): void {
        const playerId: number = globals.DamageEventTargetOwningPlayerId as number;
        if (playerId !== 23) {
            return;
        }

        const spawnedCreep: Creep | undefined = GameMap.SPAWNED_CREEP_MAP.get(globals.DamageEventTargetUnitId);
        if (spawnedCreep === undefined) {
            return;
        }

        const tower: Tower | undefined = GameMap.BUILT_TOWER_MAP.get(globals.DamageEventSourceUnitId);
        if (tower === undefined) {
            return;
        }

        switch (spawnedCreep.creepBaseUnit.name) {
            case FortifiedVillager.name:
                globals.DamageEventAmount += tower.fortifiedVillagerBonusDamage;
                break;
            case PurpleVillager.name:
                globals.DamageEventAmount += tower.purpleVillagerBonusDamage;
                break;
            case LargeVillager.name:
                globals.DamageEventAmount += tower.largeVillagerBonusDamage;
                break;
            case Zeppelin.name:
                globals.DamageEventAmount += tower.zeppelinVillagerBonusDamage;
                break;
            default:
                return;
        }
    }
}
