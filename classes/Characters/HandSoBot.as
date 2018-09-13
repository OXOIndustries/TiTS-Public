package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Interfaces.output;
	
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Items.Protection.DecentShield;
	
	public class HandSoBot extends Creature
	{
		//constructor
		public function HandSoBot()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "firewall";
			this.originalRace = "junker";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The Firewall is a mighty, motley collection of heavy duty industrial tools welded together to form a hulking robot, at least eight feet in height. Its round, riveted torso combines with its long, piston-driven arms to give it a hunched, gorilla-like profile. In way of hands it has implacably strong crane grapnels, and its two feet are square and support-flapped, built to take any kind of weight. Its head is a square, blank screen, on which a red exclamation mark blinks interminably.";
			this.customDodge = "The firewall's erratic motions somehow carry the lumbering hulk out of the way of your attack!";
			this.customBlock = "The firewall’s thick plates cause the attack to glance off harmlessly.";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.longName = "claws";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 3;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "metal plates";
			this.armor.defense = 5;
			this.armor.hasRandomProperties = true;
			this.shield = new DecentShield();

			this.physiqueRaw = 24;
			this.reflexesRaw = 5;
			this.aimRaw = 10;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 15;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.damageValue = -40.0;
			
			this.level = 5;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 20;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();

			this.femininity = 0;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.tallness = 108;
			this.thickness = 70;
			this.tone = 70;
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
			btnTargetText = "Firewall"
			
			this._isLoading = false;
		}

		override public function get bustDisplay():String
		{
			return "FIREWALL_BATTLE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (rand(3) <= 1) CombatAttacks.MeleeAttack(this, target);
			//Electropulse - shielded foes only
			else if(target.shields() > 0) electropulseAttack(target);
			//Flamethrower - unshielded only
			else flameThrowerAttack(target);
		}
		
		private function flameThrowerAttack(target:Creature):void
		{
			output("A yellow bush within a black bush appears on the Firewall’s screen. It opens its gripper at you, allowing you to momentarily see the hollow nozzle at its centre – and then burning gas shoots out of it, a shockingly hot and blinding plume of exothermic destruction which rushes greedily out towards you.");
			if (target.armor.shortName != "") output(" You cry out as the fire grabs at your " + target.armor.longName + ", catching hold and lapping at it lustily.");
			if(flags["TASTED_THE_FLAME"] == undefined)
			{
				flags["TASTED_THE_FLAME"] = 1;
				output("\n\n<i>“How the hell is that non-lethal?!”</i> you yell at So.");
				output("\n\n<i>“Pest creatures sometimes encroach on the factory space,”</i> replies the AI, sounding mildly apologetic. <i>“Fire induces a state of extreme submissiveness in them. My algorithms calculate a 71% chance that it will have the same effect on" + (target.race() != "human" ? " genetically modified" : "") + " humans.”</i>");
			}
			if(rand(10) <= 3 && !target.hasStatusEffect("Burning"))
			{
				output("\n<b>You are now on fire!</b>");
				CombatAttacks.applyBurning(target, 2 + rand(2));
			}
			//If already on fire, add another two rounds.
			else if(target.hasStatusEffect("Burning"))
			{
				output("\n<b>The flames licking at your flesh intensify!</b>");
				target.addStatusValue("Burning",1,2);
			}
			var damage:TypeCollection = new TypeCollection( { burning: 5 + rand(5) } );
			applyDamage(damage, this, target);
		}
		
		private function electropulseAttack(target:Creature):void
		{
			output("A stylized lightning bolt within a yellow triangle appears on the Firewall’s screen. Electricity courses and spits up its arm, then connects with a blinding crack to your kinetic shield.");
			var damage:TypeCollection = new TypeCollection( { electric: 15 + rand(5) } );
			applyDamage(damage, this, target);
		}
	}
}
