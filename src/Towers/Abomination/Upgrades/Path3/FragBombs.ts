import { TowerUpgrade } from "../../../TowerUpgrade";

export class FragBombs extends TowerUpgrade {
    public name = "Frag Bombs";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNFragmentationBombs.blp";
    public cost = 325;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        BlzSetUnitBaseDamage(unit, BlzGetUnitBaseDamage(unit, 0) + 1, 0);
    }
}