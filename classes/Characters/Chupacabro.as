package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.author;
	
	public class Chupacabro extends Creature
	{
		//constructor
		public function Chupacabro()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Chupacabro";
			this.originalRace = "human";
			this.a = (kGAMECLASS.silly ? "el " : "the ");
			this.capitalA = (kGAMECLASS.silly ? "El " : "The ");
			this.long = "A monster of myth straight from New Texas, " + (kGAMECLASS.silly ? "el Chupacabro" : "the Chupacabro") + "’s a brute of a bull with glowing eyes and curling horns, standing at least ten feet tall and capable of pounding you into the nearest bulkhead. He’s got Reaha hostage in a corner nearby and his fists ready to inflict some pain. He’s not wearing a lick of clothing, letting a long, two-foot horsecock dangle free and menacingly between his bowed, fur-covered legs, ending in hooves that stomp and reverberate against the metal floors of your ship.\n\nAll around you and this monster is the darkness of your ship, with Reaha curled up in a nearby corner.";
			this.customDodge = "";
			this.customBlock = "Bluh.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "swing";
			this.meleeWeapon.attackNoun = "fist";
			this.meleeWeapon.longName = "fists";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 14;
			meleeWeapon.attack = -3;
			meleeWeapon.addFlag(DamageFlag.CRUSHING);
			
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "defenses";
			this.armor.defense = 2;
			this.armor.evasion = 5;
			this.armor.hasRandomProperties = true;

			this.shield.shields = 0;
			this.shield.hasRandomProperties = true;
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 20;
			this.aimRaw = 5;
			this.intelligenceRaw = 5;
			this.willpowerRaw = 10;
			this.libidoRaw = 75;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 50;
			this.level = 4;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 115;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_DEMONIC;
			this.eyeColor = "glowing red";
			this.tallness = 125;
			this.thickness = 15;
			this.tone = 95;
			this.hairColor = "black";
			this.furColor = "black";
			this.hairLength = 1;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = [];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_BOVINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_GOAT;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_BOVINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_FURRED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_BOVINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FURRED];
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
			this.hipRatingRaw = 4;
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
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 100;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 30;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 60;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 1002;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = false;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 24;
			this.cocks[0].cType = GLOBAL.TYPE_EQUINE;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.30;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity = 1000;
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Treated");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "Chupacabro";
			sexualPreferences.setRandomPrefs(4,2);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "CHUPACABRO";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Array = new Array();
			if(target.isFeminine()) attacks.push(chupacabroLustAttack);
			if(this.energy() >= 20) attacks.push(chupacabroChargeAttack);
			if(this.energy() >= 30) attacks.push(chupacabroHaymakerAttack);
			attacks.push(chupacabroMeleeAttack);
			
			attacks[rand(attacks.length)](target);
		}
		
		public function chupacabroLustAttack(target:Creature):void
		{
			if(rand(2) == 0) output("The goat-bull reaches down to stroke at his half-hard and monstrous cock, curling a finger in an attempt to get you to stop fighting and hop on his cock, his musk wafting toward you.");
			else output("Flexing his chest, " + (kGAMECLASS.silly ? "el Chupacabro" : "the Chupacabro") + " places his hands behind his head and swings his hips around, setting his bestial tool wobbling back and forth like a big, meaty pendulum, wafting his scent towards you.");
			//25-75% chance to hit based on libido
			if(rand(100) < target.libido()/2 + 25)
			{
				if(target.hasAirtightSuit())
				{
					output("\n\nYour tongue lolls at the display. You’re quick to shake devious thoughts from your head and focus on the matter at hand again.");
					target.lust(5);
				}
				else
				{
					output("\n\nYour tongue lolls at the display, the goat-bull’s pheromones clouding your senses and deepening your lust. You’re quick to shake devious thoughts from your head and focus on the matter at hand again.");
					target.lust(10);
				}
			}
			else output("\n\n" + (kGAMECLASS.silly ? "El Chupacabro" : "The Chupacabro") + "’s display is tempting, but you resist it all the same, strengthening your resolve and leading you to take up a fighting stance again.");
		}
		
		public function chupacabroChargeAttack(target:Creature):void
		{
			output("" + (kGAMECLASS.silly ? "El Chupacabro" : "The Chupacabro") + ", grinds his hooves against your ship’s hull before charging forward with surprising speed for someone of his size. ");
			if((target.reflexes()/2 + rand(20) + 1 < this.aim()/2 + 13) && !target.isPlanted())
			{
				output("\n<b>He catches you off-guard and slams into your with the force of a freight train, knocking the wind out of you and leaving you flat on your back.</b>");
				var damage:TypeCollection = meleeDamage();
				damage.multiply(.5);
				applyDamage(damage, this, target);
				CombatAttacks.applyTrip(target);
			}
			else output("\n\nOn your guard, you manage to dodge his attack, leaving him to slam into a nearby bulkhead before turning back towards you with anger in his eyes.");
			this.energy(-20);
		}

		public function chupacabroHaymakerAttack(target:Creature):void
		{
			output("" + (kGAMECLASS.silly ? "El Chupacabro" : "The Chupacabro") + " winds up a punch and quickly lets it loose, ");
			if(!combatMiss(this, target))
			{
				output("knocking you square in the jaw. You’re left reeling with pain as you stumble back from the force of the blow.");
				var damage:TypeCollection = meleeDamage();
				damage.multiply(1.5);
				applyDamage(damage, this, target);
				if(this.physique() / 2 + rand(20) + 1 >= target.physique() / 2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune"))
				{
					output("\n<b>The punch leaves you stunned.</b>");
					CombatAttacks.applyStun(target);
				}
			}
			else output("but narrowly misses!");
			this.energy(-30);
		}
		
		public function chupacabroMeleeAttack(target:Creature):void
		{
			if(rand(2) == 0) output("" + (kGAMECLASS.silly ? "El Chupacabro" : "The Chupacabro") + " swings at your with a flurry of fists! ");
			else output("The goat-bull comes at you swinging, punching at you with a series of blows! ");
			CombatAttacks.SingleMeleeAttackImpl(this, target, true);
		}
	}
}
