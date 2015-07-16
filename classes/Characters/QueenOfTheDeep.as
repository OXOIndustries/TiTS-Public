package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	public class QueenOfTheDeep extends Creature
	{
		//constructor
		public function QueenOfTheDeep()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "queen of the deep";
			this.originalRace = "Deeps Queen";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The creature before you is a monstrous amalgam of bestial features: stalk-like legs with too many joints, writhing masses of envenomed tentacles, and a pair of huge claws all grow from a dark red body covered in carapace as thick as a tank's armor. Rising from atop the fifteen-foot-high body comes a woman's torso, with creamy cyan and white skin covered in patches of bioluminescent algae that strobe to the beat of their owner's heart. The mossy substance is arranged across her almost like clothing, though the moss leaves her pair of pendulous breasts bare, exposing eight nipples, each drooling with amber moisture. A long braid of tentacle-hair falls down the upper half's back, glowing softly in shades of blue and green.\n\nA pair of large, black eyes regard you with cool malice... and just a hint of lust. The woman-half of the Queen's monstrous form licks her dark blue lips eagerly as she draws back the string of her crystalline bow.";
			this.customDodge = "Crazy spoodercrab blocks your attack!";
			this.customBlock = "The alien's chitin deflects the attack.";
			this.plural = false;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.resistanceValue = 45.0;
			baseHPResistances.burning.resistanceValue = 45.0;
			baseHPResistances.corrosive.resistanceValue = 45.0;
			baseHPResistances.electric.resistanceValue = 45.0;
			baseHPResistances.freezing.resistanceValue = 45.0;
			
			baseHPResistances.drug.resistanceValue = 25.0;
			baseHPResistances.tease.resistanceValue = 25.0;
			baseHPResistances.pheromone.resistanceValue = 25.0;
			baseHPResistances.psionic.resistanceValue = 25.0;
			
			this.meleeWeapon = new Fists();
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 15;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 45;
			this.reflexesRaw = 35;
			this.aimRaw = 30;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 40;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.XPRaw = 2000;
			this.level = 8;
			this.credits = 0;
			this.HPMod = 180;
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
			this.cumType = GLOBAL.FLUID_TYPE_SYDIAN_CUM;
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
			
			this._isLoading = false;
		}
		override public function setDefaultSexualPreferences():void
		{
			this.sexualPreferences.setRandomPrefs(4 + rand(3), 2);
		}
		override public function prepForCombat():void
		{
			var t:QueenOfTheDeep = this.makeCopy();
			t.setDefaultSexualPreferences();
			kGAMECLASS.userInterface.showBust("QUEENOFTHEDEEP");
			kGAMECLASS.userInterface.showName("FIGHT:\nDEEPS QUEEN");
			
			kGAMECLASS.foes.push(t);
		}
	}
}