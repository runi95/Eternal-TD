import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { AbominationCustomData } from "../../Abomination";

const diseaseCloudAbilityId: number = FourCC('A006');
const permanentImmolationAbilityId: number = FourCC('A007');
export class PermanentImmolation extends TowerUpgrade {
    public readonly name = "Permanent Immolation";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNDeathPact.blp";
    public readonly cost = 650;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.removeAbility(diseaseCloudAbilityId);
        tower.unit.addAbility(permanentImmolationAbilityId);

        (tower.customData as AbominationCustomData).damageAmount += 1;
    }
}
