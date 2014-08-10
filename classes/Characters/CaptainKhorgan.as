package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	public class CaptainKhorgan extends Creature
	{
		//constructor
		public function CaptainKhorgan()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Captain Khorgan";
			this.originalRace = "Thraggen";
			this.a = "";
			this.capitalA = "";
			this.long = "Captain Khorgan cuts a truly impressive figure: a towering, muscular thraggen woman with a lengthy braid of red hair trailing down her back. Her impressive bust is barely restrained by the tatters of her corset, threatening to spill free at any moment. In one hand, the captain is clutching a force cutlass, a shimmering blue hardlight blade more than capable of shearing through steel; with the other, she clutches the remote detonator for the planet-cracking bomb you've been sent to disarm. She's breathing hard, chest heaving: and not from exertion. Her stiff nipples are poking through the ruins of her corset, and you can see an ever-growing damp patch on her pants, as if she's getting off on the fight!";
			this.customBlock = "She easily deflects your attack.";
			this.plural = false;
			this.lustVuln = 1;
			//this.meleeWeapon = new RaskvelWrench();
			
			this.meleeWeapon.damage = 3;
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "cutlass";
			this.meleeWeapon.attackVerb = "slash";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "sexy bodice";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			//this.shield = new JoyCoPremiumShield();

			this.physiqueRaw = 21;
			this.reflexesRaw = 19;
			this.aimRaw = 18;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 20;
			this.libidoRaw = 55;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 55;
			this.resistances = new Array(1.2,1.2,1.2,0.9,0.9,0.9,0.9,1);
			this.XPRaw = 500;
			this.level = 5;
			this.credits = 987;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "red";
			this.tallness = 85;
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
			this.vaginas[0].bonusCapacity = 55;
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
			//Savin wasn't around so I just threw a # in.
			this.breastRows[0].breastRatingRaw = 10;
			this.nippleColor = "dark green";
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
			var combatCaptainKhorgan:CaptainKhorgan = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("CAPTAIN_KHORGAN");
			kGAMECLASS.setLocation("FIGHT: CAP'N\nKHORGAN", "PLANET: TARKUS", "SYSTEM: REDACTED");
			combatCaptainKhorgan.sexualPreferences.setRandomPrefs(3 + rand(3));
			
			kGAMECLASS.foes.push(combatCaptainKhorgan);
		}
	}
}