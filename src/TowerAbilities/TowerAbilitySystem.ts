import { Tower } from "Towers/Tower";
import { TimerUtils } from "Utility/TimerUtils";
import { Timer, Trigger } from "w3ts";
import { Players } from "w3ts/globals";
import { TowerAbility } from "./TowerAbility";

interface ActiveTowerAbility {
    tower: Tower;
    cooldown: number;
    ability: TowerAbility;
}

const BUTTON_SIZE = 0.025;
const COOLDOWN_FRAME_SIZE = BUTTON_SIZE / 0.04;
const FRAME_START_POS_X = 0.24;
const FRAME_END_POS_X = 0.5625 + BUTTON_SIZE;
const FRAME_START_POS_Y = 0.155;
const MAX_FRAME_COUNT = 10;
const OS_KEYS = [OSKEY_1, OSKEY_2, OSKEY_3, OSKEY_4, OSKEY_5, OSKEY_6, OSKEY_7, OSKEY_8, OSKEY_9, OSKEY_0];
export class TowerAbilitySystem {
    private readonly towerAbilities: ActiveTowerAbility[][][] = [];
    private readonly backdrops: framehandle[] = [];
    private readonly buttons: framehandle[] = [];
    private readonly timerUtils: TimerUtils;

    // TODO: Add tooltip
    // TODO: Check for desyncs

    constructor(timerUtils: TimerUtils) {
        this.timerUtils = timerUtils;

        Players.forEach(() => this.towerAbilities.push([]));

        const frameMargin = (FRAME_END_POS_X - FRAME_START_POS_X - (BUTTON_SIZE * MAX_FRAME_COUNT)) / (MAX_FRAME_COUNT - 1);
        for (let i = 0; i < MAX_FRAME_COUNT; i++) {
            Players.forEach((_, playerIndex) => this.towerAbilities[playerIndex].push([]));
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
            
            BlzFrameSetVisible(button, false);

            const trig: Trigger = new Trigger();
            const cooldownButtonIndex = i;
            trig.addAction(() => {
                const abilityPlayerIndex = GetPlayerId(GetTriggerPlayer());
                if (this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].length > 0) {
                    const availableTowerAbilities = this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].filter((activeTowerAbility) => activeTowerAbility.cooldown === 0);
                    if (availableTowerAbilities.length === 0)
                        return;

                    const isLastAbility = availableTowerAbilities.length === 1;
                    const towerAbility: ActiveTowerAbility = availableTowerAbilities[0];

                    towerAbility.cooldown = towerAbility.ability.cooldown;

                    towerAbility.ability.applyAbilityEffect(towerAbility.tower);

                    const t: Timer = this.timerUtils.newTimer();
                    t.start(1, true, () => {
                        towerAbility.cooldown--;

                        if (towerAbility.cooldown <= 0) {
                            this.timerUtils.releaseTimer(t);
                        }
                    });

                    if (isLastAbility) {
                        BlzFrameSetVisible(cooldownFrame, true);
                        let minCooldown = towerAbility.cooldown;
                        for(let i = 0; i < this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex].length; i++) {
                            if (this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex][i].cooldown < minCooldown) {
                                minCooldown = this.towerAbilities[abilityPlayerIndex][cooldownButtonIndex][i].cooldown;
                            }
                        }

                        const t: Timer = this.timerUtils.newTimer();
                        t.start(0.1, true, () => {
                            minCooldown -= 0.1;
                            BlzFrameSetValue(cooldownFrame, ((towerAbility.ability.cooldown - minCooldown) / towerAbility.ability.cooldown) * 100);

                            if (minCooldown <= 0) {
                                BlzFrameSetVisible(cooldownFrame, false);
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

        for(let i = 0; i < this.towerAbilities[playerIndex].length; i++) {
            if (this.towerAbilities[playerIndex][i].length > 0) {
                if (this.towerAbilities[playerIndex][i][0].ability.name === ability.name) {
                    this.towerAbilities[playerIndex][i].push({
                        ability,
                        tower,
                        cooldown: 0,
                    });
                    break;
                }
            } else {
                this.towerAbilities[playerIndex][i].push({
                    ability,
                    tower,
                    cooldown: 0,
                });
                break;
            }
        }

        this.render();
    }

    public render(): void {
        for(let i = 0; i < MAX_FRAME_COUNT; i++) {
            const playerIndex: number = GetPlayerId(GetLocalPlayer());
            const abilityCount: number = this.towerAbilities[playerIndex][i].length;
            let abilityIcon: string = "";
            let isVisible: boolean = false;
            if (abilityCount > 0) {
                isVisible = true;
                abilityIcon = this.towerAbilities[playerIndex][i][0].ability.icon;
            }

            BlzFrameSetTexture(this.backdrops[i], abilityIcon, 0, true);
            BlzFrameSetVisible(this.buttons[i], isVisible);
        }
    }

    public removeTowerAbility(playerIndex: number, tower: Tower): void {
        for (let i = 0; i < this.towerAbilities[playerIndex].length; i++) {
            if (this.towerAbilities[playerIndex][i].length > 0) {
                for (let j = 0; j < this.towerAbilities[playerIndex][i].length; j++) {
                    if (this.towerAbilities[playerIndex][i][j].tower === tower) {
                        if (this.towerAbilities[playerIndex][i].length > 1) {
                            this.towerAbilities[playerIndex][i].splice(j, 1);
                        } else {
                            this.towerAbilities[playerIndex].splice(i, 1);
                            this.towerAbilities[playerIndex].push([]);
                        }

                        return;
                    }
                }
            }
        }
    }
}