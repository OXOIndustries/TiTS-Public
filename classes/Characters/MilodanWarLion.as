package classes.Characters
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
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
	import classes.Items.Recovery.HealingPoultice;
	import classes.Items.Recovery.PyriteIssuedStim;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.StringUtil;
	import classes.Engine.Utility.possessive;
	
	public class MilodanWarLion extends Creature
	{
		//constructor
		public function MilodanWarLion()
		{
			this._latestVersion = 1
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "war-lion";
			this.originalRace = "milodan";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "At what must be close to eight feet tall, the war-lion is a truly gigantic example of a milodan. Every inch of him is covered in either combat armor or bulging muscle, and on his back rests what you presume to be extra ammunition for the massive gun in his right hand. An automatic energy weapon with three barrels, you can’t afford to ignore where he’s aiming it for even a second. In his other hand, he holds an energy sword with an edge that sends sparks arcing off it whenever he holds down the trigger.\n\nIt’s a good assumption that as heavily-armed as this milodan is, this can’t be all he has at his disposal.";
			this.isPlural = false;
			
			this.meleeWeapon.longName = "energy sword";
			this.meleeWeapon.description = "a sparking energy sword";
			this.meleeWeapon.attackVerb = "swing";
			this.meleeWeapon.attackNoun = "sizzling slice";
			this.meleeWeapon.attack = 12;
			this.meleeWeapon.baseDamage.burning.damageValue = 6;
			this.meleeWeapon.baseDamage.electric.damageValue = 10;
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon = new LaserPistol();
			this.rangedWeapon.longName = "tri-barreled beam cannon";
			this.rangedWeapon.description = "a Pyrite Industries beam cannon";
			this.rangedWeapon.hasRandomProperties = true;
			rangedWeapon.baseDamage.burning.damageValue = 10;
			rangedWeapon.baseDamage.addFlag(DamageFlag.LASER);
			this.rangedWeapon.attack = 20;
			this.rangedWeapon.evasion = 5;
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "blinding energy beam";
			this.rangedWeapon.hasRandomProperties = true;

			this.armor.defense = 13;
			this.armor.longName = "heavy combat armor";
			this.armor.description = "a suit of heavy combat armor";
			this.armor.hasRandomProperties = true;

			this.shield = new BasicShield;
			this.shield.shields = 100;
			this.shield.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 100.0;
			baseHPResistances.electric.damageValue = 75.0;
			baseHPResistances.tease.damageValue = 25.0;
			baseHPResistances.drug.damageValue = 25.0;
			baseHPResistances.pheromone.damageValue = -50.0;
			baseHPResistances.burning.damageValue = -50.0;
			
			//this.shield = new ImprovisedShield();
			this.characterClass = GLOBAL.CLASS_MERCENARY;
			this.physiqueRaw = 45;
			this.reflexesRaw = 18;
			this.aimRaw = 36;
			this.intelligenceRaw = 9;
			this.willpowerRaw = 21;
			this.libidoRaw = 50;
			this.shieldsRaw = 100;
			this.energyRaw = 100;
			this.lustRaw = 30;
			
			this.level = 9;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 200;
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
			//this.createStatusEffect("Disarm Immune");

			kGAMECLASS.uvetoSSTDChance(this);
			randomise();
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "WAR_LION";
		}
		private function longDescUpdate():void
		{
			this.long = "At what must be close to eight feet tall, the war-lion is a truly gigantic example of a milodan. Every inch of him is covered in either combat armor or bulging muscle, and on his back rests what you presume to be extra ammunition for the massive gun in his right hand. An automatic energy weapon with three barrels, you can’t afford to ignore where he’s aiming it for even a second. In his other hand, he holds an energy sword with an edge that sends sparks arcing off it whenever he holds down the trigger.";
			//After he throws a grenade
			if(this.hasStatusEffect("grenados")) this.long += "\n\nHe also has grenades at his disposal, strapped across his back where you can’t get a good shot at them.";
			else this.long += "\n\nIt’s a good assumption that as heavily-armed as this milodan is, this can’t be all he has at his disposal.";
		}
		private function randomise():void 
		{
			sexualPreferences.setRandomPrefs(4 + rand(3));
			if(rand(10) == 0) {}
			else if(rand(3) <= 1) this.inventory.push(new HealingPoultice());
			else this.inventory.push(new PyriteIssuedStim());
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			var attackChoices:Array = new Array();

			var meleeDoom:Boolean = this.hasStatusEffect("vergeODoom");
			var rangedDoom:Boolean = this.hasStatusEffect("vergeOMeleeDoom");
			var anyDoom:Boolean = (meleeDoom || rangedDoom);

			if(this.hasStatusEffect("Disarmed")) disarmedBoxing(target);
			//Final attacks 5ever
			else if(anyDoom || this.hasStatusEffect("grenadosDISABLED"))
			{
				//Only ever hits PC
				target = kGAMECLASS.pc;
				if(meleeDoom) vergeOfDeathNoGunno(target);
				else if(rangedDoom) vergeOfDeath(target);
				else if(rand(2) == 0) vergeOfDeath(target);
				else vergeOfDeathNoGunno(target);
			}
			else if(this.HP()/this.HPMax() < 0.4) lowHPCatdoggo(target);
			else
			{
				attackChoices.push(overhandStrike);
				attackChoices.push(milopup2Attack);
				attackChoices.push(miloPup3Atk);
				attackChoices.push(miloNumbah4);
				//Picku attacku
				var selected:* = attackChoices[rand(attackChoices.length)];
				selected(target);
			}
			longDescUpdate();
		}
		public function disarmedBoxing(target:Creature):void
		{
			var d:TypeCollection = new TypeCollection( { kinetic: 1 } ); 
			d.add(physique() / 2);
			output("Annoyed by his lack of weaponry, the milodan lunges forward to claw at you with both hands!");
			if(combatMiss(this, target)) output("\nYou dodge!");
			else applyDamage(d, this, target, "minimal");
			if(combatMiss(this, target)) output("\nYou dodge!");
			else applyDamage(d, this, target, "minimal");
		}
		//WARGII LIONS!
		public function overhandStrike(target:Creature):void
		{
			output("The milodan leaps forward and closes to melee distance almost instantaneously, taking a fierce overhand swing!");
			var d:TypeCollection = this.rangedDamage();
			//PC strong and has melee weapon:
			if(!(target.meleeWeapon is EmptySlot) && target.physique()/2 + rand(20) + 1 >= this.physique()/2 + 10) 
			{
				if(target is PlayerCharacter) output(" You barely manage to block it with your [pc.meleeWeapon], forcing him to take a step back and revealing the fact he’s already bringing his gun to bear with a snarl.");
				else output(" " + StringUtil.toTitleCase(getCombatName()) + " barely manages to block it with " + target.mf("his","her") + " " + target.meleeWeapon.longName + ", forcing him to take a step back and revealing the fact that the he's already bringing his gun to bear with a snarl.");
				d.multiply(0.5);
			}
			else if(combatMiss(this, target)) 
			{
				if(target is PlayerCharacter) output(" You tumble out of the way of his up-close strike, but he’s already bringing his gun to bear with a snarl!");
				else output(" " + StringUtil.toTitleCase(getCombatName()) + " barely manages to tumble out of the way of his up-close strike, but he's already bringing the gun to bear with a snarl!");
				d.multiply(0.5);
			}
			else 
			{
				if(target is PlayerCharacter) output(" You’re forced to take a step back and in the time it takes you, the milodan brings his gun to bear with a snarling grin!");
				else output(" " + StringUtil.toTitleCase(getCombatName()) + " is forced to take a step back, and in the time it takes, the milodan brings his gun to bear with a snarling grin!");
			}
			//take half damage from the energy rifle spraydown if you blocked the sword
			damageRand(d, 15);
			applyDamage(d, this, target, "minimal");
		}
		//Two
		public function milopup2Attack(target:Creature):void
		{
			var d:TypeCollection = this.rangedDamage();
			output("Dashing forward, the milodan sweeps his energy sword from side to side, forcing ");
			if(target is PlayerCharacter) output("you");
			else output(target.getCombatName());
			output(" to parry or step back! He doesn’t let up, his swings seemingly gaining strength");

			if(combatMiss(this, target))
			{
				if(target is PlayerCharacter) 
				{
					output(". Waiting until the exact right moment, you deflect his sword and punch him in the jaw so hard his snout snaps shut, sending him stumbling back a few steps. <b>Countered!</b>");
					d = target.meleeDamage();
					damageRand(d, 15);
					applyDamage(d, target, this, "minimal");
				}
				else output(". Waiting until the exact right moment, " + target.getCombatName() + " rolls through his leg, sending him stumbling.");
			}
			else 
			{
				output(" until, finally, he jumps backwards and lets loose a devastating hail of automatic fire");
				if(!(target is PlayerCharacter)) output(" at " + target.getCombatName());
				output("!");
				damageRand(d, 15);
				d.multiply(2);
				applyDamage(d, this, target, "minimal");
			}
		}
		//Three
		public function miloPup3Atk(target:Creature):void
		{
			output("Keeping his distance, the milodan leaps back and drops to one knee, bracing himself to fire his energy rifle! A storm of rounds screams past ");
			if(target is PlayerCharacter) output("you");
			else output(target.getCombatName());
			output(", destroying almost everything in the vicinity!");
			for (var i:int = 0; i < 3; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
		//Four
		public function miloNumbah4(target:Creature):void
		{
			output("Holding his sword out guardedly, the milodan reaches under his backpack and produces a grenade with the pin already pulled! He tosses it in ");
			if(target is PlayerCharacter) output("your");
			else output(possessive(target.getCombatName()));
			output(" direction!");
			//chance to stun
			applyDamage(damageRand(new TypeCollection( { burning: 40 } ), 15), this, target, "minimal");
			if(!this.hasStatusEffect("grenados")) this.createStatusEffect("grenados");
		}
		//Five {Low hp}
		public function lowHPCatdoggo(target:Creature):void
		{
			output("Getting increasingly desperate to beat you, the milodan pulls the entire bandolier of grenades off his back and hurls them in ");
			if(target is PlayerCharacter) output("your");
			else output(possessive(target.getCombatName()));
			output(" direction, partially catching himself in the blast!");
			//deal dmg to both, chance to stun
			//chance to stun
			if(target is PlayerCharacter) output("\nYou:")
			else output("\n" + target.getCombatName() + ":");
			applyDamage(damageRand(new TypeCollection( { burning: 50 } ), 15), this, target, "minimal");
			output(" Him:");
			applyDamage(damageRand(new TypeCollection( { burning: 35 } ), 15), target, this, "minimal");
			this.createStatusEffect("grenadosDISABLED");
		}
		//Six
		//{Verge of death}
		public function vergeOfDeath(target:Creature):void
		{
			if(!this.hasStatusEffect("vergeODoom"))
			{
				output("Barely staying on his feet, the milodan fixes you with a steely gaze and, with a struggle, raises his gun in your drection. Holding down the trigger, the superheated rounds start flying around your head and show no sign of stopping!");
				this.createStatusEffect("vergeODoom");
			}
			else output("The milodan is still firing the tri-barrel energy weapon in your direction, showing no signs of stopping!");
			//he continues this until you beat him or he’s disarmed
			for (var i:int = 0; i < 3; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
		//Seven
		//{Verge of death - no gun variant}
		public function vergeOfDeathNoGunno(target:Creature):void
		{
			if(!this.hasStatusEffect("vergeOMeleeDoom"))
			{
				output("The milodan staggers towards you, taking haphazard swings with his energy blade that send arcs into the air nearby, each one with enough force behind it to take your head clean off, even now! Even with his strength depleted, he shows no signs of slowing down at all!");
				this.createStatusEffect("vergeOMeleeDoom");
			}
			//he continues this until you beat him or he’s disarmed
			else output("The milodan is still in your face, desperately swinging his sword in the hopes of catching you!");
			for (var i:int = 0; i < 3; i++)
			{
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
			}
		}
	}
}