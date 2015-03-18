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
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class RaskvelMale extends Creature
	{
		//constructor
		public function RaskvelMale()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "three male raskvel";
			this.originalRace = "raskvel";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Placeholdah";
			this.customBlock = "The zil's chitinous armor deflects your attack.";
			this.plural = true;
			this.meleeWeapon = new RaskvelWrench();
			
			rangedWeapon.baseDamage.kinetic.damageValue = 10;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "shotgun";
			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.shield = new ImprovisedShield();

			this.physiqueRaw = 11;
			this.reflexesRaw = 16;
			this.aimRaw = 16;
			this.intelligenceRaw = 17;
			this.willpowerRaw = 7;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			
			this.XPRaw = 250;
			this.level = 4;
			this.credits = 150;
			this.HPMod = 45;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_RASKVEL;
			this.eyeColor = "red";
			this.tallness = 48;
			this.thickness = 42;
			this.tone = 44;
			this.hairColor = "red";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "red";;
			this.furColor = "red";
			this.hairLength = 6;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "light red";
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
			this.hipRatingRaw = 4;
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
			this.createCock();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.cockVirgin = false;
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cType = GLOBAL.TYPE_RASKVEL;
			this.cocks[0].cockColor = "purple";
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
			this.timesCum = 3711;

			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			//this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "purple";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 35;
			
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
			var combatRaskvelMale:RaskvelMale = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("RASKVEL_MALE","RASKVEL_MALE","RASKVEL_MALE");
			kGAMECLASS.setLocation("FIGHT: MALE\nRASKVEL", "PLANET: TARKUS", "SYSTEM: REDACTED");
			combatRaskvelMale.sexualPreferences.setRandomPrefs(3 + rand(3));
			
			combatRaskvelMale.long = "You are fighting the raskvel gang. The three red-scaled males, their big, rabbit-like ears and blunt tails swinging as they move, have you surrounded. The biggest one, a good four foot two, is brazenly naked and is using his fists and feet for weapons. The other two have harnesses around their waists and are swinging heavy wrenches. Though short, all three of them are pretty strongly built: tight, unostentatious muscle bulges underneath their smooth, rusty skin, particularly in their thick thighs.";
			combatRaskvelMale.long += " Their dicks are hidden away in their sheaths, although their snug, pouch-like balls are clear to see.";
			combatRaskvelMale.long += " They have jolly, lively faces, and they laugh and call to each other as they fight you, as if they’re not taking this particularly seriously. Their attacks, though, are very definitely serious.";

			//combatRaskvelMale.ass.loosenessRaw = rand(4) + 1;
			//combatRaskvelMale.vaginas[0].loosenessRaw = rand(4) + 1;
			combatRaskvelMale.credits = 100+rand(200);

			// Codex shit - Disabled. Entry unlocks mid-greeting event.

			/*if (rand(10) == 0)
			{
				combatRaskvelFemale.inventory.push(new RaskvelWrench());
			}*/	
			if(rand(8) <= 6) combatRaskvelMale.inventory.push(new Ruskvel());
			kGAMECLASS.foes.push(combatRaskvelMale);
		}
	}
}