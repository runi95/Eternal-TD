import { Abomination } from "./Abomination/Abomination";
import { Gargoyle } from "./Gargoyle/Gargoyle";
import { MeatWagon } from "./MeatWagon/MeatWagon";
import { ObsidianStatue } from "./ObsidianStatue/ObsidianStatue";
import { Sapper } from "./Sapper/Sapper";
import { SkeletonArcher } from "./SkeletonArcher/SkeletonArcher";
import { TowerType } from "./TowerType";

const towers: Map<number, TowerType> = new Map();
[
    new SkeletonArcher(),
    new Sapper(),
    new Abomination(),
    new ObsidianStatue(),
    new Gargoyle(),
    new MeatWagon(),
].forEach((tower: TowerType) => {
    towers.set(tower.unitTypeId, tower);
    tower.upgrades.forEach((upgradePath) => {
        upgradePath.forEach((upgrade) => {
            if (upgrade.newUnitTypeId !== undefined) {
                towers.set(upgrade.newUnitTypeId, tower);
            }
        })
    })
});

export default towers;