import { TowerUpgrade } from "../../../TowerUpgrade";

export class SkeletalHammer extends TowerUpgrade {
    public name = "Skeletal Hammer";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNBash.blp";
    public cost = 3890;
    public description = "Throw really big hammers that stun any units hit by the hammer or its explosions";
    public newUnitTypeId: number = FourCC('h006');

    // TODO: Make sure this upgrade does allow for infinite stuns!
    public applyUpgrade(_unit: unit): void {
        return;
    }
}