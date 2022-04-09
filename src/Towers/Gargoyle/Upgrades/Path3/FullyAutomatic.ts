import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FullyAutomatic extends TowerUpgrade {
    public name = "Fully-Automatic";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp";
    public cost = 4590;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        BlzSetUnitAttackCooldown(tower.unit, BlzGetUnitAttackCooldown(tower.unit, 0) * 0.5, 0);
    }
}