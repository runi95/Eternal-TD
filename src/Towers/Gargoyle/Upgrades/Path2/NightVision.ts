import { setUnitAttackTargetsAllowed, TargetFlags } from "../../../../Creeps/TargetFlags";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class NightVision extends TowerUpgrade {
    public name = "Night Vision";
    public icon = "ReplaceableTextures/CommandButtons/BTNShadeTrueSight.dds";
    public cost = 325;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // TODO: Increase damage done to invisible units by +2

        setUnitAttackTargetsAllowed(tower.unit, 0, TargetFlags.GROUND, TargetFlags.AIR, TargetFlags.WARD);
    }
}
