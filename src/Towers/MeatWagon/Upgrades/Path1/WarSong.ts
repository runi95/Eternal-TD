import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class WarSong extends TowerUpgrade {
    public name = "War Song";
    public icon = "ReplaceableTextures/CommandButtons/BTNDrum.blp";
    public cost = 540;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.setBaseDamage(tower.unit.getBaseDamage(0) + 1, 0)
    }
}
