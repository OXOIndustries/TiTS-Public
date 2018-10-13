package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.LaserCarbine;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Treasures.Savicite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.possessive;
	
	public class MiningRobot extends Creature
	{
		public function MiningRobot()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "mining robot";
			this.originalRace = "robot";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "This drone appears to be a ramshackle amalgamation of parts, painted black and strapped with all kinds of mining equipment -- most notably a series of hotshot lasers and a drill that replaces one of its forearms. Much of its body is plated with black-sprayed metal, though loose wires and sensors hang out at every joint.\n\nThe hulking mineral harvester seems intent on tearing you down to your base components: better not lose!";
			this.customDodge = "It's erratic jerking carries it out of the way!";
			this.customBlock = "The machina’s thick plates cause the attack to glance off into the wilderness!";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "drill";
			this.meleeWeapon.longName = "pincers";
			this.meleeWeapon.attackNoun = "drill";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 3;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon = new LaserCarbine();
			
			this.armor.longName = "metal plates";
			this.armor.defense = 15;
			this.armor.hasRandomProperties = true;
			
			//50% kinetic res, 100% elec vuln!
			baseHPResistances.kinetic.damageValue = 50.0;
			baseHPResistances.electric.damageValue = -100.0;
			
			this.physiqueRaw = 45;
			this.reflexesRaw = 30;
			this.aimRaw = 25;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 1;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 9;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 165;
			this.HPRaw = this.HPMax();

			this.femininity = 5;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.tallness = 48;
			this.thickness = 50;
			this.tone = 50;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = 0;
			this.skinTone = "metal";
			this.skinFlags = new Array();
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 0;
			this.legFlags = new Array();
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
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
			this.buttRatingRaw = 0;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 0;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 0;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 0;
			this.minutesSinceCum = 9999;
			this.timesCum = 0;
			this.cockVirgin = true;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			this.vaginas = new Array();
			this.cocks = new Array();
			//Goo is hyper friendly!
			this.elasticity = 0;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 0;
			this.clitLength = 0;
			this.pregnancyMultiplierRaw = 0;
			
			this.createStatusEffect("Infertile");
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 0;
			this.ass.bonusCapacity = 0;
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			
			isUniqueInFight = true;
			btnTargetText = "M.Rbt";
			randomise();
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "MINING_ROBOT";
		}

		public function randomise():void
		{
			if(rand(2) == 0) this.inventory.push(new Picardine());
			if(rand(2) == 0) this.inventory.push(new Kirkite());
			if(rand(2) == 0) this.inventory.push(new Savicite());
			if(rand(2) == 0) this.inventory.push(new Satyrite());
			if(this.inventory.length == 0) this.inventory.push(new Satyrite());
		}
	
				
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(rand(4) == 0) hulkSmashAttack(target);
			else if(rand(2) == 0) laserBarrage(target);
			else drillThrust(target);
		}

		//Laser Barrage
		//4 low-accuracy laser shots.
		private function laserBarrage(target:Creature):void
		{
			output("The robot digs its feet into the ground, bracing itself before the several laser barrels of its multi-lasers heat up and start spewing streaks of red heat across the tunnel!");
			for (var i:int = 0; i < 4; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
		//Drill Thrust
		//One big, fat Kinetic hit. Sunders armor on hit.
		public function drillThrust(target:Creature):void
		{
			output("With a digitized roar, the robot barrels forward and drives its drill straight towards your chest.");
			//Hit: 
			if(!combatMiss(this, target)) 
			{
				output(" You roll with the blow, staggering back as the grinding metal tears into you!");
				if(!target.hasStatusEffect("Sundered") && target.defense() >= 2) output(" Thankfully, your armor absorbs most of the blow... but <b>the drill leaves your armor sundered!</b>");
				applyDamage(meleeDamage(), this, target, "minimal");
				if(!target.hasStatusEffect("Sundered") && target.defense() >= 2)
				{
					output("\n<b>Sundered</b>!");
					CombatAttacks.applySunder(target, 4 + rand(2));
				}
			}
			else output(" You dodge backwards and twist aside, avoiding the massive drill!");
		}
		//Hulk Smash
		//One big, fat Kinetic hit that knocks the target down 100% of the time.
		public function hulkSmashAttack(target:Creature):void
		{
			output("The mining drone rears back and comes at you swinging with its non-drill hand, trying to deck you with all the subtle force of a ballistic missile.");
			if(combatMiss(this, target) || target.isPlanted()) output(" You manage to duck the swing. The robot's fist impacts the cave wall, sending debris showering everywhere!");
			else
			{
				var damage:TypeCollection = meleeDamage();
				damage.multiply(2);
				output("The drone catches you on the side");
				if(!target.hasStatusEffect("Tripped"))
				{
					output(", sending you sprawling backwards! You land on your [pc.butt], <b>knocked prone</b>");
					CombatAttacks.applyTrip(target);
				}
				output("!");
				applyDamage(damage, this, target,"minimal");
			}
		}
	}
}
