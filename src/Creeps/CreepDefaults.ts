import { Scale } from "Utility/Scale";
import { DefenseTypes } from "./DefenseTypes";
import { TargetFlags } from "./TargetFlags";

export class CreepDefaults {
    public static readonly SCALE: Scale = {x: 1, y: 1, z: 1};
    public static readonly HEALTH: number = 1;
    public static readonly UNIT_TYPE_ID: number = FourCC('u000');
    public static readonly MOVE_SPEED: number = 150.0;
    public static readonly TARGET_AS_FLAG: TargetFlags = TargetFlags.GROUND;
    public static readonly DEFENSE_TYPE: DefenseTypes = DefenseTypes.MEDIUM;
}