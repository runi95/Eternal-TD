import { TowerUpgrade } from "../../../TowerUpgrade";

export class SeaGiant extends TowerUpgrade {
    public name = "Cluster Bombs";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNFlare.blp";
    public cost = 865;
    public description = "TO BE IMPLEMENTED";
    public newUnitTypeId: number = FourCC('h004');

    public applyUpgrade(_unit: unit): void {
        return;
    }
}