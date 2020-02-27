package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.ImmunoBooster;
	import classes.Items.Protection.DecentShield;
	import classes.Items.Accessories.JungleLure;
	import classes.Items.Accessories.JungleRepel;
	import classes.Items.Miscellaneous.MagicMilker;
	import classes.Items.Miscellaneous.ShieldBooster;
	import classes.Items.Tents.HLTent;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	//Note: V-Ko's sexual statistics aren't set up yet.
	public class VKo extends Creature
	{
		//constructor
		public function VKo()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "V-Ko";
			this.originalRace = "automaton";
			this.a = "";
			this.capitalA = "";
			this.long = "PLACE HOLDER!";
			this.customDodge = "PLACE HOLDER!";
			this.customBlock = "PLACE HOLDER!";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.longName = "claws";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "soft fur";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 3;
			this.aimRaw = 2;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 9;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();

			this.inventory.push(new ShieldBooster());
			this.inventory.push(new DecentShield());
			this.inventory.push(new JungleLure());
			this.inventory.push(new JungleRepel());
			this.inventory.push(new MagicMilker());
			this.inventory.push(new ImmunoBooster());
			this.inventory.push(new HLTent());
			this.typesBought[this.typesBought.length] = GLOBAL.PILL;
			this.typesBought[this.typesBought.length] = GLOBAL.POTION;
			this.typesBought[this.typesBought.length] = GLOBAL.DRUG;
			this.typesBought[this.typesBought.length] = GLOBAL.SHIELD;
			this.typesBought[this.typesBought.length] = GLOBAL.TENT;
			this.sellMarkup = 1.15;
			this.buyMarkdown = .5;
			this.keeperBuy = "You ask what items she has to sell.\n\n<i>\"JoyCo has provided the latest and greatest in affordable medical technology for the adventurer in need. You won't find treatments this good for this price anywhere else!\"</i> V-Ko efficiently rattles off the full list of her wares, their effects, and their prices without pause.\n";
			this.keeperSell = "You ask if you can sell her anything.\n\n<i>\"My owners have programmed me to purchase medical-type items and treatments at near galactic bazaar rates.\"</i> V-Ko seems rather pleased about admitting that her purchase prices are substandard.\n";
			this.keeperGreeting = "V-Ko smiles warmly at you.";

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "red";
			this.tallness = 75;
			this.thickness = 75;
			this.tone = 20;
			this.hairColor = "black";
			this.scaleColor = "green";
			this.furColor = "white and black";
			this.hairLength = 40;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "dark";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY];
			
			this.faceType = GLOBAL.TYPE_PANDA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_PANDA;
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_PANDA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_PANDA;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PAWS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_PANDA;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
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
			this.hipRatingRaw = 15;
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
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 212;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].bonusCapacity = 200;
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.10;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 31;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 100;
			
			this.createStatusEffect("Disarm Immune");
		}
		override public function get bustDisplay():String
		{
			return "VKO";
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachVKo();
		}
	}
}