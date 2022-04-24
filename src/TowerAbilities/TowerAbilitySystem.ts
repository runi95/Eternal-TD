import { Tower } from "Towers/Tower";
import { Group } from "Utility/Group";
import { TimerUtils } from "Utility/TimerUtils";
import { Timer, Trigger, Unit } from "w3ts";
import { Players } from "w3ts/globals";
import { TowerAbility } from "./TowerAbility";
import { TowerAbilityType } from "./TowerAbilityType";

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
const archerSquadUnitTypeId: number = FourCC('h00E');
const attackAbilityId: number = FourCC('Aatk');

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
    private readonly timerUtils: TimerUtils;
    private readonly towers: Map<number, Tower>;

    // TODO: Check for desyncs

    constructor(timerUtils: TimerUtils, towers: Map<number, Tower>) {
        this.timerUtils = timerUtils;
        this.towers = towers;

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

                    this.applyAbilityEffect(this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].ability.abilityType, tower.tower);

                    const t: Timer = this.timerUtils.newTimer();
                    t.start(1, true, () => {
                        tower.cooldown--;

                        if (tower.cooldown <= 0) {
                            this.timerUtils.releaseTimer(t);
                        }
                    });

                    if (isLastAbility) {
                        const activeAbility = this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex];
                        let minCooldown = tower.cooldown;
                        for(let i = 0; i < this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers.length; i++) {
                            if (this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers[i].cooldown < minCooldown) {
                                minCooldown = this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers[i].cooldown;
                            }
                        }

                        
                        activeAbility.visibleCooldown = minCooldown;

                        BlzFrameSetVisible(cooldownFrame, true);
                        const t: Timer = this.timerUtils.newTimer();
                        t.start(0.1, true, () => {
                            activeAbility.visibleCooldown -= 0.1;
                            BlzFrameSetValue(this.cooldownFrames[activeAbility.buttonIndex], ((activeAbility.ability.cooldown - activeAbility.visibleCooldown) / activeAbility.ability.cooldown) * 100);

                            if (activeAbility.visibleCooldown <= 0) {
                                BlzFrameSetVisible(this.cooldownFrames[activeAbility.buttonIndex], false);
                                this.timerUtils.releaseTimer(t);
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
        for(let i = 0; i < this.towerAbilities[playerIndex].length; i++) {
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

            const t: Timer = this.timerUtils.newTimer();
            t.start(0.1, true, () => {
                activeAbility.visibleCooldown -= 0.1;
                BlzFrameSetValue(this.cooldownFrames[activeAbility.buttonIndex], ((activeAbility.ability.cooldown - activeAbility.visibleCooldown) / activeAbility.ability.cooldown) * 100);

                if (activeAbility.visibleCooldown <= 0) {
                    BlzFrameSetVisible(this.cooldownFrames[activeAbility.buttonIndex], false);
                    this.timerUtils.releaseTimer(t);
                }
            });
        }

        const t: Timer = this.timerUtils.newTimer();
        t.start(1, true, () => {
            abilTower.cooldown--;

            if (abilTower.cooldown <= 0) {
                this.timerUtils.releaseTimer(t);
            }
        });

        this.render();
    }

    public render(): void {
        for(let i = 0; i < MAX_FRAME_COUNT; i++) {
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

    private applyAbilityEffect(towerAbilityType: TowerAbilityType, tower: Tower): void {
        switch (towerAbilityType) {
            case TowerAbilityType.HIRE_HARPY_ROGUES:
                const units: Unit[] = [];
                const dummyUnits: Unit[] = [];
                const upgradeTower = (tower: Tower) => {
                    // Hide previous tower
                    tower.unit.show = false;
                    units.push(tower.unit);
                    
                    // Create a dummy tower
                    const dummyUnit = new Unit(tower.unit.owner, archerSquadUnitTypeId, tower.unit.x, tower.unit.y, tower.unit.facing, 0);
                    dummyUnit.setAttackCooldown(0.06, 0);
                    dummyUnits.push(dummyUnit);
                    const dummyTower = new Tower(dummyUnit, tower.towerType, tower.pathUpgrades);
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

                    const uTower = this.towers.get(u.id);
                    if (uTower === undefined)
                        return;

                    if (uTower === tower)
                        return;

                    count++;
                    upgradeTower(uTower);
                });
                grp.destroy();

                upgradeTower(tower);

                const t: Timer = this.timerUtils.newTimer();
                t.start(15, false, () => {
                    for (let i = 0; i < units.length; i++) {
                        units[i].show = true;
                    }

                    for (let i = 0; i < dummyUnits.length; i++) {
                        dummyUnits[i].destroy();
                    }

                    this.timerUtils.releaseTimer(t);
                });
                break;
            default:
                print(`ERROR: Unimplemented ability type '${towerAbilityType}'`);
                break;
        }
    }
}