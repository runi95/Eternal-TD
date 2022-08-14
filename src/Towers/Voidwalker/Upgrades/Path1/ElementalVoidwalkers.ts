import { VoidwalkerCustomData } from "../../../Voidwalker/Voidwalker";
import { Tower } from "../../../Tower";
import { TowerUpgrade } from "../../../TowerUpgrade";

const newVoidwalkerUnitTypeIds = [
    FourCC('o004'),
    FourCC('o003'),
    FourCC('o001'),
    FourCC('o002')
];
export class ElementalVoidwalkers extends TowerUpgrade {
    public readonly name = "Elemental Voidwalkers";
    public readonly icon = "ReplaceableTextures/CommandButtons/BTNStormEarth&Fire.blp";
    public readonly cost = 2700;
    public readonly description = "TODO: Write description";

    public applyUpgrade(tower: Tower): void {
        (tower.customData as VoidwalkerCustomData).voidwalkerUnitTypeIds = newVoidwalkerUnitTypeIds;
    }
}
