import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const zeppelinCrasherAbilityId: number = FourCC('A00G');
export class ZeppelinCrasher extends TowerUpgrade {
    public name = "Zeppelin Crasher";
    public icon = "ReplaceableTextures/CommandButtons/BTNLocustSwarm.blp";
    public cost = 5400;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.addAbility(zeppelinCrasherAbilityId);
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 10, 0);
    }
}
