import { Frame, Trigger, MapPlayer } from "w3ts";
import { Tower } from "../Towers/Tower";
import { TowerController } from "../Towers/TowerController";
import { TowerUpgrade } from "../Towers/TowerUpgrade";

export class TowerUpgradeSystem {
    private readonly towerController: TowerController;
    private readonly towers: Map<number, Tower>;
    private selectedTower: Tower | null = null;

    private readonly originFrameGameUi: Frame;
    private readonly menu: Frame;
    private readonly upgradePathIconFrames: Frame[][];
    private readonly upgradePathTextFrames: Frame[][];
    private readonly upgradePathEnabled: boolean[][];

    // private readonly towerIconFrame: framehandle;
    // private readonly sellText: framehandle;

    constructor(towerController: TowerController, towers: Map<number, Tower>) {
        this.towerController = towerController;
        this.towers = towers;
        this.originFrameGameUi = Frame.fromOrigin(ORIGIN_FRAME_GAME_UI, 0);

        this.menu = new Frame('EscMenuPopupMenuTemplate', this.originFrameGameUi, -1, 0)
        this.menu.setVisible(false);
        this.menu.setSize(0.14, 0.19);
        this.menu.setPoint(FRAMEPOINT_BOTTOMRIGHT, this.originFrameGameUi, FRAMEPOINT_BOTTOMRIGHT, -0.007, 0.16);

        const x = -0.046875;
        const y = -0.075;
        this.upgradePathIconFrames = [[], [], []];
        for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 5; j++) {
                this.upgradePathIconFrames[i].push(this.createUpgradePathIconFrame(this.menu, x + i * 0.046875, y + j * 0.0375));
            }
        }
        
        const menuBackdrop: Frame = new Frame('menuBackdrop', this.menu, -1, 0, 'BACKDROP', '');

        menuBackdrop.setTexture("war3mapImported/TowerUpgradePanel.dds", 0, true)
        menuBackdrop.setAllPoints(this.menu);

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

        // BlzFrameSetTexture(this.path2Tier1IconFrame, "war3mapImported/TowerUpgradePanel.dds", 0, true);

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
                this.menu.setVisible(false);
                return;
            }
            this.selectedTower = tower;

            this.renderSelectedTowerUpgrades();
            this.menu.setVisible(true)
        });
        selectUnitTrig.registerPlayerUnitEvent(MapPlayer.fromIndex(0), EVENT_PLAYER_UNIT_SELECTED, undefined);
        this.menu.setFocus(false);
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
                        icon = icon.replace("CommandButtons/BTN", "CommandButtonsDisabled/DISBTN");
                    }
                    this.upgradePathIconFrames[i][j].setTexture(icon, 0, true)
                    this.upgradePathTextFrames[i][j].setText(`${this.selectedTower.towerType.upgrades[i][j].name} |cFFFFCC00(${this.selectedTower.towerType.upgrades[i][j].cost})|r|n|n` + this.selectedTower.towerType.upgrades[i][j].description)
                    this.upgradePathEnabled[i][j] = isEnabled;
                }
            }
        }
    }

    private createUpgradePathIconFrame(parent: Frame, offsetX: number, offsetY: number): Frame {
        const iconFrame = new Frame( 'iconFrame', parent, -1, 0, 'BACKDROP', '');
        iconFrame.setSize(0.02625, 0.02625)
        iconFrame.setPoint(FRAMEPOINT_CENTER, parent, FRAMEPOINT_CENTER, offsetX, offsetY)
        iconFrame.setTexture("UI/Widgets/EscMenu/Human/Quest-Unknown.dds", 0, true)

        return iconFrame;
    }

    private createUpgradePathButtonFrame(parent: Frame): [Frame, Frame] {
        const buttonFrame = new Frame("buttonFrame", parent, -1, 0, 'BUTTON', '');
        buttonFrame.setAllPoints(parent);
        // const tooltipFrame = BlzCreateFrame("StandardDecoratedEditBoxBackdropTemplate", buttonFrame, 0, 0);
        const tooltipFrame = new Frame("BoxedText", buttonFrame, 0, 0);
        const textFrame = new Frame("textFrame", tooltipFrame, -1, 0, "TEXT", '');
        textFrame.setSize(0.25, 0)
        tooltipFrame.setPoint(FRAMEPOINT_BOTTOMLEFT, textFrame, FRAMEPOINT_BOTTOMLEFT, -0.01, -0.01)
        tooltipFrame.setPoint(FRAMEPOINT_TOPRIGHT, textFrame, FRAMEPOINT_TOPRIGHT, 0.01, 0.01)
        buttonFrame.setTooltip(tooltipFrame)
        textFrame.setPoint(FRAMEPOINT_BOTTOM, buttonFrame, FRAMEPOINT_TOP, 0, 0.01)

        return [buttonFrame, textFrame];
    }

    private createUpgradePathButtonTrigger(buttonFrame: Frame, path: number, tier: number): void {
        const buttonTrig: Trigger = new Trigger();
        buttonTrig.addCondition(() => this.upgradePathEnabled[path][tier] && this.selectedTower && this.selectedTower.pathUpgrades[path] === tier);
        buttonTrig.addAction(() => {
            buttonFrame.setVisible(false);
            buttonFrame.setVisible(true);
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
                SelectUnitForPlayerSingle(tower.unit.handle, GetTriggerPlayer());
            } else {
                this.renderSelectedTowerUpgrades();
            }
        });
        buttonTrig.triggerRegisterFrameEvent(buttonFrame, FRAMEEVENT_CONTROL_CLICK);
    }
}