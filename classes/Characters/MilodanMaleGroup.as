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
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.StringUtil;
	
	public class MilodanMaleGroup extends Creature
	{
		//constructor
		public function MilodanMaleGroup()
		{
			this._latestVersion = 1
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "male milodan";
			this.originalRace = "milodan";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Placeholdah";
			this.isPlural = false;
			
			this.meleeWeapon.attack = 3;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 6;
			this.meleeWeapon.longName = "";
			this.meleeWeapon.description = "";
			this.meleeWeapon.attackVerb = "";
			this.meleeWeapon.attackNoun = "";
			this.meleeWeapon.hasRandomProperties = true;

			/* From RaskvelMale for reference 
			rangedWeapon.baseDamage.kinetic.damageValue = 10;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "shotgun";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "buckshot";
			this.rangedWeapon.hasRandomProperties = true;
			*/

			this.armor.longName = "thick hide";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.tease.damageValue = 50.0;
			baseHPResistances.drug.damageValue = 75.0;
			baseHPResistances.pheromone.damageValue = -100.0;
			baseHPResistances.burning.damageValue = -25.0;
			
			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 40;
			this.reflexesRaw = 30;
			this.aimRaw = 25;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 37;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = (kGAMECLASS.debug ? 0 : 180);
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 10;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "brown";
			this.tallness = 87;
			this.thickness = 50;
			this.tone = 85;
			this.hairColor = RandomInCollection(["silver","blue","white","silvery-white","silvery-blue","blue-white"]);
			//this.hairType = GLOBAL.TYPE_FELINE;
			//this.scaleColor = "red";;
			this.furColor = this.hairColor;
			this.hairLength = 3;
			
			//this.beardLength = 0;
			//this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "silver";
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
			this.cocks[0].cLengthRaw = 10;
			this.cocks[0].cType = GLOBAL.TYPE_FELINE;
			this.cocks[0].cockColor = "white";
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			this.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.impregnationType = "MilodanPregnancy";
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 8;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 7;
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
			this.nippleColor = "white";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 75;
			
			isUniqueInFight = true;
			btnTargetText = "Milodan";
			
			randomise();
			kGAMECLASS.uvetoSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			var str:String = "MILODANMALE";
			
			switch(this.meleeWeapon.longName)
			{
				case "heavy club": str += "_CLUB"; break;
				case "axe": str += "_AXE"; break;
			}
			return str;
		}
		override public function physiqueMax(raw:Boolean = false): Number {
			return 75;
		}
		private function randomise():void 
		{
			sexualPreferences.setRandomPrefs(3 + rand(3));

			if(rand(3) == 0)
			{
				changeWeapon("heavy club");
			}
			else if(rand(2) == 0)
			{
				changeWeapon("axe");
			}
			else
			{
				changeWeapon("claw");
			}
			//Placeholder for loot setup
			if(rand(10) <= 3) inventory.push(new OmegaOil());
		}
		private function changeWeapon(weaponName:String = "claw"):void 
		{
			switch(weaponName)
			{
				case "heavy club":
					this.meleeWeapon.attack = 3;
					this.meleeWeapon.baseDamage.kinetic.damageValue = 10;
					this.meleeWeapon.longName = "heavy club";
					this.meleeWeapon.description = "a heavy club";
					this.meleeWeapon.attackVerb = "smash";
					this.meleeWeapon.attackNoun = "smash";
					break;
				case "axe":
					this.meleeWeapon.attack = 3;
					this.meleeWeapon.baseDamage.kinetic.damageValue = 8;
					this.meleeWeapon.longName = "axe";
					this.meleeWeapon.description = "an axe";
					this.meleeWeapon.attackVerb = "slash";
					this.meleeWeapon.attackNoun = "cleave";
					break;
				case "claw":
					this.meleeWeapon.attack = 3;
					this.meleeWeapon.baseDamage.kinetic.damageValue = 8;
					this.meleeWeapon.longName = "claw";
					this.meleeWeapon.description = "a claw";
					this.meleeWeapon.attackVerb = "claw";
					this.meleeWeapon.attackNoun = "claw";
					break;
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(this.hasStatusEffect("Disarmed") && this.meleeWeapon.longName != "claw") this.changeWeapon("claw");
			
			var attackChoices:Array = new Array();
			if(this.hasStatusEffect("Blind") || this.hasStatusEffect("Blindness") || this.hasStatusEffect("Blinded")) 
			{
				scentOfThePrey(target);
				return;
			}
			if((this.hasStatusEffect("Stunned") || this.hasStatusEffect("Staggered")) && !this.hasStatusEffect("Berserk"))
			{
				berserk(target);
				return;
			}
			attackChoices.push(milodanAttack);
			attackChoices.push(milodanAttack);
			attackChoices.push(milodanAttack);
			if(target.shields() <= 0 && !target.hasStatusEffect("Stunned")) attackChoices.push(spinningBackfistAttack);

			var selected:* = attackChoices[rand(attackChoices.length)];
			selected(target);
		}
		
		//Attacks
		public function milodanAttack(target:Creature):void
		{
			var d:TypeCollection = this.meleeDamage();
			
			if (hasStatusEffect("Empowering Word"))
			{
				d.multiply(statusEffectv2("Empowering Word"));
			}
			
			//Club swing
			if(this.meleeWeapon.longName == "heavy club")
			{
				output("He takes a brutal swing at your chest, ");
				//Missed
				if(combatMiss(this, target)) output("but goes wide as you dodge out of the way!");
				//Hit
				else 
				{
					output("the impact knocking the air out of your lungs with a ghastly thud. You stumble backwards, off-balance for a second.");
					damageRand(d, 15);
					applyDamage(d, this, target, "melee");
					if (!target.hasStatusEffect("Staggered") && !target.isPlanted() && this.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10)
					{
						output("<b> You’ve been staggered!</b>");
						CombatAttacks.applyStagger(target, 5);
					}
				}
				
			}
			//Axe swing
			else if(this.meleeWeapon.longName == "axe")
			{
				output("He takes a vicious swing at you");
				//Missed
				if(combatMiss(this, target)) output(", but you narrowly avoid the blow!");
				//Hit
				else
				{
					output(" with the flat of the axe, smacking you upside the head and sending you reeling in pain.");
					//Crit change
					if(rand(10) == 0)
					{
						d.multiply(2);
						damageRand(d, 15);
						applyDamage(d, this, target, "melee");
						output("\n<b>Critical hit!</b>");
					}
					else
					{
						damageRand(d, 15);
						applyDamage(d, this, target, "melee");
					}
				}
			}
			//Claw slash
			else
			{
				output("He leaps forward and slashes twice with outstretched hands,");
				//Missed
				if(combatMiss(this, target)) output(" but you expertly dodge both attacks!");
				//Hit
				else 
				{
					output(" rending you with his razor-sharp claws.");
					damageRand(d, 15);
					applyDamage(d, this, target, "melee");
					// bleed chance
					if(this.physique()/2 + rand(20) + 1 >= target.reflexes()/2 + 14 && target.shields() <= 0)
					{
						if (!target.hasStatusEffect("Bleeding")) output(" <b>You’re bleeding!</b>");
						else output(" <b>Your bleeding is aggravated further!</b>");
						CombatAttacks.applyBleed(target, 1, 3, 15);
					}
				}
			}
		}
		
		//Spinning backfist
		public function spinningBackfistAttack(target:Creature):void
		{
			//milodan_weapon = club: 
			if(this.meleeWeapon.longName == "heavy club") output("He swings with his club, but fakes you out by dropping it halfway into the swing and lunging forward!");
			//milodan_weapon = axe:
			else if(this.meleeWeapon.longName == "axe") output("He swings with his axe, but fakes you out by dropping it halfway into the swing and lunging forward!");
			//milodan_weapon = claws:
			else output("He slashes at your face with his claws, but drops his arm halfway into it and lunges forward!");
			output(" Using the momentum, he spins on his heel and strikes at you with the back of his balled fist!");
			//Missed
			if(combatMiss(this, target)) output(" You duck under the blow, leaving him wide open for a counter-attack!");
			//Hit
			else
			{
				output(" Not expecting the angle of attack and having already taken a step back, you’re caught off guard and his fist slams against the side of your face!");
				//Just fist, no extra.
				var oldVal:Number = this.meleeWeapon.baseDamage.kinetic.damageValue;
				this.meleeWeapon.baseDamage.kinetic.damageValue = 0;
				var d:TypeCollection = this.meleeDamage();
				this.meleeWeapon.baseDamage.kinetic.damageValue = oldVal;
				
				if (hasStatusEffect("Empowering Word"))
				{
					d.multiply(statusEffectv2("Empowering Word"));
				}
				
				damageRand(d, 15);
				applyDamage(d, this, target, "melee");
				//Stun chance
				if (!target.hasStatusEffect("Stunned") && target.physique()/2 + rand(20) + 1 < this.physique()/2 + 10)
				{
					CombatAttacks.applyStun(target, 1);
					output(" <b>You are stunned!</b>");
				}
			}
		}
		//Procs if Stunned/Staggered. Once only.
		public function berserk(target:Creature):void
		{
			output("<b>" + StringUtil.toTitleCase(getCombatName()) + " is a juggernaut!</b> He shakes off your attempts to stop him and releases a feral roar.");
			this.removeStatusEffect("Stunned");
			this.removeStatusEffect("Staggered");
			if(this.HP() < this.HPMax())
			{
				output(" He appears rejuvenated and stronger than ever!");
				this.changeHP(100);
			}
			else output(" He appears stronger than ever!");
			this.physiqueMod += 35;
			this.createStatusEffect("Berserk",1,0,0,0,false,"Icon_Bull","Physique is greatly enhanced. (+35)",true,0);
		}
		public function scentOfThePrey(target:Creature):void
		{
			output("Flaring his nostrils, " + getCombatName() + " drinks deeply of your scent, his head tracking your every move. <b>Blindness has no effect!</b>\n\n");
			this.removeStatusEffect("Blind");
			this.removeStatusEffect("Blindness");
			this.removeStatusEffect("Blinded");
			//Attack!
			milodanAttack(target);
		}
	}
}