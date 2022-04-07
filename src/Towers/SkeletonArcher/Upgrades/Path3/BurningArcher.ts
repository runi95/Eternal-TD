import { TowerUpgrade } from "../../../TowerUpgrade";

export class BurningArcher extends TowerUpgrade {
    public name = "Burning Archer";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSearingArrows.blp";
    public cost = 675;
    public description = "TODO: Write description";
    public newUnitTypeId = FourCC('h002');

    public applyUpgrade(_unit: unit): void {
        return;
    }
}