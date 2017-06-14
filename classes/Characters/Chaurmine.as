package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.SaurmorianHammer;
	import classes.Items.Guns.SaurmorianRifle;
	import classes.Items.Protection.DecentShield;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class Chaurmine extends Creature
	{	
		//constructor
		public function Chaurmine()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Chaurmine";
			this.originalRace = "saurmorian";
			this.a = "";
			this.capitalA = "";
			this.long = "His vicious snout - combined with his tense, hulking frame - displays a savage visage, contrasting greatly with your otherwise calm surroundings. Armed with his massive hammer and heavy railgun in each hand, he looks ready to fight a small army all by himself. The cold air steams off of his sweltering body, gusts of air from above occasionally whipping and thrashing the misty streams like tattered cloth.\n\nHis azure eyes are filled with an intense fire.";
			this.customDodge = "In a shocking burst of speed, the scaled titan jerks his heavy frame just in time - dodging your attack.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon = new SaurmorianHammer();
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 5;
			
			this.rangedWeapon = new SaurmorianRifle();
			this.rangedWeapon.hasRandomProperties = true;
			this.rangedWeapon.baseDamage.kinetic.damageValue = 5;
			
			this.armor.longName = "armor";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			//this.shield = new DecentShield();

			//500% damage taken from non-lust damage when stunned

			baseHPResistances = new TypeCollection();
			baseHPResistances.tease.damageValue = 100.0;
			baseHPResistances.drug.damageValue = 90.0;
			baseHPResistances.psionic.damageValue = 90.0;
			baseHPResistances.pheromone.damageValue = 90.0;
			baseHPResistances.burning.damageValue = 90.0;
			baseHPResistances.kinetic.damageValue = 90.0;
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.electric.damageValue = 90.0;
			baseHPResistances.corrosive.damageValue = 90.0;
			
			this.level = 10;
			this.physiqueRaw = 50;
			this.reflexesRaw = 10;
			this.aimRaw = 50;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 35;
			this.libidoRaw = 25;
			this.HPMod = 700;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.XPRaw = bossXP();
			
			this.credits = 10000;
			
			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_NAGA;
			this.eyeColor = "azure";
			this.tallness = 102;
			this.thickness = 100;
			this.tone = 100;
			this.hairColor = "silver";
			this.scaleColor = "white";
			this.furColor = "silver";
			this.hairLength = 0;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "silver";
			this.skinFlags = [GLOBAL.FLAG_THICK];
			this.faceType = GLOBAL.TYPE_LIZAN;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED];
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.addTongueFlag(GLOBAL.FLAG_LONG);
			this.lipMod = 0;
			this.lipColor = "amber";
			this.earType = GLOBAL.TYPE_LIZAN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_LEITHAN;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_GRYVAIN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_LIZAN;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_THICK];
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
			this.buttRatingRaw = 3;
			//No dicks here!
			this.cocks = new Array;
			this.createCock();
			this.cocks[0].cockColor = "black"
			this.cocks[0].cType = GLOBAL.TYPE_SAURIAN;
			this.cocks[0].cLengthRaw = 14;
			this.cocks[0].cThicknessRatioRaw = 1.5;
			this.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
			this.cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
			this.cocks[0].addFlag(GLOBAL.FLAG_RIBBED);

			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 11.5;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 5;
			this.minutesSinceCum = 9999;
			this.timesCum = 100;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;

			this.createPerk("Multiple Attacks",1,0,0,0,"");
			this.createPerk("Multiple Shots",1,0,0,0,"");
			//this.createStatusEffect("Stun Immune", 0, 0, 0, 0, true, "", "", false, 0);
			this.createStatusEffect("Disarm Immune", 0, 0, 0, 0, true, "", "", false, 0);
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);

			isUniqueInFight = true;
			btnTargetText = "Chaurmine";
			setDefaultSexualPreferences();
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "CHAURMINE";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			
		}
		
		override public function canUsePowerArmorWeapon():Boolean
		{
			return true;
		}
		//500% damage taken from non-lust damage when stunned
		//low chance to [Charge] randomly
		//otherwise [Ranged Attack] or [Melee Attack]

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			/* Normal lust res set */
			if(!hasStatusEffect("Stunned"))
			{
				baseHPResistances = new TypeCollection();
				baseHPResistances.tease.damageValue = 100.0;
				baseHPResistances.drug.damageValue = 90.0;
				baseHPResistances.pheromone.damageValue = 90.0;
				baseHPResistances.burning.damageValue = 90.0;
				baseHPResistances.kinetic.damageValue = 90.0;
				baseHPResistances.freezing.damageValue = 90.0;
				baseHPResistances.electric.damageValue = 90.0;
				baseHPResistances.corrosive.damageValue = 90.0;
				baseHPResistances.psionic.damageValue = 90.0;
			}
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			//Headbutt - every fourth round charge
			else if(CombatManager.getRoundCount() % 4 == 0)
			{
				chaurmineCharge(target);
			}
			else if(rand(2) == 0) chaurmineMelee(target);
			else chaurmineRanged(target);
		}
		
		public function chaurmineMelee(target:Creature):void
		{
			for (var i:int = 0; i < 2; i++)
			{
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
				output("\n");
			}
		}
		public function chaurmineRanged(target:Creature):void
		{
			for (var i:int = 0; i < 2; i++)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
				output("\n");
			}
		}

		public function chaurmineCharge(target:Creature):void
		{
			output("<i>“I </i>will<i> understand what I’m feeling, with </i>your<i> help [pc.name],”</i> he thunders, <i>“Even if I have to force it.”</i>");
			output("\n\nChaurmine moves his weapons out of the way as he lowers his head, a growl slipping through clenched teeth with a steamy burst before charging.");
			if(!combatMiss(this,target)) 
			{
				output("\n\nYou grunt as his metal skull rams into you, ");
				if (!target.hasStatusEffect("Stunned") && target.physique() + rand(20) + 1 < 15)
				{
					target.createStatusEffect("Stunned",2,0,0,0,false,"Stun","You are stunned and cannot move until you recover!",true,0,0xFF0000);
					output("knocking the air from your lungs and sending you sliding on the icy floor, your mind reeling.");
				}
				else output("though you manage to avoid being dazed.");
				var damage:TypeCollection = meleeDamage();
				damage = damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}
			else
			{
				output("\n\nYou dodge out of the way just in time, and watch as his momentum carries him into the surrounding icy walls and pierces his horns into the frigid, crystalline surface, locking him in place.");
				createStatusEffect("Stunned", 3, 0, 0, 0, false, "Stun", "He is stuck in place and cannot attack.", true, 0, 0xFF0000);
				baseHPResistances = new TypeCollection();
				baseHPResistances.tease.damageValue = 100.0;
				baseHPResistances.drug.damageValue = 90.0;
				baseHPResistances.pheromone.damageValue = 90.0;
				baseHPResistances.burning.damageValue = -500.0;
				baseHPResistances.kinetic.damageValue = -500.0;
				baseHPResistances.freezing.damageValue = -500.0;
				baseHPResistances.electric.damageValue = -500.0;
				baseHPResistances.corrosive.damageValue = -500.0;
				baseHPResistances.psionic.damageValue = 90.0;
			}
		}
	}
}