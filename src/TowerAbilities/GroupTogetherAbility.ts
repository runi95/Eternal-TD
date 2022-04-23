import { Tower } from "Towers/Tower";
import { TowerAbility } from "./TowerAbility";

export class GroupTogetherAbility extends TowerAbility {
    public readonly name: string = "Group Together";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNEnchantedBears.blp";
    public readonly cooldown: number = 50;
    
    public applyAbilityEffect(_tower: Tower): void {
        print("TODO: Implement me!");
    }
}