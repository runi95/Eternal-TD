import { Color } from "Utility/Color";
import { Scale } from "Utility/Scale";
import { CreepDefaults } from "./CreepDefaults";
import { DefenseTypes } from "./DefenseTypes";
import { TargetFlags } from "./TargetFlags";

export abstract class CreepBaseUnit {
    public readonly abstract color: Color;
    public readonly name: string = this.constructor.name;
    public readonly scale: Scale = CreepDefaults.SCALE;
    public readonly health: number = CreepDefaults.HEALTH;
    public readonly moveSpeed: number = CreepDefaults.MOVE_SPEED;
    public readonly unitTypeId: number = CreepDefaults.UNIT_TYPE_ID;
    public readonly unitSkinTypeId: number | null = CreepDefaults.UNIT_SKIN_TYPE_ID;
    public readonly defenseType: DefenseTypes = CreepDefaults.DEFENSE_TYPE;
    public readonly targetAs: TargetFlags = CreepDefaults.TARGET_AS_FLAG;
    public readonly children: CreepBaseUnit[] = [];
}
