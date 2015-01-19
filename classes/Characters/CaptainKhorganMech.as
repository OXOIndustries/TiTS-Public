package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	public class CaptainKhorganMech extends Creature
	{
		//constructor
		public function CaptainKhorganMech()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Captain Khorgan";
			this.originalRace = "Thraggen";
			this.a = "";
			this.capitalA = "";
			this.long = "Barely visible beneath tons of steel mech suit, the captain cuts an impressive figure: buxom, muscular, and fierce. Her every moment is precise and furious, as if her rage at your intrusion alone is enough to overwhelm you. What you can see of her dress screams \"party-shop pirate,\" with ruffles and a tricorn hat and everything. Even the suit she's wearing is outdated, an old civilian mining exoskeleton, the kind used for deep-depth ore drilling and excavation, probably a century old. But it's been heavily reinforced with makeshift armor plating, shield emitters, and weapon upgrades -- including a massive missile launcher strapped to its back, probably ripped off of a starfighter or freighter.";
			this.customBlock = "The exoskeleton easily absorbs your attack.";
			this.plural = false;
			this.lustVuln = 0;
			//this.meleeWeapon = new RaskvelWrench();
			
			this.rangedWeapon.damage = 10;
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "mining laser";
			this.rangedWeapon.attackVerb = "laser";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "hull plates";
			this.armor.defense = 5;
			this.armor.hasRandomProperties = true;
			
			this.shield = new JoyCoPremiumShield();

			this.physiqueRaw = 25;
			this.reflexesRaw = 5;
			this.aimRaw = 18;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 20;
			this.libidoRaw = 55;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.resistances = new Array(.9,.9,.9,1.1,1.1,1,1.25,1);
			this.XPRaw = 500;
			this.level = 5;
			this.credits = 987;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "red";
			this.tallness = 132;
			this.thickness = 42;
			this.tone = 44;
			this.hairColor = "red";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "unknown";;
			this.furColor = "unknown";
			this.hairLength = 6;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.TYPE_HUMAN;
			this.skinTone = "green";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
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
			this.hipRatingRaw = 6;
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
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].bonusCapacity = 25;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 420;
			this.timesCum = 2862;

			this.elasticity = 1.6;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "dark green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			this.createStatusEffect("Disarm Immune");

			this._isLoading = false;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_PLANTIGRADE);
			}
		}
		override public function prepForCombat():void
		{
			var combatCaptainKhorganMech:CaptainKhorganMech = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("CAPTAIN_KHORGAN");
			kGAMECLASS.setLocation("FIGHT: CAP'N\nKHORGAN", "PLANET: TARKUS", "SYSTEM: REDACTED");
			//combatCaptainKhorganMech.sexualPreferences.setRandomPrefs(3 + rand(3));
			
			kGAMECLASS.foes.push(combatCaptainKhorganMech);
		}
	}
}