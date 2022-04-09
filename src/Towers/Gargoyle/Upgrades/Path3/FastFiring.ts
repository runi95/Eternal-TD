import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FastFiring extends TowerUpgrade {
    public name = "Fast Firing";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp";
    public cost = 430;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        BlzSetUnitAttackCooldown(tower.unit, BlzGetUnitAttackCooldown(tower.unit, 0) * 0.7, 0);
    }
}