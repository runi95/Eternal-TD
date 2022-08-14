import { setUnitAttackTargetsAllowed, TargetFlags } from "../../../../Creeps/TargetFlags";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class EnhancedEyesight extends TowerUpgrade {
    public readonly name = "Enhanced Eyesight";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNUltravision.blp";
    public readonly cost = 215;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        tower.unit.acquireRange = tower.unit.acquireRange + 80;

        // NOTE: For some reason index starts at 1 for the UNIT_WEAPON_RF_ATTACK_RANGE field and it adds range instead of setting it.
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_RANGE, 1, 80);
        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0, BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0) + 100);
        setUnitAttackTargetsAllowed(tower.unit, 0, TargetFlags.GROUND, TargetFlags.AIR, TargetFlags.WARD);
    }
}
