package classes.Characters
{
	import classes.CockClass;
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Guns.LaserPistol;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.Fists;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.VaginaClass;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.num2Text;
	import classes.Items.Miscellaneous.EmptySlot;
	
	//Low health, mid armor, heavy shields. Carries a rapid-fire, low-damage gun. Level 5.

	public class KQ2Engineer extends Creature
	{
		//constructor
		public function KQ2Engineer()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "pirate engineer";
			this.originalRace = "lapinara";
			this.a = "the ";
			this.capitalA = "The ";
			// this.long = "You're fighting a pirate techie, an ausar woman in a flight suit with a machine pistol at her hip. She's got a shock of blonde hair, perky breasts under her suit, and a shield generator that's thrumming with overcharged energy."
			this.long = "A lapinara engineer, a small pale-skinned creature with big bunny ears, curled horns, and a cute little tail. She's wearing a black breastplate, tall boots, and a jockstrap that can only barely contain her over-sized testicles. Her six-inch canine cock bounces unrestrained in front of her, peeking out of her clothes. She clutches a laser pistol in her hand, tricked out with enough mods to make it a serious damage-dealer.";
			this.customBlock = "The pirates armor deflects your attack with an alarming ease.";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new Fists();
			this.rangedWeapon = new LaserPistol();
			rangedWeapon.hasRandomProperties = true;
			rangedWeapon.baseDamage.burning.damageValue = 18;
			this.shield = new ReaperArmamentsMarkIIShield();
			shield.shields = 200;
			shield.resistances.burning.resistanceValue = 25.0;
			shield.resistances.electric.resistanceValue = -10;
			shield.hasRandomProperties = true;
			
			this.armor.longName = "flight suit";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			baseHPResistances.tease.resistanceValue = 10.0;
			
			this.physiqueRaw = 10;
			this.reflexesRaw = 35;
			this.aimRaw = 25;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 8;
			this.libidoRaw = 20;
			this.shieldsRaw = shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 33;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 400 + rand(37);
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 100;
			this.eyeType = GLOBAL.TYPE_LAPINARA;
			this.eyeColor = "black";
			this.tallness = 45;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = GLOBAL.TYPE_LAPINARA;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_LAPINARA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_LAPINARA;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_LAPINARA;
			this.gills = false;
			this.legType = GLOBAL.TYPE_LAPINARA;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.createCock();
			this.shiftCock(0, GLOBAL.TYPE_CANINE);
			this.cocks[0].cLengthRaw = 6;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].type = GLOBAL.TYPE_LAPINARA;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 16;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 321;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 4;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			createPerk("Overcharge", 0, 0, 0, 0, "Overcharged Shot");
			createPerk("Weapon Hack", 0, 0, 0, 0, "Weapon Hack");
			
			isUniqueInFight = true;
			btnTargetText = "Engineer";
			sexualPreferences.setRandomPrefs(4, 2);
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "KQ2ENGINEER";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (!hasStatusEffect("Shield Regen Cooldown"))
			{
				// Short-circuit- if the engineer is below 50%, she'll use it on herself
				if ((shields() / shieldsMax()) < 0.5)
				{
					shieldBoost(this);
					return;
				}
				
				var worstPerc:Number = 1.0;
				var shieldTarget:Creature = null;
				
				for (var i:int = 0; i < alliedCreatures.length; i++)
				{
					if (alliedCreatures[i].isDefeated()) continue;
					
					var thisPerc:Number = (alliedCreatures[i].shields() <= 0 ? 0 : alliedCreatures[i].shields() / alliedCreatures[i].shieldsMax());
					
					if (thisPerc < worstPerc)
					{
						shieldTarget = alliedCreatures[i];
						worstPerc = thisPerc;
					}
				}
				
				if (shieldTarget != null && worstPerc < 0.5)
				{
					shieldBoost(shieldTarget);
					return;
				}
			}
			
			var attacks:Array = [];
			
			if (!hasStatusEffect("Stunned") && !hasStatusEffect("Disarmed")) attacks.push( { v: pistolShot, w: 50 } );
			if (CombatAttacks.Overcharge.IsAvailable(this) && !target.hasStatusEffect("Stunned")) attacks.push( { v: CombatAttacks.Overcharge, w: 20 } );
			if (CombatAttacks.WeaponHack.IsAvailable(this) && !target.hasStatusEffect("Disarmed")) attacks.push( { v: CombatAttacks.WeaponHack, w: 10 } );
			if (attacks.length <= 0)
			{
				attackPass();
				return;
			}
			
			var selection:* = weightedRand(attacks);
			
			if (selection is Function) selection(target);
			else
			{
				var s:SingleCombatAttack = selection as SingleCombatAttack;
				s.execute(alliedCreatures, hostileCreatures, this, target);
			}
		}
		
		private function attackPass():void
		{
			output("The engineer is unable to attack!");
		}
		
		private function pistolShot(target:Creature):void
		{
			output("The engineer levels her pistol at " + (target is PlayerCharacter ? "you" : target.a + target.short) +" and squeezes off a shot. A bright red lance of energy surges from the barrel,");
			
			if (rangedCombatMiss(this, target))
			{
				output(" narrowly missing " + (target is PlayerCharacter ? "you" : target.a + target.short) + "!");
			}
			else
			{
				output(" slamming into " + (target is PlayerCharacter ? "you" : target.a + target.short) + "!");
				applyDamage(rangedDamage(), this, target, "minimal");
			}
		}
		
		private function shieldBoost(target:Creature):void
		{
			if (target is KQ2Engineer)
			{
				//On self use:
				output("The lapinara reaches down to her shield generator and fiddles with a power setting. After a moment, her barrier flickers with renewed strength, and she sighs in relief.");
			}
			else
			{
				var numAlive:int = numFenrisDronesAlive();
				//On Drone use:
				output("The lapinara rushes over to");
				if (numAlive > 1) output(" one of");
				output(" her drone");
				if (numAlive > 1) output("s");
				output(" and takes a knee next to it, yanking off its back panel and starting to pull wires. After a moment's work, the drone's shields flicker with renewed strength.");
			}
			
			target.changeShields(target.shieldsMax() * 0.3);
			createStatusEffect("Shield Regen Cooldown", 5);
		}
		
		private function numFenrisDronesAlive():int
		{
			var numAlive:int = 0;
			var hostiles:Array = CombatManager.getHostileActors();
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is KQ2FenrisDrone && !hostiles[i].isDefeated()) numAlive++;
			}
			
			return numAlive;
		}
	
		override public function getCombatDescriptionExtension():void
		{
			var numAlive:int = numFenrisDronesAlive();
			
			if (numAlive == 0) return;
			
			output("\n\nThe engineer is accompanied by");
			if (numAlive > 1) output(" several sleek, black canine robots, each with markings on their chests identifying them as Fenris IV assault drones.");
			else output(" a sleek, black canine robot marked as a Fenris IV assault drone.");
		}
	}
}