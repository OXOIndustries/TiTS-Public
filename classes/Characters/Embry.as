package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.GirlyBra;
	import classes.Items.Apparel.GirlyPanties;
	import classes.Items.Apparel.PeasantDress;
	
	public class Embry extends Creature
	{
		//constructor
		public function Embry()
		{
			this._latestVersion = 2;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Embry";
			this.originalRace = "simii";
			this.a = "";
			this.capitalA = "";
			this.long = "Placeholder";
			this.customDodge = "Syri Don't Dodge Foo";
			this.customBlock = "Obvious placeholder is obvious.";
			this.plural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "semi-solid fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor = new PeasantDress();
			this.lowerUndergarment = new GirlyPanties();
			this.upperUndergarment = new GirlyBra();
			
			this.physiqueRaw = 15;
			this.reflexesRaw = 15;
			this.aimRaw = 15;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 15;
			this.libidoRaw = 55;
			this.HPMod = 15;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.XPRaw = 350;
			this.level = 3;
			this.credits = 0;
			
			this.femininity = 70;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 72;
			this.thickness = 30;
			this.tone = 50;
			this.hairColor = "pink";
			this.scaleColor = "blue";
			this.furColor = "pink";
			this.hairLength = 8;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "fair";
			this.skinFlags = [];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = -1;
			this.earType = GLOBAL.TYPE_SIMII;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_SIMII;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_SIMII;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FLUFFY];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SIMII;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_LONG, GLOBAL.FLAG_PREHENSILE];
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
			this.hipRatingRaw = 1;
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
			this.buttRatingRaw = 3;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1;
			this.cocks[0].cLengthRaw = 4;
			this.cocks[0].cType = GLOBAL.TYPE_SIMII;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			
			this.cockVirgin = true;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 5;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			
			this._isLoading = false;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			delete dataObject.meleeWeapon;
			delete dataObject.lustVuln;
			delete dataObject.resistances;
			delete dataObject.bonusResistances;
			delete dataObject.bonusLustVuln;
		}
	}
}