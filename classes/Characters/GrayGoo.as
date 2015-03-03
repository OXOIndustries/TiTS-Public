package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	public class GrayGoo extends Creature
	{
		//constructor
		public function GrayGoo()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "gray goo";
			this.originalRace = "Conglomerate";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "This goo-like creature is made of a writhing mass of nano-bots, trillions of the little things coalesced into the form of an almost comically-busty woman, with wide hips and thick thighs over long legs that seem to have trouble maintaining their shape, as her feet are constantly turning to an amorphous liquid on the ground as she walks. Her arms, too, are constantly shifting, turning into masses of thin tentacles or else reforming into the shape of various sex toys and restraints, some parts of her intelligence clearly over-eager to milk all the \"natural lube\" she can out of you! ";
			this.customDodge = "The goo's body twists and morphs outlandishly to avoid your attack.";
			this.customBlock = "The goo's remarkable composition somehow allows her to take your attack unharmed.";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon = new Fists();
			
			this.rangedWeapon.attack = 1;
			this.rangedWeapon.longName = "dart";
			this.rangedWeapon.attackVerb = "dart";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "glittering \"skin\"";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 12;
			this.reflexesRaw = 12;
			this.aimRaw = 3;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 8;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			this.resistances = new Array(.75,.75,.75,1,1,1,1,1);
			this.XPRaw = 225;
			this.level = 4;
			this.credits = 50;
			this.HPMod = 10;
			this.HPRaw = this.HPMax();


			this.femininity = 100;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "silver";
			this.tallness = 70;
			this.thickness = 45;
			this.tone = 0;
			this.hairColor = "silver";
			this.scaleColor = this.scaleColor;
			this.furColor = "gray";
			this.hairLength = 31;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "skin";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 2;
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
			this.hipRatingRaw = 15;
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
			this.buttRatingRaw = 13;
			//No dicks here!
			this.cocks = new Array();
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].wetnessRaw = 5;
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
			this.minutesSinceCum = 3650;
			this.timesCum = 188721;

			//Goo is hyper friendly!
			this.elasticity = 100;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 21;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Stun Immune");
			
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
			var combatGrayGoo:GrayGoo = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("GRAY_GOO");
			kGAMECLASS.userInterface.showName("FIGHT:\nGRAY GOO");
			combatGrayGoo.sexualPreferences.setRandomPrefs(3 + rand(3));
			
			// Codex shit
			CodexManager.unlockEntry("Gray Goos");
			combatGrayGoo.credits = 50+rand(200);
			/*if (rand(3) == 0)
			{
				combatGrayGoo.inventory.push(new ZilHoney());
			}
			else
			{
				combatGrayGoo.inventory.push(new ZilRation());
			}*/
			
			kGAMECLASS.foes.push(combatGrayGoo);
		}
	}
}