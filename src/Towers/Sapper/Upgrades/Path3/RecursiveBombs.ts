import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const clusterBombsAbilityId: number = FourCC('A005');
export class RecursiveBombs extends TowerUpgrade {
    public readonly name = "Recursive Bombs";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNScatterRockets.blp";
    public readonly cost = 3025;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setAbilityLevel(clusterBombsAbilityId, 2);
    }
}
