import { TowerUpgrade } from "../../../TowerUpgrade";

export class FasterSpread extends TowerUpgrade {
    public name = "Faster Spread";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNPlagueCloud.blp";
    public cost = 160;
    public description = "TODO: Write description";

    public applyUpgrade(_unit: unit): void {
        // NOTE: This function is purposefully left empty because the upgrades happen in Abomination.ts
    }
}