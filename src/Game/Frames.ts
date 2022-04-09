import { Trigger } from "../JassOverrides/Trigger";
import { Tower } from "../Towers/Tower";
import { TowerController } from "../Towers/TowerController";
import { TowerUpgrade } from "../Towers/TowerUpgrade";

export class TowerSystem {
    private readonly towerController: TowerController;
    private readonly towers: Map<number, Tower>;
    private selectedTower: Tower | null = null;

    private readonly originFrameGameUi: framehandle;
    private readonly menu: framehandle;
    private readonly upgradePathIconFrames: framehandle[][];
    private readonly upgradePathTextFrames: framehandle[][];
    private readonly upgradePathEnabled: boolean[][];

    // private readonly towerIconFrame: framehandle;
    // private readonly sellText: framehandle;

    constructor(towerController: TowerController, towers: Map<number, Tower>) {
        this.towerController = towerController;
        this.towers = towers;
        this.originFrameGameUi = BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0);

        this.menu = BlzCreateFrame('EscMenuPopupMenuTemplate', this.originFrameGameUi, -1, 0);
        BlzFrameSetVisible(this.menu, false);
        BlzFrameSetSize(this.menu, 0.14, 0.19);
        BlzFrameSetPoint(this.menu, FRAMEPOINT_BOTTOMRIGHT, this.originFrameGameUi, FRAMEPOINT_BOTTOMRIGHT, -0.007, 0.16);

        const x = -0.046875;
        const y = -0.075;
        this.upgradePathIconFrames = [[], [], []];
        for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 5; j++) {
                this.upgradePathIconFrames[i].push(this.createUpgradePathIconFrame(this.menu, x + i * 0.046875, y + j * 0.0375));
            }
        }
        
        const menuBackdrop: framehandle = BlzCreateFrameByType('BACKDROP', 'menuBackdrop', this.menu, '', 0);
        BlzFrameSetTexture(menuBackdrop, "war3mapImported\\TowerUpgradePanel.dds", 0, true);
        BlzFrameSetAllPoints(menuBackdrop, this.menu);

        this.upgradePathEnabled = [[], [], []];
        this.upgradePathTextFrames = [[], [], []];
        for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 5; j++) {
                this.upgradePathEnabled[i][j] = false;
                const [buttonFrame, textFrame] = this.createUpgradePathButtonFrame(this.upgradePathIconFrames[i][j]);
                this.upgradePathTextFrames[i][j] = textFrame;
                this.createUpgradePathButtonTrigger(buttonFrame, i, j)
            }
        }

        // BlzFrameSetSize(path1Tier1ButtonFrame, 0.02625, 0.02625);

        // BlzFrameSetTexture(this.path2Tier1IconFrame, "war3mapImported\\TowerUpgradePanel.dds", 0, true);

        // this.menu = BlzCreateSimpleFrame('SimpleObserverPanel', this.originFrameGameUi, 0);
        // BlzFrameSetSize(this.menu, 0.22, 0.48);
        // BlzFrameSetPoint(this.menu, FRAMEPOINT_RIGHT, this.originFrameGameUi, FRAMEPOINT_RIGHT, 0, 0);

        // Upgrade menu
        // this.menu = BlzCreateSimpleFrame('MinimapButtonBar', this.originFrameGameUi, 0);

        // BlzFrameSetSize(this.menu, 0.22, 0.48);
        // BlzFrameSetPoint(this.menu, FRAMEPOINT_RIGHT, this.originFrameGameUi, FRAMEPOINT_RIGHT, 0, 0);
        // BlzFrameSetPoint(this.menu, FRAMEPOINT_CENTER, this.originFrameGameUi, FRAMEPOINT_CENTER, 0.4, 0.5);

        /*
        // Menu backdrop
        const menuBackdrop: framehandle = BlzCreateFrame('EscMenuBackdrop', this.menu, 0, 0);
        BlzFrameSetAllPoints(menuBackdrop, this.menu);

        this.path2Tier1IconFrame = BlzCreateFrameByType('BACKDROP', 'path2Tier1IconFrame', this.menu, '', 0);
        BlzFrameSetSize(this.path2Tier1IconFrame, 0.04, 0.04);
        BlzFrameSetPoint(this.path2Tier1IconFrame, FRAMEPOINT_BOTTOMLEFT, this.menu, FRAMEPOINT_BOTTOMLEFT, 0.035, 0.06);
        this.path2Tier2IconFrame = BlzCreateFrameByType('BACKDROP', 'path2Tier2IconFrame', this.menu, '', 0);
        BlzFrameSetSize(this.path2Tier2IconFrame, 0.04, 0.04);
        BlzFrameSetPoint(this.path2Tier2IconFrame, FRAMEPOINT_BOTTOM, this.menu, FRAMEPOINT_BOTTOM, -0.0051, 0.06);
        this.path2Tier3IconFrame = BlzCreateFrameByType('BACKDROP', 'path2Tier3IconFrame', this.menu, '', 0);
        BlzFrameSetSize(this.path2Tier3IconFrame, 0.04, 0.04);
        BlzFrameSetPoint(this.path2Tier3IconFrame, FRAMEPOINT_BOTTOMRIGHT, this.menu, FRAMEPOINT_BOTTOMRIGHT, -0.047, 0.06);
        */




        
        // Menu title
        // const menuTitle: framehandle = BlzCreateFrame('StandardTitleTextTemplate', this.menu, 0, 0);
        // BlzFrameSetPoint(menuTitle, FRAMEPOINT_TOP, this.menu, FRAMEPOINT_TOP, 0.0, -0.04);

        // Menu escape button
        // const closeButton: framehandle = BlzCreateFrameByType('GLUETEXTBUTTON', 'closeButton', this.menu, 'ScriptDialogButton', 0);
        // BlzFrameSetPoint(closeButton, FRAMEPOINT_BOTTOM, this.menu, FRAMEPOINT_BOTTOM, 0.0, 0.025);
        // BlzFrameSetText(closeButton, 'Close');

        // Tower icon frame
        // this.towerIconFrame = BlzCreateFrameByType('BACKDROP', 'towerIconFrame', this.menu, '', 0);
        // BlzFrameSetSize(this.towerIconFrame, 0.04, 0.04);
        // BlzFrameSetPoint(this.towerIconFrame, FRAMEPOINT_LEFT, this.menu, FRAMEPOINT_LEFT, 0.04, 0.06);
        // BlzFrameSetAllPoints(this.towerIconFrame, this.towerIconFrame);

        // const towerIconHighlightFrame = BlzCreateFrame('ScoreScreenTabButtonBackdrop', this.towerIconFrame, 0, 0);
        // const towerIconHighlightFrame = BlzCreateFrame('BattleNetButtonMouseOverHighlightTemplate', this.towerIconFrame, 0, 0);
        // const towerIconHighlightFrame = BlzCreateFrame('BattleNetButtonFocusHighlightTemplate', this.towerIconFrame, 0, 0);
        // BlzFrameSetAllPoints(towerIconHighlightFrame, this.towerIconFrame);

        // const sellButton: framehandle = BlzCreateFrameByType('GLUETEXTBUTTON', 'sellButton', this.towerIconFrame, 'ScriptDialogButton', 0);
        // BlzFrameSetPoint(sellButton, FRAMEPOINT_BOTTOM, this.towerIconFrame, FRAMEPOINT_BOTTOM, 0.0, -0.035);
        // BlzFrameSetSize(sellButton, 0.05, 0.034);
        // BlzFrameSetText(sellButton, 'Sell');

        // this.sellText = BlzCreateFrameByType('TEXT', 'sellText', sellButton, '', 0);
        // BlzFrameSetPoint(this.sellText, FRAMEPOINT_BOTTOM, sellButton, FRAMEPOINT_BOTTOM, 0, -0.01);
        
        // const closeButtonTrigger: Trigger = new Trigger();
        // closeButtonTrigger.registerFrameEvent(closeButton, FRAMEEVENT_CONTROL_CLICK);
        // closeButtonTrigger.registerPlayerKeyEvent(Player(0), OSKEY_ESCAPE, 0, true);
        // closeButtonTrigger.addAction(() => {
        //     BlzFrameSetVisible(this.menu, false);
        // });

        // BlzFrameSetVisible(this.menu, false);

        const selectUnitTrig: Trigger = new Trigger();
        selectUnitTrig.addAction(() => {
            const trig: unit = GetTriggerUnit();
            const unitHandleId: number = GetHandleId(trig);
            // const trigUnitTypeId: number = GetUnitTypeId(trig);
            // const goldCost: number = GetUnitGoldCost(trigUnitTypeId);
            // BlzFrameSetText(this.sellText, `(|cFFFFCC00${goldCost}|r)`);

            const tower: Tower | undefined = this.towers.get(unitHandleId);
            if (tower === undefined) {
                this.selectedTower = null;
                BlzFrameSetVisible(this.menu, false);
                return;
            }
            this.selectedTower = tower;

            this.renderSelectedTowerUpgrades();

            BlzFrameSetVisible(this.menu, true);
        });
        selectUnitTrig.registerPlayerUnitEvent(Player(0), EVENT_PLAYER_UNIT_SELECTED);

        BlzFrameSetFocus(this.menu, false);
    }

    private renderSelectedTowerUpgrades(): void {
        if (this.selectedTower === null) {
            return;
        }

        for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 5; j++) {
                if (this.selectedTower.towerType.upgrades[i] && this.selectedTower.towerType.upgrades[i][j]) {
                    const pathA: number = this.selectedTower.pathUpgrades[(i + 1) % 3];
                    const pathB: number = this.selectedTower.pathUpgrades[(i + 2) % 3];
                    const isPathAvailable = (pathA === 0 || pathB === 0) && (j < 2 || (pathA < 3 && pathB < 3));
                    const isEnabled: boolean = j === this.selectedTower.pathUpgrades[i] && isPathAvailable;
                    let icon: string = this.selectedTower.towerType.upgrades[i][j].icon;
                    if (!isEnabled) {
                        icon = icon.replace("CommandButtons\\BTN", "CommandButtonsDisabled\\DISBTN");
                    }

                    BlzFrameSetTexture(this.upgradePathIconFrames[i][j], icon, 0, true);
                    BlzFrameSetText(this.upgradePathTextFrames[i][j], `${this.selectedTower.towerType.upgrades[i][j].name} |cFFFFCC00(${this.selectedTower.towerType.upgrades[i][j].cost})|r|n|n` + this.selectedTower.towerType.upgrades[i][j].description);
                    this.upgradePathEnabled[i][j] = isEnabled;
                }
            }
        }
    }

    private createUpgradePathIconFrame(parent: framehandle, offsetX: number, offsetY: number): framehandle {
        const iconFrame = BlzCreateFrameByType('BACKDROP', 'iconFrame', parent, '', 0);
        BlzFrameSetSize(iconFrame, 0.02625, 0.02625);
        BlzFrameSetPoint(iconFrame, FRAMEPOINT_CENTER, parent, FRAMEPOINT_CENTER, offsetX, offsetY);
        BlzFrameSetTexture(iconFrame, "UI\\Widgets\\EscMenu\\Human\\Quest-Unknown.dds", 0, true);

        return iconFrame;
    }

    private createUpgradePathButtonFrame(parent: framehandle): [framehandle, framehandle] {
        const buttonFrame = BlzCreateFrameByType("BUTTON", "", parent, "buttonFrame", 0);
        BlzFrameSetAllPoints(buttonFrame, parent);
        // const tooltipFrame = BlzCreateFrame("StandardDecoratedEditBoxBackdropTemplate", buttonFrame, 0, 0);
        const tooltipFrame = BlzCreateFrame("BoxedText", buttonFrame, 0, 0);
        const textFrame = BlzCreateFrameByType("TEXT", "textFrame", tooltipFrame, "", 0);
        BlzFrameSetSize(textFrame, 0.25, 0);
        BlzFrameSetPoint(tooltipFrame, FRAMEPOINT_BOTTOMLEFT, textFrame, FRAMEPOINT_BOTTOMLEFT, -0.01, -0.01);
        BlzFrameSetPoint(tooltipFrame, FRAMEPOINT_TOPRIGHT, textFrame, FRAMEPOINT_TOPRIGHT, 0.01, 0.01);
        BlzFrameSetTooltip(buttonFrame, tooltipFrame);
        BlzFrameSetPoint(textFrame, FRAMEPOINT_BOTTOM, buttonFrame, FRAMEPOINT_TOP, 0, 0.01);

        return [buttonFrame, textFrame];
    }

    private createUpgradePathButtonTrigger(buttonFrame: framehandle, path: number, tier: number): void {
        const buttonTrig: Trigger = new Trigger();
        buttonTrig.addCondition(() => this.upgradePathEnabled[path][tier] && this.selectedTower?.pathUpgrades[path] === tier);
        buttonTrig.addAction(() => {
            BlzFrameSetVisible(buttonFrame, false);
            BlzFrameSetVisible(buttonFrame, true);
            const tower: Tower = (this.selectedTower as Tower);
            const upgrade: TowerUpgrade = tower.towerType.upgrades[path][tier];
            const playerCurrentGold: number = GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD);

            if (playerCurrentGold < upgrade.cost) {
                return;
            }

            const pathA: number = tower.pathUpgrades[(path + 1) % 3];
            const pathB: number = tower.pathUpgrades[(path + 2) % 3];
            const isPathAvailable = (pathA === 0 || pathB === 0) && (tier < 2 || (pathA < 3 && pathB < 3));
            if (!isPathAvailable) {
                return;
            }

            SetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, playerCurrentGold - upgrade.cost);

            tower.pathUpgrades[path]++;
            if (this.towerController.upgradeTower(tower, upgrade)) {
                SelectUnitForPlayerSingle(tower.unit, GetTriggerPlayer());
            } else {
                this.renderSelectedTowerUpgrades();
            }
        });
        buttonTrig.registerFrameEvent(buttonFrame, FRAMEEVENT_CONTROL_CLICK);
    }
}