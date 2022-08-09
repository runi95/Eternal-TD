import { GameMap } from "../Game/GameMap";
import { Effect, MapPlayer, Unit } from "w3ts";
import { DefenseTypes } from "./DefenseTypes";
import { TargetFlags } from "./TargetFlags";
import { CreepDefaults } from "./CreepDefaults";
import { OverflowProtectionModifier } from "./Modifiers/OverflowProtectionModifier";
import { BlinkModifier } from "./Modifiers/BlinkModifier";
import { DecoyModifier } from "./Modifiers/DecoyModifier";
import { Globals } from "../Utility/Globals";
import { RandomNumberGenerator } from "../Utility/RandomNumberGenerator";
import { LastStandModifier } from "./Modifiers/LastStandModifier";
import type { Color } from "../Utility/Color";
import type { Scale } from "../Utility/Scale";
import type { CreepModifier } from "./CreepModifier";
import type { CreepBaseUnit } from "./CreepBaseUnit";
import { MapRegionController } from "../Game/MapRegionController";

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

    private readonly modifiers: CreepModifier[];
    private readonly modifierNameCheckMap: Map<string, boolean> = new Map();
    private readonly unit: Unit;
    private _nextCheckpointIndex: number;
    private _creepBaseUnit: CreepBaseUnit;
    private _parent: Parent;
    private _currentRegionId: number | null = null;

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

    // Static only class
    protected constructor(creepBaseUnit: CreepBaseUnit, parent: Parent, modifiers: CreepModifier[], nextCheckpointIndex: number, x: number, y: number, face: number) {
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
            applyEffect(this.unit);
        }

        this.unit.issueOrderAt("move", GameMap.CHECKPOINTS[nextCheckpointIndex].x, GameMap.CHECKPOINTS[nextCheckpointIndex].y);
        this.unit.setExploded(true);

        GameMap.SPAWNED_CREEP_MAP.set(this.unitId, this);
    }

    public hasModifier(modifier: CreepModifier): boolean {
        return !!this.modifierNameCheckMap.get(modifier.name);
    }

    public removeModifier(modifier: CreepModifier): boolean {
        const creepModifier = this.modifierNameCheckMap.get(modifier.name);
        if (!creepModifier) return false;

        const res = this.modifierNameCheckMap.delete(modifier.name);
        return res;
    }

    public regrow(): void {
        if (this._parent === null) return;
        this._creepBaseUnit = this._parent.creepBaseUnit;
        this._parent = this._parent.parent;
        this.applyStats();
    }

    public dealLethalDamage(damageAmount: number, ignoreModifiers: boolean = false): number {
        const x = this.unit.x;
        const y = this.unit.y;
        const facing = this.unit.facing;

        let spawnedCreeps: CreepBaseUnit[] = [];
        if (!ignoreModifiers && this.hasModifier(OverflowProtectionModifier.OVERFLOW_PROTECTION_MODIFIER)) {
            spawnedCreeps = this._creepBaseUnit.children;
            damageAmount = 0;
            this.modifierNameCheckMap.delete(OverflowProtectionModifier.OVERFLOW_PROTECTION_MODIFIER.name);
        } else {
            for (let i = 0; i < this._creepBaseUnit.children.length; i++) {
                const creepDamageEvent = this.dealDamageToBaseUnits(this._creepBaseUnit.children[i], damageAmount);
                damageAmount = creepDamageEvent.overflowingDamage;
                spawnedCreeps = spawnedCreeps.concat(creepDamageEvent.spawnedCreeps);
            }
        }

        if (!ignoreModifiers && spawnedCreeps.length === 0 && this.hasModifier(LastStandModifier.LAST_STAND_MODIFIER)) {
            this.modifierNameCheckMap.delete(LastStandModifier.LAST_STAND_MODIFIER.name);
            return 0;
        }

        GameMap.PLAYER_GOLD_TO_DISTRIBUTE++;

        let isUnitReused = false;
        const newParent = { parent: this._parent, creepBaseUnit: this._creepBaseUnit };
        for (let i = 0; i < spawnedCreeps.length; i++) {
            if (i === 0 && spawnedCreeps[0].unitTypeId === this._creepBaseUnit.unitTypeId) {
                isUnitReused = true;
                this._parent = newParent;
                this._creepBaseUnit = spawnedCreeps[0];
                this.applyStats();
            } else {
                new Creep(spawnedCreeps[i], newParent, this.modifiers, this._nextCheckpointIndex, x, y, facing);
            }
        }

        if (!ignoreModifiers && spawnedCreeps.length === 0 && this.hasModifier(DecoyModifier.DECOY_MODIFIER) && RandomNumberGenerator.random(1, 4) === 4) {
            const eff = new Effect("Abilities/Spells/Human/Polymorph/PolyMorphTarget.mdl", x, y);
            const decoy = new Unit(MapPlayer.fromIndex(23), DecoyModifier.DECOY_UNIT_ID, x, y, facing);
            decoy.setExploded(true);
            decoy.applyTimedLife(Globals.TIMED_LIFE_BUFF_ID, 3);
            eff.destroy();
        }

        return isUnitReused ? (this._creepBaseUnit.health + this.healthAddend) * this.healthMultiplier - damageAmount : -damageAmount;
    }

    public dealDamageToBaseUnits(creepBaseUnit: CreepBaseUnit, damageAmount: number): CreepDamageEvent {
        const modifiedHealth = (creepBaseUnit.health + this.healthAddend) * this.healthMultiplier;
        if (damageAmount < modifiedHealth) {
            return { spawnedCreeps: [creepBaseUnit], overflowingDamage: damageAmount };
        }

        GameMap.PLAYER_GOLD_TO_DISTRIBUTE++;
        damageAmount -= modifiedHealth;

        let spawnedCreeps: CreepBaseUnit[] = [];
        for (let i = 0; i < creepBaseUnit.children.length; i++) {
            const creepDamageEvent = this.dealDamageToBaseUnits(creepBaseUnit.children[i], damageAmount);
            damageAmount = creepDamageEvent.overflowingDamage;
            spawnedCreeps = spawnedCreeps.concat(creepDamageEvent.spawnedCreeps);
        }

        return { spawnedCreeps, overflowingDamage: damageAmount };
    }

    public get currentRegionId(): number {
        return this._currentRegionId;
    }

    public set currentRegionId(currentRegion: number) {
        this._currentRegionId = currentRegion;
        MapRegionController.REGIONS[this._currentRegionId].triggerCreepEnterEvents(this.unit);
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

        if (nextCheckpointIndex % 2 === 0 && this.hasModifier(BlinkModifier.BLINK_MODIFIER)) {
            const currentX = this.unit.x;
            const currentY = this.unit.y;
            const targetX = GameMap.CHECKPOINTS[nextCheckpointIndex].x;
            const targetY = GameMap.CHECKPOINTS[nextCheckpointIndex].y;

            const dist = Math.sqrt(Math.pow(targetX - currentX, 2) + Math.pow(targetY - currentY, 2));

            const dx = targetX - currentX;
            const dy = targetY - currentY;
            const newX = currentX + (dx / dist) * BlinkModifier.BLINK_DISTANCE;
            const newY = currentY + (dy / dist) * BlinkModifier.BLINK_DISTANCE;

            this.unit.x = newX;
            this.unit.y = newY;
            DestroyEffect(AddSpecialEffect('Abilities/Spells/NightElf/Blink/BlinkTarget.mdl', currentX, currentY));
            DestroyEffect(AddSpecialEffect('Abilities/Spells/NightElf/Blink/BlinkCaster.mdl', newX, newY));

            // this.modifierNameCheckMap.delete(BlinkModifier.BLINK_MODIFIER.name);
        }
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
