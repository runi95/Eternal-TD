import { SapperCustomData } from "Towers/Sapper/Sapper";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const clusterBombsAbilityId: number = FourCC('A005');
export class BombBlitz extends TowerUpgrade {
    public name = "Bomb Blitz";
    public icon = "ReplaceableTextures/CommandButtons/BTNWallOfFire.blp";
    public cost = 37800;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as SapperCustomData).aoeDamage += 3;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 3, 0);
        tower.unit.setAbilityLevel(clusterBombsAbilityId, 3);
    }
}