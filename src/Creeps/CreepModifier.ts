import { DefenseTypes } from "./DefenseTypes";
import { TargetFlags } from "./TargetFlags";
import type { Color } from "../Utility/Color";
import type { Scale } from "../Utility/Scale";
import type { Unit } from "w3ts";

export type CreepModifierApplyFunction = (unit: Unit) => void;

export abstract class CreepModifier {
    public abstract readonly icon: string;
    public abstract readonly description: string;

    public readonly name: string = this.constructor.name;

    /**
     * Multiplies the original color with the given color mask 
     */
    public readonly colorMask?: Color;

    /**
     * Sums the original health with the given amount
     */
    public readonly healthAddend?: number;

    /**
     * Multiplies the total health with the given amount
     */
    public readonly healthMultiplier?: number;

    /**
     * Overrides the original defense type with the given type
     */
    public readonly defenseTypeOverride?: DefenseTypes;

    /**
     * Overrides the original targetAs flag with the given flag
     */
    public readonly targetAsOverride?: TargetFlags;

    /**
     * Overrides the original scale size with the given scale
     */
    public readonly scaleOverride?: Scale;

    /**
     * Apply the specified effect at the very end of spawning the creep
     */
    public readonly applyEffect?: CreepModifierApplyFunction;
};
