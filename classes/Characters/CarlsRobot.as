package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.rand;
	
	public class CarlsRobot extends Creature
	{
		
		
		//constructor
		public function CarlsRobot()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "machina";
			this.originalRace = "robot";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The robot hovers in the air, spindly arms twitching and flicking in the air at every moment. Its steel-grey dome has lost it’s shine from both combat and the fatigue of the jungle, though it still looks fully operational and, at the moment, lethal. Each of its many tools are pointed at you, threateningly. You’re in for it now!";
			this.customDodge = "The machina lazily lists to the side, causing your attack to go wayward!";
			this.customBlock = "The machina’s thick plates cause the attack to glance off into the wilderness!";
			this.plural = false;
			this.lustVuln = 0;
			
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.longName = "pincers";
			this.meleeWeapon.damage = 3;
			this.meleeWeapon.damageType = GLOBAL.SLASHING;
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "metal plates";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 5;
			this.aimRaw = 9;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 1;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XPRaw = 100;
			this.level = 3;
			this.credits = 0;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();

			this.femininity = 5;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.tallness = 48;
			this.thickness = 50;
			this.tone = 50;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = 0;
			this.skinTone = "metal";
			this.skinFlags = new Array();
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 0;
			this.legFlags = new Array();
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
			this.buttRatingRaw = 0;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 0;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 0;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 0;
			this.minutesSinceCum = 9999;
			this.timesCum = 0;
			this.cockVirgin = true;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			this.vaginas = new Array();
			this.cocks = new Array();
			//Goo is hyper friendly!
			this.elasticity = 0;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 0;
			this.clitLength = 0;
			this.pregnancyMultiplierRaw = 0;
			
			this.createStatusEffect("Infertile");
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 0;
			this.ass.bonusCapacity = 0;
			
			this.createStatusEffect("Disarm Immune");
			
			this._isLoading = false;

		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.skinFlags.length == 0)
			{
				dataObject.skinFlags.push(GLOBAL.FLAG_FLUFFY);
			}
		}
		
		override public function setDefaultSexualPreferences():void
		{
			
		}
		
		override public function prepForCombat():void
		{
			var combatMachina:CarlsRobot = this.makeCopy();
			
			//kGAMECLASS.userInterface.showBust("NALEEN_MALE");
			kGAMECLASS.setLocation("FIGHT:\nMACHINA", "PLANET: MHEN'GA", "SYSTEM: ARA ARA");
			combatMachina.setDefaultSexualPreferences();
			
			kGAMECLASS.foes.push(combatMachina);
		}
	}
}