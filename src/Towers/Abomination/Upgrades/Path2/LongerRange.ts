import { TowerUpgrade } from "../../../TowerUpgrade";

export class LongerRange extends TowerUpgrade {
    public name = "Longer Range";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNBansheeAdept.blp";
    public cost = 110;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        SetUnitAcquireRange(unit, GetUnitAcquireRange(unit) + 40);

        // NOTE: The rest of the effects of this upgrade happens in Abomination.ts
    }
}