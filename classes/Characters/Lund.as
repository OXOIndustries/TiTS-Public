package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Protection.ArcticWarfareBelt;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.Items.Protection.SalamanderShield;
	import classes.Items.Guns.HammerPistolScavenged;
	import classes.Items.Melee.YappiStrap;
	import classes.Items.Armor.InsulatedCoat;
	import classes.Items.Transformatives.KorgonneSnacks;
	import classes.Items.Upgrades.HardLightUpgrade

	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.author;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.Util.InCollection;
	
	public class Lund extends Creature
	{
		//constructor
		public function Lund()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Lund";
			this.originalRace = "korgonne";
			this.a = "";
			this.capitalA = "";
			this.long = "You’re fighting Lund, the korgonne hunter.\n\nHe’s holding twin daggers and twirling them in his hands, demonstrating an absurd amount of familiarity and skill with his weaponry of choice. From his narrow waist hangs a loincloth, and fastened to it is an array of pouches. It’s clear that he came prepared for this after your apparent slight to his honor.";
			this.customDodge = "";
			this.isPlural = false;

			this.meleeWeapon.attackVerb = "strike";
			this.meleeWeapon.longName = "knives";
			this.meleeWeapon.attackNoun = "slash";
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 3;
			this.meleeWeapon.addFlag(DamageFlag.PENETRATING);

			this.shield = new ImprovisedShield();
			this.shield.shields = 55;
			this.shield.hasRandomProperties = true;
				
			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.tease.damageValue = 65.0;
			baseHPResistances.drug.damageValue = 20.0;
			baseHPResistances.pheromone.damageValue = -30.0;
			baseHPResistances.burning.damageValue = -25.0;

			//armorbutt
			this.armor.longName = "fur-padded hides";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;
			this.armor.evasion = 33;

			this.physiqueRaw = 45;
			this.reflexesRaw = 45;
			this.aimRaw = 38;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 38;
			this.libidoRaw = 55;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 9;
			this.XPRaw = bossXP();
			//Credits set below.
			this.credits = 100;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 25;
			this.eyeType = GLOBAL.TYPE_KORGONNE;
			this.eyeColor = "green";
			this.tallness = 5*12+4; //between 4'6"-5'6" (mid-upper of range in codex)
			this.thickness = 62;
			this.tone = 55;
			this.hairColor = "dirty blonde";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "blue";;
			this.furColor = "tan";
			this.hairLength = 2;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "white";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_CANINE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED];
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.armFlags = [GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PAWS];
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_PAWS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
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
			this.hipRatingRaw = 6;
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
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			this.cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
			this.cocks[0].cockColor = RandomInCollection(["blue", "bright blue", "cyan"]);
			this.cocks[0].cType = GLOBAL.TYPE_CANINE;
			this.cocks[0].knotMultiplier = 2;

			this.vaginas = new Array();
			this.vaginalVirgin = true;
			this.analVirgin = true;
			this.cockVirgin = false;
			//balls
			this.balls = 1;
			this.cumMultiplierRaw = 20;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 25;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 80;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 420;
			this.timesCum = 1250;

			this.elasticity = 2;
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
			this.ass.bonusCapacity += 15;
			this.createPerk("Fixed CumQ",250,0,0,0);

			isUniqueInFight = true;
			btnTargetText = "Lund";

			//"Hard" level preferences.
			sexualPreferences.setRandomPrefs(4 + rand(3));
			
			//Korg love 'dem hips
			sexualPreferences.removePref(GLOBAL.SEXPREF_WIDE_HIPS);
			sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS, GLOBAL.REALLY_LIKES_SEXPREF);

			credits = 200+rand(100);

			//old loot from females. Maybe reuse
			//5% chance of InsulatedCoat
			if(rand(20) == 0) inventory.push(new InsulatedCoat());

			if(rand(4) == 0 && inventory.length == 0) inventory.push(new KorgonneSnacks());
			
			kGAMECLASS.uvetoSSTDChance(this);
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return kGAMECLASS.lundBustString();
		}	
		private function updateDesc():void
		{
			//Blurb
			this.long = "You’re fighting Lund, the korgonne hunter.";
			this.long += "\n\nHe’s holding twin daggers and twirling them in his hands, demonstrating an absurd amount of familiarity and skill with his weaponry of choice. From his narrow waist hangs a loincloth, and fastened to it is an array of pouches. It’s clear that he came prepared for this after your apparent slight to his honor.";
			this.long += "\n\n";
			if (this.HPQ() >= 66 && this.lustQ() < 33) this.long += "He jumps from side to side, bouncing on his paws with his daggers held high. He certainly looks the part of a hunter.";
			//random if health blurb or lust blurb
			else if (rand(2) == 0)
			{
				if (this.HPQ() >= 33) this.long += "Though you’ve wounded him slightly he persists in bouncing around you, trying to make himself less of a target. He still looks confident, like he knows he can win.";
				else this.long += "He’s stopped bouncing now that you’ve wounded him severely, but the dogged tenacity in his eyes remains. He circles you, looking for an opportunity.";
			}
			else
			{
				if (this.lustQ() < 66) this.long += "He bounces around you despite the slight tenting of his loincloth, the pointed tip of his canine cock bringing it upwards and almost revealing his fuzzy nuts. Despite the obvious distraction, he still seems mostly focused on beating you.";
				else this.long += "His stiffly erect doggycock has pushed the loincloth aside, and he seems to be focused mostly on your sexual assets, his eyes glued to your groin. Even his stance is weaker, belying his utter distraction as he hesitantly circles you.";
			}

			if (this.hasStatusEffect("Hunter Stance")) this.long += "\n\n<b>He’s watching you for an opening...</b>";
		}
		//Actual Fight
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (this.hasStatusEffect("Hunter Stance"))
			{
				addStatusValue("Hunter Stance", 1, 1);
				if(statusEffectv1("Hunter Stance") >= 3)
				{
					removeStatusEffect("Hunter Stance");
					createStatusEffect("Stance Cooldown",3);
				}
			}
			if (!this.hasStatusEffect("Hunter Stance") && !this.hasStatusEffect("Stance Cooldown")) hunterStance(target);

			if (rand(3) == 0) stabby(target);
			else if (rand(2) == 0) lundGrapple(target);
			else tossSavicite (target);
			updateDesc();
		}

		//Attacks
		//Lund should have really high evasion. If you miss an attack while he’s in hunter stance, he counterattacks you (unless this is too hard to code).
		
		//Hunter Stance
		public function hunterStance(target:Creature):void
		{
			author("Wsan");
			//Done on turn 1, lasts 3(?) turns, raises evasion, if you miss him while he’s doing this he stabs the shit out of you. Cooldown of 5-6 turns to allow for 2-3 turns of damage?

			output("Lund takes on some kind of martial stance! It looks like he’s planning on dealing out some serious punishment if you give him the opportunity...\n\n");
			createStatusEffect("Hunter Stance");
		}
		//Counter
		//done in response (perhaps as an additional action?) to the PC missing. Always hits.
		public function counterAttack(target:Creature):void
		{
			author("Wsan");
			output("\nSeeing the opportunity arise after you miss your attack, Lund goes on the offensive with a masterful display of skill with his blades!");
			if (target.shields() > 0) output(" Though your shields crackle and protect you from the brunt of it all, you can tell that would have done some serious damage to you had you been without their aid! Dissatisfied, he leaps backwards and resumes circling you.");
			else output(" Without the protection of your shields, he overwhelms you with his savagery! Twin daggers jab and pick at your weak points, cutting and slicing before he withdraws by leaping backwards.");
			applyDamage(meleeDamage(), this, target);
			applyDamage(meleeDamage(), this, target);
			if(target.shields() <= 0)
			{
				if (!target.hasStatusEffect("Bleeding")) output("\n<b>You’re bleeding!</b>");
				else output("\n<b>Your bleeding is aggravated further!</b>");
				CombatAttacks.applyBleed(target, 1, 3, 7);
			}
		}
		//Stabby
		public function stabby(target:Creature):void
		{
			author("Wsan");
			output("Lund lowers himself to the ground and dashes at you at an angle, hoping to throw you off as he engages you!");
			if (!combatMiss(this,target))
			{
				output(" He leaps up from below and strikes at you with his daggers, stabbing and slicing before he pulls back!");
				applyDamage(meleeDamage().multiply(0.75), this, target);
				applyDamage(meleeDamage().multiply(0.75), this, target);
				if(target.shields() <= 0)
				{
					if (!target.hasStatusEffect("Bleeding")) output("\n<b>You’re bleeding!</b>");
					else output("\n<b>Your bleeding is aggravated further!</b>");
					CombatAttacks.applyBleed(target, 1, 3, 7);
				}
			}
			else output(" You’re more than ready for him, and deftly avoid every wild attack he makes against you before pulling back!");
		}
		//Grapple
		public function lundGrapple(target:Creature):void
		{
			author("Wsan");
			output("Lund spins one dagger in the air before jamming it into its sheath, bites down on the handle of the other one, and bounds at you barehanded! Upon crashing into you he immediately tries to grapple you, struggling against your footing on the treacherous ground of Uveto!");
			if (target.physique() >= 40)
			{
				output(" He’s far too weak to possibly succeed, though, and with a vicious swing of your [pc.legOrLegs] you send him catapulting through the air end-over-end. He thuds to the ground with a grunt and springs back up, wiping his mouth off as he collects his daggers and raises them once more.");
				applyDamage(new TypeCollection( { kinetic: 20 }, DamageFlag.BYPASS_SHIELD ), target, this, "minimal");
			}
			else if (target.physique() >= 30)
			{
				output(" You grunt in effort as you fight against him but eventually succeed, slamming him into the ground and trying to follow it up before he rolls away and springs to his feet, grabbing his daggers and raising them once more.");
				applyDamage(new TypeCollection( { kinetic: 10 }, DamageFlag.BYPASS_SHIELD ), target, this, "minimal");
			}
			else
			{
				output(" Try as you might, you can’t dislodge him, and you soon find yourself surprised as you’re flipped end-over-end onto the ground and he follows it up with a stab of the dagger drawn from the sheath at his waist! He leaps back and drops the other dagger into his free hand, resuming his battle-ready stance.");
				applyDamage(new TypeCollection( { kinetic: 32 }, DamageFlag.PENETRATING, DamageFlag.BYPASS_SHIELD ), this, target);
			}

			//pc has 40+ str: lund takes some dmg
			//pc has 30-40 str: lund takes very little dmg
			//pc has <30 str: pc takes a bunch of dmg
		}

		//Toss Savicite
		public function tossSavicite(target:Creature):void
		{
			author("Wsan");
			output("Taking off from a dead stop like he’s competing in a race, Lund practically flies at you while one of his hands drops to his waist. He cuts through the string holding one of the pouches there and takes it up in his other hand, approaching you before throwing powder into the air!");
			if (!combatMiss(this,target))
			{
				output(" Unprepared, you get a lungful of the pink powder and immediately grow hotter, sweating and panting even in the icy Uvetan wilds. It’s Savicite! Damn it, you can feel yourself getting hornier by the second...");
				output("\n\nBy the time you refocus on the fight, Lund is already ready for the next attack.");
				applyDamage(new TypeCollection( { tease: 32 } ), this, target);
			}
			else output(" You jump back and the powder whirls harmlessly into the air, carried away by a traveling wind. Lund curses at the missed opportunity and readies himself once more, staring you down.");
			//does lust dmg. Probably a lot of it.
		}
	}
}
/*



*/