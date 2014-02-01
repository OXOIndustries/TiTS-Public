package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.rand;
	
	public class ZilFemale extends Creature
	{
		//constructor
		public function ZilFemale()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "female zil";
			this.originalRace = "zil";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The female zil you're fighting stands just shy of 5'6, and is covered from head to toes in shiny black chitin. A downy fuzz falls from her head down to her shoulders, resembling curly blonde hair. She's got dozens of sharp darts on her belt, noticeably discolored with chemicals, and a number of glass vials at hand full of who-knows what. Worse, she's got a full bee-like abdomen behind her with a deadly-looking stinger. She moves with a liquid, feline grace, assuming a combat stance that leaves her crotch pointed at you to fill their air with lusty pheromones as her perky tits jut out at you, bobbing from side to side enticingly.";
			this.customDodge = "The zil girl tumbles out of the way with a swift contortion.";
			this.customBlock = "The zil's chitinous armor deflects your attack.";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon = new Fists();
			
			this.rangedWeapon.attack = 1;
			this.rangedWeapon.longName = "dart";
			this.rangedWeapon.attackVerb = "dart";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 2;
			this.reflexesRaw = 2;
			this.aimRaw = 1;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 45;
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XPRaw = 20;
			this.level = 1;
			this.credits = 0;
			this.HPMod = 4;
			this.HPRaw = this.HPMax();


			this.femininity = 85;
			this.eyeType = GLOBAL.BEE;
			this.eyeColor = "black";
			this.tallness = 66;
			this.thickness = 45;
			this.tone = 40;
			this.hairColor = "black";
			this.scaleColor = this.scaleColor;
			this.furColor = "yellow";
			this.hairLength = 22;
			this.hairType = GLOBAL.BEE;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.CHITIN;
			this.skinTone = "black";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.BEE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.BEE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.BEE;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.BEE;
			this.gills = false;
			this.wingType = GLOBAL.BEE;
			this.legType = GLOBAL.BEE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.BEE;
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
			this.hipRating = 6;
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
			this.buttRating = 6;
			//No dicks here!
			this.cocks = new Array();
			this.createVagina();
			this.girlCumType = GLOBAL.HONEY;
			this.vaginalVirgin = false;
			this.vaginas[0].looseness = 2;
			this.vaginas[0].wetness = 4;
			//balls
			this.balls = 0;
			this.cumMultiplier = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQuality = 1;
			this.cumType = GLOBAL.HONEY;
			this.ballSize = 0;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 321;

			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertility = 5;
			this.clitLength = .5;
			this.pregnancyMultiplier = 1;

			this.breastRows[0].breastRating = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetness = 0;
			this.ass.bonusCapacity += 15;
			this.createStatusEffect("Disarm Immune");
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.PLANTIGRADE);
			}
		}
		
		override public function setDefaultSexualPreferences():void
		{
			this.sexualPreferences.clearPrefs();
			
			//Zil Girl Likes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,			GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS,	GLOBAL.REALLY_LIKES_SEXPREF);

			//Zil Girl Dislikes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			//this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.REALLY_DISLIKES_SEXPREF); // Guessing this is an error
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR,		GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
		
		override public function prepForCombat():void
		{
			var combatZilFemale:ZilFemale = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("ZILFEMALE");
			kGAMECLASS.setLocation("FIGHT:\nFEMALE ZIL", "PLANET: MHEN'GA", "SYSTEM: ARA ARA");
			combatZilFemale.sexualPreferences.setRandomPrefs(3 + rand(3));
			
			if (rand(3) == 0)
			{
				combatZilFemale.inventory.push(new ZilHoney());
			}
			else
			{
				combatZilFemale.inventory.push(new ZilRation());
			}
			
			kGAMECLASS.foes.push(combatZilFemale);
		}
	}
}