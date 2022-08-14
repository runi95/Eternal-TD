import { SapperCustomData } from "../../../Sapper/Sapper";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FragBombs extends TowerUpgrade {
    public readonly name = "Frag Bombs";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNFragmentationBombs.blp";
    public readonly cost = 325;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as SapperCustomData).aoeDamage += 1;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0);
    }
}
