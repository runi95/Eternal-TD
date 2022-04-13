import { BlueVillager } from "../Creeps/Normal/BlueVillager";
import { Creep } from "../Creeps/Creep";
import { GreenVillager } from "../Creeps/Normal/GreenVillager";
import { PinkVillager } from "../Creeps/Normal/PinkVillager";
import { RedVillager } from "../Creeps/Normal/RedVillager";
import { YellowVillager } from "../Creeps/Normal/YellowVillager";
import { Modifier } from "../Creeps/Modifier";
import { RegenModifier } from "../Creeps/Modifiers/RegenModifier";
import { BlackVillager } from "../Creeps/Normal/BlackVillager";
import { WhiteVillager } from "../Creeps/Normal/WhiteVillager";
import { InvisibilityModifier } from "../Creeps/Modifiers/InvisibilityModifier";
import { PurpleVillager } from "../Creeps/Normal/PurpleVillager";
import { ZebraVillager } from "../Creeps/Normal/ZebraVillager";
import { FortifiedVillager } from "../Creeps/Normal/FortifiedVillager";
import { RainbowVillager } from "../Creeps/Normal/RainbowVillager";
import { LargeVillager } from "../Creeps/Normal/LargeVillager";
import { Zeppelin } from "../Creeps/Normal/Zeppelin";

const regenModifier = new RegenModifier();
const invisibilityModifier = new InvisibilityModifier();

interface CreepSpawnDetails {
    creepType: typeof Creep;
    amount: number;
    delay: number;
    modifiers?: Modifier[];
}

type Round = CreepSpawnDetails[];
type Rounds = Round[];

const rounds: Rounds = [
    // ROUND 1:
    [
        {
            creepType: RedVillager,
            amount: 1,
            delay: 0.9,
        }
    ],

    // ROUND 2:
    [
        {
            creepType: RedVillager,
            amount: 35,
            delay:  10000000
        }
    ],

    // ROUND 3:
    [
        {
            creepType: RedVillager,
            amount: 25,
            delay: 0.9
        },
        {
            creepType: BlueVillager,
            amount: 5,
            delay: 0.9
        }
    ],

    // ROUND 4:
    [
        {
            creepType: RedVillager,
            amount: 35,
            delay: 0.9
        },
        {
            creepType: BlueVillager,
            amount: 18,
            delay: 0.9
        }
    ],

    // ROUND 5:
    [
        {
            creepType: RedVillager,
            amount: 5,
            delay: 0.9
        },
        {
            creepType: BlueVillager,
            amount: 27,
            delay: 0.9
        }
    ],

    // ROUND 6:
    [
        {
            creepType: RedVillager,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: BlueVillager,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: GreenVillager,
            amount: 4,
            delay: 0.9
        }
    ],

    // ROUND 7:
    [
        {
            creepType: RedVillager,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: BlueVillager,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: GreenVillager,
            amount: 5,
            delay: 0.9
        }
    ],

    // ROUND 8:
    [
        {
            creepType: RedVillager,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: BlueVillager,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: GreenVillager,
            amount: 14,
            delay: 0.9
        },
    ],

    // ROUND 9:
    [
        {
            creepType: GreenVillager,
            amount: 30,
            delay: 0.9
        }
    ],

    // ROUND 10:
    [
        {
            creepType: BlueVillager,
            amount: 102,
            delay: 0.9
        }
    ],

    // ROUND 11:
    [
        {
            creepType: RedVillager,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: BlueVillager,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: GreenVillager,
            amount: 12,
            delay: 0.9
        },
        {
            creepType: YellowVillager,
            amount: 3,
            delay: 0.9
        }
    ],

    // ROUND 12:
    [
        {
            creepType: BlueVillager,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: GreenVillager,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: YellowVillager,
            amount: 5,
            delay: 0.9
        }
    ],

    // ROUND 13:
    [
        {
            creepType: BlueVillager,
            amount: 50,
            delay: 0.9
        },
        {
            creepType: GreenVillager,
            amount: 23,
            delay: 0.9
        }
    ],

    // ROUND 14:
    [
        {
            creepType: RedVillager,
            amount: 49,
            delay: 0.9
        },
        {
            creepType: BlueVillager,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: GreenVillager,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: YellowVillager,
            amount: 9,
            delay: 0.9
        },
    ],

    // ROUND 15:
    [
        {
            creepType: RedVillager,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: BlueVillager,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: GreenVillager,
            amount: 12,
            delay: 0.9
        },
        {
            creepType: YellowVillager,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: PinkVillager,
            amount: 5,
            delay: 0.9
        }
    ],

    // ROUND 16:
    [
        {
            creepType: GreenVillager,
            amount: 40,
            delay: 0.9
        },
        {
            creepType: YellowVillager,
            amount: 8,
            delay: 0.9
        }
    ],

    // ROUND 17:
    [
        {
            creepType: YellowVillager,
            amount: 12,
            delay: 0.9,
            modifiers: [regenModifier],
        },
    ],

    // ROUND 18:
    [
        {
            creepType: GreenVillager,
            amount: 80,
            delay: 0.9
        }
    ],

    // ROUND 19:
    [
        {
            creepType: GreenVillager,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: YellowVillager,
            amount: 4,
            delay: 0.9
        },
        {
            creepType: YellowVillager,
            amount: 5,
            delay: 0.9,
            modifiers: [regenModifier],
        },
        {
            creepType: PinkVillager,
            amount: 4,
            delay: 0.9
        },
    ],

    // ROUND 20:
    [
        {
            creepType: BlackVillager,
            amount: 6,
            delay: 0.9
        },
    ],

    // ROUND 21
    [
        {
            creepType: YellowVillager,
            amount: 40,
            delay: 0.9
        },
        {
            creepType: PinkVillager,
            amount: 14,
            delay: 0.9
        },
    ],

    // ROUND 22:
    [
        {
            creepType: WhiteVillager,
            amount: 16,
            delay: 0.9
        },
    ],

    // ROUND 23:
    [
        {
            creepType: BlackVillager,
            amount: 7,
            delay: 0.9
        },
        {
            creepType: WhiteVillager,
            amount: 7,
            delay: 0.9
        },
    ],

    // ROUND 24:
    [
        {
            creepType: BlueVillager,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: GreenVillager,
            amount: 1,
            delay: 0.9,
            modifiers: [invisibilityModifier]
        },
    ],

    // ROUND 25:
    [
        {
            creepType: YellowVillager,
            amount: 25,
            delay: 0.9,
            modifiers: [regenModifier]
        },
        {
            creepType: PurpleVillager,
            amount: 10,
            delay: 0.9,
        },
    ],

    // ROUND 26:
    [
        {
            creepType: RedVillager,
            amount: 23,
            delay: 0.9,
            modifiers: [regenModifier]
        },
        {
            creepType: ZebraVillager,
            amount: 4,
            delay: 0.9,
        },
    ],

    // ROUND 27:
    [
        {
            creepType: RedVillager,
            amount: 100,
            delay: 0.1,
        },
        {
            creepType: BlueVillager,
            amount: 60,
            delay: 0.1,
        },
        {
            creepType: GreenVillager,
            amount: 45,
            delay: 0.1
        },
        {
            creepType: YellowVillager,
            amount: 45,
            delay: 0.1
        }
    ],

    // ROUND 28:
    [
        {
            creepType: FortifiedVillager,
            amount: 6,
            delay: 0.9,
        },
    ],

    // ROUND 29:
    [
        {
            creepType: YellowVillager,
            amount: 50,
            delay: 0.9,
        },
        {
            creepType: YellowVillager,
            amount: 15,
            delay: 0.9,
            modifiers: [regenModifier]
        },
    ],

    // ROUND 30:
    [
        {
            creepType: FortifiedVillager,
            amount: 9,
            delay: 0.9,
        },
    ],

    // ROUND 31:
    [
        {
            creepType: BlackVillager,
            amount: 8,
            delay: 0.9,
        },
        {
            creepType: WhiteVillager,
            amount: 8,
            delay: 0.9,
        },
        {
            creepType: ZebraVillager,
            amount: 8,
            delay: 0.9,
        },
        {
            creepType: ZebraVillager,
            amount: 2,
            delay: 0.9,
            modifiers: [regenModifier]
        },
    ],

    // ROUND 32:
    [
        {
            creepType: BlackVillager,
            amount: 15,
            delay: 0.9,
        },
        {
            creepType: WhiteVillager,
            amount: 20,
            delay: 0.9,
        },
        {
            creepType: PurpleVillager,
            amount: 10,
            delay: 0.9,
        },
    ],

    // ROUND 33:
    [
        {
            creepType: RedVillager,
            amount: 20,
            delay: 0.1,
            modifiers: [invisibilityModifier],
        },
        {
            creepType: YellowVillager,
            amount: 13,
            delay: 0.6,
            modifiers: [invisibilityModifier],
        },
    ],

    // ROUND 34:
    [
        {
            creepType: YellowVillager,
            amount: 160,
            delay: 0.05,
        },
        {
            creepType: ZebraVillager,
            amount: 6,
            delay: 0.9,
        },
    ],

    // ROUND 35:
    [
        {
            creepType: PinkVillager,
            amount: 35,
            delay: 0.4,
        },
        {
            creepType: BlackVillager,
            amount: 30,
            delay: 0.4,
        },
        {
            creepType: WhiteVillager,
            amount: 25,
            delay: 0.4,
        },
        {
            creepType: RainbowVillager,
            amount: 6,
            delay: 0.4,
        },
    ],

    // ROUND 36:
    [
        {
            creepType: PinkVillager,
            amount: 140,
            delay: 0.05,
        },
        {
            creepType: GreenVillager,
            amount: 30,
            delay: 0.4,
            modifiers: [regenModifier, invisibilityModifier],
        },
    ],

    // ROUND 37:
    [
        {
            creepType: BlackVillager,
            amount: 25,
            delay: 0.5,
        },
        {
            creepType: WhiteVillager,
            amount: 25,
            delay: 0.5,
        },
        {
            creepType: WhiteVillager,
            amount: 7,
            delay: 0.5,
            modifiers: [invisibilityModifier],
        },
        {
            creepType: ZebraVillager,
            amount: 10,
            delay: 0.5,
        },
        {
            creepType: FortifiedVillager,
            amount: 15,
            delay: 0.5,
        },
    ],

    // ROUND 38:
    [
        {
            creepType: PinkVillager,
            amount: 42,
            delay: 0.1,
        },
        {
            creepType: WhiteVillager,
            amount: 17,
            delay: 0.1,
        },
        {
            creepType: ZebraVillager,
            amount: 10,
            delay: 0.1,
        },
        {
            creepType: FortifiedVillager,
            amount: 14,
            delay: 0.1,
        },
        {
            creepType: LargeVillager,
            amount: 2,
            delay: 0.9,
        },
    ],

    // ROUND 39:
    [
        {
            creepType: BlackVillager,
            amount: 10,
            delay: 0.1,
        },
        {
            creepType: WhiteVillager,
            amount: 10,
            delay: 0.1,
        },
        {
            creepType: ZebraVillager,
            amount: 20,
            delay: 0.1,
        },
        {
            creepType: RainbowVillager,
            amount: 18,
            delay: 0.1,
        },
        {
            creepType: RainbowVillager,
            amount: 2,
            delay: 0.1,
            modifiers: [regenModifier],
        },
    ],

    // ROUND 40:
    [
        {
            creepType: Zeppelin,
            amount: 1,
            delay: 0.9,
        },
    ],
];

export function getRoundCreeps(currentRound: number): Round {
    return rounds[Math.min(currentRound, rounds.length - 1)];
}