import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Archmage extends TowerUpgrade {
    public name = "Archmage";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSorceressMaster.blp";
    public cost = 34560;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // TODO: Increase damage against zeppelins
        // TODO: Add Dragon's Breath and Shimmer attacks?
        BlzSetUnitBaseDamage(tower.unit, BlzGetUnitBaseDamage(tower.unit, 0) + 2, 0);
        BlzSetUnitAttackCooldown(tower.unit, BlzGetUnitAttackCooldown(tower.unit, 0) * 0.5, 0);
    }
}