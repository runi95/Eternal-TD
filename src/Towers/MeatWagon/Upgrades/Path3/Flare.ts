import { setUnitAttackAreaOfEffectTargetsAllowed, setUnitAttackTargetsAllowed, TargetFlags } from "../../../../Creeps/TargetFlags";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { MeatWagoCustomData } from "../../MeatWagon";

export class Flare extends TowerUpgrade {
    public readonly name = "Flare";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNFlare.blp";
    public readonly cost = 755;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as MeatWagoCustomData).hasFlare = true;

        setUnitAttackTargetsAllowed(tower.unit, 0, TargetFlags.GROUND + TargetFlags.AIR + TargetFlags.WARD);
        setUnitAttackAreaOfEffectTargetsAllowed(tower.unit, 0, TargetFlags.GROUND + TargetFlags.AIR + TargetFlags.WARD);
    }
}
