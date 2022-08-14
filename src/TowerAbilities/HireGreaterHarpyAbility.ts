import { TowerAbility } from "./TowerAbility";

export class HireGreaterHarpyAbility extends TowerAbility {
    public readonly name: string = "Hire Greater Harpies";
    public readonly description: string = "Groups every archer tower together to increase their awesome power.";
    public readonly icon: string = "ReplaceableTextures/CommandButtons/BTNEnchantedBears.blp";
    public readonly cooldown: number = 50;
}
