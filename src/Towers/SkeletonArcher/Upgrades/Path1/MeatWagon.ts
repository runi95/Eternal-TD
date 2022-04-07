import { TowerUpgrade } from "../../../TowerUpgrade";

export class MeatWagon extends TowerUpgrade {
    public name = "Meat Wagon";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNVorpalBlades.blp";
    public cost = 325;
    public description = "TODO: Write description";
    public newUnitTypeId = FourCC('h001');

    public applyUpgrade(_unit: unit): void {
        // TODO: Increase damage against Large villagers
        return;
    }
}