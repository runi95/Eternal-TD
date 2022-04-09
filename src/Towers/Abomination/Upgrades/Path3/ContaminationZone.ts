import { TowerUpgrade } from "../../../TowerUpgrade";

export class ContaminationZone extends TowerUpgrade {
    public name = "Contamination Zone";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNDeathAndDecay.blp";
    public cost = 21600;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 70);

        // NOTE: The rest of the effects of this upgrade happens in Abomination.ts
    }
}