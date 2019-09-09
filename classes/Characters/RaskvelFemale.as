package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Melee.RaskvelWrench;
	import classes.Items.Transformatives.Ruskvel;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.*;
	
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
			this.long = "";
			this.customBlock = "The zil's chitinous armor deflects your attack.";
			this.isPlural = false;
			this.meleeWeapon = new RaskvelWrench();
			
			rangedWeapon.baseDamage.kinetic.damageValue = 10;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "shotgun";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "buckshot";
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
			
			this.level = 3;
			this.XPRaw = normalXP();
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
			
			isUniqueInFight = true;
			btnTargetText = "Raskvel";
			
			randomise();
			kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "RASKVEL_FEMALE";
		}
		
		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(4 + rand(3), 0);
			
			//Determine armor sizes
			if (rand(2) == 0) 
			{
				long = "Dressed in a tattered shirt and fluttering skirt, the raskvel girl doesn’t seem to have any sense of propriety. Her clothes are obviously there to keep her warm during her adventures - not to protect her modesty. Ears so long they hang down past her waist flutter around as she moves, weighted with gaudy piercings, many of them made from small gears or cogs. She wields a wrench almost as big as herself with surprising dexterity. That wrench is no ordinary wrench either, there’s a cylindrical barrel down the handle and a trigger mechanism as well. It actually looks like a gun has been built into it! A much smaller looking pistol hangs from her hip.";
				armor.longName = "tattered shirt and fluttering skirt";
			}
			else 
			{
				long = "Dressed in a crotch-less jumpsuit, the raskvel girl doesn’t seem to have any sense of propriety. Her clothes are obviously there to keep her warm during her adventures - not to protect her modesty. Ears so long they hang down past her waist flutter around as she moves, weighted with gaudy piercings, many of them made from small gears or cogs. She wields a wrench almost as big as herself with surprising dexterity. That wrench is no ordinary wrench either, there’s a cylindrical barrel down the handle and a trigger mechanism as well. It actually looks like a gun has been built into it! A much smaller looking pistol hangs from her hip.";
				armor.longName = "crotch-less jumpsuit";
			}
			ass.loosenessRaw = rand(4) + 1;
			vaginas[0].loosenessRaw = rand(4) + 1;
			credits = 100+rand(100);

			if (rand(10) == 0) inventory.push(new RaskvelWrench());
			else if(rand(8) <= 2) inventory.push(new Ruskvel());
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_PLANTIGRADE);
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(hasStatusEffect("Disarmed"))
			{
				raskvelPunch(target);
			}
			else if(hasStatusEffect("Wrench Charge")) 
			{
				CombatAttacks.WrenchAttack.execute(alliedCreatures, hostileCreatures, this, target);
			}
			else
			{
				if(rand(4) == 0 && target.hasCock()) raskvelGirlsTeasingCockwielders(target);
				else if(rand(3) == 0) CombatAttacks.WrenchAttack.execute(alliedCreatures, hostileCreatures, this, target);
				else if(rand(2) == 0) CombatAttacks.AphrodisiacDarts.execute(alliedCreatures, hostileCreatures, this, target);
				else raskvelFemShotgun(target);
			}
		}
		
		private function raskvelGirlsTeasingCockwielders(target:Creature):void
		{
			if(rand(4) == 0) 
			{
				output("The short female swivels to show you her rump, shaking it up and down to show off her puffed-up pussy and second clit from behind. She shakes and wobbles, bouncing her cheeks enticingly for your enjoyment while asking, \"<i>Come over here and give me some eggs, and we can forget all about this.</i>\"");
				applyDamage(new TypeCollection( { tease: 7 + rand(3) } ), this, target, "minimal");
			}
			//#2
			else if(rand(3) == 0)
			{
				output("Pulling down her top to expose her nipples, " + a + short + " asks, \"<i>Still want to fight? You could always pay me in sperm, you know.</i>\"");
				applyDamage(new TypeCollection( { tease: 6 + rand(7) } ), this, target, "minimal");
			}
			//#3
			else if(rand(2) == 0) 
			{
				output("The raskvel playfully scampers up and pivots, resting her butt against your crotch. She squeezes her surprisingly powerfully thighs to make her cushy little asscheeks wobble back and forth against");
				if (target.isCrotchExposed()) output(" [pc.oneCock]");
				else output(" [pc.oneCock] through your [pc.lowerGarments]");
				output(". \"<i>Come play, we can forget about the money.</i>\"");
				applyDamage(new TypeCollection( { tease: 10 + rand(4) } ), this, target, "minimal");
			}
			//#4
			else
			{
				output("Dropping her wrench, the little creature launches herself towards you, legs akimbo.");
				//Miss
				if(combatMiss(this, target)) output(" You step aside, forcing her to land hard and circle back to her weapon with a frown.");
				//Hit
				else
				{
					output(" Her trajectory carries her square into your face. The lizard-girl’s hot cunt squishes up against your [pc.face] as her legs circle behind your neck, and she languidly grinds herself on your face while running her hands ");
					if(target.hasHair()) output("through your [pc.hair]");
					else output("over your head");
					output(". She detaches before you can think to get her off of you, leaving you with the taste of her femininity on your lips and the thought of sex on your mind.");
					applyDamage(new TypeCollection( { tease: 15 + rand(6) } ), this, target, "minimal");
				}
			}
		}
		
		private function raskvelFemShotgun(target:Creature):void
		{
			output(capitalA + short + " presses a button on the side of her wrench, and you hear a shell slide home. A moment later she points it your way and pulls the trigger. Ka-BLAM! The report is loud enough to echo for miles.");
			//Miss
			if(rangedCombatMiss(this, target)) output(" The pellets fly wide.");
			//Hit
			else
			{
				output("\nYou are struck by the projectiles!");
				var damage:TypeCollection = rangedDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}
		
		private function raskvelPunch(target:Creature):void
		{
			output("Unmoved by being disarmed, the petite raskvel balls her fists and charges you.");
			if(rangedCombatMiss(this, target))
			{
				output("\nYou slide to the side of her clumsy swings.");
			}
			else
			{
				var damage:TypeCollection = new TypeCollection( { kinetic: physique() / 2});
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}
	}
}