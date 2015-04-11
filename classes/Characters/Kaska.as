package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	public class Kaska extends Creature
	{
		//constructor
		public function Kaska()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Kaska";
			this.originalRace = "Dzaan";
			this.a = ""; 
			this.capitalA = "";
			this.long = "Kaska is an imposing woman, standing seven and a half feet tall and toting a weapon bigger than a fair number of coreward races. Half her reddish purple hair is bound in tightly-cropped dreadlocks while the rest hangs over one bare shoulder. She'd cut an attractive, if oversized, figure in any number of drinking establishments if it wasn't for her aggressive, warlike expression. Then there's the matter of the seven inch python between her legs. It isn't even hard, and it already matches the average size of terran erections. She's unarmed save for a pair of armor plated shinguards. Tight leather wrappings cover her up elsewhere, covering up her nipples in a kind of obscene, faux modesty.";
			this.customBlock = "She springs out of the way of your attack.";
			this.plural = false;
			
			//this.meleeWeapon = new RaskvelWrench();
			
			rangedWeapon.baseDamage.kinetic.damageValue = 1;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			
			this.rangedWeapon.attack = -5;
			this.rangedWeapon.longName = "dual-barreled machine gun";
			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.baseDamage.kinetic.damageValue = 1;
			this.rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "revealing leathers";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			//this.shield = new JoyCoPremiumShield();

			this.physiqueRaw = 15;
			this.reflexesRaw = 19;
			this.aimRaw = 22;
			this.intelligenceRaw = 14;
			this.willpowerRaw = 12;
			this.libidoRaw = 65;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 20;
			
			this.XPRaw = 450;
			this.level = 5;
			this.credits = 987;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "red";
			this.tallness = 90;
			this.thickness = 40;
			this.tone = 40;
			this.hairColor = "reddish purple";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "unknown";;
			this.furColor = "unknown";
			this.hairLength = 9;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.TYPE_HUMAN;
			this.skinTone = "caramel";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 1;
			//Should be set to Dzaan once that type is coded
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			//Should be Dzaan
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
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
			this.hipRatingRaw = 8;
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
			this.buttRatingRaw = 5;
			this.createCock();
			this.cocks[0].cLengthRaw = 11;
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].flaccidMultiplier = .75;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.cockVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 25;
			//balls
			this.balls = 2;
			this.ballSizeRaw = 4;
			this.cumMultiplierRaw = 40;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 120;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 26;
			this.minutesSinceCum = 420;
			this.timesCum = 3944;

			this.elasticity = 1.4;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 5;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			//Savin wasn't around so I just threw a # in.
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "dark brown";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);

			this._isLoading = false;
		}
		override public function prepForCombat():void
		{
			var combatKaska:Kaska = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("KASKA");
			kGAMECLASS.setLocation("FIGHT:\nKASKA", "PLANET: TARKUS", "SYSTEM: REDACTED");
			//KASKA Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE,	GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS,		GLOBAL.KINDA_LIKES_SEXPREF);	
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.KINDA_LIKES_SEXPREF);
			//KASKA Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,		GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS,	GLOBAL.REALLY_DISLIKES_SEXPREF);

			kGAMECLASS.foes.push(combatKaska);
		}
	}
}