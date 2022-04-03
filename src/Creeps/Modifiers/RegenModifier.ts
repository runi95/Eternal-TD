import { Creep } from "../Creep";
import { Modifier } from "../Modifier";

export interface RegenUnit {
    unit: unit;
    remainingRegenTicks: number;
}

export const regenUnitMap: Map<number, RegenUnit> = new Map();

const regenUnitTypeId: number = FourCC('u002');
export class RegenModifier extends Modifier {
    public transform(creep: Creep): void {
        creep.unitTypeId = regenUnitTypeId;
    }

    public apply(unit: unit): void {
        regenUnitMap.set(GetHandleId(unit), { unit, remainingRegenTicks: 3 });
    }
}