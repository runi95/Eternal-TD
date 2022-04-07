import { TowerUpgrade } from "../../../TowerUpgrade";

export class FasterHurling extends TowerUpgrade {
    public name = "Faster Hurling";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNDispelMagic.blp";
    public cost = 270;
    public description = "TODO: Write description";

    public applyUpgrade(unit: unit): void {
        BlzSetUnitAttackCooldown(unit, BlzGetUnitAttackCooldown(unit, 0) * 0.75, 0);
    }
}