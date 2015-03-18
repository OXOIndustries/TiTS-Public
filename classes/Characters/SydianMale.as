package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	public class SydianMale extends Creature
	{
		//constructor
		public function SydianMale()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "sydian male";
			this.originalRace = "Sydian";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Placeholder";
			this.customDodge = "The sydian rolls aside in a remarkable display of agility for one with such a large frame.";
			this.customBlock = "The alien's chitin deflects the attack.";
			this.plural = false;
			
			this.meleeWeapon = new Fists();
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 18;
			this.reflexesRaw = 12;
			this.aimRaw = 10;
			this.intelligenceRaw = 13;
			this.willpowerRaw = 17;
			this.libidoRaw = 35;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 33;
			
			this.XPRaw = 250;
			this.level = 4;
			this.credits = 0;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 5;
			this.eyeType = GLOBAL.TYPE_SYDIAN;
			this.eyeColor = "black";
			this.tallness = 85;
			this.thickness = 70;
			this.tone = 80;
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
			this.tailRecharge = 5;
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
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.5;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_SYDIAN_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 100;
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
			
			this._isLoading = false;
		}
		
		override public function prepForCombat():void
		{
			var combatSydianMale:SydianMale = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("SYDIAN_MALE");
			kGAMECLASS.userInterface.showName("FIGHT:\nSYDIAN MALE");
			
			CodexManager.unlockEntry("Sydians");
			
			combatSydianMale.sexualPreferences.setRandomPrefs(2 + rand(3));
			combatSydianMale.cocks[0].cLengthRaw = 9 + rand(4);
			if(rand(3) == 0) combatSydianMale.hairColor = "pale green";
			else if(rand(2) == 0) combatSydianMale.hairColor = "fiery orange";
			else combatSydianMale.hairColor = "blood-hued crimson";
			combatSydianMale.long = "The figure you're facing stands almost seven feet tall, looking every bit the hulking brute. He - there's no way you could mistake him for any other gender - stands with an easy balance that can only have come from spending years climbing around the heaps and spires of his home planet. There isn't a single stitch of clothing or equipment to protect his modesty, only carapace-like plates that cover most of him. Two feelers twitch atop his head, each about eight inches long, and another four sprout from the end of his long, tapered tail. That limb is still looks thick enough to smart if he were to club you with it. His eyes are inky onyx spheres, though his hair is " + combatSydianMale.hairColor + ". A cock as orange as a terran sunset dangles between his legs, about " + combatSydianMale.cocks[0].cLength() + " inches long and covered with a peculiar coat of tiny, brush-like cilia.";
			kGAMECLASS.foes.push(combatSydianMale);
		}
	}
}