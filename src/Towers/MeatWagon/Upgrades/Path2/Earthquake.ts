import { EarthquakeAbility } from "../../../../TowerAbilities/EarthquakeAbility";
import { TowerAbility } from "../../../../TowerAbilities/TowerAbility";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class Earthquake extends TowerUpgrade {
    public readonly name = "Earthquake";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNEarthquake.blp";
    public readonly cost = 32400;
    public readonly description = "TODO: Write description";
    public readonly ability?: TowerAbility = new EarthquakeAbility();

    public applyUpgrade(tower: Tower): void {
        tower.largeVillagerBonusDamage += 9;
        tower.fortifiedVillagerBonusDamage += 3;
        tower.zeppelinVillagerBonusDamage += 3;
    }
}
