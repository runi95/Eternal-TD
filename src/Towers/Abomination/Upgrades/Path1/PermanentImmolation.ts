import { TowerUpgrade } from "../../../TowerUpgrade";

const diseaseCloudAbilityId: number = FourCC('A006');
const permanentImmolationAbilityId: number = FourCC('A007');
export class PermanentImmolation extends TowerUpgrade {
    public name = "Permanent Immolation";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNDeathPact.blp";
    public cost = 650;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        UnitRemoveAbility(unit, diseaseCloudAbilityId);
        UnitAddAbility(unit, permanentImmolationAbilityId);

        // NOTE: The rest of the effects of this upgrade happens in Abomination.ts
    }
}