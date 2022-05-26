import { TowerAbility } from "./TowerAbility";
import { TowerAbilityType } from "./TowerAbilityType";

export class AbsoluteZeroAbility extends TowerAbility {
    public readonly name: string = "Absolute Zero";
    public readonly description: string = "Damages and freezes all creeps for 10 seconds.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNBreathOfFrost.blp";
    public readonly cooldown: number = 20;
    public readonly abilityType: TowerAbilityType = TowerAbilityType.ABSOLUTE_ZERO;
}