package classes.Characters
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.StorageClass;
	import classes.VaginaClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	import classes.Util.RandomInCollection;
	import classes.Util.InCollection;
	
	//The Lureling should have shitloads of Heath and massive Armor. It is, however, super vulnerable to lust. The whole reason it's doing this is cuz it's horny.
	public class Lureling extends Creature
	{
		//constructor
		public function Lureling()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "lureling";
			originalRace = "lureling";
			a = "the ";
			capitalA = "The ";
			this.long = "It's a huge, gross sea monster that resembles an oversized angler fish with frog-like legs. Its gaping, slavering maw drools with a thousand teeth arranged in a fearsome circle, and tiny black eyes stare at you with unbridled malice.";
			this.customBlock = "The lurelings’s armor deflects your attack.";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new Fists();
			meleeWeapon.baseDamage.kinetic.damageValue = 20;
			meleeWeapon.baseDamage.addFlag(DamageFlag.CRUSHING);
			
			this.physiqueRaw = 30;
			this.reflexesRaw = 20;
			this.aimRaw = 15;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 30;
			this.libidoRaw = 30;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 20;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 100.0;
			baseHPResistances.burning.damageValue = -50.0;
			baseHPResistances.kinetic.damageValue = 25;
			//baseHPResistances.electric.damageValue = -10;
			baseHPResistances.poison.damageValue = 50;
			baseHPResistances.corrosive.damageValue = 50;
			baseHPResistances.drug.resistanceValue = -50.0;
			baseHPResistances.tease.resistanceValue = -25.0;
			baseHPResistances.pheromone.resistanceValue = -25.0;
			baseHPResistances.psionic.resistanceValue = -25.0;

			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 450;
			this.HPRaw = this.HPMax();
			
			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_FROG;
			this.eyeColor = "black";
			this.tallness = 100;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "green";
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "green";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_FROG;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_FROG;
			this.tongueFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_LUBRICATED];
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_FROG;
			this.armFlags = [GLOBAL.FLAG_SCALED];
			this.gills = true;
			this.legType = GLOBAL.TYPE_FROG;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_SCALED];
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
			this.cocks = new Array();
			
			this.vaginas = [];
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1.5;
			this.ballFullness = 1;
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
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			isUniqueInFight = true;
			btnTargetText = "Lureling";
			
			createStatusEffect("Force It Gender");
			//sexualPreferences.setRandomPrefs(2 + rand(3));
			
			this._isLoading = false;
		}

		private var _psiCD:Number = 0;
		
		override public function get bustDisplay():String
		{
			return "LURELING";
		}
	
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			if(_psiCD > 0) _psiCD--;
			if(_psiCD < 0) _psiCD = 0;
			if(rand(3) == 0 && !target.hasStatusEffect("Staggered")) chomp(target);
			else if((rand(4) == 0 || this.HP() / this.HPMax() <= 0.3) && _psiCD == 0) psionicBacklash(target);
			else flipperSlap(target);
		}

		//Flipper Slap
		//Does Crushing damage. //Default attack, used most often
		private function flipperSlap(target:Creature):void
		{
			output("Growling deeply, the Lureling advances on you and slaps with its frog-like foot, trying to backhand you across the igloo. ");
			if (combatMiss(this, target)) output("You duck down, avoiding the flailing monster's attack.");
			else
			{
				output("You grunt as the massive arm smashes you across the chest and face. Ow!");
				applyDamage(meleeDamage(), this, target, "minimal");
			}
		}

		//Chomp!
		//Deals heavy penetrating damage. Lowers PC physique by 5 on a hit, lasts for a turn. Low accuracy.
		private function chomp(target:Creature):void
		{
			output("The huge sea monster snarls and lunges, trying to grab you between its gnashing teeth! You dodge back");
			//Low accuracy = 3x normal dodge chance for PC.
			if (combatMiss(this, target) || combatMiss(this, target) || combatMiss(this, target)) output(", narrowly avoiding a nasty bite!");
			else
			{
				output(" but don't manage to evade the Lureling's bestial mouth, and feel its teeth crush into you. The bite isn't lethal, but it leaves you gasping and winded for a moment by the time you struggle free!");
				if (!target.isPlanted()) 
				{
					CombatAttacks.applyStagger(target, 1, true);
					output(" <b>You are staggered!</b>");
				}
				if (rand(4) == 0 && target.shields() <= 0) 
				{
					CombatAttacks.applyBleed(target);
					output(" <b>You are bleeding!</b>");
				}
				applyDamage(new TypeCollection( { kinetic: 30 }, DamageFlag.PENETRATING), this, target, "minimal");
			}
		}

		//Psionic Backlash
		//If the PC uses a ranged or psychic ability, the Lureling has a high chance to use this. PC must pass a Willpower check or take some psychic damage and be Stunned for a round.
		private function psionicBacklash(target:Creature):void
		{
			output("The sea beast howls, an unearthly screech that leaves you staggering back and grabbing at your head. Oh, stars, that hurts! ");
			if (willpower() + rand(100) < target.WQ()) output("You grit your teeth and push through the pain, refusing the give in to the Lureling's psychic assault!");
			else
			{
				output("You scream in pain and slump to your [pc.knees], unable to think of anything but the pounding in your head.");
				if (!target.hasStatusEffect("Stun Immune") && !target.hasStatusEffect("Stunned") && target.physique()/2 + rand(20) + 1 < this.physique()/2+10)
				{
					CombatAttacks.applyStun(target, 1, true);
					output(" <b>You’re stunned!</b>");
				}
				applyDamage(new TypeCollection( { kinetic: 30 }, DamageFlag.PSIONIC), this, target, "minimal");
			}
			_psiCD += 2;
		}
	}
}
