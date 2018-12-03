package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Guns.HammerCarbine;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Drinks.RedMyrVenom;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;

	import classes.GLOBAL;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author Fen Oxo - mostly copy pasted from the MyrGoldOfficer()
	 */
	
	public class Onzia extends Creature
	{
		private var specialCD:int = 0;
					
		public function Onzia() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "gold scout";
			this.originalRace = "gold myr";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.scaleColor = "gold";
			
			this.long = "The gold myr refugees have done well for themselves on Mhen’ga if this scout is any indication. The once scrappy soldier has grown fat off the planet’s lush bounties and now sports balloonishly inflated tits thanks to the easy availability of sugary fruits and even sweeter sex. She carries a heavy, fifty-caliber burst rifle in all four of her hands, popping off tightly controlled clusters of shots at the mining robots.";

			this.isPlural = false;
			
			shield = new ReaperArmamentsMarkIShield();
			//meleeWeapon = new SurvivalAxe();
			//meleeWeapon.baseDamage.kinetic.damageValue = 25;
			rangedWeapon = new HammerCarbine();
			rangedWeapon.baseDamage.kinetic.damageValue = 14;

			armor.longName = "thick chitin";
			armor.defense = 7;
			armor.hasRandomProperties = false;
			
			this.physiqueRaw = 22;
			this.reflexesRaw = 22;
			this.aimRaw = 27;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 22;
			this.libidoRaw = 50;
			this.shieldsRaw = shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = -25.0;
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			baseHPResistances.drug.damageValue = -25.0;
			
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 75;
			this.HPRaw = this.HPMax();
			
			//MUCH IS PLACEHOLDER DUE TO LACK OF MYR TYPE PARTS AT CODE TIME.
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "black";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "gold";
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
			this.minutesSinceCum = 635;
			this.timesCum = 255;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 12;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;

			//NO DIX
			this.cocks = new Array();
			//One normalish cunt
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			
			isUniqueInFight = true;
			btnTargetText = "GoldScout";
			
			createPerk("Can Crit",0,0,0,0);
			//this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			//credits = rand(200);
			sexualPreferences.setRandomPrefs(5, 0);
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			
			var foo:int = rand(3);
			switch(foo){
				case 0:	inventory.push(new Picardine()); break;
				case 1:	inventory.push(new Kirkite()); break;
				case 2:	inventory.push(new Satyrite()); break;
			}
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "GOLD_REMNANT_SI_OFFICER";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			if(this.hasStatusEffect("Tripped"))
			{
				if(rand(2) == 0) 
				{
					output("The myr scout rolls sideways and up onto her feet, watching the robots warily.");
					this.removeStatusEffect("Tripped");
					return;
				}
				else
				{
					output("Staying down, the insectile interloper focuses on spraying bullets over personal safety. ")
				}
			}
			myrOfficerShoot(target);		
		}
		
		private function myrOfficerShoot(target:Creature):void
		{	
			output("The gold myr scout unleashes a cluster of shots, sending sugar-swollen tits carelessly bouncing.");
			for(var x:int = 0; x < 3; x++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, false);
			}
			if(rand(4) == 0) output("\n<i>“Come on, you walking heaps of scrap!”</i>");
			else if(rand(3) == 0) output("\n<i>“I’ll kill yooouuuu!”</i>");
			else if(rand(2) == 0) output("\n<i>“I’m not dying like this!”</i>");
			else output("\n<i>“Die! Die! Die!”</i>");
		}
	}

}