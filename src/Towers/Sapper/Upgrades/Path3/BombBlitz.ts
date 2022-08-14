import { SapperCustomData } from "../../../Sapper/Sapper";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const clusterBombsAbilityId: number = FourCC('A005');
export class BombBlitz extends TowerUpgrade {
    public readonly name = "Bomb Blitz";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNWallOfFire.blp";
    public readonly cost = 37800;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as SapperCustomData).aoeDamage += 3;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 3, 0);
        tower.unit.setAbilityLevel(clusterBombsAbilityId, 3);
    }
}
