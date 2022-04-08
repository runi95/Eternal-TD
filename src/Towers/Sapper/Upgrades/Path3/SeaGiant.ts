import { TowerUpgrade } from "../../../TowerUpgrade";

export class SeaGiant extends TowerUpgrade {
    public name = "Cluster Bombs";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNFragmentationBombs.blp";
    public cost = 865;
    public description = "TODO: Write description";
    public newUnitTypeId: number = FourCC('h004');

    public applyUpgrade(_unit: unit): void {
        return;
    }
}