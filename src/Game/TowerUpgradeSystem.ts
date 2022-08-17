import { Frame, Trigger, MapPlayer } from "w3ts";
import { TowerController } from "../Towers/TowerController";
import { GameMap } from "./GameMap";
import type { TowerUpgrade } from "../Towers/TowerUpgrade";
import type { Tower } from "../Towers/Tower";
import type { Unit } from "w3ts";

export class TowerUpgradeSystem {
    private selectedTower: Tower | null = null;
    private isMenuVisible: boolean = false;

    private static readonly UPGRADE_TOWER_SYNC_PREFIX = 'upgradeTower';

    private readonly selectUnitTrig: Trigger = new Trigger();
    private readonly upgradeTowerSyncTrig: Trigger = new Trigger();
    private readonly towerController: TowerController;
    private readonly originFrameGameUi: Frame;
    private readonly menu: Frame;
    private readonly upgradePathIconFrames: Frame[][];
    private readonly upgradePathTextFrames: Frame[][];
    private readonly upgradePathEnabled: boolean[][];
    private readonly upgradePathLockedIconFrames: Frame[][];

    constructor(towerController: TowerController) {
        this.towerController = towerController;
        this.originFrameGameUi = Frame.fromOrigin(ORIGIN_FRAME_GAME_UI, 0);

        this.menu = new Frame('EscMenuPopupMenuTemplate', this.originFrameGameUi, -1, 0);
        this.menu.setEnabled(false);
        this.menu.setVisible(false);
        this.menu.setSize(0.14, 0.19);
        this.menu.setPoint(FRAMEPOINT_BOTTOMRIGHT, this.originFrameGameUi, FRAMEPOINT_BOTTOMRIGHT, -0.007, 0.16);

        const x = -0.046875;
        const y = -0.075;
        this.upgradePathIconFrames = [[], [], []];
        this.upgradePathLockedIconFrames = [[], [], []];
        for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 5; j++) {
                this.upgradePathIconFrames[i].push(this.createUpgradePathIconFrame(this.menu, x + i * 0.046875, y + j * 0.0375));
                this.upgradePathLockedIconFrames[i].push(this.createUpgradePathIconFrame(this.menu, x + i * 0.046875, y + j * 0.0375, "ReplaceableTextures/CommandButtons/BTNLockAndChains.dds"));
            }
        }

        const menuBackdrop: Frame = new Frame('menuBackdrop', this.menu, -1, 0, 'BACKDROP', '');

        menuBackdrop.setTexture("war3mapImported/TowerUpgradePanel.dds", 0, true);
        menuBackdrop.setAllPoints(this.menu);

        this.upgradePathEnabled = [[], [], []];
        this.upgradePathTextFrames = [[], [], []];
        for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 5; j++) {
                this.upgradePathEnabled[i][j] = false;
                const [buttonFrame, textFrame] = this.createUpgradePathButtonFrame(this.upgradePathIconFrames[i][j]);
                this.upgradePathTextFrames[i][j] = textFrame;
                this.createUpgradePathButtonTrigger(buttonFrame, i, j);
            }
        }

        this.selectUnitTrig.addAction(() => {
            const trig: unit = GetTriggerUnit();
            const owningPlayer = GetOwningPlayer(trig);
            const unitHandleId: number = GetHandleId(trig);
            const trigPlayer = GetTriggerPlayer();

            const tower: Tower | undefined = GameMap.BUILT_TOWER_MAP.get(unitHandleId);
            if (GetLocalPlayer() === trigPlayer) {
                if (tower !== undefined && owningPlayer === trigPlayer) {
                    this.selectedTower = tower;
                    this.isMenuVisible = true;
                } else {
                    this.selectedTower = null;
                    this.isMenuVisible = false;
                }
            }

            if (tower !== undefined) {
                this.renderSelectedTowerUpgrades();
            }

            this.menu.setVisible(this.isMenuVisible);
        });
        this.upgradeTowerSyncTrig.addAction(() => this.upgradeTower(BlzGetTriggerSyncData()));

        this.menu.setFocus(false);
    }

    public addPlayer(player: MapPlayer) {
        this.selectUnitTrig.registerPlayerUnitEvent(player, EVENT_PLAYER_UNIT_SELECTED, undefined);
        this.upgradeTowerSyncTrig.registerPlayerSyncEvent(player, TowerUpgradeSystem.UPGRADE_TOWER_SYNC_PREFIX, false);
    }

    public deselectUnit(unit: Unit) {
        if (unit.id === this.selectedTower?.unit?.id) {
            this.selectedTower = null;
            this.isMenuVisible = false;
        }

        this.menu.setVisible(this.isMenuVisible);
    }

    private renderSelectedTowerUpgrades(): void {
        for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 5; j++) {
                let icon = "UI/Widgets/EscMenu/Human/Quest-Unknown.dds";
                let text = "";
                let isPathAvailable = false;
                if (this.selectedTower !== null && this.selectedTower.towerType.upgrades[i] && this.selectedTower.towerType.upgrades[i][j]) {
                    const pathA: number = this.selectedTower.pathUpgrades[(i + 1) % 3];
                    const pathB: number = this.selectedTower.pathUpgrades[(i + 2) % 3];
                    isPathAvailable = (pathA === 0 || pathB === 0) && (j < 2 || (pathA < 3 && pathB < 3));
                    const isEnabled: boolean = j === this.selectedTower.pathUpgrades[i] && isPathAvailable;
                    icon = this.selectedTower.towerType.upgrades[i][j].icon;
                    if (!isEnabled) {
                        icon = icon.replace("CommandButtons/BTN", "CommandButtonsDisabled/DISBTN");
                    }

                    this.upgradePathEnabled[i][j] = isEnabled;
                    text = `${this.selectedTower.towerType.upgrades[i][j].name} |cFFFFCC00(${this.selectedTower.towerType.upgrades[i][j].cost})|r|n|n` + this.selectedTower.towerType.upgrades[i][j].description;
                }

                this.upgradePathIconFrames[i][j].setTexture(icon, 0, true);
                this.upgradePathTextFrames[i][j].setText(text);
                this.upgradePathLockedIconFrames[i][j].visible = !isPathAvailable;
            }
        }
    }

    private createUpgradePathIconFrame(parent: Frame, offsetX: number, offsetY: number, texture = "UI/Widgets/EscMenu/Human/Quest-Unknown.dds"): Frame {
        const iconFrame = new Frame('iconFrame', parent, -1, 0, 'BACKDROP', '');
        iconFrame.setSize(0.02625, 0.02625);
        iconFrame.setPoint(FRAMEPOINT_CENTER, parent, FRAMEPOINT_CENTER, offsetX, offsetY);
        iconFrame.setTexture(texture, 0, true);

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
        buttonTrig.addAction(() => {
            const player = MapPlayer.fromEvent();
            const playerCurrentGold = player.getState(PLAYER_STATE_RESOURCE_GOLD);

            buttonFrame.setEnabled(false);
            buttonFrame.setEnabled(true);
            if (GetLocalPlayer() === player.handle) {
                if (!this.upgradePathEnabled[path][tier]) return;
                if (!this.selectedTower) return;
                if (this.selectedTower.pathUpgrades[path] !== tier) return;

                const tower: Tower = (this.selectedTower as Tower);
                if (tower === null) return;

                const pathA: number = tower.pathUpgrades[(path + 1) % 3];
                const pathB: number = tower.pathUpgrades[(path + 2) % 3];
                const isPathAvailable = (pathA === 0 || pathB === 0) && (tier < 2 || (pathA < 3 && pathB < 3));
                if (!isPathAvailable) return;

                const upgrade: TowerUpgrade = tower.towerType.upgrades[path][tier];
                if (playerCurrentGold < upgrade.cost) return;

                const stringifiedData = `${tower.internalId}:${path}:${tier}`;
                BlzSendSyncData(TowerUpgradeSystem.UPGRADE_TOWER_SYNC_PREFIX, stringifiedData);
            }
        });
        buttonTrig.triggerRegisterFrameEvent(buttonFrame, FRAMEEVENT_CONTROL_CLICK);
    }

    private upgradeTower(data: string) {
        const split = data.split(":");
        const internalId = Number(split[0]);
        const towerId = GameMap.BUILT_TOWER_INTERNAL_ID_MAP.get(internalId);
        const tower: Tower | undefined = GameMap.BUILT_TOWER_MAP.get(towerId);
        if (tower === null) return;

        const path = Number(split[1]);
        const tier = Number(split[2]);

        const player = MapPlayer.fromEvent();
        const playerCurrentGold = player.getState(PLAYER_STATE_RESOURCE_GOLD);
        const upgrade = tower.towerType.upgrades[path][tier];
        if (playerCurrentGold < upgrade.cost) return;

        const pathA: number = tower.pathUpgrades[(path + 1) % 3];
        const pathB: number = tower.pathUpgrades[(path + 2) % 3];
        const isPathAvailable = (pathA === 0 || pathB === 0) && (tier < 2 || (pathA < 3 && pathB < 3));
        if (!isPathAvailable) return;

        player.setState(PLAYER_STATE_RESOURCE_GOLD, playerCurrentGold - upgrade.cost);

        tower.pathUpgrades[path]++;

        if (this.towerController.upgradeTower(tower, upgrade)) {
            SelectUnitForPlayerSingle(tower.unit.handle, player.handle); // TODO: Figure out if this causes / can cause desyncs
        } else {
            this.renderSelectedTowerUpgrades();
        }
    }
}
