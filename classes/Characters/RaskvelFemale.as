package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Melee.RaskvelWrench;
	import classes.Items.Transformatives.Ruskvel;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	public class RaskvelFemale extends Creature
	{
		//constructor
		public function RaskvelFemale()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "female raskvel";
			this.originalRace = "raskvel";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Dressed in a [INSERT SHIT HERE], the raskvel girl doesn't seem to have any sense of propriety. Her clothes are obviously there to keep her warm during her adventures - not to protect her modesty. Ears so long they hang down past her waist flutter around as she moves, weighted with gaudy piercings, many of them made from small gears or cogs. She wields a wrench almost as big as herself with surprising dexterity. That wrench is no ordinary wrench either, there's a cylindrical barrel down the handle and a trigger mechanism as well. It actually looks like a gun has been built into it! A much smaller looking pistol hangs from her hip.";
			this.customBlock = "The zil's chitinous armor deflects your attack.";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon = new RaskvelWrench();
			
			this.rangedWeapon.damage = 10;
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "shotgun";
			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.shield = new ImprovisedShield();

			this.physiqueRaw = 7;
			this.reflexesRaw = 13;
			this.aimRaw = 13;
			this.intelligenceRaw = 14;
			this.willpowerRaw = 5;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XPRaw = 150;
			this.level = 3;
			this.credits = 100;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_RASKVEL;
			this.eyeColor = "red";
			this.tallness = 48;
			this.thickness = 42;
			this.tone = 44;
			this.hairColor = "red";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "blue";;
			this.furColor = "red";
			this.hairLength = 6;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "light blue";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_RASKVEL;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_RASKVEL;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_RASKVEL;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_RASKVEL;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.addTailFlag(GLOBAL.FLAG_LONG);
			this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
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
			this.buttRatingRaw = 6;
			//No dicks here!
			this.cocks = new Array();
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].type = GLOBAL.TYPE_RASKVEL;
			this.vaginas[0].clits = 2;
			this.vaginas[0].vaginaColor = "purple";
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
			this.timesCum = 1111;

			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "purple";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
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
			var combatRaskvelFemale:RaskvelFemale = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("RASKVEL_FEMALE");
			kGAMECLASS.setLocation("FIGHT: FEM.\nRASKVEL", "PLANET: TARKUS", "SYSTEM: REDACTED");
			combatRaskvelFemale.sexualPreferences.setRandomPrefs(4 + rand(3),0);
			
			//Determine armor sizes
			if(rand(2) == 0) {
				combatRaskvelFemale.long = "Dressed in a tattered shirt and fluttering skirt, the raskvel girl doesn't seem to have any sense of propriety. Her clothes are obviously there to keep her warm during her adventures - not to protect her modesty. Ears so long they hang down past her waist flutter around as she moves, weighted with gaudy piercings, many of them made from small gears or cogs. She wields a wrench almost as big as herself with surprising dexterity. That wrench is no ordinary wrench either, there's a cylindrical barrel down the handle and a trigger mechanism as well. It actually looks like a gun has been built into it! A much smaller looking pistol hangs from her hip.";
				combatRaskvelFemale.armor.longName = "tattered shirt and fluttering skirt";
			}
			else 
			{
				combatRaskvelFemale.long = "Dressed in a crotch-less jumpsuit, the raskvel girl doesn't seem to have any sense of propriety. Her clothes are obviously there to keep her warm during her adventures - not to protect her modesty. Ears so long they hang down past her waist flutter around as she moves, weighted with gaudy piercings, many of them made from small gears or cogs. She wields a wrench almost as big as herself with surprising dexterity. That wrench is no ordinary wrench either, there's a cylindrical barrel down the handle and a trigger mechanism as well. It actually looks like a gun has been built into it! A much smaller looking pistol hangs from her hip.";
				combatRaskvelFemale.armor.longName = "crotch-less jumpsuit";
			}
			combatRaskvelFemale.ass.loosenessRaw = rand(4) + 1;
			combatRaskvelFemale.vaginas[0].loosenessRaw = rand(4) + 1;
			combatRaskvelFemale.credits = 100+rand(100);

			// Codex shit
			CodexManager.unlockEntry("Raskvel");
			if (rand(10) == 0)
			{
				combatRaskvelFemale.inventory.push(new RaskvelWrench());
			}
			else if(rand(8) <= 6) combatRaskvelFemale.inventory.push(new Ruskvel());
			kGAMECLASS.foes.push(combatRaskvelFemale);
		}
	}
}