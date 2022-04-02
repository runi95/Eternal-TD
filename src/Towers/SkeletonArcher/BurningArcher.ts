import { TowerUpgrade } from "../TowerUpgrade";

export class BurningArcher extends TowerUpgrade {
    public name = "Burning Archer";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNSearingArrows.blp";
    public cost = 675;
    public description = "Use a long range bow that deals +3 damage per hit.";
    public newUnitTypeId = FourCC('h002');

    public applyUpgrade(_unit: unit): void {
        return;
    }
}