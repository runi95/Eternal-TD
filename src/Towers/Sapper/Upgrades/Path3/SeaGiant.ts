import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class SeaGiant extends TowerUpgrade {
    public readonly name = "Cluster Bombs";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNSeaGiant.blp";
    public readonly cost = 865;
    public readonly description = "TODO: Write description";
    public readonly newUnitTypeId: number = FourCC('h004');

    public applyUpgrade(_tower: Tower): void {
        return;
    }
}
