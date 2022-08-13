import { InvisibilityModifier } from "../Creeps/Modifiers/InvisibilityModifier";
import { Zeppelin } from "../Creeps/Normal/Zeppelin";
import { GameMap } from "../Game/GameMap";
import { Tower } from "../Towers/Tower";
import { Group } from "../Utility/Group";
import { StunUtils } from "../Utility/StunUtils";
import { TimerUtils } from "../Utility/TimerUtils";
import { Point, Trigger, Unit } from "w3ts";
import { Players } from "w3ts/globals";
import { TowerAbilityType } from "./TowerAbilityType";
import type { TowerAbility } from "./TowerAbility";
import { Timer } from "w3ts";
import { FortifiedVillager } from "../Creeps/Normal/FortifiedVillager";
import { ObsidianStatueCustomData } from "../Towers/ObsidianStatue/ObsidianStatue";
import { WhiteVillager } from "../Creeps/Normal/WhiteVillager";
import { ZebraVillager } from "../Creeps/Normal/ZebraVillager";

interface ActiveTowerAbility {
    towers: AbilityTowerMeta[];
    ability: TowerAbility;
    visibleCooldown: number;
    buttonIndex: number;
}

interface AbilityTowerMeta {
    tower: Tower;
    cooldown: number;
}

const skeletonArcherUnitTypeId: number = FourCC('h000');
const harpyRogueUnitTypeId: number = FourCC('h00E');
const greaterHarpyUnitTypeId: number = FourCC('h00F');
const attackAbilityId: number = FourCC('Aatk');
const zeppelinUnitTypeId: number = FourCC('u006');

const BUTTON_SIZE = 0.03;
const COOLDOWN_FRAME_SIZE = BUTTON_SIZE / 0.04;
const FRAME_START_POS_X = 0.24;
const FRAME_END_POS_X = 0.5625 + BUTTON_SIZE;
const FRAME_START_POS_Y = 0.155;
const MAX_FRAME_COUNT = 10;
const OS_KEYS = [OSKEY_1, OSKEY_2, OSKEY_3, OSKEY_4, OSKEY_5, OSKEY_6, OSKEY_7, OSKEY_8, OSKEY_9, OSKEY_0];
export class TowerAbilitySystem {
    private readonly towerAbilities: ActiveTowerAbility[][] = [];
    private readonly backdrops: framehandle[] = [];
    private readonly buttons: framehandle[] = [];
    private readonly tooltips: framehandle[] = [];
    private readonly cooldownFrames: framehandle[] = [];

    // TODO: Check for desyncs

    constructor() {
        Players.forEach(() => this.towerAbilities.push([]));

        const frameMargin = (FRAME_END_POS_X - FRAME_START_POS_X - (BUTTON_SIZE * MAX_FRAME_COUNT)) / (MAX_FRAME_COUNT - 1);
        for (let i = 0; i < MAX_FRAME_COUNT; i++) {
            const button: framehandle = BlzCreateFrameByType(
                'BUTTON',
                'button',
                BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
                'StandardButtonTemplate',
                0,
            );
            const backdrop: framehandle = BlzCreateFrameByType('BACKDROP', 'backdrop', button, 'ButtonBackdropTemplate', 0);
            BlzFrameSetSize(button, BUTTON_SIZE, BUTTON_SIZE);
            BlzFrameSetSize(backdrop, BUTTON_SIZE, BUTTON_SIZE);
            const x = FRAME_START_POS_X + i * BUTTON_SIZE + i * frameMargin;
            BlzFrameSetAbsPoint(button, FRAMEPOINT_CENTER, x, FRAME_START_POS_Y);
            BlzFrameSetPoint(backdrop, FRAMEPOINT_CENTER, button, FRAMEPOINT_CENTER, 0.0, 0.0);
            BlzFrameSetTexture(backdrop, 'ReplaceableTextures/CommandButtons/BTNFlakCannons.blp', 0, true);

            this.buttons.push(button);
            this.backdrops.push(backdrop);

            const cooldownFrame = BlzCreateFrameByType("STATUSBAR", "cooldown", button, "", 0);
            BlzFrameSetPoint(cooldownFrame, FRAMEPOINT_CENTER, button, FRAMEPOINT_CENTER, 0.0, 0.0);
            BlzFrameSetSize(cooldownFrame, 0.04, 0.04);
            BlzFrameSetScale(cooldownFrame, COOLDOWN_FRAME_SIZE);
            BlzFrameSetValue(cooldownFrame, 0);
            BlzFrameSetModel(cooldownFrame, "ui/feedback/cooldown/ui-cooldown-indicator.mdx", 0);
            BlzFrameSetVisible(cooldownFrame, false);
            this.cooldownFrames.push(cooldownFrame);

            const tooltipFrame = BlzCreateFrame("BoxedText", button, 0, 0);
            const textFrame = BlzCreateFrameByType("TEXT", "textFrame", tooltipFrame, '', 0);
            BlzFrameSetSize(textFrame, 0.25, 0);
            BlzFrameSetPoint(tooltipFrame, FRAMEPOINT_BOTTOMLEFT, textFrame, FRAMEPOINT_BOTTOMLEFT, -0.01, -0.01);
            BlzFrameSetPoint(tooltipFrame, FRAMEPOINT_TOPRIGHT, textFrame, FRAMEPOINT_TOPRIGHT, 0.01, 0.01);
            BlzFrameSetTooltip(button, tooltipFrame);
            BlzFrameSetPoint(textFrame, FRAMEPOINT_BOTTOM, button, FRAMEPOINT_TOP, 0, 0.01);
            this.tooltips.push(textFrame);

            BlzFrameSetVisible(button, false);

            const trig: Trigger = new Trigger();
            const cooldownButtonIndex = i;
            trig.addAction(() => {
                const abilityPlayerIndex = GetPlayerId(GetTriggerPlayer());
                if (this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex] !== undefined) {
                    const availableTowers = this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers.filter((tower) => tower.cooldown === 0);
                    if (availableTowers.length === 0)
                        return;

                    const isLastAbility = availableTowers.length === 1;
                    const tower: AbilityTowerMeta = availableTowers[0];

                    tower.cooldown = this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].ability.cooldown;

                    const abilityEffectResult = this.applyAbilityEffect(this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].ability.abilityType, tower.tower);
                    if (!abilityEffectResult) {
                        tower.cooldown = 0;
                        return;
                    }

                    const t: Timer = TimerUtils.newTimer();
                    t.start(1, true, () => {
                        tower.cooldown--;

                        if (tower.cooldown <= 0) {
                            TimerUtils.releaseTimer(t);
                        }
                    });

                    if (isLastAbility) {
                        const activeAbility = this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex];
                        let minCooldown = tower.cooldown;
                        for (let i = 0; i < this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers.length; i++) {
                            if (this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers[i].cooldown < minCooldown) {
                                minCooldown = this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers[i].cooldown;
                            }
                        }


                        activeAbility.visibleCooldown = minCooldown;

                        BlzFrameSetVisible(cooldownFrame, true);
                        const t: Timer = TimerUtils.newTimer();
                        t.start(0.1, true, () => {
                            activeAbility.visibleCooldown -= 0.1;
                            BlzFrameSetValue(this.cooldownFrames[activeAbility.buttonIndex], ((activeAbility.ability.cooldown - activeAbility.visibleCooldown) / activeAbility.ability.cooldown) * 100);

                            if (activeAbility.visibleCooldown <= 0) {
                                BlzFrameSetVisible(this.cooldownFrames[activeAbility.buttonIndex], false);
                                TimerUtils.releaseTimer(t);
                            }
                        });
                    }
                }
            });
            Players.forEach((player) => {
                trig.registerPlayerKeyEvent(player, OS_KEYS[cooldownButtonIndex], 0, true);
            });
        }
    }

    public addTowerAbility(playerIndex: number, tower: Tower, ability: TowerAbility): void {
        this.removeTowerAbility(playerIndex, tower);

        const abilTower = {
            tower,
            cooldown: ability.cooldown
        };

        let activeAbility: ActiveTowerAbility | undefined = undefined;
        for (let i = 0; i < this.towerAbilities[playerIndex].length; i++) {
            if (this.towerAbilities[playerIndex][i].ability.name === ability.name) {
                this.towerAbilities[playerIndex][i].towers.push(abilTower);
                activeAbility = this.towerAbilities[playerIndex][i];
                break;
            }
        }

        if (activeAbility === undefined) {
            activeAbility = {
                ability,
                towers: [abilTower],
                buttonIndex: this.towerAbilities[playerIndex].length,
                visibleCooldown: ability.cooldown,
            }
            this.towerAbilities[playerIndex].push(activeAbility);

            BlzFrameSetVisible(this.cooldownFrames[activeAbility.buttonIndex], true);

            const t: Timer = TimerUtils.newTimer();
            t.start(0.1, true, () => {
                activeAbility.visibleCooldown -= 0.1;
                BlzFrameSetValue(this.cooldownFrames[activeAbility.buttonIndex], ((activeAbility.ability.cooldown - activeAbility.visibleCooldown) / activeAbility.ability.cooldown) * 100);

                if (activeAbility.visibleCooldown <= 0) {
                    if (this.towerAbilities[playerIndex][activeAbility.buttonIndex].visibleCooldown <= 0) {
                        BlzFrameSetVisible(this.cooldownFrames[activeAbility.buttonIndex], false);
                    }
                    TimerUtils.releaseTimer(t);
                }
            });
        }

        const t: Timer = TimerUtils.newTimer();
        t.start(1, true, () => {
            abilTower.cooldown--;

            if (abilTower.cooldown <= 0) {
                TimerUtils.releaseTimer(t);
            }
        });

        this.render();
    }

    public render(): void {
        for (let i = 0; i < MAX_FRAME_COUNT; i++) {
            const playerIndex: number = GetPlayerId(GetLocalPlayer());
            let abilityIcon: string = "";
            let isVisible: boolean = false;
            let tooltipText: string = "";
            let isCooldownVisible: boolean = false;
            if (this.towerAbilities[playerIndex].length > i) {
                isVisible = true;
                abilityIcon = this.towerAbilities[playerIndex][i].ability.icon;
                tooltipText = `${this.towerAbilities[playerIndex][i].ability.name}|n|n${this.towerAbilities[playerIndex][i].ability.description}`;
                isCooldownVisible = this.towerAbilities[playerIndex][i].visibleCooldown > 0;
            }

            BlzFrameSetTexture(this.backdrops[i], abilityIcon, 0, true);
            BlzFrameSetVisible(this.buttons[i], isVisible);
            BlzFrameSetText(this.tooltips[i], tooltipText);
            BlzFrameSetVisible(this.cooldownFrames[i], isCooldownVisible);
        }
    }

    public removeTowerAbility(playerIndex: number, tower: Tower): void {
        let shift = -1;
        for (let i = 0; i < this.towerAbilities[playerIndex].length; i++) {
            for (let j = 0; j < this.towerAbilities[playerIndex][i].towers.length; j++) {
                if (this.towerAbilities[playerIndex][i].towers[j].tower === tower) {
                    const activeTower = this.towerAbilities[playerIndex][i].towers[j];
                    if (this.towerAbilities[playerIndex][i].towers.length > 1) {
                        this.towerAbilities[playerIndex][i].towers.splice(j, 1);

                        let minCooldown: number = this.towerAbilities[playerIndex][i].towers[0].cooldown;
                        for (let k = 1; k < this.towerAbilities[playerIndex][i].towers.length; k++) {
                            if (this.towerAbilities[playerIndex][i].towers[k].cooldown < minCooldown) {
                                minCooldown = this.towerAbilities[playerIndex][i].towers[k].cooldown;
                            }
                        }
                        this.towerAbilities[playerIndex][i].visibleCooldown = minCooldown;
                    } else {
                        this.towerAbilities[playerIndex][i].visibleCooldown = 0;
                        this.towerAbilities[playerIndex].splice(i, 1);
                        shift = i;
                    }

                    activeTower.cooldown = 0;
                    break;
                }
            }
        }

        if (shift > -1) {
            for (let i = shift; i < this.towerAbilities[playerIndex].length; i++) {
                this.towerAbilities[playerIndex][i].buttonIndex--;
            }
        }
    }

    private applyAbilityEffect(towerAbilityType: TowerAbilityType, tower: Tower): boolean {
        let wendigoSmashDamage = 750;
        let pandemicDamage = 1;
        let pandemicDuration = 30;
        let pandemicMaxUnitCount = 200;
        let snowstormDuration = 6;
        let snowstormBlizzard = false;

        switch (towerAbilityType) {
            case TowerAbilityType.HIRE_HARPY_ROGUES:
                const hireHarpyRogues = () => {
                    const units: Unit[] = [];
                    const dummyUnits: Unit[] = [];
                    const upgradeTower = (tower: Tower) => {
                        // Hide previous tower
                        tower.unit.show = false;
                        units.push(tower.unit);

                        // Create a dummy tower
                        const dummyUnit = new Unit(tower.unit.owner, harpyRogueUnitTypeId, tower.unit.x, tower.unit.y, tower.unit.facing, 0);
                        dummyUnit.setAttackCooldown(0.06, 0);
                        dummyUnits.push(dummyUnit);
                        const dummyTower = new Tower(dummyUnit, tower.towerType, tower.visibleRegions, tower.pathUpgrades);
                        const pathUpgrades = tower.pathUpgrades;
                        dummyUnit.disableAbility(attackAbilityId, false, true);
                        for (let i = 0; i < pathUpgrades.length; i++) {
                            for (let j = 0; j < pathUpgrades[i] && j < 2; j++) {
                                tower.towerType.upgrades[i][j].applyUpgrade(dummyTower);
                            }
                        }
                    };

                    DestroyEffect(AddSpecialEffect("Abilities/Spells/NightElf/BattleRoar/RoarCaster.mdl", tower.unit.x, tower.unit.y));

                    const grp: Group = Group.fromPlayerAndType(GetOwningPlayer(tower.unit.handle), skeletonArcherUnitTypeId);
                    let count = 0;
                    grp.for((u) => {
                        if (count > 8)
                            return;

                        if (!u.show)
                            return;

                        const uTower = GameMap.BUILT_TOWER_MAP.get(u.id);
                        if (uTower === undefined)
                            return;

                        if (uTower === tower)
                            return;

                        count++;
                        upgradeTower(uTower);
                    });
                    grp.destroy();

                    upgradeTower(tower);

                    const t: Timer = TimerUtils.newTimer();
                    t.start(15, false, () => {
                        for (let i = 0; i < units.length; i++) {
                            units[i].show = true;
                        }

                        for (let i = 0; i < dummyUnits.length; i++) {
                            dummyUnits[i].destroy();
                        }

                        TimerUtils.releaseTimer(t);
                    });

                    return true;
                }
                return hireHarpyRogues();
            case TowerAbilityType.HIRE_GREATER_HARPIES:
                const hireGreaterHarpies = () => {
                    const units: Unit[] = [];
                    const dummyUnits: Unit[] = [];
                    const upgradeTower = (tower: Tower) => {
                        // Hide previous tower
                        tower.unit.show = false;
                        units.push(tower.unit);

                        // Create a dummy tower
                        const dummyUnit = new Unit(tower.unit.owner, greaterHarpyUnitTypeId, tower.unit.x, tower.unit.y, tower.unit.facing, 0);
                        dummyUnit.setAttackCooldown(0.03, 0);
                        dummyUnits.push(dummyUnit);
                        const dummyTower = new Tower(dummyUnit, tower.towerType, tower.visibleRegions, tower.pathUpgrades);
                        const pathUpgrades = tower.pathUpgrades;
                        dummyUnit.disableAbility(attackAbilityId, false, true);
                        for (let i = 0; i < pathUpgrades.length; i++) {
                            for (let j = 0; j < pathUpgrades[i] && j < 2; j++) {
                                tower.towerType.upgrades[i][j].applyUpgrade(dummyTower);
                            }
                        }
                    };

                    DestroyEffect(AddSpecialEffect("Abilities/Spells/NightElf/BattleRoar/RoarCaster.mdl", tower.unit.x, tower.unit.y));

                    const grp: Group = Group.fromPlayerAndType(GetOwningPlayer(tower.unit.handle), skeletonArcherUnitTypeId);
                    let count = 0;
                    grp.for((u) => {
                        if (count > 8)
                            return;

                        if (!u.show)
                            return;

                        const uTower = GameMap.BUILT_TOWER_MAP.get(u.id);
                        if (uTower === undefined)
                            return;

                        if (uTower === tower)
                            return;

                        count++;
                        upgradeTower(uTower);
                    });
                    grp.destroy();

                    upgradeTower(tower);

                    const t: Timer = TimerUtils.newTimer();
                    t.start(15, false, () => {
                        for (let i = 0; i < units.length; i++) {
                            units[i].show = true;
                        }

                        for (let i = 0; i < dummyUnits.length; i++) {
                            dummyUnits[i].destroy();
                        }

                        TimerUtils.releaseTimer(t);
                    });

                    return true;
                };
                return hireGreaterHarpies();
            case TowerAbilityType.ZEPPELIN_CRUSH:
                wendigoSmashDamage = 4500;
            case TowerAbilityType.WENDIGO_SMASH:
                const wendigoSmash = () => {
                    let targ: Unit | undefined;
                    let targLife = 0;
                    const grp: Group = Group.fromPlayerAndType(Player(23), zeppelinUnitTypeId);
                    grp.for((u: Unit) => {
                        const uLife = u.life;
                        if (targ === undefined || uLife > targLife) {
                            targ = u,
                                targLife = uLife;
                        }
                    });
                    grp.destroy();

                    if (targ === undefined) {
                        return false;
                    }

                    tower.unit.damageTarget(targ.handle, wendigoSmashDamage, true, true, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                    const x: number = targ.x;
                    const y: number = targ.y;
                    DestroyEffect(AddSpecialEffect("Abilities/Spells/Human/Thunderclap/ThunderClapCaster.mdl", x, y));

                    const loc = new Point(x, y);
                    let unitCount = 0;
                    const thunderclapGroup: Group = Group.fromRange(120, loc);
                    thunderclapGroup.for((u: Unit) => {
                        if (unitCount > 99) {
                            return;
                        }

                        if (u.owner.id !== 23) {
                            return;
                        }

                        tower.unit.damageTarget(u.handle, 3, true, true, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                    });
                    thunderclapGroup.destroy();
                    loc.destroy();

                    return true;
                };
                return wendigoSmash();
            case TowerAbilityType.PLAGUE:
                pandemicDamage = 2;
                pandemicDuration = 90;
                pandemicMaxUnitCount = 500;
            case TowerAbilityType.PANDEMIC:
                const pandemic = () => {
                    const x = tower.unit.x;
                    const y = tower.unit.y;
                    let ticks = 0;
                    let unitCount = 0;
                    const t: Timer = TimerUtils.newTimer();
                    t.start(0.1, true, () => {
                        ticks++;

                        const loc = new Point(x, y);
                        const pandemicGrp: Group = Group.fromRange(1500, loc);
                        pandemicGrp.for((u) => {
                            if (unitCount >= pandemicMaxUnitCount)
                                return;

                            if (u.owner.id !== 23) {
                                return;
                            }

                            unitCount++;
                            tower.unit.damageTarget(u.handle, pandemicDamage, true, true, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                        });
                        pandemicGrp.destroy();
                        loc.destroy();

                        if (ticks > pandemicDuration || unitCount >= pandemicMaxUnitCount) {
                            TimerUtils.releaseTimer(t);
                        }
                    });

                    return true;
                };
                return pandemic();
            case TowerAbilityType.ABSOLUTE_ZERO:
                let snowstormDuration = 10;
                let snowstormBlizzard = true
            case TowerAbilityType.SNOWSTORM:
                const snowstorm = () => {
                    const x = tower.unit.x;
                    const y = tower.unit.y;
                    const { hasColdSnap } = tower.customData as ObsidianStatueCustomData;

                    const loc = new Point(x, y);
                    const group: Group = Group.fromRange(1500, loc);
                    group.for((u) => {
                        if (u.owner.id !== 23) {
                            return;
                        }

                        const unitId = u.id;
                        const creep = GameMap.SPAWNED_CREEP_MAP.get(unitId);
                        if (creep === undefined) return;
                        if (!snowstormBlizzard) {
                            if (creep.hasModifier(InvisibilityModifier.INVISIBILITY_MODIFIER)) {
                                snowstormDuration = 3;
                            } else {
                                switch (creep.creepBaseUnit.name) {
                                    case WhiteVillager.name:
                                    case ZebraVillager.name:
                                    case Zeppelin.name:
                                        snowstormDuration = 3;
                                    case FortifiedVillager.name:
                                        if (!hasColdSnap) return;
                                    default:
                                        break;
                                }
                            }
                        }

                        tower.unit.damageTarget(u.handle, 1, true, true, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                        StunUtils.freezeUnit(u, snowstormDuration, false, false, false, false);
                    });
                    group.destroy();
                    loc.destroy();

                    return true;
                };
                return snowstorm();
            case TowerAbilityType.ARTILLERY:
                const artillery = () => {
                    const currentCooldown: number = tower.unit.getAttackCooldown(0);
                    const currentAreaOfEffect = BlzGetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0);
                    BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, currentAreaOfEffect * 1.15);
                    tower.unit.setAttackCooldown(currentCooldown * 0.25, 0);

                    const t: Timer = TimerUtils.newTimer();
                    t.start(8, false, () => {
                        TimerUtils.releaseTimer(t);

                        const currentCooldown: number = tower.unit.getAttackCooldown(0);
                        BlzSetUnitWeaponRealField(tower.unit.handle, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0, currentAreaOfEffect);
                        tower.unit.setAttackCooldown(currentCooldown * 4, 0);
                    });

                    return true;
                };
                return artillery();
            case TowerAbilityType.EARTHQUAKE:
                const earthquake = () => {
                    let ticks = 8;
                    const t: Timer = TimerUtils.newTimer();
                    t.start(1, true, () => {
                        ticks--;

                        const x = tower.unit.x;
                        const y = tower.unit.y;

                        DestroyEffect(AddSpecialEffect("Abilities/Spells/Orc/EarthQuake/EarthQuakeTarget.mdl", x, y));

                        const loc = new Point(x, y);
                        const group: Group = Group.fromRange(1500, loc);
                        group.for((u) => {
                            if (u.owner.id !== 23) {
                                return;
                            }

                            const creep = GameMap.SPAWNED_CREEP_MAP.get(u.id);
                            if (creep === undefined) return;

                            tower.unit.damageTarget(u.handle, 20, false, false, ATTACK_TYPE_SIEGE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS);
                            StunUtils.stunUnit(u.handle, 0.9);
                        });
                        group.destroy();
                        loc.destroy();

                        if (ticks <= 0) {
                            TimerUtils.releaseTimer(t);
                        }
                    })


                    return true;
                };
                return earthquake();
            default:
                print(`ERROR: Unimplemented ability type '${towerAbilityType}'`);
                return false;
        }
    }
}
