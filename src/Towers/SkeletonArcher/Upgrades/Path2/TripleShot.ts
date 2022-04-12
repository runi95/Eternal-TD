import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class TripleShot extends TowerUpgrade {
    public name = "Triple Shot";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNFanOfKnives.blp";
    public cost = 430;
    public description = "TODO: Write description";

    private readonly tripleShotAbilityId: number = FourCC('A001');

    public applyUpgrade(tower: Tower): void {
        tower.unit.addAbility(this.tripleShotAbilityId);
    }
}