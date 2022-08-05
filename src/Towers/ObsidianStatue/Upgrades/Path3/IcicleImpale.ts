import { setUnitAttackTargetsAllowed, TargetFlags } from "../../../../Creeps/TargetFlags";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class IcicleImpale extends TowerUpgrade {
    public name = "Icicle Impale";
    public icon = "ReplaceableTextures/CommandButtons/BTNIceShard.blp";
    public cost = 32400;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasIcicles = true;
        tower.zeppelinVillagerBonusDamage += 48;

        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.75, 0);
        setUnitAttackTargetsAllowed(tower.unit, 0, TargetFlags.GROUND, TargetFlags.AIR);
    }
} 
