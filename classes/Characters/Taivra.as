package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Melee.TaivrasSpear;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Guns.EagleHandgun;
	import classes.Items.Guns.LaserPistol;
	
	import classes.GLOBAL;

	/**
	 * ...
	 * @author Gedan
	 */
	
	public class Taivra extends Creature
	{
		
		public function Taivra() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Taivra";
			this.originalRace = "nyrea";
			this.a = "";
			this.capitalA = "";
			this.tallness = 72;
			this.scaleColor = "green";
			
			this.long = "You’re facing down Queen Taivra, an alpha nyrea powerful enough to subjugate an entire city of her amazonian sisters. She stands nearly six feet tall, with pale yellow flesh left largely bare by her revealing armor - if you could call it that. She wears a bikini-style vest and bottom of padded chainmail, showing off her ample cleavage and her firm muscles and belly. Leather bracers and pauldrons adorn compliment her armor, and a blood red cape flows from her shoulders. A black Reaper shield belt hangs loosely from her hips, a trophy taken from an off-worlder, no doubt, and now adorned with fetishes and potion vials.";
			
			this.plural = false;
			
			this.shield = new ReaperArmamentsMarkIShield();
			this.meleeWeapon = new TaivrasSpear();
			
			this.physiqueRaw = 25;
			this.reflexesRaw = 30;
			this.aimRaw = 25;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 29;
			this.libidoRaw = 80;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 25.0;
			
			this.XPRaw = 750;
			this.level = 8;
			this.credits = 0;
			this.HPMod = 150;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_NYREA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_NYREA;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_NYREA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NYREA;
			this.legCount = 2;
			this.legFlags = [];
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
			this.refractoryRate = 9999;
			this.minutesSinceCum = 9000;
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			
			this.hairLength = 10;
			
			this.cocks = [];
			this.cocks.push(new CockClass());
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_NYREA;
			(this.cocks[0] as CockClass).cLengthRaw = 13;
			(this.cocks[0] as CockClass).cThicknessRatioRaw = 1.66;
			(this.cocks[0] as CockClass).addFlag(GLOBAL.FLAG_KNOTTED);
			(this.cocks[0] as CockClass).virgin = false;
			this.cockVirgin = false;
			
			this._isLoading = false;
		}
		
		override public function prepForCombat():void
		{
			var nyrea:Taivra = this.makeCopy();
			
			nyrea.tallness = 68 + (rand(12) - 6);
			nyrea.rangedWeapon = new (RandomInCollection(EagleHandgun, HammerPistol, LaserPistol))();
			
			nyrea.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,		GLOBAL.REALLY_LIKES_SEXPREF);
			nyrea.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			nyrea.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			nyrea.sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			nyrea.sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS,	GLOBAL.KINDA_LIKES_SEXPREF);
			nyrea.sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE,		GLOBAL.KINDA_LIKES_SEXPREF);
			
			nyrea.long += "\n\nThe queen’s long black hair is tied into a tight ponytail behind her elfin ears, and her pitch-black eyes regard you with ";
			if(kGAMECLASS.flags["FREED_DANE_FROM_TAIVRA"] == 1) nyrea.long += "cold contempt";
			else nyrea.long += "playful mirth, like a cat stalking her prey";
			nyrea.long += ". Her purple lips twist in a smile, and she twirls her towering longspear about herself in a series of flourishes and feints that would have impressed a core-world martial artist.";
			if(kGAMECLASS.flags["FREED_DANE_FROM_TAIVRA"] == 1) nyrea.long += "\n\nDane, your cousin [rival.name]’s four-armed ausar bodyguard, is standing at your side. Though wounded by Queensguard, he’s still managing to stand - if only barely. He might not be at full strength, but it’s reassuring to have somebody watching your back.";

			nyrea.inventory.push(new ReaperArmamentsMarkIShield());
			//else if(rand(50) == 0) nyrea.inventory.push(new Satyrite());
			//else if(rand(20) == 0) nyrea.inventory.push(new Picardine());
			//else if (rand(20) == 0)	nyrea.inventory.push(nyrea.rangedWeapon.makeCopy());
			//else if (rand(20) == 0) nyrea.inventory.push(nyrea.meleeWeapon.makeCopy());
			kGAMECLASS.showName("FIGHT:\nQUEEN TAIVRA");
			if(kGAMECLASS.flags["FREED_DANE_FROM_TAIVRA"] == 1) kGAMECLASS.showBust("TAIVRA","DANE");
			else kGAMECLASS.showBust("TAIVRA");
			kGAMECLASS.foes.push(nyrea);
		}
		
	}

}