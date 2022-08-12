import { TowerAbility } from "./TowerAbility";
import { TowerAbilityType } from "./TowerAbilityType";

export class ZeppelinCrushAbility extends TowerAbility {
    public readonly name: string = "Zeppelin Crush";
    public readonly description: string = "Crushes the strongest Zeppelin on the map into several pieces.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNControlMagic.blp";
    public readonly cooldown: number = 10;
    public readonly abilityType: TowerAbilityType = TowerAbilityType.ZEPPELIN_CRUSH;
}
