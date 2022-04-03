import { Creep } from "./Creep";

export abstract class Modifier {
    public abstract transform(creep: Creep): void;
    public abstract apply(unit: unit): void;
}