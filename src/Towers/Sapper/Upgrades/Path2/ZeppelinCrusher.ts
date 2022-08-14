import { ZeppelinCrushAbility } from "../../../../TowerAbilities/ZeppelinCrushAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class ZeppelinCrusher extends TowerUpgrade {
    public readonly name = "Zeppelin Crusher";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNControlMagic.blp";
    public readonly cost = 27000;
    public readonly description = "TODO: Write description";
    public readonly ability = new ZeppelinCrushAbility();

    public applyUpgrade(tower: Tower): void {
        tower.zeppelinVillagerBonusDamage += 69;
    }
}
