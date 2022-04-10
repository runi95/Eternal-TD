import { Spell } from 'Spells/Spell';

const attackAbilityId: number = FourCC('Aatk');
export class AttackGround extends Spell {
    protected readonly abilityId: number = FourCC('A00B');

    public action(): void {
        const trig: unit = GetTriggerUnit();
        const x: number = GetSpellTargetX();
        const y: number = GetSpellTargetY();

        // Not allowed to attack ground if attack is hidden
        BlzUnitDisableAbility(trig, attackAbilityId, false, false);
        
        // Issue order to attack ground
        IssuePointOrderById(trig, 851984, x, y);

        // Hide attack again
        BlzUnitDisableAbility(trig, attackAbilityId, false, true);
    }
}
