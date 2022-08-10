import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { GargoyleCustomData } from "../../Gargoyle";

const zeppelinCrasherAbilityId: number = FourCC('A00G');
export class CripplingShot extends TowerUpgrade {
    public name = "Crippling Shot";
    public icon = "ReplaceableTextures/CommandButtons/BTNCripple.blp";
    public cost = 36720;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as GargoyleCustomData).aoeDamage += 6;
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 50, 0);
        tower.unit.setAbilityLevel(zeppelinCrasherAbilityId, 2);
    }
}
