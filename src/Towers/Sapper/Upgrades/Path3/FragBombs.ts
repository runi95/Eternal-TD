import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FragBombs extends TowerUpgrade {
    public name = "Frag Bombs";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNFlare.blp";
    public cost = 325;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        BlzSetUnitBaseDamage(tower.unit, BlzGetUnitBaseDamage(tower.unit, 0) + 1, 0);
    }
}