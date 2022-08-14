import { setUnitAttackTargetsAllowed, TargetFlags } from "../../../../Creeps/TargetFlags";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class NightVision extends TowerUpgrade {
    public readonly name = "Night Vision";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNShadeTrueSight.dds";
    public readonly cost = 325;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // TODO: Increase damage done to invisible units by +2

        setUnitAttackTargetsAllowed(tower.unit, 0, TargetFlags.GROUND, TargetFlags.AIR, TargetFlags.WARD);
    }
}
