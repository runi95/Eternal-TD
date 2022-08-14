import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class FasterMagic extends TowerUpgrade {
    public readonly name = "Faster Magic";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNAnimalWarTraining.blp";
    public readonly cost = 160;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0, BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 450);
    }
}
