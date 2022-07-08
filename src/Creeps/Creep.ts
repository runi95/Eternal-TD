import { GameMap } from "Game/GameMap";
import { MapPlayer, Unit } from "w3ts";
import { CreepBaseUnit } from "./CreepBaseUnit";
import { DefenseTypes } from "./DefenseTypes";
import { TargetFlags } from "./TargetFlags";
import { CreepDefaults } from "./CreepDefaults";
import { CreepModifier } from "./CreepModifier";
import { Color } from "Utility/Color";
import { Scale } from "Utility/Scale";

export interface CreepDamageEvent {
    spawnedCreeps: CreepBaseUnit[];
    overflowingDamage: number;
}

export type Parent = {
    parent: Parent;
    creepBaseUnit: CreepBaseUnit;
} | null;

export class Creep {
    public readonly unitId: number;
    public currentRegion: number | null = null;

    private readonly modifiers: CreepModifier[];
    private readonly modifierNameCheckMap: Map<string, boolean> = new Map();
    private readonly unit: Unit;
    private _nextCheckpointIndex: number;
    private _creepBaseUnit: CreepBaseUnit;
    private _parent: Parent;

    // Precalculated modifier values
    private readonly healthAddend: number;
    private readonly healthMultiplier: number;
    private readonly colorMask: Color;
    private readonly scaleOverride: Scale;
    private readonly defenseTypeOverride: DefenseTypes | undefined;
    private readonly targetAsOverride: TargetFlags | undefined;

    public static spawn(creepBaseUnit: CreepBaseUnit, modifiers: CreepModifier[] = [], nextCheckpointIndex: number = 1, x?: number, y?: number, face: number = 0): void {
        new Creep(creepBaseUnit, null, modifiers, nextCheckpointIndex, x, y, face);
    }

    private constructor(creepBaseUnit: CreepBaseUnit, parent: Parent, modifiers: CreepModifier[], nextCheckpointIndex: number, x: number, y: number, face: number) {
        this._creepBaseUnit = creepBaseUnit;
        this._parent = parent;
        this._nextCheckpointIndex = nextCheckpointIndex;
        this.modifiers = modifiers;
        this.unit = new Unit(MapPlayer.fromIndex(23), creepBaseUnit.unitTypeId, x || GameMap.CHECKPOINTS[0].x, y || GameMap.CHECKPOINTS[0].y, face);
        this.unitId = this.unit.id;

        if (creepBaseUnit.unitSkinTypeId !== CreepDefaults.UNIT_SKIN_TYPE_ID) {
            this.unit.skin = creepBaseUnit.unitSkinTypeId;
        }

        let rMask = 1;
        let gMask = 1;
        let bMask = 1;
        let aMask = 1;
        let healthAddend = 0;
        let healthMultiplier = 0;
        let defenseTypeOverride: DefenseTypes | undefined;
        let targetAsOverride: TargetFlags | undefined;
        let scaleOverride: Scale | undefined;
        const applyEffects: ((unit: Unit) => void)[] = [];
        for (const modifier of this.modifiers) {
            this.modifierNameCheckMap.set(modifier.name, true);
            if (modifier.colorMask !== undefined) {
                rMask *= modifier.colorMask.r;
                gMask *= modifier.colorMask.g;
                bMask *= modifier.colorMask.b;
                aMask *= modifier.colorMask.a;
            }

            if (modifier.healthAddend !== undefined) healthAddend += modifier.healthAddend;
            if (modifier.healthMultiplier !== undefined) healthMultiplier += modifier.healthMultiplier;
            if (modifier.defenseTypeOverride !== undefined) defenseTypeOverride = modifier.defenseTypeOverride;
            if (modifier.targetAsOverride !== undefined) targetAsOverride = modifier.targetAsOverride;
            if (modifier.scaleOverride !== undefined) scaleOverride = modifier.scaleOverride;
            if (modifier.applyEffect !== undefined) applyEffects.push(modifier.applyEffect);
        }

        this.colorMask = { r: rMask, g: gMask, b: bMask, a: aMask };
        this.healthAddend = healthAddend;
        this.healthMultiplier = Math.max(healthMultiplier, 1);
        this.defenseTypeOverride = defenseTypeOverride;
        this.targetAsOverride = targetAsOverride;
        this.scaleOverride = scaleOverride;

        this.applyStats();

        for (const applyEffect of applyEffects) {
            (applyEffect as any)(this.unit); // FIXME: Why do we have to do "as any" here?
        }

        this.unit.issueOrderAt("move", GameMap.CHECKPOINTS[nextCheckpointIndex].x, GameMap.CHECKPOINTS[nextCheckpointIndex].y);
        this.unit.setExploded(true);

        GameMap.SPAWNED_CREEP_MAP.set(this.unitId, this);
    }

    public hasModifier(modifier: CreepModifier): boolean {
        return !!this.modifierNameCheckMap.get(modifier.name);
    }

    public regrow(): void {
        if (this._parent === null) return;
        this._creepBaseUnit = this._parent.creepBaseUnit;
        this._parent = this._parent.parent;
        this.applyStats();
    }

    public dealLethalDamage(damageAmount: number): number {
        let spawnedCreeps: CreepBaseUnit[] = [];
        for (let i = 0; i < this._creepBaseUnit.children.length; i++) {
            const creepDamageEvent = this.dealDamageToBaseUnits(this._creepBaseUnit.children[i], damageAmount);
            damageAmount = creepDamageEvent.overflowingDamage;
            spawnedCreeps = spawnedCreeps.concat(creepDamageEvent.spawnedCreeps);
        }

        let isUnitReused = false;
        const newParent = { parent: this._parent, creepBaseUnit: this._creepBaseUnit };
        for (let i = 0; i < spawnedCreeps.length; i++) {
            if (i === 0 && spawnedCreeps[0].unitTypeId === this._creepBaseUnit.unitTypeId) {
                isUnitReused = true;
                this._parent = newParent;
                this._creepBaseUnit = spawnedCreeps[0];
                this.applyStats();
            } else {
                new Creep(spawnedCreeps[i], newParent, this.modifiers, this._nextCheckpointIndex, this.unit.x, this.unit.y, this.unit.facing);
            }
        }

        return isUnitReused ? damageAmount : -1;
    }

    public dealDamageToBaseUnits(creepBaseUnit: CreepBaseUnit, damageAmount: number): CreepDamageEvent {
        const modifiedHealth = (creepBaseUnit.health + this.healthAddend) * this.healthMultiplier;
        if (damageAmount < modifiedHealth) {
            return { spawnedCreeps: [creepBaseUnit], overflowingDamage: damageAmount };
        }

        damageAmount -= modifiedHealth;

        let spawnedCreeps: CreepBaseUnit[] = [];
        for (let i = 0; i < this._creepBaseUnit.children.length && damageAmount > 0; i++) {
            const creepDamageEvent = this.dealDamageToBaseUnits(this._creepBaseUnit.children[i], damageAmount);
            damageAmount = creepDamageEvent.overflowingDamage;
            spawnedCreeps = spawnedCreeps.concat(creepDamageEvent.spawnedCreeps);
        }

        return { spawnedCreeps, overflowingDamage: damageAmount };
    }

    public get creepBaseUnit(): CreepBaseUnit {
        return this._creepBaseUnit;
    }

    public get nextCheckpointIndex(): number {
        return this._nextCheckpointIndex;
    }

    public set nextCheckpointIndex(nextCheckpointIndex: number) {
        this.unit.issueOrderAt("move", GameMap.CHECKPOINTS[nextCheckpointIndex].x, GameMap.CHECKPOINTS[nextCheckpointIndex].y);
        this._nextCheckpointIndex = nextCheckpointIndex;
    }

    private get color(): Color {
        return {
            r: Math.round(this._creepBaseUnit.color.r * this.colorMask.r),
            g: Math.round(this._creepBaseUnit.color.g * this.colorMask.g),
            b: Math.round(this._creepBaseUnit.color.b * this.colorMask.b),
            a: Math.round(this._creepBaseUnit.color.a * this.colorMask.a)
        };
    }

    private applyStats() {
        const creepColor = this.color;
        this.unit.setVertexColor(creepColor.r, creepColor.g, creepColor.b, creepColor.a);

        const scale = this.scaleOverride || this._creepBaseUnit.scale;
        if (scale.x !== CreepDefaults.SCALE.x || scale.y !== CreepDefaults.SCALE.y || scale.z !== CreepDefaults.SCALE.z) {
            this.unit.setScale(scale.x, scale.y, scale.z);
        }

        const creepMoveSpeed = this._creepBaseUnit.moveSpeed;
        if (creepMoveSpeed !== CreepDefaults.MOVE_SPEED) {
            this.unit.moveSpeed = creepMoveSpeed;
        }

        const creepHealth = (this._creepBaseUnit.health + this.healthAddend) * this.healthMultiplier;
        if (creepHealth > CreepDefaults.HEALTH) {
            this.unit.maxLife = creepHealth;
            this.unit.life = creepHealth;
        }

        const creepDefenseType = this.defenseTypeOverride || this.creepBaseUnit.defenseType || CreepDefaults.DEFENSE_TYPE;
        if (creepDefenseType !== CreepDefaults.DEFENSE_TYPE) {
            BlzSetUnitIntegerField(this.unit.handle, UNIT_IF_DEFENSE_TYPE, creepDefenseType);
        }

        const creepTargetAs = this.targetAsOverride || this.creepBaseUnit.targetAs || CreepDefaults.TARGET_AS_FLAG;
        if (creepTargetAs !== CreepDefaults.TARGET_AS_FLAG) {
            BlzSetUnitIntegerField(this.unit.handle, UNIT_IF_TARGETED_AS, creepTargetAs);
        }
    }
}
