package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.rand;
	import classes.Characters.PlayerCharacter;
	import classes.Items.Piercings.GeddaniumRingPiercing;
	import classes.Items.Piercings.UrtaniumRingPiercing;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function calculateLustDamage(target:Creature, attacker:Creature, damageResult:DamageResult, special:String = ""):void
	{
		if (target == null) return;
		
		if (target.isLustImmune)
		{
			damageResult.remainingLustDamage = new TypeCollection();
			damageResult.lustDamage = 0;
			damageResult.lustResisted = true;
			return;
		}
		
		var tarResistances:TypeCollection = target.getLustResistances();
		
		if (target is PlayerCharacter && kGAMECLASS.easy)
		{
			tarResistances.addFlag(DamageFlag.EASY);
			damageResult.easyModeApplied = true;
		}
		
		if (target.lustRaw >= target.lustMax()) return;
		
		// Apply bonuses to specific damage types.
		var lustDamage:TypeCollection = damageResult.remainingLustDamage.makeCopy();
		
		if (lustDamage.tease.damageValue > 0 && attacker != null) lustDamage.tease.damageValue += attacker.sexiness() / 2;
		if (lustDamage.tease.damageValue > 0 && attacker != null && attacker.hasPheromones()) lustDamage.pheromone.damageValue += 1 + rand(attacker.pheromoneLevel());

		//Enemies with sexjuice coverings get bonuses against the PC - but not the other way around. PC bonuses handled by PC tease system.
		if (lustDamage.tease.damageValue > 0 && target is PlayerCharacter)
		{
			if(target.hasCock() && attacker != null && attacker.hasStatusEffect("Cum Soaked")) 
			{
				var spunkBonus:Number = attacker.statusEffectv1("Cum Soaked");
				if (spunkBonus > 5) spunkBonus = 5;
				lustDamage.tease.damageValue += spunkBonus;
			}
			if (lustDamage.tease.damageValue > 0 && target.hasVagina() && attacker != null && attacker.hasStatusEffect("Pussy Drenched")) 
			{
				var slutsauceBonus:Number = attacker.statusEffectv1("Pussy Drenched");
				if (slutsauceBonus > 5) slutsauceBonus = 5;
				lustDamage.tease.damageValue += slutsauceBonus;
			}
		}

		//25% dam multiplier
		if (lustDamage.tease.damageValue > 0 && target.hasStatusEffect("Red Myr Venom")) lustDamage.tease.damageValue *= 1.25;

		// Apply any defensive modifiers
		var damMulti:Number = 1;
		if (target.hasStatusEffect("Blue Balls")) damMulti += 0.25;
		if (target.hasStatusEffect("Sex On a Meteor")) damMulti += 0.5;
		if (target.hasStatusEffect("\"Rutting\"")) damMulti += 0.5;
		if (target.hasStatusEffect("Tallavarian Tingler")) damMulti += 0.5;
		if (lustDamage.tease.damageValue > 0)
		{
			if(target.hasPiercingOfClass(GeddaniumRingPiercing) && attacker != null && attacker.hasScales()) lustDamage.tease.damageValue *= 1.3;
			if(target.hasPiercingOfClass(UrtaniumRingPiercing) && attacker != null && attacker.hasFur()) lustDamage.tease.damageValue *= 1.3;
		}

		//New status: "Red Myr Venom" replaces this.
		//if (target.hasStatusEffect("Myr Venom")) damMulti += 0.25;
		if (target.hasPerk("Easy")) damMulti += 0.2;
		if (target.hasStatusEffect("Fuck Fever") && attacker != null && attacker.hasCock()) damMulti += 0.4;
		if (target.hasStatusEffect("Flushed") && attacker != null && attacker.hasCock()) damMulti += 0.2;
		if (attacker != null && attacker.hasFur())
		{
			if (target.statusEffectv2("Furpies Simplex H") == 1 || target.statusEffectv2("Furpies Simplex C") == 1 || target.statusEffectv2("Furpies Simplex D") == 1) damMulti += 0.25;
		}
		if (target.hasStatusEffect("Oil Aroused")) damMulti += 0.1;
		if (damMulti != 1) lustDamage.multiply(damMulti);
		
		// Apply resistances
		lustDamage.applyResistances(tarResistances);
		var damageAfterResistances:Number = lustDamage.getTotal();
		
		// Lust ARMOOOOOR
		var lustDef:Number = target.lustDef();
		
		if (target.hasPerk("Akane's Painslut")) lustDef -= Math.round(((target.HPMax() - target.HP()) / target.HPMax()) * 5 * target.level);
		
		damageAfterResistances -= lustDef;
		damageAfterResistances = Math.round(damageAfterResistances);
		
		// Clamp damage done to 1 > Damage > DamageToCap
		if (damageAfterResistances < 1) damageAfterResistances = 1;
		if (damageAfterResistances > (target.lustMax() - target.lust()))
		{
			var damDiff:Number = (target.lustMax() - target.lust()) / damageAfterResistances;
			damageAfterResistances = target.lustMax() - target.lust();
			
			damageResult.lustDamage = damageAfterResistances;
			damageResult.typedLustDamage = lustDamage.makeCopy();
			damageResult.typedLustDamage.multiply(damDiff);
			
			damageResult.totalDamage += damageAfterResistances;
			damageResult.typedTotalDamage.add(damageResult.typedLustDamage);
		}
		else
		{
			damageResult.typedLustDamage = lustDamage.makeCopy();
			damageResult.lustDamage = damageAfterResistances;
			
			damageResult.totalDamage += damageAfterResistances;
			damageResult.typedTotalDamage.add(damageResult.typedLustDamage);
		}
		
		target.lust(damageAfterResistances);
	}

}