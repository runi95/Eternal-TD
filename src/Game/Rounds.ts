import { BlueVillager } from "../Creeps/Normal/BlueVillager";
import { Creep } from "../Creeps/Creep";
import { GreenVillager } from "../Creeps/Normal/GreenVillager";
import { PinkVillager } from "../Creeps/Normal/PinkVillager";
import { RedVillager } from "../Creeps/Normal/RedVillager";
import { YellowVillager } from "../Creeps/Normal/YellowVillager";
import { Modifier } from "../Creeps/Modifier";
import { RegenModifier } from "../Creeps/Modifiers/RegenModifier";

const regenModifier = new RegenModifier();

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
            amount: 20,
            delay: 0.9
        }
    ],

    // ROUND 2:
    [
        {
            creepType: RedVillager,
            amount: 35,
            delay: 0.9
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
];

export function getRoundCreeps(currentRound: number): Round {
    return rounds[Math.min(currentRound, rounds.length - 1)];
}