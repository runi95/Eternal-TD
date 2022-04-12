import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

export class NightVision extends TowerUpgrade {
    public name = "Night Vision";
    public icon = "ReplaceableTextures\\CommandButtons\\BTNLocustSwarm.blp";
    public cost = 325;
    public description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        // TODO: Increase damage done to invisible units by +2

        // Allows targetting (wards) units with the invisiblity modifier
        BlzSetUnitWeaponIntegerField(tower.unit.handle, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, 0, 22);
    }
}