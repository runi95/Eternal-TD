import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ArcaneSpike extends TowerUpgrade {
    public name = "Arcane Spike";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNPriestAdept.blp";
    public cost = 10800;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // TODO: Increase damage against zeppelins
        BlzSetUnitBaseDamage(tower.unit, BlzGetUnitBaseDamage(tower.unit, 0) + 2, 0);
        BlzSetUnitAttackCooldown(tower.unit, BlzGetUnitAttackCooldown(tower.unit, 0) * 0.5, 0);
    }
}