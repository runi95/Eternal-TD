import { TowerUpgrade } from "../../../TowerUpgrade";

export class EvenFasterSpread extends TowerUpgrade {
    public name = "Even Faster Spread";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNDeathAndDecay.blp";
    public cost = 325;
    public description = "TODO: Write description";

    public applyUpgrade(_unit: unit): void {
        // NOTE: This function is purposefully left empty because the upgrades happen in Abomination.ts
    }
}