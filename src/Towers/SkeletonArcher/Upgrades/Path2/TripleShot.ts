import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class TripleShot extends TowerUpgrade {
    public readonly name = "Triple Shot";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNFanOfKnives.blp";
    public readonly cost = 430;
    public readonly description = "TODO: Write description";

    private readonly tripleShotAbilityId: number = FourCC('A001');

    public applyUpgrade(tower: Tower): void {
        tower.unit.addAbility(this.tripleShotAbilityId);
    }
}
