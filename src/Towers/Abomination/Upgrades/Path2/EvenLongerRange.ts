import { TowerUpgrade } from "../../../TowerUpgrade";

export class EvenLongerRange extends TowerUpgrade {
    public name = "Even Longer Range";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNBansheeMaster.blp";
    public cost = 245;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 40);

        // NOTE: The rest of the effects of this upgrade happens in Abomination.ts
    }
}