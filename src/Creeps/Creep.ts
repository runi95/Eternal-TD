import { Color } from "../Utility/Color";
import { CreepType } from "./CreepType";
import { DefenseTypes } from "./DefenseTypes";
import { TargetFlags } from "./TargetFlags";

export interface CreepDamageEvent {
    spawnedCreeps: Creep[];
    overflowingDamage: number;
}

const defaultCreepUnitTypeId: number = FourCC('u000');
const creepBaseSpeed = 280.0;
const defaultTargetAsFlag = TargetFlags.GROUND;
const defaultDefenseType = DefenseTypes.MEDIUM;
export class Creep {
    public health = 1;
    public speed = 1;
    public unitTypeId: number = defaultCreepUnitTypeId;
    public color: Color = {r: 255, g: 255, b: 255, a: 255};
    public defenseType: DefenseTypes = defaultDefenseType;
    public targetAs: TargetFlags = defaultTargetAsFlag;
    public readonly creepType: CreepType | null = null;
    protected children: Creep[] = [];
    protected _parent: Creep | null = null;

    public apply(unit: unit): void {
        SetUnitVertexColor(unit, this.color.r, this.color.g, this.color.b, this.color.a);
        SetUnitMoveSpeed(unit, creepBaseSpeed * this.speed);

        if (this.health > 1) {
            BlzSetUnitMaxHP(unit, this.health);
            SetUnitLifePercentBJ(unit, 100);
        }

        if (this.defenseType !== defaultDefenseType) {
            BlzSetUnitIntegerField(unit, UNIT_IF_DEFENSE_TYPE, this.defenseType);
        }

        if (this.targetAs !== defaultTargetAsFlag) {
            BlzSetUnitIntegerField(unit, UNIT_IF_TARGETED_AS, this.targetAs);
        }
    }

    public dealLethalDamage(damageAmount: number): CreepDamageEvent {
        let spawnedCreeps: Creep[] = [];
        for (let i = 0; i < this.children.length; i++) {
            this.children[i]._parent = this;
            const creepDamageEvent = this.children[i].dealDamage(damageAmount);
            damageAmount = creepDamageEvent.overflowingDamage;
            spawnedCreeps = spawnedCreeps.concat(creepDamageEvent.spawnedCreeps);
        }

        return { spawnedCreeps, overflowingDamage: damageAmount };
    }

    public dealDamage(damageAmount: number): CreepDamageEvent {
        if (damageAmount < this.health) {
            return { spawnedCreeps: [this], overflowingDamage: damageAmount };
        }

        let spawnedCreeps: Creep[] = [];
        for (let i = 0; i < this.children.length && damageAmount > 0; i++) {
            this.children[i]._parent = this;
            const creepDamageEvent = this.children[i].dealDamage(damageAmount - this.health);
            damageAmount = creepDamageEvent.overflowingDamage;
            spawnedCreeps = spawnedCreeps.concat(creepDamageEvent.spawnedCreeps);
        }

        return { spawnedCreeps, overflowingDamage: damageAmount };
    }

    public get parent(): Creep | null {
        return this._parent;
    }
}
