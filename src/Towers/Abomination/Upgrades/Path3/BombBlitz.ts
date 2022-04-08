import { TowerUpgrade } from "../../../TowerUpgrade";

const clusterBombsAbilityId: number = FourCC('A005');
export class BombBlitz extends TowerUpgrade {
    public name = "Bomb Blitz";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNWallOfFire.blp";
    public cost = 37800;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        SetUnitAbilityLevel(unit, clusterBombsAbilityId, 3);
    }
}