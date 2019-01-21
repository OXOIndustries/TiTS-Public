package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.StorageClass;
	//import classes.Items.Guns.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Items.Transformatives.OmegaOil;
	import classes.Items.Guns.LaserPistol;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.StringUtil;
	
	public class MilodanInfiltrator extends Creature
	{
		//constructor
		public function MilodanInfiltrator()
		{
			this._latestVersion = 1
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "milodan infiltrator";
			this.originalRace = "milodan";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Wearing a tight-fitting helmet and clad in a black infiltration suit, the man looks from left to right, clearly searching for an opening to get some distance and open up on you with the large laser rifle he’s carrying. In the meantime, he holds an automatic sidearm in his right hand, trying to track your movement with it so he can get shots in. Knowing that if he misses it’ll be a free opportunity for you to attack, he’s hesitant to fire, waiting for you to do something.";
			this.isPlural = false;
			
			this.meleeWeapon.longName = "energy sword";
			this.meleeWeapon.description = "a sparking energy sword";
			this.meleeWeapon.attackVerb = "swing";
			this.meleeWeapon.attackNoun = "sizzling slice";
			this.meleeWeapon.attack = 12;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 7;
			this.meleeWeapon.baseDamage.electric.damageValue = 10;
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon = new LaserPistol();
			this.rangedWeapon.longName = "autopistol";
			this.rangedWeapon.description = "a Pyrite Industries autopistol";
			this.rangedWeapon.hasRandomProperties = true;
			rangedWeapon.baseDamage.kinetic.damageValue = 5;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.evasion = 33;
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "bullet";
			this.rangedWeapon.hasRandomProperties = true;

			this.armor.defense = 4;
			this.armor.longName = "light combat armor";
			this.armor.description = "a suit of light combat armor";
			this.armor.hasRandomProperties = true;

			this.shield = new BasicShield;
			this.shield.shields = 150;
			this.shield.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 100.0;
			baseHPResistances.electric.damageValue = 50.0;
			baseHPResistances.tease.damageValue = 0.0;
			baseHPResistances.drug.damageValue = 25.0;
			baseHPResistances.pheromone.damageValue = -50.0;
			baseHPResistances.burning.damageValue = -50.0;
			
			//this.shield = new ImprovisedShield();
			this.characterClass = GLOBAL.CLASS_MERCENARY;
			this.physiqueRaw = 25;
			this.reflexesRaw = 42;
			this.aimRaw = 40;
			this.intelligenceRaw = 38;
			this.willpowerRaw = 38;
			this.libidoRaw = 30;
			this.shieldsRaw = 150;
			this.energyRaw = 100;
			this.lustRaw = 30;
			
			this.level = 9;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 150;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 10;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "blue";
			this.tallness = 8*12;
			this.thickness = 75;
			this.tone = 85;
			this.hairColor = RandomInCollection(["rust-brown"]);
			//this.hairType = GLOBAL.TYPE_FELINE;
			//this.scaleColor = "red";;
			this.furColor = this.hairColor;
			this.hairLength = 7;
			
			//this.beardLength = 0;
			//this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "white";
			//this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_FELINE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED, GLOBAL.FLAG_FURRED];
			this.tongueType = GLOBAL.TYPE_FELINE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_FELINE;
			//this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_FELINE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_FELINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_FURRED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE]
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
			this.cocks[0].cLengthRaw = 16;
			this.cocks[0].cType = GLOBAL.TYPE_FELINE;
			this.cocks[0].cockColor = "white";
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			this.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.impregnationType = "MilodanPregnancy";
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 8;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 20;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 420;
			this.timesCum = 850;

			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			//this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 1000;
			
			isUniqueInFight = true;
			btnTargetText = "Milodan";
			
			createPerk("Juggernaut",0,0,0,0);
			this.createStatusEffect("Disarm Immune");

			kGAMECLASS.uvetoSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "MILO_INFILTRATOR";
		}
		private function longDescUpdate():void
		{
			this.long = "Wearing a tight-fitting helmet and clad in a black infiltration suit, the man looks from left to right, clearly searching for an opening to get some distance and open up on you with the large laser rifle he’s carrying. In the meantime, he holds an automatic sidearm in his right hand, trying to track your movement with it so he can get shots in. Knowing that if he misses it’ll be a free opportunity for you to attack, he’s hesitant to fire, waiting for you to do something.";
			//After he uses a grenade:
			if(this.hasStatusEffect("Flashbangu") && !this.hasStatusEffect("SeenKnife")) this.long += " He seems to have a small pouch of flashbangs on his waist, as well.";
			//After he uses a knife:
			if(this.hasStatusEffect("SeenKnife")) this.long += " He also has a small knife honed to a razor edge, and though his skill with it is questionable, it’ll still put a hole in you if he connects.";
		}
		private function randomise():void 
		{
			sexualPreferences.setRandomPrefs(4 + rand(3));
		}
		public function swapGuns():void
		{
			if(this.rangedWeapon.longName == "laser rifle")
			{
				this.rangedWeapon.longName = "autopistol";
				this.rangedWeapon.description = "a Pyrite Industries autopistol";
				rangedWeapon.baseDamage.kinetic.damageValue = 5;
				rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
				rangedWeapon.baseDamage.removeFlag(DamageFlag.LASER);
				this.rangedWeapon.attack = 10;
				this.rangedWeapon.evasion = 33;
				this.rangedWeapon.attackVerb = "shoot";
				this.rangedWeapon.attackNoun = "bullet";
			}
			else
			{
				this.rangedWeapon.longName = "laser rifle";
				this.rangedWeapon.description = "a Pyrite Industries laser rifle";
				rangedWeapon.baseDamage.burning.damageValue = 40;
				rangedWeapon.baseDamage.addFlag(DamageFlag.LASER);
				rangedWeapon.baseDamage.removeFlag(DamageFlag.BULLET);
				this.rangedWeapon.attack = 5;
				this.rangedWeapon.evasion = 33;
				this.rangedWeapon.attackVerb = "shoot";
				this.rangedWeapon.attackNoun = "high-intensity laser";
			}
		}		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			var attackChoices:Array = new Array();

			if(this.HP()/this.HPMax() < .33) 
			{
				if(this.hasStatusEffect("SeenKnife")) dyingPuppoBoi(target);
				else nowThisIsAKnoif(target);
			}
			else if(!target.isBlind() && this.energy() >= 20 && rand(4) == 0) flashyBangBang(target);
			else if(rand(3) == 0) pistolFakeOutShootRifle(target);
			else if(rand(2) == 0) pistolSpray(target);
			else riflepistolswappy(target);
			longDescUpdate();
		}
		//Attacks
		//One
		public function pistolFakeOutShootRifle(target:Creature):void
		{
			output("The milodan fires a couple of shots from his pistol haphazardly, using the space created to jump back and slam another round back in his rifle. You close the gap, but not before he fires!");
			if(rangedCombatMiss(this, target)) output("\nYou dodge!");
			else 
			{
				swapGuns();
  				applyDamage(damageRand(rangedDamage(), 15), this, target, "minimal");
  				swapGuns();
  			}
		}
		//Two
		public function pistolSpray(target:Creature):void
		{
			output("The milodan seemingly spots an opportunity, opening fire with his automatic pistol!");
			for (var i:int = 0; i < 2; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
		//Three
		public function riflepistolswappy(target:Creature):void
		{
			output("Jumping towards you, the milodan swings his heavy rifle at you! Grunting ");
			if(target.physique()/2 + rand(20) + 1 >= this.physique()/2 + 10) output("as you block it, you manage to avoid his hidden counterattack with the autopistol, twisting his arm so the shots go astray");
			else 
			{
				output("from the impact, you don’t see him bringing the autopistol to bear until it’s too late!");
				for (var i:int = 0; i < 3; i++)
				{
					output("\n");
					CombatAttacks.SingleRangedAttackImpl(this, target, true);
				}
			}
		}
		//Four
		public function flashyBangBang(target:Creature):void
		{
			this.energy(-20);
			output("The milodan suddenly reaches for a pouch on his waist, thumbing the detonator on a flashbang and tossing it into the air!");
			if(target.reflexes()/2 + rand(20) + 1 >= this.aim()/2 + 10) output(" Thinking quickly, you raise your arm to your downcast eyes. By watching the positioning of his feet, you not only manage to avoid the brunt of the blindness but even counterattack!");
			else 
			{
				output(" Blindsided by the maneuver and blinded as a consequence, you’re unable to mount a counterattack as he brings the heavy rifle to bear!");
				CombatAttacks.applyBlind(target, 1);
				output("\n");
				swapGuns();
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
				swapGuns();
			}
			if(!this.hasStatusEffect("Flashbangu")) this.createStatusEffect("Flashbangu");
		}
		//Five
		//Low hp
		public function nowThisIsAKnoif(target:Creature):void
		{
			this.energy(-100);
			output("Getting increasingly desperate as you wear him down, the milodan rushes you, drawing a knife from a holster on his back! He swings wildly, jabbing at your face and trying to score a hit!");
			//Multihit attack, does less damage than his other attacks
			for (var i:int = 0; i < 2; i++)
			{
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
			}
			this.createStatusEffect("SeenKnife")
		}
		//Six
		//almost dead
		public function dyingPuppoBoi(target:Creature):void
		{
			output("Exhausted, his suit covered in discoloured stains and tears, the milodan clenches his knife tightly. You take a step back as his hand begins to rise from his hip, his legs releasing the stored kinetic energy when he lunges at you with a dead-straight stab almost as pure in its intent as in its lack of technique.");
			if(target.reflexes()/4 + target.intelligence()/4 + rand(20) + 1 >= this.physique()/2 + 10) output("\n\nHe’s too slow, and you’ve seen him coming. Beaten as he is, you sweep his arm to the side before his hand even reaches you and leave him stumbling.");
			else CombatAttacks.SingleMeleeAttackImpl(this, target, false);
		}
	}
}