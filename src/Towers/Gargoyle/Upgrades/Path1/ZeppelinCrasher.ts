import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { GargoyleCustomData } from "../../Gargoyle";

const zeppelinCrasherAbilityId: number = FourCC('A00G');
export class ZeppelinCrasher extends TowerUpgrade {
    public readonly name = "Zeppelin Crasher";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNImpale.blp";
    public readonly cost = 5400;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as GargoyleCustomData).aoeDamage += 2;
        tower.unit.addAbility(zeppelinCrasherAbilityId);
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 10, 0);
    }
}
