import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const clusterBombsAbilityId: number = FourCC('A005');
export class BombBlitz extends TowerUpgrade {
    public name = "Bomb Blitz";
    public icon = "ReplaceableTextures/CommandButtons/BTNWallOfFire.blp";
    public cost = 37800;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAbilityLevel(clusterBombsAbilityId, 3);
    }
}