import { DamageEngine, DamageEventType, DamageInstance } from "./DamageEngine";
import { DamageReductionDamageEvent } from "./DamageEvents/DamageReductionDamageEvent";
import { EmbrittlementDamageEvent } from "./DamageEvents/EmbrittlementDamageEvent";
import { FrostWyrmDamageEvent } from "./DamageEvents/FrostWyrmDamageEvent";
import { GargoyleWeakSplashDamageEvent } from "./DamageEvents/GargoyleWeakSplashDamageEvent";
import { ObsidianFormDamageEvent } from "./DamageEvents/ObsidianFormDamageEvent";
import { SapperDamageEvent } from "./DamageEvents/SapperDamageEvent";
import { SeaGiantDamageEvent } from "./DamageEvents/SeaGiantDamageEvent";
import { SkeletalOrcDamageEvent } from "./DamageEvents/SkeletalOrcDamageEvent";
import { SuperBrittleDamageEvent } from "./DamageEvents/SuperBrittleDamageEvent";
import { VillagerLethalDamageEvent } from "./DamageEvents/VillagerLethalDamageEvent";
import { VillagerTypeBonusDamageEvent } from "./DamageEvents/VillagerTypeBonusDamageEvent";
import type { Tower } from "../../Towers/Tower";
import { GameMap } from "../../Game/GameMap";
import { Creep } from "../../Creeps/Creep";
import { MeatWagonShockwaveDamageEvent } from "./DamageEvents/MeatWagonShockwaveDamageEvent";
import { MeatWagonFlareDamageEvent } from "./DamageEvents/MeatWagonFlareDamageEvent";
import { MeatWagonPurgeDamageEvent } from "./DamageEvents/MeatWagonPurgeDamageEvent";
import { MeatWagonBurnyStuffDamageEvent } from "./DamageEvents/MeatWagonBurnyStuffDamageEvent";

export interface ExtendedDamageInstance extends DamageInstance {
    sourceOwningPlayer: player;
    targetOwningPlayer: player;
    sourceOwningPlayerId: number;
    targetOwningPlayerId: number;
    sourceUnitId: number;
    targetUnitId: number;
    sourceUnitTypeId: number;
    targetUnitTypeId: number;
    tower: Tower | undefined;
    creep: Creep;
}

export class DamageEventController {
    constructor() {
        DamageEngine.registerTransformer((d: ExtendedDamageInstance) => {
            d.sourceOwningPlayer = GetOwningPlayer(d.source);
            d.targetOwningPlayer = GetOwningPlayer(d.target);
            d.sourceOwningPlayerId = GetPlayerId(d.sourceOwningPlayer);
            d.targetOwningPlayerId = GetPlayerId(d.targetOwningPlayer);
            d.sourceUnitId = GetHandleId(d.source);
            d.targetUnitId = GetHandleId(d.target);
            d.sourceUnitTypeId = GetUnitTypeId(d.source);
            d.targetUnitTypeId = GetUnitTypeId(d.target);
            d.tower = GameMap.BUILT_TOWER_MAP.get(d.sourceUnitId);
            d.creep = GameMap.SPAWNED_CREEP_MAP.get(d.targetUnitId);

            return d;
        });

        // Pre damage events
        DamageEngine.register(new EmbrittlementDamageEvent(), DamageEventType.PreDamageEvent);
        DamageEngine.register(new SuperBrittleDamageEvent(), DamageEventType.PreDamageEvent);

        // On damage events
        DamageEngine.register(new VillagerTypeBonusDamageEvent(), DamageEventType.OnDamageEvent);
        DamageEngine.register(new GargoyleWeakSplashDamageEvent(), DamageEventType.OnDamageEvent);
        DamageEngine.register(new ObsidianFormDamageEvent(), DamageEventType.OnDamageEvent);
        DamageEngine.register(new DamageReductionDamageEvent(), DamageEventType.OnDamageEvent);
        DamageEngine.register(new MeatWagonShockwaveDamageEvent(), DamageEventType.OnDamageEvent);
        DamageEngine.register(new MeatWagonFlareDamageEvent(), DamageEventType.OnDamageEvent);
        DamageEngine.register(new MeatWagonPurgeDamageEvent(), DamageEventType.OnDamageEvent);
        DamageEngine.register(new MeatWagonBurnyStuffDamageEvent(), DamageEventType.OnDamageEvent);

        // After damage events
        DamageEngine.register(new SapperDamageEvent(), DamageEventType.AfterDamageEvent);
        DamageEngine.register(new SeaGiantDamageEvent(), DamageEventType.AfterDamageEvent);
        DamageEngine.register(new SkeletalOrcDamageEvent(), DamageEventType.AfterDamageEvent);
        DamageEngine.register(new FrostWyrmDamageEvent(), DamageEventType.AfterDamageEvent);

        // Lethal damage events
        DamageEngine.register(new VillagerLethalDamageEvent(), DamageEventType.LethalDamageEvent);
    }
}
