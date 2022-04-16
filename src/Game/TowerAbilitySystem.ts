import { TimerUtils } from "Utility/TimerUtils";
import { Frame, MapPlayer, Timer, Trigger } from "w3ts";
import { Players } from "w3ts/globals";

const BUTTON_SIZE = 0.025;
const COOLDOWN_FRAME_SIZE = BUTTON_SIZE / 0.04;
const FRAME_START_POS_X = 0.24;
const FRAME_END_POS_X = 0.5625 + BUTTON_SIZE;
const FRAME_START_POS_Y = 0.155;
const MAX_FRAME_COUNT = 10;
const OS_KEYS = [OSKEY_1, OSKEY_2, OSKEY_3, OSKEY_4, OSKEY_5, OSKEY_6, OSKEY_7, OSKEY_8, OSKEY_9, OSKEY_0];
export class TowerAbilitySystem {
    private readonly timerUtils: TimerUtils;

    constructor(timerUtils: TimerUtils) {
        this.timerUtils = timerUtils;

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

            const cooldownFrame = BlzCreateFrameByType("STATUSBAR", "cooldown", button, "", 0);
            BlzFrameSetPoint(cooldownFrame, FRAMEPOINT_CENTER, button, FRAMEPOINT_CENTER, 0.0, 0.0);
            BlzFrameSetSize(cooldownFrame, 0.04, 0.04);
            BlzFrameSetScale(cooldownFrame, COOLDOWN_FRAME_SIZE);
            BlzFrameSetValue(cooldownFrame, 0);
            BlzFrameSetModel(cooldownFrame, "ui/feedback/cooldown/ui-cooldown-indicator.mdx", 0);
            BlzFrameSetVisible(cooldownFrame, false);

            const trig: Trigger = new Trigger();
            trig.addAction(() => {
                BlzFrameSetVisible(cooldownFrame, true);
                let i = 0;
                const t: Timer = this.timerUtils.newTimer();
                t.start(0.1, true, () => {
                    BlzFrameSetValue(cooldownFrame, i++);

                    print(i);
                    if (i >= 100) {
                        BlzFrameSetVisible(cooldownFrame, false);
                        this.timerUtils.releaseTimer(t);
                    }
                });
            });
            Players.forEach((player) => trig.registerPlayerKeyEvent(player, OS_KEYS[i], 0, true));
        }
    }
}