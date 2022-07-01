import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { CreepBaseUnits } from "Creeps/CreepBaseUnits";
import { CreepModifier } from "Creeps/CreepModifier";
import { InvisibilityModifier } from "../Creeps/Modifiers/InvisibilityModifier";
import { RegenModifier } from "Creeps/Modifiers/RegenModifier";

interface CreepSpawnDetails {
    creepType: CreepBaseUnit;
    amount: number;
    delay: number;
    modifiers?: CreepModifier[];
}

type Round = CreepSpawnDetails[];
type Rounds = Round[];

const rounds: Rounds = [
    // ROUND 1:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 20,
            delay: 0.9,
        }
    ],

    // ROUND 2:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 35,
            delay:  0.9
        }
    ],

    // ROUND 3:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 25,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 5,
            delay: 0.9
        }
    ],

    // ROUND 4:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 35,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 18,
            delay: 0.9
        }
    ],

    // ROUND 5:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 5,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 27,
            delay: 0.9
        }
    ],

    // ROUND 6:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 4,
            delay: 0.9
        }
    ],

    // ROUND 7:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 5,
            delay: 0.9
        }
    ],

    // ROUND 8:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 14,
            delay: 0.9
        },
    ],

    // ROUND 9:
    [
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 30,
            delay: 0.9
        }
    ],

    // ROUND 10:
    [
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 102,
            delay: 0.9
        }
    ],

    // ROUND 11:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 12,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 3,
            delay: 0.9
        }
    ],

    // ROUND 12:
    [
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 5,
            delay: 0.9
        }
    ],

    // ROUND 13:
    [
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 50,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 23,
            delay: 0.9
        }
    ],

    // ROUND 14:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 49,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 9,
            delay: 0.9
        },
    ],

    // ROUND 15:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 15,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 12,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 5,
            delay: 0.9
        }
    ],

    // ROUND 16:
    [
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 40,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 8,
            delay: 0.9
        }
    ],

    // ROUND 17:
    [
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 12,
            delay: 0.9,
            modifiers: [RegenModifier.REGEN_MODIFIER],
        },
    ],

    // ROUND 18:
    [
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 80,
            delay: 0.9
        }
    ],

    // ROUND 19:
    [
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 10,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 4,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 5,
            delay: 0.9,
            modifiers: [RegenModifier.REGEN_MODIFIER],
        },
        {
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 4,
            delay: 0.9
        },
    ],

    // ROUND 20:
    [
        {
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 6,
            delay: 0.9
        },
    ],

    // ROUND 21
    [
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 40,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 14,
            delay: 0.9
        },
    ],

    // ROUND 22:
    [
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 16,
            delay: 0.9
        },
    ],

    // ROUND 23:
    [
        {
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 7,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 7,
            delay: 0.9
        },
    ],

    // ROUND 24:
    [
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 20,
            delay: 0.9
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 1,
            delay: 0.9,
            modifiers: [InvisibilityModifier.INVISIBILITY_MODIFIER]
        },
    ],

    // ROUND 25:
    [
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 25,
            delay: 0.9,
            modifiers: [RegenModifier.REGEN_MODIFIER]
        },
        {
            creepType: CreepBaseUnits.PURPLE_VILLAGER,
            amount: 10,
            delay: 0.9,
        },
    ],

    // ROUND 26:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 23,
            delay: 0.9,
            modifiers: [RegenModifier.REGEN_MODIFIER]
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 4,
            delay: 0.9,
        },
    ],

    // ROUND 27:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 100,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 60,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 45,
            delay: 0.1
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 45,
            delay: 0.1
        }
    ],

    // ROUND 28:
    [
        {
            creepType: CreepBaseUnits.FORTIFIED_VILLAGER,
            amount: 6,
            delay: 0.9,
        },
    ],

    // ROUND 29:
    [
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 50,
            delay: 0.9,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 15,
            delay: 0.9,
            modifiers: [RegenModifier.REGEN_MODIFIER]
        },
    ],

    // ROUND 30:
    [
        {
            creepType: CreepBaseUnits.FORTIFIED_VILLAGER,
            amount: 9,
            delay: 0.9,
        },
    ],

    // ROUND 31:
    [
        {
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 8,
            delay: 0.9,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 8,
            delay: 0.9,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 8,
            delay: 0.9,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 2,
            delay: 0.9,
            modifiers: [RegenModifier.REGEN_MODIFIER]
        },
    ],

    // ROUND 32:
    [
        {
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 15,
            delay: 0.9,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 20,
            delay: 0.9,
        },
        {
            creepType: CreepBaseUnits.PURPLE_VILLAGER,
            amount: 10,
            delay: 0.9,
        },
    ],

    // ROUND 33:
    [
        {
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 20,
            delay: 0.1,
            modifiers: [InvisibilityModifier.INVISIBILITY_MODIFIER],
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 13,
            delay: 0.6,
            modifiers: [InvisibilityModifier.INVISIBILITY_MODIFIER],
        },
    ],

    // ROUND 34:
    [
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 160,
            delay: 0.05,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 6,
            delay: 0.9,
        },
    ],

    // ROUND 35:
    [
        {
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 35,
            delay: 0.4,
        },
        {
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 30,
            delay: 0.4,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 25,
            delay: 0.4,
        },
        {
            creepType: CreepBaseUnits.RAINBOW_VILLAGER,
            amount: 6,
            delay: 0.4,
        },
    ],

    // ROUND 36:
    [
        {
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 140,
            delay: 0.05,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 30,
            delay: 0.4,
            modifiers: [RegenModifier.REGEN_MODIFIER, InvisibilityModifier.INVISIBILITY_MODIFIER],
        },
    ],

    // ROUND 37:
    [
        {
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 25,
            delay: 0.5,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 25,
            delay: 0.5,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 7,
            delay: 0.5,
            modifiers: [InvisibilityModifier.INVISIBILITY_MODIFIER],
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 10,
            delay: 0.5,
        },
        {
            creepType: CreepBaseUnits.FORTIFIED_VILLAGER,
            amount: 15,
            delay: 0.5,
        },
    ],

    // ROUND 38:
    [
        {
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 42,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 17,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 10,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.FORTIFIED_VILLAGER,
            amount: 14,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.LARGE_VILLAGER,
            amount: 2,
            delay: 0.9,
        },
    ],

    // ROUND 39:
    [
        {
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 10,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 10,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 20,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.RAINBOW_VILLAGER,
            amount: 18,
            delay: 0.1,
        },
        {
            creepType: CreepBaseUnits.RAINBOW_VILLAGER,
            amount: 2,
            delay: 0.1,
            modifiers: [RegenModifier.REGEN_MODIFIER],
        },
    ],

    // ROUND 40:
    [
        {
            creepType: CreepBaseUnits.ZEPPELIN,
            amount: 1,
            delay: 0.9,
        },
    ],
];

export function getRoundCreeps(currentRound: number): Round {
    return rounds[Math.min(currentRound, rounds.length - 1)];
}