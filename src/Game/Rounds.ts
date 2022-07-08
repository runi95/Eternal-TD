import { CreepBaseUnit } from "Creeps/CreepBaseUnit";
import { CreepBaseUnits } from "Creeps/CreepBaseUnits";
import { CreepModifier } from "Creeps/CreepModifier";
import { InvisibilityModifier } from "../Creeps/Modifiers/InvisibilityModifier";
import { RegenModifier } from "Creeps/Modifiers/RegenModifier";
import { EvasionModifier } from "../Creeps/Modifiers/EvasionModifier";
import { DoubleHealthModifier } from "../Creeps/Modifiers/DoubleHealthModifier";
import { OverflowProtectionModifier } from "../Creeps/Modifiers/OverflowProtectionModifier";

interface CreepSpawnDetails {
    creepType: CreepBaseUnit;
    amount: number;
}

interface Round {
    newModifier?: CreepModifier;
    creeps: CreepSpawnDetails[];
}

type Rounds = Round[];

const rounds: Rounds = [
    // ROUND 1:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 20,
        }],
        newModifier: EvasionModifier.EVASION_MODIFIER
    },

    // ROUND 2:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 35,
        }],
        newModifier: DoubleHealthModifier.DOUBLE_HEALTH_MODIFIER
    },

    // ROUND 3:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 25,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 5,
        }],
    },

    // ROUND 4:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 35,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 18,
        }]
    },

    // ROUND 5:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 5,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 27,
        }]
    },

    // ROUND 6:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 15,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 15,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 4,
        }]
    },

    // ROUND 7:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 20,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 20,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 5,
        }]
    },

    // ROUND 8:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 20,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 14,
        }]
    },

    // ROUND 9:
    {
        creeps: [{
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 30,
        }],
        newModifier: OverflowProtectionModifier.OVERFLOW_PROTECTION_MODIFIER
    },

    // ROUND 10:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 102,
        }]
    },

    // ROUND 11:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 12,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 3,
        }]
    },

    // ROUND 12:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 15,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 5,
        }]
    },

    // ROUND 13:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 50,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 23,
        }]
    },

    // ROUND 14:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 49,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 15,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 9,
        }]
    },

    // ROUND 15:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 20,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 15,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 12,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 5,
        }]
    },

    // ROUND 16:
    {
        creeps: [{
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 40,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 8,
        }]
    },

    // ROUND 17:
    {
        creeps: [{
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 12,
        }],
        newModifier: RegenModifier.REGEN_MODIFIER,
    },

    // ROUND 18:
    {
        creeps: [{
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 80,
        }]
    },

    // ROUND 19:
    {
        creeps: [{
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 4,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 5,
        },
        {
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 4,
        }]
    },

    // ROUND 20:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 6,
        }]
    },

    // ROUND 21
    {
        creeps: [{
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 40,
        },
        {
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 14,
        }]
    },

    // ROUND 22:
    {
        creeps: [{
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 16,
        }]
    },

    // ROUND 23:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 7,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 7,
        }]
    },

    // ROUND 24:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 20,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 1,
        }],
        newModifier: InvisibilityModifier.INVISIBILITY_MODIFIER
    },

    // ROUND 25:
    {
        creeps: [{
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 25,
        },
        {
            creepType: CreepBaseUnits.PURPLE_VILLAGER,
            amount: 10,
        }]
    },

    // ROUND 26:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 23,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 4,
        }]
    },

    // ROUND 27:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 100,
        },
        {
            creepType: CreepBaseUnits.BLUE_VILLAGER,
            amount: 60,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 45,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 45,
        }]
    },

    // ROUND 28:
    {
        creeps: [{
            creepType: CreepBaseUnits.FORTIFIED_VILLAGER,
            amount: 6,
        }]
    },

    // ROUND 29:
    {
        creeps: [{
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 50,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 15,
        }]
    },

    // ROUND 30:
    {
        creeps: [{
            creepType: CreepBaseUnits.FORTIFIED_VILLAGER,
            amount: 9,
        }]
    },

    // ROUND 31:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 8,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 8,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 8,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 2,
        }]
    },

    // ROUND 32:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 15,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 20,
        },
        {
            creepType: CreepBaseUnits.PURPLE_VILLAGER,
            amount: 10,
        }]
    },

    // ROUND 33:
    {
        creeps: [{
            creepType: CreepBaseUnits.RED_VILLAGER,
            amount: 20,
        },
        {
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 13,
        }]
    },

    // ROUND 34:
    {
        creeps: [{
            creepType: CreepBaseUnits.YELLOW_VILLAGER,
            amount: 160,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 6,
        }]
    },

    // ROUND 35:
    {
        creeps: [{
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 35,
        },
        {
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 30,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 25,
        },
        {
            creepType: CreepBaseUnits.RAINBOW_VILLAGER,
            amount: 6,
        }]
    },

    // ROUND 36:
    {
        creeps: [{
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 140,
        },
        {
            creepType: CreepBaseUnits.GREEN_VILLAGER,
            amount: 30,
        }]
    },

    // ROUND 37:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 25,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 25,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 7,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.FORTIFIED_VILLAGER,
            amount: 15,
        }]
    },

    // ROUND 38:
    {
        creeps: [{
            creepType: CreepBaseUnits.PINK_VILLAGER,
            amount: 42,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 17,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.FORTIFIED_VILLAGER,
            amount: 14,
        },
        {
            creepType: CreepBaseUnits.LARGE_VILLAGER,
            amount: 2,
        }]
    },

    // ROUND 39:
    {
        creeps: [{
            creepType: CreepBaseUnits.BLACK_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.WHITE_VILLAGER,
            amount: 10,
        },
        {
            creepType: CreepBaseUnits.ZEBRA_VILLAGER,
            amount: 20,
        },
        {
            creepType: CreepBaseUnits.RAINBOW_VILLAGER,
            amount: 18,
        },
        {
            creepType: CreepBaseUnits.RAINBOW_VILLAGER,
            amount: 2,
        }]
    },

    // ROUND 40:
    {
        creeps: [{
            creepType: CreepBaseUnits.ZEPPELIN,
            amount: 1,
        }]
    },
];

export function getRoundCreeps(currentRound: number): Round {
    return rounds[Math.min(currentRound, rounds.length - 1)];
}
