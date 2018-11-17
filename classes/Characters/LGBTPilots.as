package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.TarkusJokeBook;
	import classes.Items.Apparel.MitzisDress;
	import classes.Items.Apparel.SchoolgirlCostume;
	import classes.Items.Apparel.MitzisYogaBikini;
	import classes.Items.Apparel.MitzisLibrarianOutfit;
	import classes.Items.Apparel.TransparentZipsuit;
	import classes.Items.Apparel.MitzisSuccBikini;
	import classes.Items.Apparel.MitziCowFetishCostume;
	import classes.Items.Apparel.MitziNunFetishCostume;
	
	public class LGBTPilots extends Creature
	{
		//constructor
		public function LGBTPilots()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "gabilani vacationers";
			this.originalRace = "gabilani vacationers";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The vacationers are happily busy with the control panel, a small bank of monitors, and glasses of alcohol. They laugh and wave when they notice you staring at them, for all the world like they’re enjoying themselves on a cruise liner rather than working out which lethal weapon to use on you next.\n\nThe blue-skinned pair are ensconced in miniature luxury: plush pillows, a bar and what looks like a tiny sauna all seem to be in evidence up there. Some form of gyroscopic stabilizer is keeping their glass bubble still and level, even as the LG-BT shakes the ground with its every heavy, groaning step, stalking around you, forcing you to keep moving to avoid being crushed.";
			this.customDodge = "The attack fails to penetrade all the armor between you and them!";
			this.customBlock = "The armor soaks up the hit.";
			this.isPlural = true;
			
			this.meleeWeapon = new Fists();
			//this.armor = new MitzisDress();

			baseHPResistances.kinetic.damageValue = 100.0;
			baseHPResistances.burning.damageValue = 100.0;
			baseHPResistances.freezing.damageValue = 100.0;
			baseHPResistances.corrosive.damageValue = 100.0;
			baseHPResistances.electric.damageValue = 100.0;
			baseHPResistances.poison.damageValue = 100.0;
			baseHPResistances.tease.damageValue = -160.0;
			baseHPResistances.drug.damageValue = 100.0;
			baseHPResistances.drug.damageValue = 100.0;
			baseHPResistances.pheromone.damageValue = 100;
			
			this.physiqueRaw = 7;
			this.reflexesRaw = 10;
			this.aimRaw = 10;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 10;
			this.libidoRaw = 100;
			this.HPMod = 50;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 45;
			this.level = 3;
			this.XPRaw = normalXP();
			this.HP(this.HPMax());
			this.credits = 100;
			
			this.femininity = 50;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.tallness = 41;
			this.thickness = 50;
			this.tone = 0;
			this.hairColor = "black";
			this.scaleColor = "blue";
			//this.scaleColor = titsPtr.chars["PC"].scaleColor;
			this.furColor = "blue";
			//this.furColor = titsPtr.chars["PC"].furColor;
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "blue";
			//this.skinTone = titsPtr.chars["PC"].skinTone;
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_GABILANI;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.tongueFlags = [GLOBAL.FLAG_LONG];
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_GABILANI;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.hornLength = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_GABILANI;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
			this.tailFlags = [];
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
			this.hipRatingRaw = 10;
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
			this.buttRatingRaw = 8;
			
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cType = GLOBAL.TYPE_GABILANI;
			this.cocks[0].cLengthRaw = 7;
			this.cocks[0].cockColor = "blue";
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 4;
			//this.ballSize = titsPtr.chars["PC"].ballSize;
			this.ballFullness = 10;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 1;
			this.minutesSinceCum = 14;
			this.timesCum = 5399;
			
			this.elasticity = 3;

			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 50;
			this.vaginas[0].vaginaColor = "blue";
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 50;

			//Fertility is a % out of 100. 
			this.fertilityRaw = 0;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 11;
			this.nippleColor = "purple";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			isUniqueInFight = true;
			btnTargetText = "Pilots";
			createStatusEffect("Stun Immune");
			createStatusEffect("Flying", 0, 0, 0, 0, false, "Icon_Wings", "Flying, cannot be struck by normal melee attacks!", true, 0);
			this._isLoading = false;
			sexualPreferences.setRandomPrefs(5 + rand(3),0);
		}
		override public function get bustDisplay():String
		{
			//return "MINING_ROBOT";
			return "LGBT_PILOTS";
		}
		//All actions handled by LGBT
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
		}
	}
}
