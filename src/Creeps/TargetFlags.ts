import { Unit } from "../../node_modules/w3ts/index";

export enum TargetFlags {
    NONE = 0,
    GROUND = 2,
    AIR = 4,
    STRUCTURE = 8,
    WARD = 16,
    ITEM = 32,
    TREE = 64,
    WALL = 128,
    DEBRIS = 256,
    DECORATION = 512,
    BRIDGE = 1024,
}

export function setUnitAttackTargetsAllowed(unit: Unit, weaponIndex: number, ...allowedTargets: TargetFlags[]) {
    BlzSetUnitWeaponIntegerField(unit.handle, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, weaponIndex, allowedTargets.reduce((acc, curr) => acc + curr, 0));
}
