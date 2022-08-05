import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const zeppelinCrasherAbilityId: number = FourCC('A00G');
export class CripplingShot extends TowerUpgrade {
    public name = "Crippling Shot";
    public icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp";
    public cost = 36720;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 50, 0);
        tower.unit.setAbilityLevel(zeppelinCrasherAbilityId, 2);
    }
}
