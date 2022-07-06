import { CreepBaseUnit } from "./CreepBaseUnit";
import { BlackVillager } from "./Normal/BlackVillager";
import { BlueVillager } from "./Normal/BlueVillager";
import { FortifiedVillager } from "./Normal/FortifiedVillager";
import { GreenVillager } from "./Normal/GreenVillager";
import { LargeVillager } from "./Normal/LargeVillager";
import { PinkVillager } from "./Normal/PinkVillager";
import { PurpleVillager } from "./Normal/PurpleVillager";
import { RainbowVillager } from "./Normal/RainbowVillager";
import { RedVillager } from "./Normal/RedVillager";
import { WhiteVillager } from "./Normal/WhiteVillager";
import { YellowVillager } from "./Normal/YellowVillager";
import { ZebraVillager } from "./Normal/ZebraVillager";
import { Zeppelin } from "./Normal/Zeppelin";

export class CreepBaseUnits {
    public static readonly RED_VILLAGER: CreepBaseUnit = RedVillager.RED_VILLAGER;
    public static readonly BLUE_VILLAGER: CreepBaseUnit = BlueVillager.BLUE_VILLAGER;
    public static readonly GREEN_VILLAGER: CreepBaseUnit = GreenVillager.GREEN_VILLAGER;
    public static readonly YELLOW_VILLAGER: CreepBaseUnit = YellowVillager.YELLOW_VILLAGER;
    public static readonly PINK_VILLAGER: CreepBaseUnit = PinkVillager.PINK_VILLAGER;
    public static readonly PURPLE_VILLAGER: CreepBaseUnit = PurpleVillager.PURPLE_VILLAGER;
    public static readonly BLACK_VILLAGER: CreepBaseUnit = BlackVillager.BLACK_VILLAGER;
    public static readonly FORTIFIED_VILLAGER: CreepBaseUnit = FortifiedVillager.FORTIFIED_VILLAGER;
    public static readonly WHITE_VILLAGER: CreepBaseUnit = WhiteVillager.WHITE_VILLAGER;
    public static readonly ZEBRA_VILLAGER: CreepBaseUnit = ZebraVillager.ZEBRA_VILLAGER;
    public static readonly RAINBOW_VILLAGER: CreepBaseUnit = RainbowVillager.RAINBOW_VILLAGER;
    public static readonly LARGE_VILLAGER: CreepBaseUnit = LargeVillager.LARGE_VILLAGER;
    public static readonly ZEPPELIN: CreepBaseUnit = Zeppelin.ZEPPELIN;
}
