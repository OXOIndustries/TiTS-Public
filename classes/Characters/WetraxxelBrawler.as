package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class WetraxxelBrawler extends Creature
	{
		//constructor
		public function WetraxxelBrawler()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "wetraxxel brawler";
			this.originalRace = "wetraxxel";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The wetraxxel is a towering, insectile man -- easily ten feet tall, and covered in chitinous plates. A pair of small insectile feelers adorn his head, over small black eyes and a pair of slits for nostrils. His mouth is a four-part set of sharply fanged mandibles, which click quietly as his grunts and growls. He’s monstrously broad-shouldered, with lighter-colored and more flexible plates on his chest; his gut is an off-white against the midnight black of his other chitin. His plated fists are raised to you in a classic boxing stance, ready to punch and block in equal measure.\n\nThe wetraxxal male’s naked save for a simple loincloth which barely conceals a hefty-looking package, certainly sizable even for its owner’s great height. ";
			this.customDodge = "The wetraxxel brawler rolls aside in a remarkable display of agility for one with such a large frame.";
			this.customBlock = "The alien’s chitin deflects the attack.";
			this.isPlural = false;
			
			baseHPResistances.drug.resistanceValue = 20.0;
			baseHPResistances.tease.resistanceValue = 20.0;
			baseHPResistances.pheromone.resistanceValue = 20.0;
			baseHPResistances.psionic.resistanceValue = 20.0;
			
			this.meleeWeapon = new Fists();
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 7;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 30;
			this.reflexesRaw = 26;
			this.aimRaw = 10;
			this.intelligenceRaw = 7;
			this.willpowerRaw = 25;
			this.libidoRaw = 20;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 20.0;
			baseHPResistances.burning.damageValue = 20.0;
			baseHPResistances.electric.damageValue = 20.0;
			
			this.level = 7;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 80;
			this.HPRaw = this.HPMax();
			
			this.femininity = 5;
			this.eyeType = GLOBAL.TYPE_SYDIAN;
			this.eyeColor = "black";
			this.tallness = 120;
			this.thickness = 30;
			this.tone = 90;
			this.hairColor = "black";
			this.scaleColor = "orange";
			this.furColor = "orange";
			this.hairLength = 6;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "orange";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SYDIAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_SYDIAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_SYDIAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_SYDIAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SYDIAN;
			this.tailCount = 1;
			this.tailFlags = new Array();
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
			this.tailRecharge = 0;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 2;
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 12;
			this.cocks[0].cThicknessRatioRaw = 1.5;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 8;
			this.ballFullness = 3;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 200;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 20;
			this.minutesSinceCum = 2110;
			this.timesCum = 1722;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15
			this.ass.loosenessRaw = 2;
			//this.inventory.push(new ZilRation());

			this.createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Wetraxxel";
			sexualPreferences.setRandomPrefs(4 + rand(3),2);
			//kGAMECLASS.myrellionSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "WETRAXXEL";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Array = [];

			attacks.push(wetraxxelBrawlerOneTwoPunch);
			attacks.push(wetraxxelBrawlerBodyslam);
			if (target.hasStatusEffect("Tripped")) attacks.push(wetraxxelBrawlerElbowDive);
			if (!target.hasStatusEffect("Tripped")) attacks.push(wetraxxelBrawlerSweepKick);
			if (!target.hasStatusEffect("Staggered")) attacks.push(wetraxxelBrawlerDropKick);
			if (!target.hasStatusEffect("Tripped")) attacks.push(wetraxxelBrawlerLariat);

			attacks[rand(attacks.length)](target);
		}
		
		private function wetraxxelBrawlerElbowDive(target:Creature):void
		{
			//Massive kinetic damage against knocked down PCs, chance to stun.

			output("Looking down at you with a scowl, the wetraxxel cracks his knuckles and lumbers forward. You try and scramble back, but find him much swifter from this position. After a moment of self-assured leering, the wetraxxel lunges forward with a leap, and drops down elbow-first on you!");
			if (combatMiss(this, target))
			{
				output(" You manage to twist out of the way, letting him elbow-drop the floor. Oof, that’s gotta hurt!");
			}
			else
			{
				output(" He drops down on you like a hammer, cracking his elbow right into your gut! You cry out as the massive blow connects, leaving your writhing in pain.");
				
				applyDamage(damageRand(new TypeCollection( { kinetic: 22 } ), 25), this, target);
			}
		}
		
		public function wetraxxelBrawlerBodyslam(target:Creature):void
		{
			//Strong kinetic attack.

			output("The wetraxxel stomps his feet, pounds his chest, and comes rushing at you with a blood-curdling battle-roar. He tucks one of his shoulders and rushes at you, trying to slam into you with the whole weight of his body behind him!");
			if (combatMiss(this, target, -1, 2))
			{
				output(" You side-step the incoming attack, letting the brawler’s charge carry him straight past you. He only just manages to slow himself down before slamming into a wall himself.");
			}
			else
			{
				output(" The brawler body-slams you at full force, crashing into your [pc.chest] with rib-cracking impact! You’ll be feeling that for days!");
				applyDamage(damageRand(new TypeCollection( { kinetic: 18 } ), 20), this, target);
			}
		}
		
		private function wetraxxelBrawlerLariat(target:Creature):void
		{
			//Low kinetic attack. Chance to knockdown.

			output("The wetraxxel rushes at you, thrusting his arm out to the side and twisting his body, catching you in a clothesline!");
			if (combatMiss(this, target, -1, 2) || target.isPlanted())
			{
				output(" You manage to keep your footing, blocking the worst of the brawler’s strike.");
			}
			else
			{
				output(" His forearm catches you right on the chin, and the weight of the brawler’s body slams you into the ground. You feel the weight of the world slam into the back of your head, rattling you to your core. <b>You’re knocked down!</b>");
				CombatAttacks.applyTrip(target);
				applyDamage(damageRand(new TypeCollection( { kinetic: 10 } ), 10), this, target);
			}
		}
		
		public function wetraxxelBrawlerDropKick(target:Creature):void
		{
			//Strong kinetic attack. Chance to Stagger on hit (reduces Reflexes and Aim for several turns)

			output("The brawler takes a running start, hurling himself feet-first at you.");
			if (combatMiss(this, target) || target.isPlanted())
			{
				output(" You duck the attack, letting his weight carry him over your head and into the wall!");
			}
			else
			{
				output(" His feet slam into your [pc.chest], knocking the wind out of you and sending you stumbling back. It’s agony to catch your breath after that, and you find yourself clutching at your chest, wheezing painfully. <b>Your aim and reflexes are temporarily reduced</b> while you catch your breath.");

				applyDamage(damageRand(new TypeCollection( { kinetic: 18 } ), 15), this, target);

				if (target.hasStatusEffect("Staggered"))
				{
					target.setStatusValue("Staggered", 1, 5);
				}
				else
				{
					CombatAttacks.applyStagger(target, 5);
				}
			}
		}
		
		private function wetraxxelBrawlerSweepKick(target:Creature):void
		{
			//Strong kinetic attack. Chance to knock down. Taurs and nagas immune.

			output("The brawler bug swings at you, making you duck back - and immediately follows up by ducking down and trying to sweep your [pc.legs] out from under you.");
			if (combatMiss(this, target))
			{
				output(" You dodge the strike, leaping back out of the way.");
			}
			else
			{
				if (target.isTaur() || target.isNaga())
				{
					output(" His kick strikes you, hard, but due to your bestial anatomy, you’re hardly affected in any way but for a sharp sting from the impact. He hits like a truck!");
				}
				else
				{
					if ((rand(target.reflexes()) >= target.reflexesMax() / 3) || target.isPlanted())
					{
						output(" The kick takes you completely by surprise, momentarily throwing you off balance and almost tumbling to the ground. You grunt as you narrowly manage to stay upright.");
					}
					else
					{
						output(" The kick takes you completely by surprise, throwing you off your feet and sending you tumbling to the ground. You grunt as the wind’s knocked out of you, narrowly avoiding cracking your head on a sharp stone nearby. <b>You’re knocked down!</b>");
						CombatAttacks.applyTrip(target);
					}
				}

				applyDamage(damageRand(new TypeCollection( { kinetic: 20 } ), 25), this, target);
			}
		}
		
		private function wetraxxelBrawlerOneTwoPunch(target:Creature):void
		{
			//Basic attack. Two moderate kinetic hits.

			output("The wetraxxel lunges forward, keeping his guard up until the very last second. He strikes out with a quick jab, followed up by a brutal left hook!");

			var numHits:uint = 0;
			if (!combatMiss(this, target)) numHits++;
			if (!combatMiss(this, target, -1, 2)) numHits++;

			if (numHits == 1) output(" You stagger back under the force of the first blow, though you’re able to dodge the follow-up strike.");
			else if (numHits == 2) output(" You’re thrown off balance by the force of the first punch, leaving you wide open for a thunderous blow that makes you see stars. You cry out in pain, staggering until you slump up against the cavern wall. Ouch!");
			else output(" You nimbly duck out of the way, blocking and dodging his strikes.");

			if (numHits > 0)
			{
				applyDamage(damageRand(new TypeCollection( { kinetic: numHits * 15 } ), 15), this, target);
			}
		}
	}
}