import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import type { GargoyleCustomData } from "../../Gargoyle";

const obsidianFormAbilityId: number = FourCC('A00H');
export class ObsidianForm extends TowerUpgrade {
    public readonly name = "Obsidian Form";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNStoneForm.blp";
    public readonly cost = 7775;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as GargoyleCustomData).hasObsidianForm = true;
        tower.unit.setVertexColor(100, 100, 100, 255);
        tower.unit.addAbility(obsidianFormAbilityId);
        tower.unit.hideAbility(obsidianFormAbilityId, true);
    }
}
