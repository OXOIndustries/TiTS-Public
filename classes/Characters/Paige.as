package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.UGCUniform;
	import classes.Items.Melee.Tonfas;
	
	public class Paige extends Creature
	{		
		//constructor
		public function Paige()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Paige";
			this.originalRace = "half-ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "You're standing in her yoga class. Your Ausar opponent stands across from you, her fists raised and close to her face. Her stance is wide and steady, but unaggressive; she isn't about to make the first move. Despite her battle-unprepared clothing and her disability, you know that this fight isn't going to be an easy one. She wants to prove herself <i>to</i> herself, and she'll fight like a beast to do it.";
			this.customDodge = "uncreated";
			this.customBlock = "uncreated";
			this.isPlural = false;
			
			this.meleeWeapon = new Tonfas();
			this.armor = new UGCUniform();
			
			this.physiqueRaw = 10;
			this.reflexesRaw = 8;
			this.aimRaw = 6;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 3;
			this.libidoRaw = 40;
			this.shieldsRaw = 20;
			this.energyRaw = 100;
			this.lustRaw = 85;
			
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 68; //Just picked something since I didnt see a specific value.
			this.thickness = 30;
			this.tone = 85;
			this.hairColor = "light brown";
			this.scaleColor = "blue";
			this.furColor = "brown";
			this.hairLength = 11;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "tan";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_CANINE;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY,GLOBAL.FLAG_LONG,GLOBAL.FLAG_THICK,GLOBAL.FLAG_FURRED];
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
			this.hipRatingRaw = 3;
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
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 1;
			this.minutesSinceCum = 3679200;
			this.timesCum = 1024;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 20;
			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 3; ///C-cups
			this.nippleColor = "pink"; //presumably
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			
			this._isLoading = false;
			this.createPerk("Multiple Attacks",1,0,0,0,"");
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Blind-ish", 0, 0, 0, 0, false, "Blind", "Paige may not see very well, but years of adapting to her current state leave her less impaired than you might think.", true, 0, 0xFF0000);
		}
		override public function hasBlindImmunity():Boolean
		{
			return true;
		}
		override public function isDefeated():Boolean
		{
			if (HP() <= 0) return true;
			return false;
		}
		override public function lustMax():Number
		{
			return 99;
		}
		override public function setDefaultSexualPreferences():void
		{
			//Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILS,			GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR,		GLOBAL.KINDA_LIKES_SEXPREF);
			//Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
	}
}