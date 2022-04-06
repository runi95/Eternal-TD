import { TowerUpgrade } from "../../../TowerUpgrade";

export class RazorSharpArrows extends TowerUpgrade {
    public name = "Razor Sharp Arrows";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNShadowStrike.blp";
    public cost = 235;
    public description = "Deals 1 extra damage per shot.";

    public applyUpgrade(unit: unit): void {
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 1, 0);
    }
}