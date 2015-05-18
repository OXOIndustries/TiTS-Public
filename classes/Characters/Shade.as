package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Accessories.LightningDuster;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.Items.Guns.ArcCaster;
	import classes.kGAMECLASS;
	
	public class Shade extends Creature
	{
		
		//constructor
		public function Shade()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Shade";
			this.originalRace = "kaithrit";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "Shade nimbly ducks aside!";
			this.customBlock = "";
			this.plural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "semi-solid fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "flak vest";
			this.armor.defense = 7;
			this.armor.hasRandomProperties = true;

			this.rangedWeapon = new ArcCaster();

			this.shield = new ReaperArmamentsMarkIIShield();
			
			this.accessory = new LightningDuster();
			
			this.physiqueRaw = 21;
			this.reflexesRaw = 31;
			this.aimRaw = 34;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 25;
			this.libidoRaw = 50;
			this.HPMod = 125;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.XPRaw = 400;
			this.level = 7;
			this.credits = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "yellow";
			this.tallness = 77;
			this.thickness = 25;
			this.tone = 70;
			this.hairColor = "silver";
			this.scaleColor = "green";
			this.furColor = "silver";
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "tanned";
			this.skinFlags = [];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_FELINE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_FELINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CUNTSNAKE;
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
			this.buttRatingRaw = 3;
			//No dicks here!
			this.cocks = new Array();
			//Vag!
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].bonusCapacity = 300;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 15;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9;
			this.minutesSinceCum = 900;
			this.timesCum = 1302;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 15;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 7;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 100;
			
			this.inventory.push(new ArcCaster());

			this._isLoading = false;
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//LIKES
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS,	GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE, 		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,	 	GLOBAL.KINDA_LIKES_SEXPREF);

			//DISLIKES
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, 	GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE, GLOBAL.REALLY_DISLIKES_SEXPREF);
		}
		
		override public function prepForCombat():void
		{
			var combatShade:Shade = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("SHADE","KARA");
			kGAMECLASS.userInterface.showName("FIGHT:\nSHADE");
			combatShade.setDefaultSexualPreferences();
			
			kGAMECLASS.foes.push(combatShade);
		}
	}
}