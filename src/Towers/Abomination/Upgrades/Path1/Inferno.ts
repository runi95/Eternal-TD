import { TowerUpgrade } from "../../../TowerUpgrade";

export class Inferno extends TowerUpgrade {
    public name = "Inferno";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNInfernal.blp";
    public cost = 49140;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 120);

        // NOTE: The rest of the effects of this upgrade happens in Abomination.ts
    }
}