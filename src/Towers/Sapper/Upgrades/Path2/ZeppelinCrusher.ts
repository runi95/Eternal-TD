import { ZeppelinCrushAbility } from "TowerAbilities/ZeppelinCrushAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ZeppelinCrusher extends TowerUpgrade {
    public name = "Zeppelin Crusher";
    public icon = "ReplaceableTextures/CommandButtons/BTNEarthquake.blp";
    public cost = 27000;
    public description = "TODO: Write description";
    public ability = new ZeppelinCrushAbility();

    public applyUpgrade(tower: Tower): void {
        tower.zeppelinVillagerBonusDamage += 69;
    }
}