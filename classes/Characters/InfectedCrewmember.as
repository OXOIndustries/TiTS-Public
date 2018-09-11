package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Drinks.RedMyrVenom;
	
	import classes.GLOBAL;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.weightedRand;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class InfectedCrewmember extends Creature
	{
		
		public function InfectedCrewmember() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "infected crew member";
			this.originalRace = RandomInCollection("ausar", "gryvain", "raskvel");
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.skinTone = "red";
			this.btnTargetText = "Infected C.";
			this.isUniqueInFight = false;
			
			this.long = "";
			
			this.isPlural = false;
			
			this.shield = new EmptySlot();
			this.meleeWeapon.attackVerb = "tentacle-slap";
			this.meleeWeapon.attackNoun = "tentacle-slap";
			this.meleeWeapon.longName = "wriggly tentacle";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 18;
			meleeWeapon.addFlag(DamageFlag.CRUSHING);
			meleeWeapon.hasRandomProperties = true;

			armor.longName = "thick chitin";
			armor.defense = 3;
			armor.hasRandomProperties = true;
			
			this.physiqueRaw = 13;
			this.reflexesRaw = 25;
			this.aimRaw = 5;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 8;
			this.libidoRaw = 100;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 33;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 35.0;
			baseHPResistances.burning.damageValue = 10.0;
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.psionic.damageValue = -25.0;
			baseHPResistances.drug.damageValue = -10.0;
			baseHPResistances.pheromone.damageValue = -10.0;
			
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			//MUCH IS PLACEHOLDER DUE TO LACK OF MYR TYPE PARTS AT CODE TIME.
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "red";
			this.furColor = "red";
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "dusky";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_CHITINOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_CHITINOUS];
			
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 5;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 6;
			//buttRating
			//0 - buttless
			//2 - tight
			//4 - average
			//6 - noticable
			//8 - large
			//10 - jiggly
			//13 - expansive
			//16 - huge
			//20 - inconceivably large/big/huge etc
			this.buttRatingRaw = 6;
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 35;
			this.timesCum = 599;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 2;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;

			//One parasite dick!
			this.cocks = new Array();
			this.createCock(12);
			this.cocks[0].cType = GLOBAL.TYPE_INHUMAN;
			//One normalish cunt
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			
			credits = rand(200);
			sexualPreferences.setRandomPrefs(4 + rand(3),1);
			
			createStatusEffect("Force It Gender");
			
			_randomBustSelection = ("LUSTOMORPH_" + originalRace.toUpperCase());
			
			this._isLoading = false;
		}
		
		private var _randomBustSelection:String;
		
		override public function get bustDisplay():String
		{
			return _randomBustSelection;
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var atks:Array = [];
			
			atks.push( { v: tentacleRush, w: 40 } );
			atks.push( { v: faceHug, w: 20 } );
			
			// Welcome to combat status effects -- proper shared storage for multienemy fights. Works the same 
			// as status effects, only accessed through CombatManager.{has/add/get/remove}CombatEffect
			// Anything you want to clean up at the end of a combat round, you do in postHostileTurnActions, ie
			// this is a second layer behind regular status effects to control things from a higher level
			// such as avoiding duplicate outputs for things like status effect processing from AoEs.
			if (!CombatManager.hasCombatEffect("Lust Spores Used")) atks.push( { v: lustSpores, w: 15 } );
			
			var stunnedAllies:Array = [];
			for (var i:int = 0; i < alliedCreatures.length; i++)
			{
				var p:Creature = alliedCreatures[i];
				if (p != this && p.isDefeated() == false && p.hasStatusEffect("Stunned")) stunnedAllies.push(p);
			}
			if (stunnedAllies.length > 0) atks.push( { v: hivemindRoar, w: 40 } );
			
			var atk:Function = weightedRand(atks);
			
			if (atk == hivemindRoar)
			{
				atk(stunnedAllies[rand(stunnedAllies.length)], alliedCreatures, hostileCreatures);
			}
			else if (atk == lustSpores)
			{
				atk(hostileCreatures);
			}
			else
			{
				atk(target);
			}
		}
		
		public function tentacleRush(target:Creature):void
		{
			//Heavy crushing damage. Basic physical attack.
			/*
			if (CombatManager.enemiesAlive() > 1) output("A");
			else output("The");
			*/
			output(StringUtil.capitalize(this.getCombatName(), false) + " surges towards " + target.getCombatName() + ", flailing its tentacles wildly in front of itself.");
			
			if (!combatMiss(this, target))
			{
				output(" One the largest tendrils hits home, slamming into " + target.getCombatPronoun("himher") + " with crushing force, sending " + target.getCombatPronoun("himher") + " staggering back.");
				applyDamage(damageRand(this.meleeDamage(), 15), this, target, "minimal");
			}
			else
			{
				output(" Thankfully, it doesn’t manage to hit anything.");
			}

		}
		
		public function faceHug(target:Creature):void
		{
			//Moderate lust attack, high success chance. Basic lust attack.
			output(StringUtil.capitalize(this.getCombatName(), false) + " leaps forward, lunging towards " + target.getCombatName() + " with an inhuman banshee’s wail. It slams into " + target.getCombatPronoun("himher") + ", barreling " + target.getCombatPronoun("himher") + " to the deck and pinning " + target.getCombatPronoun("himher") + " down with its knees. The several tentacles growing from the mutant’s crotch lash out, groping and thrusting at");
			if (target is PlayerCharacter) output(" your");
			else output(" " + target.getCombatName() + "’s");
			output(" face, trying to penetrate.");
			
			if(target.hasAirtightSuit())
			{
				output(" Fortunately, " + target.getCombatPronoun("hisher") + " airtight suit makes it difficult for the attack to be effective.");
			}
			else if (combatMiss(this, target))
			{
				output(" " + StringUtil.capitalize(target.getCombatPronoun("heshe"), false) + " manage");
				if (!(target is PlayerCharacter) && !target.isPlural) output("s");
				output(" to keep");
				if (target is PlayerCharacter) output(" your");
				else output(" " + target.getCombatPronoun("hisher"));
				output(" mouth shut, resisting the creature until " + target.getCombatPronoun("heshe") + " can push it off.");
			}
			else
			{
				output(" The mutant manages to force " + target.getCombatPronoun("hisher") + " mouth open, thrusting a tentacle in and squirting out a thick, red, viscous liquid into " + target.getCombatPronoun("hisher") + " mouth! " + StringUtil.capitalize(target.getCombatName(), false) + " struggle");
				if (!(target is PlayerCharacter) && !target.isPlural) output("s");
				output(" to throw the creature off, though " + target.getCombatPronoun("hisher") + " skin reddens in response to the mouthful of mutant jizz...");
				
				applyDamage(new TypeCollection( { drug: 7 } ), this, target, "minimal");
			}

		}
		
		public function hivemindRoar(target:Creature, friendlies:Array, hostiles:Array):void
		{
			//Removes stun from another creature. It immediately acts.
			output("One of the mutants grabs its stunned companion with its tentacles, roaring into its ear and thrusting into its exposed orifices with every tentacle. The stunned mutant shrieks, roused from its stupor by a sudden rush of pleasure and stimulation. It turns its attention directly towards you, eyes afire with renewed desire.");
			
			output("\n\n<b>" + target.a + target.uniqueName +" is no longer stunned!</b>\n\n");
			target.removeStatusEffect("Stunned");
			target.CombatAI(friendlies, hostiles);
		}
		
		public function lustSpores(hostileCreatures:Array):void
		{
			CombatManager.addCombatEffect(new StorageClass("Lust Spores Used"));
			
			//Rare action. Creates a light Lust DOT on all PC-aligned creatures for 2-4 turns.
			output(StringUtil.capitalize(this.getCombatName(), false) + " rears its reddened head back and vomits forth a rush of dark red... mist!? Gas seeps out of the creature’s mouth, billowing out around you. You flail your hands out at the growing cloud, trying to wave it away from you... but to no avail. A heavy cloud of red mutant-gunk settles over you");
			
			var bothUp:Boolean = (kGAMECLASS.flags["CHIEF_NEYKKAR_WITH_PC"] == 1);
			var airtight:Boolean = false;
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				if (hostileCreatures[i].isDefeated())
				{
					bothUp = false;
					break;
				}
				else
				{
					var t:Creature = hostileCreatures[i] as Creature;
					
					if (t.hasStatusEffect("Lust Spores"))
					{
						t.setStatusValue("Lust Spores", 1, 2 + rand(2));
					}
					else if (!t.hasAirtightSuit())
					{
						t.createStatusEffect("Lust Spores", 2 + rand(2), 0, 0, 0, false, "LustUp", "A hazy cloud of pure lust is still lingering in the air, heating your loins despite your best efforts....", true, 0, 0xFF0000);
					}
					else
					{
						airtight = true;
					}
				}
			}
			
			if (bothUp) output(" and your companion");
			
			if (!airtight) output(", making you something between nauseous and horny...");
			else
			{
				output(". Your air-tight suit serves you well, keeping you safe from any effect");
				if (bothUp) output(", though the same can’t be said for your compatriot...");
				output(".");
			}
		}
	}

}