package classes.Characters
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Armor.ChitPlate;
	import classes.Items.Guns.BothriocRifle;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.BothriocRapier;
	import classes.StorageClass;
	import classes.VaginaClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	import classes.Util.RandomInCollection;
	import classes.Util.InCollection;
	
	
	public class AraKei extends Creature
	{
		//constructor
		public function AraKei()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = false;
			
			short = "Ara Kei";
			originalRace = "bothrioc";
			a = "";
			capitalA = "";
			//this.long = "";
			this.customBlock = "The pirate’s armor deflects your attack with alarming ease.";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new BothriocRapier();
			this.rangedWeapon = new BothriocRifle();
			this.armor = new ChitPlate();
			
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 25.0;
			
			this.physiqueRaw = 18;
			this.reflexesRaw = 25;
			this.aimRaw = 18;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 8;
			this.libidoRaw = 30;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 80 + rand(80);
			this.HPMod = 70;
			this.HPRaw = this.HPMax();
			
			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
			this.tallness = 68;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = RandomInCollection("black", "white", "electric blue", "rusty red");
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
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
			this.tailRecharge = 5;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 0;
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
			var c:CockClass = new CockClass();
			cocks.push(c);
			c.cLengthRaw = 8;
			c.cThicknessRatioRaw = 1.75;
			c.cType = GLOBAL.TYPE_BOTHRIOC;
			c.addFlag(GLOBAL.FLAG_LUBRICATED);
			c.addFlag(GLOBAL.FLAG_OVIPOSITOR);
			c.addFlag(GLOBAL.FLAG_RIBBED);
			
			this.vaginas = [];
			var v:VaginaClass = new VaginaClass();
			vaginas.push(v);
			v.wetnessRaw = 2;
			v.loosenessRaw = 3;
			v.type = GLOBAL.TYPE_BOTHRIOC;
			
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.impregnationType = "BothriocPregnancy";
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1.5;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 321;
			
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
			
			isUniqueInFight = true;
			btnTargetText = "B.Pidemme";
			
			// v1 == 0 -> they
			// v1 == 1 -> he
			// v2 == 2 -> she
			createStatusEffect("Forced Gender");
			
			this._isLoading = false;
		}
		
		// We're going to have to override the tag db because a bunch of the pronouns only implement
		// mf rather than mfn
		override public function getDescription(arg:String, arg2:*):String
		{
			var firstLetter:String = arg.substr(0, 1);
			var actualTag:String = firstLetter.toLowerCase() + arg.substr(1);
			var doCaps:Boolean = firstLetter == firstLetter.toUpperCase();
			
			switch (actualTag)
			{
				case "he":
					return mfn("he", "she", "they");
					break;
				
				case "his":
					return mfn("his", "her", "their");
					break;
					
				case "him":
					return mfn("him", "her", "them");
					break;
					
				case "himself":
					return mfn("himself", "herself", "themselves");
					break;
					
				default:
					return super.getDescription(arg, arg2);
					break;
			}
		}
		
		override public function mfn(m:String, f:String, n:String, ignorePref:Boolean = false):String
		{
			switch (getStatusEffect("Forced Gender").value1)
			{
				case 0:
				default:
					return n;
					break;
					
				case 1:
					return m;
					break;
					
				case 2:
					return f;
					break;
			}
		}
		
	}
}
