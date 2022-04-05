import { TowerUpgrade } from "../../../TowerUpgrade";

export class FasterHurling extends TowerUpgrade {
    public name = "Faster Hurling";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNScatterRockets.blp";
    public cost = 270;
    public description = "Hurl the rocks at a faster pace.";

    public applyUpgrade(unit: unit): void {
        BlzSetUnitAttackCooldown(unit, BlzGetUnitAttackCooldown(unit, 0) * 0.75, 0);
    }
}