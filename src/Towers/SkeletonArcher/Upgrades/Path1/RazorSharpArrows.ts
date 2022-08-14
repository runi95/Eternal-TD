import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class RazorSharpArrows extends TowerUpgrade {
    public readonly name = "Razor Sharp Arrows";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNShadowStrike.blp";
    public readonly cost = 235;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
    }
}
