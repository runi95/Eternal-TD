import { Sound } from "w3ts";

export class Sounds {
    public static START_OF_GAME: Sound = new Sound("Sound/Dialogue/UndeadCampaign/Undead08/U08Archimonde19.wav", false, false, true, 10, 10, "DefaultEAXON");
    public static START_OF_GAME_2: Sound = new Sound("Units/Human/Peasant/PeasantWarcry1.wav", false, false, true, 10, 10, "DefaultEAXON");
    public static LOSE_A_LIFE: Sound = new Sound("Abilities/Spells/Other/LoadUnload/Loading.wav", false, false, true, 10, 10, "DefaultEAXON");

    // Static only class
    protected constructor() { }
}
