import { Creep } from "../Creep";
import { Modifier } from "../Modifier";

const invisibilityUnitTypeId: number = FourCC('u003');

export class InvisibilityModifier extends Modifier {
    public transform(creep: Creep): void {
        creep.unitTypeId = invisibilityUnitTypeId;
        creep.color = {r: creep.color.a, g: creep.color.g, b: creep.color.b, a: 125};
    }

    public apply(_unit: unit): void {
        return;
    }
}