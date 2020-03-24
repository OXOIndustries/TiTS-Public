package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.Engine.Utility.rand;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.Items.Accessories.SalamanderDefenseSystem;
	import classes.Items.Accessories.BimboleumDefenseSystem;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function calculateDamage(baseDamage:TypeCollection, attacker:Creature, target:Creature, special:String = ""):DamageResult
	{
		// Split damage into the two components -- HP/Shield and Lust
		
		var baseHPDamage:TypeCollection = new TypeCollection();
		var baseLustDamage:TypeCollection = new TypeCollection();
		
		for (var i:uint = 0; i < DamageType.NUMTYPES; i++)
		{
			if (baseDamage.getType(i).isHPDamage) baseHPDamage.getType(i).damageValue = baseDamage.getType(i).damageValue;
			else baseLustDamage.getType(i).damageValue = baseDamage.getType(i).damageValue;
		}
		
		var dFlags:Vector.<DamageFlag> = baseDamage.getFlags();
		
		for (i = 0; i < dFlags.length; i++)
		{
			var df:DamageFlag = new DamageFlag();
			var dfl:DamageFlag = new DamageFlag();
			
			df.loadSaveObject(dFlags[i].getSaveObject());
			dfl.loadSaveObject(dFlags[i].getSaveObject());
			
			baseHPDamage.addDamageFlag(df);
			baseLustDamage.addDamageFlag(dfl);
		}
		
		var damageResult:DamageResult = new DamageResult();
		
		/****************************
		 * Apply damage bonuses here
		 ****************************/
		
		// Take care HOW you apply bonuses here -- lust AND hp damage can be modified
		// Special will allow you to apply bonus only to 'default' attacks.
		
		if (attacker != null && (special == "ranged" || special == "melee"))
		{
			var crittyBonus:Number = 0;
			if(attacker.hasPerk("Giant Slayer"))
			{
				var tallnessLimit:Number = attacker.perkv1("Giant Slayer");
				if(tallnessLimit == 0) tallnessLimit = 7*12;
				var crittyness:Number = attacker.perkv2("Giant Slayer");
				if(crittyness == 0) crittyness = 5;
				if(target.tallness >= tallnessLimit) crittyBonus += crittyness;
			}

			if(target.hasStatusEffect("Deep Freeze") && baseDamage.hasFlag(DamageFlag.CRUSHING))
			{
				damageResult.wasCrit = true;
				baseHPDamage.multiply(target.statusEffectv3("Deep Freeze"));
			}
			if(target.evasion() < 0)
			{
				//So, -1 evasion = mult by 1.03
				//-5 = mult by 1.15
				baseHPDamage.multiply(target.evasion() * -4 / 100 + 1);
			}
			if (special == "melee")
			{
				// Melee crit
				if(!attacker.isBlind() && attacker.critBonus(true) + crittyBonus >= rand(100) + 1 && (attacker is PlayerCharacter || attacker.hasPerk("Can Crit")) && !baseHPDamage.hasFlag(DamageFlag.NO_CRIT))
				{
					damageResult.wasCrit = true;
					baseHPDamage.multiply(2);
				}
				//Alpha strike forcing them criiiiiits!
				else if (!attacker.isBlind() && attacker.hasPerk("Alpha Strike") && !attacker.hasStatusEffect("AlphaedStroked") && !baseHPDamage.hasFlag(DamageFlag.NO_CRIT))
				{
					damageResult.wasCrit = true;
					baseHPDamage.multiply(2);
				}
				
				// Sneak attack
				if (!attacker.isBlind() && (target.hasStatusEffect("Stunned") || target.isBlind()) && attacker.hasPerk("Sneak Attack")) 
				{
					damageResult.wasSneak = true;
					
					baseHPDamage.add(attacker.level * 3 + attacker.bimboIntelligence()/2);
					if (attacker.hasStatusEffect("Take Advantage")) baseHPDamage.add(attacker.level * 2);
					if (target.hasStatusEffect("Stunned") && target.isBlind()) baseHPDamage.add(attacker.level);
				}
				
				//Burninate the countryside
				if (baseHPDamage.getTotal() > 0 && baseHPDamage.hasFlag(DamageFlag.CHANCE_APPLY_BURN) && target.willTakeBurnDamage(baseDamage.burning.damageValue) && rand(5) == 0)
				{
					CombatAttacks.applyBurn(target, 2);
				}

				//Electrified weapons do more damage based on int!
				if (attacker.hasStatusEffect("Charged Weapon"))
				{
					var chargeBonus:Number = attacker.bimboIntelligence();
					baseHPDamage.add(new TypeCollection( { electric: chargeBonus } ));
				}
				
				//Akane skills
				if (target.hasStatusEffect("Fade-cloak"))
				{
					if (baseHPDamage.getTotal() > 0)
					{
						if (!target.hasStatusEffect("Fade-cloak struck")) target.createStatusEffect("Fade-cloak struck");
					}
				}
				if (target.hasStatusEffect("Petra overcharge"))
				{
					if (target.hasStatusEffect("Petra shield hits")) target.addStatusValue("Petra shield hits", 1, 1);
					else target.createStatusEffect("Petra shield hits", 1, 0, 0, 0, true, "", "", true);
				}
				
				// War Cry Buff
				if (attacker.hasStatusEffect("War Cry"))
				{
					baseHPDamage.add(attacker.statusEffectv1("War Cry"));
				}
				
				//Special counter - added when PC melees something. Eaten at the end of the round.
				if(attacker is PlayerCharacter && !target.hasStatusEffect("Melee Counter")) target.createStatusEffect("Melee Counter",0,0,0,0);
			}
			if (special == "ranged")
			{
				if (!attacker.isBlind() && attacker.hasStatusEffect("Concentrated Fire"))
				{
					baseHPDamage.add(attacker.statusEffectv1("Concentrated Fire"));
				}
				
				// Ranged crit 
				if(!attacker.isBlind() && attacker.critBonus(false) + crittyBonus >= rand(100) + 1 && (attacker is PlayerCharacter || attacker.hasPerk("Can Crit")) && !baseHPDamage.hasFlag(DamageFlag.NO_CRIT))
				{
					damageResult.wasCrit = true;
					baseHPDamage.multiply(2);
				}
				//Alpha strike forcing them criiiiiits!
				else if (!attacker.isBlind() && attacker.hasPerk("Alpha Strike") && !attacker.hasStatusEffect("AlphaedStroked") && !baseHPDamage.hasFlag(DamageFlag.NO_CRIT))
				{
					damageResult.wasCrit = true;
					baseHPDamage.multiply(2);
				}
				
				// Sneak Attack (AKA Aimed Shot)
				if (baseHPDamage.getTotal() > 0 && !attacker.isBlind() && (target.hasStatusEffect("Stunned") || target.isBlind()) && attacker.hasPerk("Aimed Shot")) 
				{
					output("\n<b>Aimed shot!</b>");
					baseHPDamage.add(attacker.level * 3 + attacker.bimboIntelligence()/2);
					if(attacker.hasStatusEffect("Take Advantage")) baseHPDamage.add(attacker.level * 2);
					if(target.hasStatusEffect("Stunned") && target.isBlind()) baseHPDamage.add(attacker.level);
				}
				
				//Burninate the countryside
				if (baseHPDamage.getTotal() > 0 && baseHPDamage.hasFlag(DamageFlag.CHANCE_APPLY_BURN) && target.willTakeBurnDamage(baseDamage.burning.damageValue) && rand(5) == 0)
				{
					CombatAttacks.applyBurn(target, 2);
				}
				
				//AkaneQuest skills ranged edition
				if (target.hasStatusEffect("Petra overcharge") && rand(2) == 0)
				{
					if (baseHPDamage.hasFlag(DamageFlag.LASER) || baseHPDamage.hasFlag(DamageFlag.ENERGY_WEAPON))
					{					
						baseHPDamage.multiply(0.5);
						baseHPDamage.applyResistances(target.getShieldResistances());
						var dmg:int = baseHPDamage.getTotal();
						output(" " + (target is PlayerCharacter ? "Your" : target.short + "'s") + " shield charges itself with the energy of the attack!");
						target.shields(dmg);
						baseHPDamage.multiply(0);
					}
				}
				
				// War Cry Buff
				if (attacker.hasStatusEffect("War Cry"))
				{
					baseHPDamage.add(attacker.statusEffectv1("War Cry"));
				}
			}
			if (special == "explosion" || special == "cluster")
			{
				if (target.hasPerk("Get Down!")) baseHPDamage.multiply((100-target.perkv1("Get Down!")/100));
			}
			//Track Alpha Strike. Don't need to track the perk here cause who cares.
			if(attacker.hasPerk("Alpha Strike") && !attacker.hasStatusEffect("AlphaedStroked") && damageResult.wasCrit == true) attacker.createStatusEffect("AlphaedStroked",0,0,0,0,true,"","",true);
		}
		
		//Reduce damage for gravitational fiiiieeeeelds
		if(attacker != null && target != null)
		{
			if(attacker.hasStatusEffect("Gravitational Anomaly") || target.hasStatusEffect("Gravitational Anomaly"))
			{
				//baseHPDamage.multiply(0.5);
				//baseHPDamage.multiply(new TypeCollection( { kinetic: 0.5 } ));
				baseHPDamage.kinetic.damageValue *= 0.5;
			}
		}
		
		//More akane statuses
		if(attacker != null)
		{
			if (attacker.hasStatusEffect("Fade-cloak"))
			{
				baseHPDamage.multiply(attacker.statusEffectv3("Fade-cloak")/100.0 + 1);
			}
			if (attacker.hasStatusEffect("Brutalized"))
			{
				baseHPDamage.multiply(0.9);
				baseLustDamage.multiply(0.9);
			}
		}
		
		//10% damage boost vs Treated
		//Fen note: No this is bad and it should feel bad.
		//if(attacker.hasPerk("Chupacabro Slayer") && target.isTreated()) baseHPDamage.multiply(1.1);
		

		/****************************
		 * Now apply the damage.
		 ****************************/		
		damageResult.remainingDamage = baseHPDamage;
		damageResult.remainingLustDamage = baseLustDamage;
		
		if (!damageResult.remainingDamage.hasFlag(DamageFlag.BYPASS_SHIELD) && damageResult.remainingDamage.getTotal() > 0)
		{
			calculateShieldDamage(target, attacker, damageResult, special);
			
			for (i = 0; i < DamageType.NUMTYPES; i++)
			{
				if (isNaN(damageResult.typedTotalDamage.getType(i).damageValue)) throw new Error("NaN");
			}
		}
		
		if (!damageResult.remainingDamage.hasFlag(DamageFlag.ONLY_SHIELD) && damageResult.remainingDamage.getTotal() > 0)
		{
			calculateHPDamage(target, attacker, damageResult, special);
			
			for (i = 0; i < DamageType.NUMTYPES; i++)
			{
				if (isNaN(damageResult.typedTotalDamage.getType(i).damageValue)) throw new Error("NaN");
			}
		}
		
		if (damageResult.remainingLustDamage.getTotal() > 0)
		{
			calculateLustDamage(target, attacker, damageResult, special);
		}
		
		// Round all the values for display
		damageResult.hpDamage = Math.round(damageResult.hpDamage);
		damageResult.shieldDamage = Math.round(damageResult.shieldDamage);
		damageResult.lustDamage = Math.round(damageResult.lustDamage);
		damageResult.totalDamage = Math.round(damageResult.totalDamage);

		//Cool accessory procs!
		if(damageResult.shieldDamage >= target.shields() && target.hasShields())
		{
			if(target.accessory is SalamanderDefenseSystem || target.accessory is BimboleumDefenseSystem)
			{
				if(!target.hasStatusEffect("Def Proc")) target.createStatusEffect("Def Proc",1,0,0,0,true,"","",true,0);
			}
		}
		//For tracking shield regeneration for level 10 boopers
		if(damageResult.shieldDamage > 0 && !target.hasStatusEffect("Shields Damaged")) target.createStatusEffect("Shields Damaged", 0, 0, 0, 0, true, "", "", true, 0);

		return damageResult;
	}

}
