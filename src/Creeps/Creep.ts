import { Color } from "../Utility/Color";

export interface CreepDamageEvent {
    spawnedCreeps: Creep[];
    overflowingDamage: number;
}

const defaultCreepUnitTypeId: number = FourCC('u000');
export class Creep {
    public health = 1;
    public speed = 1;
    public unitTypeId: number = defaultCreepUnitTypeId;
    public color: Color = {r: 255, g: 255, b: 255, a: 255};
    protected children: Creep[] = [];
    protected _parent: Creep | null = null;

    public apply(unit: unit): void {
        SetUnitVertexColor(unit, this.color.r, this.color.g, this.color.b, this.color.a);
        SetUnitMoveSpeed(unit, GetUnitMoveSpeed(unit) * this.speed);

        if (this.health > 1) {
            BlzSetUnitMaxHP(unit, this.health);
            SetUnitLifePercentBJ(unit, 100);
        }
    }

    public dealLethalDamage(damageAmount: number): CreepDamageEvent {
        let spawnedCreeps: Creep[] = [];
        for (let i = 0; i < this.children.length && damageAmount > 0; i++) {
            this.children[i]._parent = this;
            const creepDamageEvent = this.children[i].dealDamage(damageAmount - this.health);
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
