import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class DeadlyShot extends TowerUpgrade {
    public name = "Deadly Shot";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp";
    public cost = 3240;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // TODO: Increase damage dealt to Large villagers by +15
        BlzSetUnitBaseDamage(tower.unit, BlzGetUnitBaseDamage(tower.unit, 0) + 13, 0);
    }
}