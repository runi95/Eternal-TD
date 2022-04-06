import { TowerUpgrade } from "../../../TowerUpgrade";

export class TripleShot extends TowerUpgrade {
    public name = "Triple Shot";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNFanOfKnives.blp";
    public cost = 430;
    public description = "Shoot 3 arrows per attack.";

    private readonly tripleShotAbilityId: number = FourCC('A001');

    public applyUpgrade(unit: unit): void {
        UnitAddAbility(unit, this.tripleShotAbilityId);
    }
}