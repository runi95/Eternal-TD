import { TowerAbility } from "./TowerAbility";
import { TowerAbilityType } from "./TowerAbilityType";

export class HireHarpyRoguesAbility extends TowerAbility {
    public readonly name: string = "Hire Harpy Rogues";
    public readonly description: string = "Groups every archer tower together to increase their awesome power.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNBattleRoar.blp";
    public readonly cooldown: number = 50;
    public readonly abilityType: TowerAbilityType = TowerAbilityType.HIRE_HARPY_ROGUES;
}
