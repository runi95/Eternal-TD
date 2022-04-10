import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class RapidReload extends TowerUpgrade {
    public name = "Rapid Reload";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNBerserkForTrolls.blp";
    public cost = 540;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        BlzSetUnitAttackCooldown(tower.unit, BlzGetUnitAttackCooldown(tower.unit, 0) * 0.78, 0);
    }
}