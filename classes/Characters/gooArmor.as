package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.Items.Transformatives.Bovinium;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class gooArmor extends Creature
	{
		//constructor
		public function gooArmor()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Nova";
			this.originalRace = "gray goo";
			this.a = "";
			this.capitalA = "";
			this.long = "PLACE HOLDER!";
			this.customDodge = "PLACE HOLDER!";
			this.customBlock = "PLACE HOLDER!";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "slap";
			meleeWeapon.attackNoun = "slap";
			this.meleeWeapon.longName = "gooey psuedopod";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "gooey coverings";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 4;
			this.reflexesRaw = 10;
			this.aimRaw = 8;
			this.intelligenceRaw = 9;
			this.willpowerRaw = 9;
			this.libidoRaw = 55;
			this.energyRaw = 100;
			this.lustRaw = 35;
			
			this.level = 2;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "silver";
			this.tallness = 73;
			this.thickness = 21;
			this.tone = 40;
			this.hairColor = "steel gray";
			this.scaleColor = "steel gray";
			this.furColor = "steel gray";
			this.hairLength = 22;
			this.hairType = GLOBAL.HAIR_TYPE_GOO;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "steel gray";
			this.skinFlags = new Array();
			addSkinFlag(GLOBAL.FLAG_SQUISHY);
			addSkinFlag(GLOBAL.FLAG_LUBRICATED);
			addSkinFlag(GLOBAL.FLAG_AMORPHOUS);
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = GLOBAL.TYPE_HUMAN;
			this.hornLength = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 2;
			this.legFlags = new Array();
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 0;
			this.tailFlags = new Array();
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 1;
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
			this.buttRatingRaw = 10;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 12.5;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 30;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 90;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 4182;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].bonusCapacity = 20;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			//this.fertility = 0;
			this.createStatusEffect("Infertile");
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 10;
			this.nippleColor = "silver";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 50;
			
			this.createStatusEffect("Disarm Immune");
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.meleeWeapon.attackVerb = "slap";
			dataObject.meleeWeapon.attackNoun = "slap";
			dataObject.meleeWeapon.longName = "gooey psuedopod";
			dataObject.armor.longName = "gooey coverings";
			dataObject.eyeType = GLOBAL.TYPE_HUMAN;
			dataObject.eyeColor = "silver";
			dataObject.hairColor = "steel gray";
			dataObject.scaleColor = "steel gray";
			dataObject.furColor = "steel gray";
			dataObject.hairType = GLOBAL.HAIR_TYPE_GOO;
			dataObject.skinType = GLOBAL.SKIN_TYPE_GOO;
			dataObject.skinTone = "steel gray";
			dataObject.skinFlags = [GLOBAL.FLAG_SQUISHY, GLOBAL.FLAG_LUBRICATED, GLOBAL.FLAG_AMORPHOUS, GLOBAL.FLAG_ABSORBENT];
			dataObject.earType = GLOBAL.TYPE_HUMAN;
			dataObject.horns = 0;
			dataObject.hornType = GLOBAL.TYPE_HUMAN;
			dataObject.hornLength = 0;
			dataObject.armType = GLOBAL.TYPE_HUMAN;
			dataObject.legType = GLOBAL.TYPE_GOOEY;
			dataObject.tailType = GLOBAL.TYPE_HUMAN;
			dataObject.tailCount = 0;
			dataObject.tailFlags = [];
			dataObject.hipRatingRaw = 10;
			dataObject.buttRatingRaw = 10;
			dataObject.nippleColor = "silver";
		}
	}

}