import { setUnitAttackTargetsAllowed, TargetFlags } from "../../../../Creeps/TargetFlags";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";
import { ObsidianStatueCustomData } from "../../ObsidianStatue";

export class IcicleImpale extends TowerUpgrade {
    public readonly name = "Icicle Impale";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNFrostBolt.blp";
    public readonly cost = 32400;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as ObsidianStatueCustomData).hasIcicles = true;
        tower.zeppelinVillagerBonusDamage += 48;

        tower.unit.setAttackCooldown(tower.unit.getAttackCooldown(0) * 0.75, 0);
        setUnitAttackTargetsAllowed(tower.unit, 0, TargetFlags.GROUND, TargetFlags.AIR);
    }
} 
