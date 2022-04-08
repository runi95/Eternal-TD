import { TowerUpgrade } from "../../../TowerUpgrade";

export class GreaterPermanentImmolation extends TowerUpgrade {
    public name = "Permanent Immolation";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp";
    public cost = 3780;
    public description = "TODO: Write description";

    public applyUpgrade(_unit: unit): void {
        // NOTE: This function is purposefully left empty because the upgrades happen in Abomination.ts
    }
}