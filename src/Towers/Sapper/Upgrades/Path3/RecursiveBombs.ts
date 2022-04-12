import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const clusterBombsAbilityId: number = FourCC('A005');
export class RecursiveBombs extends TowerUpgrade {
    public name = "Recursive Bombs";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNScatterRockets.blp";
    public cost = 3025;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAbilityLevel(clusterBombsAbilityId, 2);
    }
}