import { Tower } from "Towers/Tower";
import { TimerUtils } from "Utility/TimerUtils";
import { Timer, Trigger } from "w3ts";
import { Players } from "w3ts/globals";
import { TowerAbility } from "./TowerAbility";

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

const BUTTON_SIZE = 0.025;
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

    // TODO: Check for desyncs

    constructor(timerUtils: TimerUtils) {
        this.timerUtils = timerUtils;

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

                    this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].ability.applyAbilityEffect(tower.tower);

                    const t: Timer = this.timerUtils.newTimer();
                    t.start(1, true, () => {
                        tower.cooldown--;

                        if (tower.cooldown <= 0) {
                            this.timerUtils.releaseTimer(t);
                        }
                    });

                    if (isLastAbility) {
                        BlzFrameSetVisible(cooldownFrame, true);
                        let minCooldown = tower.cooldown;
                        for(let i = 0; i < this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers.length; i++) {
                            if (this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers[i].cooldown < minCooldown) {
                                minCooldown = this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].towers[i].cooldown;
                            }
                        }

                        this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].visibleCooldown = minCooldown;

                        const t: Timer = this.timerUtils.newTimer();
                        t.start(0.1, true, () => {
                            this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].visibleCooldown -= 0.1;
                            BlzFrameSetValue(this.cooldownFrames[this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].buttonIndex], ((this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].ability.cooldown - this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].visibleCooldown) / this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].ability.cooldown) * 100);

                            if (this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].visibleCooldown <= 0) {
                                BlzFrameSetVisible(this.cooldownFrames[this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].buttonIndex], false);
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

        let notExists = true;
        for(let i = 0; i < this.towerAbilities[playerIndex].length; i++) {
            if (this.towerAbilities[playerIndex][i].ability.name === ability.name) {
                notExists = false;
                this.towerAbilities[playerIndex][i].towers.push({
                    tower,
                    cooldown: 0,
                });
                break;
            }
        }

        if (notExists) {
            this.towerAbilities[playerIndex].push({
                ability,
                towers: [{
                    tower,
                    cooldown: 0
                }],
                buttonIndex: this.towerAbilities[playerIndex].length,
                visibleCooldown: 0,
            });
        }

        this.render();
    }

    public render(): void {
        for(let i = 0; i < MAX_FRAME_COUNT; i++) {
            const playerIndex: number = GetPlayerId(GetLocalPlayer());
            let abilityIcon: string = "";
            let isVisible: boolean = false;
            let tooltipText: string = "";
            if (this.towerAbilities[playerIndex].length > i) {
                isVisible = true;
                abilityIcon = this.towerAbilities[playerIndex][i].ability.icon;
                tooltipText = `${this.towerAbilities[playerIndex][i].ability.name}|n|n${this.towerAbilities[playerIndex][i].ability.description}`;
            }

            BlzFrameSetTexture(this.backdrops[i], abilityIcon, 0, true);
            BlzFrameSetVisible(this.buttons[i], isVisible);
            BlzFrameSetText(this.tooltips[i], tooltipText);
        }
    }

    public removeTowerAbility(playerIndex: number, tower: Tower): void {
        let shift = -1;
        for (let i = 0; i < this.towerAbilities[playerIndex].length; i++) {
            for (let j = 0; j < this.towerAbilities[playerIndex][i].towers.length; j++) {
                if (this.towerAbilities[playerIndex][i].towers[j].tower === tower) {
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
}