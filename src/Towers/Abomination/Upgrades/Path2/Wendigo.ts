import { TowerUpgrade } from "../../../TowerUpgrade";

export class Wendigo extends TowerUpgrade {
    public name = "Wendigo";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNHumanArtilleryUpOne.blp";
    public cost = 1190;
    public description = "TODO: Write description";
    public newUnitTypeId: number = FourCC('h005');

    public applyUpgrade(_unit: unit): void {
        return;
    }
}