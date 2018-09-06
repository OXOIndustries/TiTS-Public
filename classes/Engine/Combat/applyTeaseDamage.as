package classes.Engine.Combat 
{
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.Items.Piercings.GeddaniumRingPiercing;
	import classes.Items.Piercings.UrtaniumRingPiercing;
	import classes.Characters.*;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.possessive;
	import classes.StringUtil;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.teaseReactions;
	import classes.Util.InCollection;
	/**
	 * ...
	 * @author Gedan
	 */
	public function applyTeaseDamage(attacker:Creature, target:Creature, teaseCount:Number, teaseType:String, likeAdjustments:Array = null):void
	{
		if (target is Celise)
		{
			output("\n");
			CombatManager.processCombat();
			return;
		}
		
		var factor:Number = 1;
		var factorMax:Number = 2;
		var bonus:int = 0;
		var msg:String = "";
		
		if (likeAdjustments && likeAdjustments.length > 0)
		{
			for (var i:int = 0; i < likeAdjustments.length; i++) factor *= likeAdjustments[i];
		}
		//Free "really likes" for geddanium rang~
		if (attacker.hasPiercingOfClass(GeddaniumRingPiercing) && target.hasScales()) factor *= 2;
		if (attacker.hasPiercingOfClass(UrtaniumRingPiercing) && target.hasFur()) factor *= 2;
		if (attacker.hasStatusEffect("Sex On a Meteor") || attacker.hasStatusEffect("Tallavarian Tingler")) factor *= 1.5;
		if (attacker.hasStatusEffect("\"Rutting\"")) factor *= 1.5;
		if (attacker.hasStatusEffect("Body Paint")) factor *= 1.15;
		if (attacker.hasStatusEffect("Well-Groomed")) factor *= attacker.statusEffectv2("Well-Groomed");
		if ((target.originalRace == "nyrea" && attacker.hasPerk("Nyrean Royal")) || attacker.hasStatusEffect("Oil Aroused")) factor *= 1.1;
		if (attacker.hasFur())
		{
			if (target.statusEffectv2("Furpies Simplex H") == 1 || target.statusEffectv2("Furpies Simplex C") == 1 || target.statusEffectv2("Furpies Simplex D") == 1) factor *= 1.25;
		}
		
		if (factor > factorMax) factor = factorMax;
	
		if (attacker.hasPheromones()) bonus += attacker.pheromoneLevel();
		if (teaseType == "SQUIRT") bonus += 2;
		if (attacker.hasStatusEffect("Sweet Tooth")) bonus += 1;
		
		/* Fen note: cut to move this over to the sexprefs system.
		var sweatyBonus:int = 0;
		if(attacker.hasStatusEffect("Sweaty") && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SWEAT) > 0) 
		{
			//-5 per level normally, so add twice that since we flippin it'
			sweatyBonus = attacker.statusEffectv1("Sweaty") * 10;
			//Furries dont benefit quite as much.
			if(attacker.hasFur()) sweatyBonus = attacker.statusEffectv1("Sweaty") * 5;
		}*/
		
		if (target.isLustImmune || (target.willpower() / 2 + rand(20) + 1 > attacker.level * 2.5 * factor + 10 + teaseCount / 10 + attacker.sexiness() + bonus))
		{
			if(target is HandSoBot)
			{
				output("\n\n<i>“An attempt to confuse and overwhelm an enemy with an overt display of sexual dominance,”</i> says So. She sounds genuinely interested. <i>“An unorthodox but effective strategy in many known organic cultures’ approach to war. I was unaware sentients of a human upbringing had any experience of such a thing, however. Perhaps that explains why you are attempting it against a foe that cannot in any way feel desire.”</i>");
			}
			else if(target.isLustImmune == true) 
			{
				msg = "\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false);
				if(target.isPlural) msg += " don’t";
				else msg += " doesn’t";
				msg += " seem to care for your erotically-charged display.</b>";
				output(msg);
			}
			else if(teaseType == "SQUIRT") 
			{
				output("\n\nYour milk goes wide.");
				output(" (<b>0</b>)");
				teaseSkillUp(teaseType);
			}
			else if(teaseType == "DICK SLAP")
			{
				output("\n\nYour foe looks more annoyed than aroused at your antics as they wipe your girl lube off.");
				if(kGAMECLASS.silly) output(" You pity them somewhat. Your [pc.cumNoun] has a lot of nutrients in it...");
				output(" (<b>0</b>)");
				teaseSkillUp(teaseType);
			}
			else if (target is HuntressVanae || target is MaidenVanae)
			{
				output("\n\n");
				output(teaseReactions(0, target));
				output(" (<b>0</b>)");
				teaseSkillUp(teaseType);
			}
			else if (target is WetraHound)
			{
				output("\n\n");
				kGAMECLASS.wetraHoundAnimalIntellect();
				output(" (<b>0</b>)");
				teaseSkillUp(teaseType);
			}
			//Enemies with special fail messages
			else if(target is MaidenVanae || target is HuntressVanae)
			{
				output("\n\n" + teaseReactions(0, target) + " (<b>0</b>)");
				teaseSkillUp(teaseType);
			}
			else if(target is KorgonneFemale)
			{
				output("\n\nThe barbarian girl flashes a savage grin, apparently unfazed." + ((kGAMECLASS.silly) ? " <i>“No. So no. Wow. Very no.”</i>" : ""));
				output(" (<b>0</b>)");
				teaseSkillUp(teaseType);
			}
			else
			{
				output("\n\n" + StringUtil.capitalize(target.getCombatName()), false);
				if(target.isPlural) output(" resist");
				else output(" resists");
				output(" your erotically charged display... this time.");
				output(" (<b>0</b>)");
				teaseSkillUp(teaseType);
			}
		}
		else
		{
			var damage:Number = 10 * (teaseCount / 100 + 1) + attacker.sexiness() / 2 + attacker.statusEffectv2("Painted Penis") + attacker.statusEffectv4("Heat");
			if (teaseType == "SQUIRT") damage += 5;
			if (attacker.hasPheromones()) damage += 1 + rand(4);
			damage *= (rand(31) + 85) / 100;
			
			var bonusCap:Number = 0;
			bonusCap += attacker.statusEffectv3("Painted Penis");
			
			var cap:Number = 15 + attacker.level * 2 + bonusCap;
			damage = (Math.min(damage, cap) * factor);
			
			//Tease % resistance.
			if (InCollection(teaseType, ["SQUIRT", "DICK SLAP", "MYR VENOM"])) damage = (1 - (target.getLustResistances().drug.damageValue / 100)) * damage;
			else damage = (1 - (target.getLustResistances().tease.damageValue / 100)) * damage;
			//Level % reduction
			var levelDiff:Number = target.level - attacker.level;
			//Reduce tease damage by 50% for every level down the PC is.
			if(levelDiff > 0)
			{
				for(var z:int = levelDiff; z > 0; z--)
				{
					damage *= 0.70;
				}
			}

			//Tease armor - only used vs weapon-type attacks at present.
			//damage -= target.lustDef();

			cap = 30 + bonusCap;
			//Damage cap
			if (damage > cap) damage = cap;
			//Damage min
			if (damage < 0) damage = 0;
			
			if(target.lust() + damage > target.lustMax()) damage = target.lustMax() - target.lust();
			damage = Math.ceil(damage);
		
			output("\n\n");
			switch(teaseType)
			{
				case "SQUIRT":
					if(target.isPlural)
					{
						output(StringUtil.capitalize(target.getCombatName(), false) + " are splattered with your [pc.milk], unable to get it off.");
						if(damage > 0) output(" All of a sudden, their faces begin to flush, and they look quite aroused.");
						else output(" They seem unimpressed.");
					}
					else
					{
						output(StringUtil.capitalize(target.getCombatName(), false) + " is splattered with your [pc.milk], unable to get it off.");
						if(damage > 0) output(" All of a sudden, " + target.mfn("his","her","its") + " " + target.face() + " begins to flush, and " + target.mfn("he","she","it") + " looks quite aroused.");
						else output(" " + target.mfn("He","She","It") + " seems unimpressed.");
					}
					break;
				case "DICK SLAP":
					if(target.isPlural)
					{
						output(StringUtil.capitalize(possessive(target.getCombatName()), false));
						if(damage > 0) output(" faces look rather flush as they");
						output(" quickly wipe your [pc.cum] off.");
					}
					else
					{
						output(StringUtil.capitalize(possessive(target.getCombatName()), false));
						if(damage > 0) output(" face looks rather flush as " + target.mfn("he","she","it"));
						output(" quickly wipes your [pc.cum] off.");
					}
					if(kGAMECLASS.silly) output(" Ha! GOT ‘EM!");
					break;
				default:
					output(teaseReactions(damage,target));
					break;
			}
			target.lust(damage);
			
			var damageResult:DamageResult = new DamageResult();
			if (damage > 0)
			{
				damageResult.lustDamage = damage;
				damageResult.typedLustDamage.tease.damageValue = damage;
			}
			else
			{
				damageResult.lustResisted = true;
			}
			
			outputDamage(damageResult);
			
			teaseSkillUp(teaseType);
			
			if(target is MyrInfectedFemale && damage >= 10)
			{
				//output("\n\n<b>Your teasing has the poor girl in a shuddering mess as she tries to regain control of her lust addled nerves.</b>");
				var stunDur:int = 1 + rand(2);
				CombatAttacks.applyStun(target, stunDur);
				CombatAttacks.applyLustStun(target, stunDur);
			}
		}
		
		// kGAMECLASS.setEnemy(target);
		if (attacker is PlayerCharacter) kGAMECLASS.playerMimbraneSpitAttack();
	}
}

function teaseSkillUp(teaseType:String):void
{
	if(teaseType == null) return;
	
	import classes.kGAMECLASS;
	import classes.Engine.Utility.IncrementFlag;
	import classes.Util.InCollection;
	
	switch(teaseType)
	{
		case "SQUIRT": teaseType = "CHEST"; break;
		case "DICK SLAP": teaseType = "CROTCH"; break;
		case "MYR VENOM": teaseType = "ORAL"; break;
	}
	
	if(InCollection(teaseType, ["BUTT", "CHEST", "CROTCH", "HIPS", "ORAL"]))
		IncrementFlag("TIMES_" + teaseType + "_TEASED"); // the menu display handles wrapping this so w/e
}

