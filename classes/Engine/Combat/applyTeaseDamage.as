package classes.Engine.Combat 
{
	import classes.kGAMECLASS;
	import classes.Creature;
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
		if (attacker.hasStatusEffect("Sex On a Meteor") || attacker.hasStatusEffect("Tallavarian Tingler")) factor *= 1.5;
		if (attacker.hasStatusEffect("\"Rutting\"")) factor *= 1.5;
		if (attacker.hasStatusEffect("Body Paint")) factor *= 1.15;
		if (attacker.hasStatusEffect("Well-Groomed")) factor *= attacker.statusEffectv2("Well-Groomed");
		if ((target.originalRace == "nyrea" && attacker.hasPerk("Nyrean Royal")) || attacker.hasStatusEffect("Oil Aroused")) factor *= 1.1;

		
		if (factor > factorMax) factor = factorMax;
	
		if (attacker.hasPheromones()) bonus += attacker.pheromoneLevel();
		if (teaseType == "SQUIRT") bonus += 2;
		if (attacker.hasStatusEffect("Sweet Tooth")) bonus += 1;
		

		// Failed/Miss
		// OLD: if (target.isLustImmune || (target.willpower() / 2 + rand(20) + 1 > attacker.level * 2.5 * factor + 10 + teaseCount / 10 + attacker.sexiness() + bonus))
		if(lustCombatMiss(attacker,target,factor))
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
			}
			else if(teaseType == "DICK SLAP")
			{
				output("\n\nYour foe looks more annoyed than aroused at your antics as they wipe your girl lube off.");
				if(kGAMECLASS.silly) output(" You pity them somewhat. Your [pc.cumNoun] has a lot of nutrients in it...");
			}
			else if (target is HuntressVanae || target is MaidenVanae)
			{
				output("\n\n");
				output(teaseReactions(0, target));
			}
			else if (target is WetraHound)
			{
				output("\n\n");
				kGAMECLASS.wetraHoundAnimalIntellect();
			}
			//Enemies with special fail messages
			else if(target is MaidenVanae || target is HuntressVanae)
			{
				output("\n\n" + teaseReactions(0, target));
			}
			else if(target is KorgonneFemale)
			{
				output("\n\nThe barbarian girl flashes a savage grin, apparently unfazed." + ((kGAMECLASS.silly) ? " <i>“No. So no. Wow. Very no.”</i>" : ""));
			}
			else
			{
				output("\n\n" + StringUtil.capitalize(target.getCombatName()), false);
				if(target.isPlural) output(" resist");
				else output(" resists");
				output(" your erotically charged display... this time.");
			}
			output(" (<b>L: +<span class='lust'>0</span></b>)");
		}
		// Success
		else
		{
			//Sexiness and resolve are 1:1. Willpower and tease skill dont match up even till level 20, making lust more powerful against lower level enemies naturally.
			//lustDef Stat: level/1.5 + willpower()/4 + resolve()
			var damage:Number = (10 + attacker.teaseSkill()/4 + attacker.sexiness());
			trace("Damage: " + damage);
			damage += attacker.statusEffectv4("Heat");
			damage += attacker.statusEffectv2("Painted Penis");
			damage += attacker.statusEffectv2("Painted Tits");
			if (teaseType == "SQUIRT") damage += 5;
			if (attacker.hasPheromones()) damage += 1 + rand(3);
			trace("Damage: " + damage);
						
			var bonusCap:Number = 0;
			bonusCap += attacker.statusEffectv3("Painted Penis");
			bonusCap += attacker.statusEffectv3("Painted Tits");
			
			//Cap is 30 plus enough to exceed lustDefense but scales higher for foes over 100 maxLust.
			var cap:Number = Math.round(30 * (target.lustMax()/100)) + target.lustDef();
			trace("Cap: " + cap)
			cap += bonusCap;
			trace("lustMax: " + target.lustMax());
			trace("lustDef: " + target.lustDef());

			//Figure out damage
			damage *= factor;
			damage = (Math.min(damage, cap));
			trace("Damage: " + damage);
			

			//Level % reduction
			var levelDiff:Number = target.level - attacker.level;
			//Reduce tease damage by 70% for every level down the attacker is is.
			if(levelDiff > 0)
			{
				for(var z:int = levelDiff; z > 0; z--)
				{
					damage *= 0.70;
				}
			}
			trace("Damage: " + damage);
			//Damage cap
			if (damage > cap) damage = cap;
			var hitCapEffect:Boolean = damage == cap;
			//Damage min
			if (damage < 0) damage = 0;
			trace("Damage: " + damage);
			//Set it as an actual damage type
			var damageCollection:TypeCollection = new TypeCollection( { tease: damage } )
			//Drug-based teases do drug damage instead.
			if (InCollection(teaseType, ["SQUIRT", "DICK SLAP", "MYR VENOM"])) damageCollection = new TypeCollection( { drug: damage } )
	
			output("\n\n");
			trace("Damage: " + damage);
			var damageRes:DamageResult = applyDamage( damageCollection , attacker, target, "suppress");
			trace("DamageRes: " + damageRes.lustDamage);
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
					output(teaseReactions(damageRes.lustDamage,target));
					break;
			}
			outputDamage(damageRes);
			//9999 output likes/dislikes	
			
	
			// Followups
			if(target is MyrInfectedFemale && damageRes.lustDamage >= 10)
			{
				//output("\n\n<b>Your teasing has the poor girl in a shuddering mess as she tries to regain control of her lust addled nerves.</b>");
				var stunDur:int = 1 + rand(2);
				CombatAttacks.applyStun(target, stunDur);
				CombatAttacks.applyLustStun(target, stunDur);
			}
			// if you successfully tease an enemy, they suffer a -10% hit-chance penalty for the rest of the battle.
			if (attacker.hasPerk("Innocent Allure") && !target.isStaggered() && !target.isPlanted() && !target.isBlind())
			{
				if(attacker is PlayerCharacter)
				{
					if(rand(2) == 0) output("\n\n" + StringUtil.capitalize(target.getCombatName(), false) + "  seem" + (target.isPlural ? "" : "s") + " to have become a bit distracted after your display, " + (target.isPlural ? "their" : target.mfn("his","her","its")) + " movements faltering and less precise.");
					else output("\n\nYour display appears to have shaken the " + possessive(target.getCombatName()) + " resolve and impaired " + (target.isPlural ? "their" : target.mfn("his","her","its")) + " aim; you can sense some hesitation in " + (target.isPlural ? "their" : target.mfn("his","her","its")) + " very stance.");
				}
				else {
					output("\n\n" + StringUtil.capitalize(target.getCombatName(), false) + "  seem" + (target.isPlural ? "" : "s") + " to have become distracted after " + possessive(attacker.getCombatName()) + " display, " + (target.isPlural ? "their" : target.mfn("his","her","its")) + " movements faltering and less precise.");
				}
				
				CombatAttacks.applyLustStagger(target, 3);
				
				if(target is PlayerCharacter) output(" <b>You are staggered by the tease!</b>");
				else output(" <b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " staggered by the tease!</b>");
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

