import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class RazorSharpArrows extends TowerUpgrade {
    public name = "Razor Sharp Arrows";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNShadowStrike.blp";
    public cost = 235;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        BlzSetUnitBaseDamage(tower.unit, BlzGetUnitBaseDamage(tower.unit, 0) + 1, 0);
    }
}