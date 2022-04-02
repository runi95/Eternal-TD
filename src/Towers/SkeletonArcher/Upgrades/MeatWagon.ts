import { TowerUpgrade } from "../../TowerUpgrade";

export class MeatWagon extends TowerUpgrade {
    public name = "Meat Wagon";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNVorpalBlades.blp";
    public cost = 325;
    public description = "Converts the Skeleton Archer to a Meat Wagon that hurls corpses instead of arrows. Good range, but slower attack speed. Each corpse can damage multiple villagers at once.";
    public newUnitTypeId = FourCC('h001');

    public applyUpgrade(_unit: unit): void {
        return;
    }
}