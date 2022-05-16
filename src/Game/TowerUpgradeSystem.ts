import { Frame, Trigger, MapPlayer } from "w3ts";
import { Tower } from "../Towers/Tower";
import { TowerController } from "../Towers/TowerController";
import { TowerUpgrade } from "../Towers/TowerUpgrade";

// FIXME: Upgrade menu is still visible after selling a tower

export class TowerUpgradeSystem {
    private readonly towerController: TowerController;
    private readonly towers: Map<number, Tower>;
    private selectedTower: Tower | null = null;

    private readonly originFrameGameUi: Frame;
    private readonly menu: Frame;
    private readonly upgradePathIconFrames: Frame[][];
    private readonly upgradePathTextFrames: Frame[][];
    private readonly upgradePathEnabled: boolean[][];

    constructor(towerController: TowerController, towers: Map<number, Tower>) {
        this.towerController = towerController;
        this.towers = towers;
        this.originFrameGameUi = Frame.fromOrigin(ORIGIN_FRAME_GAME_UI, 0);

        this.menu = new Frame('EscMenuPopupMenuTemplate', this.originFrameGameUi, -1, 0);
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

        const selectUnitTrig: Trigger = new Trigger();
        selectUnitTrig.addAction(() => {
            const trig: unit = GetTriggerUnit();
            const unitHandleId: number = GetHandleId(trig);

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
                    this.upgradePathTextFrames[i][j].setText(`${this.selectedTower.towerType.upgrades[i][j].name} |cFFFFCC00(${this.selectedTower.towerType.upgrades[i][j].cost})|r|n|n` + this.selectedTower.towerType.upgrades[i][j].description);
                    this.upgradePathEnabled[i][j] = isEnabled;
                } else {
                    this.upgradePathIconFrames[i][j].setTexture("UI/Widgets/EscMenu/Human/Quest-Unknown.dds", 0, true)
                    this.upgradePathTextFrames[i][j].setText("");
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