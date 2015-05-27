package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.DecentShield;
	import classes.kGAMECLASS;
	
	public class Dane extends Creature
	{	
		//constructor
		public function Dane()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Dane";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "Dane stands tall; he's nearly eight feet of powerful, corded muscle. His most obvious feature is his quartet of arms. Evidently, the ausar has turned to genetic modifications for his enhanced stature. His fur is so white it practically glows, and his ivory hair is tied back in short ponytail. His eyes are red too, marking him as an albino. In his upper arms, Dane wields a pair of electrified cutlasses, and in his lower ones, he's gripping a matched set of powder pistols. A lightweight set of high tech armor guards his chest and thighs.";
			this.customDodge = "Dane casually sidesteps out of the way.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.plural = false;
			
			this.meleeWeapon = new ShockBlade();
			this.meleeWeapon.hasRandomProperties = true;
			
			meleeWeapon.baseDamage.electric.damageValue = 3;
			
			this.rangedWeapon = new HammerPistol();
			this.rangedWeapon.hasRandomProperties = true;
			this.rangedWeapon.attackVerb = "shot";
			
			rangedWeapon.baseDamage.kinetic.damageValue = 3;
			
			this.armor.longName = "armor";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			this.shield = new DecentShield();
			
			this.level = 3;
			this.physiqueRaw = 8;
			this.reflexesRaw = 12;
			this.aimRaw = 6;
			this.intelligenceRaw = 11;
			this.willpowerRaw = 9;
			this.libidoRaw = 35;
			this.HPMod = 0;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.XPRaw = 500;
			
			this.credits = 1200;
			
			this.femininity = 10;
			this.eyeType = 0;
			this.eyeColor = "crimson";
			this.tallness = 95;
			this.thickness = 75;
			this.tone = 85;
			this.hairColor = "white";
			this.scaleColor = "white";
			this.furColor = "white";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.addTongueFlag(GLOBAL.FLAG_LONG);
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY];
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
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].cLengthRaw = 18;
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 2000;
			this.timesCum = 1549;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pale pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;

			this.inventory.push(new ShockBlade());
			this.createPerk("Multiple Attacks",0,0,0,0,"");
			this.createPerk("Multiple Shots",0,0,0,0,"");
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
		}	
		override public function setDefaultSexualPreferences():void
		{
			//Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE,	GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,					GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,				GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,					GLOBAL.KINDA_LIKES_SEXPREF);

			//Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS,				GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,				GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
		override public function prepForCombat():void
		{
			var combatDane:Dane = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("DANE");
			kGAMECLASS.setLocation("FIGHT:\nDANE", "PLANET: MHEN'GA", "SYSTEM: ARA ARA");
			combatDane.setDefaultSexualPreferences();
			
			kGAMECLASS.foes.push(combatDane);
		}
	}
}