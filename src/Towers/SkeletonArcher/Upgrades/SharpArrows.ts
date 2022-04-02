import { TowerUpgrade } from "../../TowerUpgrade";

export class SharpArrows extends TowerUpgrade {
    public name = "Sharp Arrows";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNImprovedBows.blp";
    public cost = 150;
    public description = "Deals 1 extra damage per shot.";

    public applyUpgrade(unit: unit): void {
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 1, 0);
    }
}