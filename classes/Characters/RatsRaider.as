package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.ItemSlotClass;
	import classes.Items.Armor.RattyArmor;
	import classes.Items.Melee.ReaperStunBaton;
	import classes.Items.Protection.SalamanderShield;
	import classes.Items.Accessories.FlashGoggles;
	import classes.Items.Transformatives.MousearellaCheese;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.num2Text;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	
	public class RatsRaider extends Creature
	{
		public var ratVariety:int;
		private static const specialCost:int = 25;
		private var specialAttacks:Array;
		
		public static const ratCapacity:int = 150;
		
		public static const RAT_REP_NONE:int = 0;
		public static const RAT_REP_LOW:int = 1;
		public static const RAT_REP_MID:int = 2;
		public static const RAT_REP_HIGH:int = 3;
		public static const RAT_REP_GOOD_CEO:int = 4;
		
		public static const PINK_RODENIAN:int = 0;
		public static const TAN_MOUSEBOY:int = 1;
		public static const HALF_GIRL:int = 2;
		public static const WHITE_RODENIAN:int = 3;
		public static const FAIR_MOUSEBOY:int = 4;
		public static const HALF_BOY:int = 5;
		
		public static const RAT_BUSTS:Array = ["RATS_RAIDER_ROD_1", "RATS_RAIDER_MOUSE_1", "RATS_RAIDER_GIRL", "RATS_RAIDER_ROD_2", "RATS_RAIDER_MOUSE_2", "RATS_RAIDER_BOY"];
		
		public function RatsRaider(ratVariety:int = 0)
		{
			this.ratVariety = ratVariety;
		
			this._latestVersion = 3;
			this.version = _latestVersion;
			this._neverSerialize = true;

			this.a = "the ";
			this.capitalA = "The ";
			
			this.hipRatingRaw = 5;
			this.buttRatingRaw = 5;
			
			this.hairLength = 7;

			this.inventory = new Array();
			
			this.meleeWeapon = new ReaperStunBaton();
			this.meleeWeapon.baseDamage.multiply(0.17);
			
			this.earType = GLOBAL.TYPE_MOUSE;
			this.tailType = GLOBAL.TYPE_MOUSE;
			this.addArmFlag(GLOBAL.FLAG_FURRED);
			this.legType = GLOBAL.TYPE_MOUSE;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FURRED];
			
			this.libidoRaw = 20;
			
			this.analVirgin = false;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			
			this.shield = new SalamanderShield();
			this.armor = new RattyArmor();
			this.armor.evasion = 10;
			this.baseHPResistances.burning.resistanceValue = 50.0;
			this.baseHPResistances.electric.resistanceValue = 75.0;
			
			this.ass.bonusCapacity = ratCapacity - analCapacity();
			
			//Set race
			switch (ratVariety)
			{
				//Rodenians
				case PINK_RODENIAN: case WHITE_RODENIAN:		
					originalRace = "rodenian";
					btnTargetText = "Rodent Girl";
					short = "Rodent Girl";
					
					hairLength = 12;
					
					hipRatingRaw = 7;
					buttRatingRaw = 9;
					
					skinType = GLOBAL.SKIN_TYPE_FUR;
					faceType = GLOBAL.TYPE_MOUSE;
					addFaceFlag(GLOBAL.FLAG_MUZZLED);
					break;
				//Mouse-boys
				case TAN_MOUSEBOY: case FAIR_MOUSEBOY:
					btnTargetText = "Mouse-boy";
					short = "Mouse-boy";
					
					hipRatingRaw = 7;
					buttRatingRaw = 4;
					
					clearArmFlags();
					legType = GLOBAL.TYPE_HUMAN;
					legFlags = [GLOBAL.FLAG_PLANTIGRADE];
					
					//Check Butts
					if (kGAMECLASS.flags["RAT_ANUSES_TAKEN"] == undefined) analVirgin = true;
					else if (kGAMECLASS.flags["RAT_ANUSES_TAKEN"] & 1<<ratVariety) analVirgin = false;
					else analVirgin = true;
					
					break;
				//Half-rodenians
				case HALF_BOY: case HALF_GIRL: default:
					originalRace = "half-rodenian";
					short = "Half-Rodenian " + (ratVariety == HALF_BOY ? "Boy" : "Girl");
					btnTargetText = "H.Roden " + (ratVariety == HALF_BOY ? "Boy" : "Girl");
					this.inventory.push(new MousearellaCheese());
					break;
			}
			
			//Set gender
			switch (ratVariety)
			{
				//Females
				case PINK_RODENIAN: case WHITE_RODENIAN: case HALF_GIRL: default:
					createStatusEffect("Force Fem Gender");
					
					//Takes them down to "slender"
					lipMod = -2;
					tallness = 60; //default
					
					characterClass = GLOBAL.CLASS_SMUGGLER;
					createPerk("Shield Tweaks");
					createPerk("Shield Booster");
					
					thickness = 35;
					tone = 60;
					femininity = 90;
					
					breastRows[0].breastRatingRaw = 3;
					
					physiqueRaw = 18;
					reflexesRaw = 32;
					aimRaw = 32;
					intelligenceRaw = 36;
					willpowerRaw = 16;
					
					shield.shields += 90;
					HPMod = -21;
					
					specialAttacks = ["flashbang", "stun gun"];
					
					break;
				//Males
				case TAN_MOUSEBOY: case FAIR_MOUSEBOY: case HALF_BOY:
					createStatusEffect("Force Male Gender");
					tallness = 64; //default

					nippleColor = "peach";
					
					characterClass = GLOBAL.CLASS_MERCENARY;
					
					thickness = 25;
					tone = 70;
					femininity = 35;
					
					createCock(8);
					cocks[0].cThicknessRatioRaw = 1.1;
					balls = 2;
					ballSizeRaw = 6;
					
					physiqueRaw = 40;
					reflexesRaw = 32;
					aimRaw = 20;
					intelligenceRaw = 16;
					willpowerRaw = 24;
					
					shield.shields += 45;
					HPMod = 54;
					
					addFaceFlag(GLOBAL.FLAG_FRECKLED);
					
					specialAttacks = ["headbutt", "leg strike"];
					
					break;
			}
			
			//Set individual
			switch (ratVariety)
			{
				case PINK_RODENIAN:
					tallness = 58;
					skinTone = "peach";
					furColor = "light pink";
					eyeColor = "green";
					hairColor = "blonde and purple";
					nippleColor = "light pink";
					break;
				case WHITE_RODENIAN:
					tallness = 61;
					skinTone = "tan";
					furColor = "white";
					eyeColor = "red";
					hairColor = "dirty-blonde";
					nippleColor = "dark red";
					lipColor = "black";
					break;
				case TAN_MOUSEBOY:
					tallness = 62;
					skinTone = "tan";
					eyeColor = "hazel";
					hairColor = "black";
					break;
				case FAIR_MOUSEBOY:
					tallness = 61;
					skinTone = "fair";
					eyeColor = "brown";
					hairColor = "light brown";
					break;
				case HALF_GIRL:
					tallness = 59;
					skinTone = "fair";
					furColor = "gray";
					eyeColor = "blue";
					hairColor = "white and green";
					nippleColor = "pink";
					
					hipRatingRaw = 8;
					buttRatingRaw = 6;
					
					createVagina();
					vaginas[0].hymen = false;
					vaginas[0].wetnessRaw = 4;
					vaginas[0].bonusCapacity = ratCapacity - vaginalCapacity();
					clitLength = 0.9;
					
					break;
				case HALF_BOY:
					tallness = 60;
					femininity = 40;
					skinTone = "chocolate";
					cocks[0].cockColor = "chocolate";
					furColor = "black";
					eyeColor = "violet";
					hairColor = "blonde";
					
					hipRatingRaw = 9;
					buttRatingRaw = 8;
					
					break;
			}
			
			//Set likes
			switch (ratVariety)
			{
				case PINK_RODENIAN: case WHITE_RODENIAN:
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS,	GLOBAL.REALLY_LIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_FURRIES,			GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT,			GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE,	GLOBAL.KINDA_LIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_DISLIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_NIPPLECUNTS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
					
					break;
				case TAN_MOUSEBOY: case FAIR_MOUSEBOY:
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.REALLY_LIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS,		GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,			GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS,	GLOBAL.KINDA_LIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.KINDA_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY,			GLOBAL.KINDA_DISLIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_NIPPLECUNTS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
					
					break;
				case HALF_GIRL:
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,		GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,			GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS,		GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.REALLY_LIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE,	GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT,			GLOBAL.KINDA_LIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,				GLOBAL.KINDA_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS,	GLOBAL.KINDA_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_NIPPLECUNTS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
					
					break;
				case HALF_BOY:
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE,		GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.REALLY_LIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,			GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY,			GLOBAL.KINDA_LIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS,	GLOBAL.KINDA_LIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.KINDA_DISLIKES_SEXPREF);
					
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
					this.sexualPreferences.setPref(GLOBAL.SEXPREF_NIPPLECUNTS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			
					break;
			}

			this.level = 8;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			this.XPRaw = this.normalXP();
			//Loot is handled by ratPostFightAdjustments()
			this.credits = 0;
			
			createPerk("Appearance Enabled");
			createPerk("Inhuman Desire", 25);
			createPerk("Giant Slayer", 6*12, 10);
			createPerk("Get Down!", 50);

			this.isUniqueInFight = true;
			
			kGAMECLASS.zhengShiSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return RAT_BUSTS[ratVariety];
		}
		
		public function get groupDisplay():String
		{
			return "RATS_RAIDER_GROUP_" + (Math.floor(ratVariety/3) == 0 ? "ONE" : "TWO");
		}
		
		public function isLeaderRat():Boolean
		{
			return getLeaderRat() == this;
		}
		
		public static function getLeaderRat(ignoreStunned:Boolean = true):RatsRaider
		{
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally is RatsRaider && !(ally.isImmobilized() && ignoreStunned) && !ally.isDefeated())
					return ally as RatsRaider;
			return null;
		}
		
		public static function getThiefRat():RatsRaider
		{
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally.hasStatusEffect("Plunder over Pillage!"))
					return ally as RatsRaider;
			return null;
		}
		
		public static function ratCount(ignoreStunned:Boolean = true, ignoreGender:String = "n"):Number
		{
			var rats:Number = 0;
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally is RatsRaider
					&& !(ally.isImmobilized() && ignoreStunned)
					&& !ally.isDefeated()
					&& ally.mf("m", "f") != ignoreGender)
					rats++;
			return rats;
		}	
		
		private function ratpileReady(target:Creature):Boolean
		{
			if (!isLeaderRat()) return false;
			if (!target.hasStatusEffect("Stunned")) return false;
			if (ratCount() < 2) return false;
			return true;
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var possibleAttacks:Array = [tailLash];
			if (!hasStatusEffect("Disarmed")) possibleAttacks.push(shockProd);
			if (energy() >= specialCost && !target.hasStatusEffect("Rat Special'd"))
			{
				if (specialAttacks.indexOf("headbutt") >= 0 && !target.hasStatusEffect("Stunned"))
					possibleAttacks.push(headbutt);
				if (specialAttacks.indexOf("leg strike") >= 0 && !target.hasStatusEffect("Tripped"))
					possibleAttacks.push(legStrike);
				if (specialAttacks.indexOf("stun gun") >= 0 && !target.hasStatusEffect("Stunned") && !hasStatusEffect("Disarmed"))
					possibleAttacks.push(stunGun, stunGun);
				if (specialAttacks.indexOf("flashbang") >= 0 && !target.isBlind())
					possibleAttacks.push(flashbang);
			}
			if (shields() < shieldsMax()/2 && !hasStatusEffect("Rat Boost Used"))
				possibleAttacks.push(shieldBoost);
			
			//Starting the ratpile, fleeing, reviving an ally, continuing the grapple and being horny
			//override normal rat AI
			var woundedRats:Array = new Array();
			var hornyRats:int = 0;
			for each (var ally:Creature in alliedCreatures)
			{
				if (ally is RatsRaider && ally.HP() <= 0 && ally.lust() < ally.lustMax())
					woundedRats.push(ally);
				if (ally.hasStatusEffect("Rat Cascade Used")) hornyRats++;
			}
			if (target.isGrappled()) possibleAttacks = [ratpile];
			else if (rand(2) == 0 && woundedRats.length > 0 && !hasStatusEffect("Rat Revive Used"))
			{
				possibleAttacks = [revive];
				target = RandomInCollection(woundedRats);
			}
			else if (lust() > 80 && !hasStatusEffect("Rat Cascade Used") && hornyRats < 2) possibleAttacks = [lustCade];
			else if (hasStatusEffect("Plunder over Pillage!") && (HPQ() < 60 || ratCount(false) < 3)) possibleAttacks = [fleeWithTheMoney];
			else if (ratpileReady(target)) possibleAttacks = [ratpileStart];
			
			//Excecute
			RandomInCollection(possibleAttacks)(target);
		}

		// [BASIC ATTACKS]
		// Male and Female Rodent
		// Basic Attack - Electric damage for taking down shields and tazing pesky CEOs-to-be.
		private function shockProd(target:Creature):void
		{
			var rats:int = ratCount();
			var randomDialogue:Array = new Array();
			switch(kGAMECLASS.ratputation())
			{
				case RAT_REP_GOOD_CEO: randomDialogue.push("Haha, this is fun, [pc.mister] CEO!", "You’re open, [pc.mister] CEO!", "Can you dodge this, [pc.mister] CEO?", "Be careful, [pc.mister] CEO!", "Thanks for the opening, [pc.mister] CEO!"); break;
				case RAT_REP_HIGH: randomDialogue.push("Leave it to me!", "I won’t go easy on you!");
				case RAT_REP_MID: randomDialogue.push("You’re not getting away, fiend!", "I won’t miss, you monster!", "You can’t run, you snake!");
				case RAT_REP_LOW: randomDialogue.push("Here I come, [pc.mister] CEO!", "You’re mine, [pc.mister] CEO!");
				default: randomDialogue.push("Think fast!", "All at once!", "You’ll regret this!");
			}
			if (kGAMECLASS.silly) randomDialogue.push("Look-see, man-thing!", "All will see, man-thing!");
			
			output("<i>“" + RandomInCollection(randomDialogue) + "”</i> " + (rats > 1 ? "A" : "The") + " mouse-eared pirate hops forward, swinging " + mf("his", "her") + " stun stick at you.");
			// Miss
			if (combatMiss(this, target) || blindMiss(this, target, true))
			{
				output(" You dodge backwards just in time, watching the little rodent twirl in place");
				if (rats > 1)
				{
					output(", nearly hitting");
					if (rats > 2) output(" one of their advancing friends!");
					else output(" their advancing friend!");
					output(" <i>“Watch it, you idiot!”</i> comes a flustered shout");
					output(".");
				}
			}
			// Hit
			else
			{
				output(" You’re unable to avoid the swing, and the electrified baton slams into your arm, rebounding with shocking effect!");
				applyDamage(damageRand(meleeDamage(), 25), this, target, "melee");
			}
		}
		// Male and Female Rodent
		// Basic Attack - Armored tail inflicts kinetic damage. Chance for Bleed if Shield Down.
		private function tailLash(target:Creature):void
		{
			var rats:int = ratCount();
			var storedBaton:ItemSlotClass = meleeWeapon;
			meleeWeapon = rangedWeapon;
			switch (rats)
			{
				case 3: output("From your peripheral sight you spot one of the rats darting forward and twisting around, bringing their long, bladed tail to bear!"); break;
				case 2: output("A rat darts forward without brandishing " + mf("his", "her") + " weapon. With widening eyes you watch " + mf("him pivot his", "her pivot her") + " armored tail towards you!"); break;
				default:
				case 1: output("The rash mouse-pirate charges at you in full sprint, bladed tail waving wildly behind" + mf(" him!", " her!")); break;
			}
			
			// Miss
			if (combatMiss(this, target) || blindMiss(this, target, true))
			{
				output(" You jerk backwards and catch the whirling tail just before it connects! <i>“G-get off me!”</i> the chubby-eared rodent stammers before you");
				if (target.hasLegs()) output(" boot " + mf("him", "her") + " square in the ass");
				else output(" shove " + mf("him", "her") + " away");
				if (rats > 1) output(" and back to " + mf("his", "her") + " their friends");
				output(".");
			}
			// Hit
			else
			{
				output(" The lethal tendril weaves too fast for you to dodge or duck, and the weaponized tip lashes your arm!");
				if (rand(4) == 0 && target.shields() <= 0)
				{
					if (kGAMECLASS.silly) output(" <i>Stinking rat-vole rodent piece of trash!</i> <b>You’re bleeding</b>!");
					else output(" The damn rat struck too well, and as a result blood rushes from your wound - <b>you’re bleeding!</b>");
					CombatAttacks.applyBleed(target);
				}
				applyDamage(damageRand(meleeDamage(),15), this, target, "melee");
			}
			
			meleeWeapon = storedBaton;
		}
		
		// [SPECIALS]
		// Male Rodent Only
		// Special Skill - Same as Merc Headbutt, chance to stun.
		private function headbutt(target:Creature):void
		{
			energy(-specialCost);
			target.createStatusEffect("Rat Special'd");
			
			if (ratCount(false, "f") > 1)
			{
				output("One of the taller rats charges at you, dodging your deflective punch. <i>“");
				if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO && rand(2) == 0) output("I’ll make this quick!");
				else output("You’re only making this harder!!");
				output("”</i> he declares, rearing back for a powerful headbutt!");
			}
			else
			{
				output("<i>“");
				if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO && rand(2) == 0) output("Try not to pass out!");
				else output("You brought this on yourself!");
				output("”</i> The rat boy charges at you, parries your deflective punch, and rears back for a powerful headbutt!");
			}
			// Miss
			if (combatMiss(this, target) || blindMiss(this, target, true))
			{
				output(" You redirect your momentum to your free hand and sock the rat boy in the side of his lunging head, your knuckles pinging loudly off his dizzied head! He twirls around twice like a drunken dancer, falling back");
				if (ratCount() > 1) output(" to the steadying arms of his companions");
				output(" as you shake your [pc.arm] out. <i>Better a bruised knuckle</i>, you think!");
			}
			// Hit
			else
			{
				output(" The freckled pirate’s armored head collides with yours, a loud <i>SMACK</i> booming like thunder!");
				if (physique() / 2 + rand(20) + 1 >= target.physique() / 2 + 10 && !target.hasStatusEffect("Stun Immune"))
				{
					output(" Stars explode in your eyes and you stumble back with a pained grunt, unable to act! <i>“Now’s our chance! Get [pc.himHer]”</i> one rat triumphantly yells!");
					CombatAttacks.applyStun(target);
				}
				else
				{
					output(" <i>“Alright");
					if (ratCount(false) > 1) output(", let’s ge-");
					output("!”</i> the bold rat fist pumps, but you’re not out! Your concussed sight clears as you glower and groan warningly at the cocksure bandit. He scampers back");
					if (ratCount(false) > 1) output(" to the safety of numbers");
					output(". Shit, that’s the kind of bruise that someone will easily notice...");
				}
				applyDamage(damageRand(new TypeCollection({kinetic: physique()/2 + level}), 15), this, target, "headbutt");
			}
		}
		// Male Rodent Only
		// Special Skill -  If hits knock the player down. Low accuracy, Smugglers can leap up etc.
		private function legStrike(target:Creature):void
		{
			energy(-specialCost);
			target.createStatusEffect("Rat Special'd");

			if (ratCount(false, "f") > 1) output("Pushing his way to the front, one of the roguish rats darts at you, swinging obvious feints with his baton. You step back, dodging two hammer-like blows before noticing him aiming for your [pc.legOrLegs]!");
			else output("The roguish rat boy darts at you, stun baton swinging wildly. You can only focus on dodging, quickly becoming aware that this is just a distraction. His body curls and he aims the next hammer-like blow for your [pc.legOrLegs]!");

			// Miss
			if (combatMiss(this, target, attack(true)+10) || blindMiss(this, target, true))
			{
				output(" Unable to dodge back, you instead <i>jump</i> over the vicious swing. Before the rodent can try again, you kick his wrist and force him back in a dizzying twirl. He growls and half-cries in pain,");
				if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO) output(" <i>“That hurt, [pc.mister] CEO!”</i> before shaking his arm and assuming an aggressive stance! That’s the point!");
				else output(" <i>“Ow! You’ll pay for that!”</i> before shaking his arm and assuming an aggressive stance! Yeah, sure!");
			}
			// Hit
			else
			{
				output(" You try to hop back, but the rat’s stun baton bounces off your " + (target.hasLegs() ? "crus" : "limb") + " with a nerve-numbing bang; smoke billows from the electrifying impact. You yelp and fall to the ground, head banging on the floor with starry-eyed results. The only thing keeping you conscious is the infuriating laughter...");
				CombatAttacks.applyTrip(target);
			}
		}
		
		// Female Rodent Only
		// Special Skill - Same as Smuggler skill, blinds the player.
		private function flashbang(target:Creature):void
		{
			energy(-specialCost);
			target.createStatusEffect("Rat Special'd");

			if (ratCount(false) > 1) output("<i>“Eyes shut!”</i> a lithe rodent girl orders, two metal canisters rolling towards you on gunmetal rims. You only manage a gasp as your eyes twitch in fight-or-flight.");
			else output("The lithe rodent girl eyes you intently and tosses out two metal canisters, covering her eyes with an arm and hunkering down as the cylindrical concussers roll towards you on thick metal rims.");
			
			if (target.accessory is FlashGoggles) output(" Thanks to your special eyewear, all you need do is cover your [pc.ears], avoiding the worst of that pitiful attempt to subdue you!");
			// Miss
			else if (aim() / 2 + rand(20) + 6 < target.reflexes() / 2 + 10) output(" You hurriedly shield your eyes and plug your [pc.ears]; the flashbangs blow, but you manage to avoid the worst of it!");
			// Hit
			else
			{
				output("\n\nThe grenades go off and this plane of existence turns blank white, filled with flecks of starry color and a distressing sightlessness. Your [pc.ears] flex instinctively, but you can’t hear anything save for a painful ringing. Hollow bellows boom in your quavering eardrums, filling you with a palpable sense of dread.");
				CombatAttacks.applyBlind(target, 3);
			}
		}
		// Female Rodent Only
		// Special Skill - High electric damage for shields, stun chance if shield down, does some mild damage  through shield.
		//Description outdated
		private function stunGun(target:Creature):void
		{
			energy(-specialCost);
			target.createStatusEffect("Rat Special'd");

			if (ratCount(false, "m") > 1) output("A fuzzy rat girl steps forward and levels a chrome-silver pistol at you, two bee-striped prongs poke out of the barrel.");
			else output("The fuzzy rodenian girl jumps to the front and levels a chrome-silver gun at you, two large bee-striped prongs poking out of the barrel.");

			// Miss
			if (rangedCombatMiss(this, target, attack(false)+10) || blindMiss(this, target)) output(" You sidestep those rapidly unspindling stingers just in time, watching them plink harmlessly off the wall. The rodenian reels the stingers back, huffing in frustration.");
			// Hit
			else
			{
				output(" A loud click is all you hear before the spooling darts scream through the air in your direction, implanting in your [pc.arm] with a painful sting.");
				if (target.shields() > 0) 
				{
					output(" Before you can rip them out, an electrical bombardment assaults your shield!");
					var damage:TypeCollection = new TypeCollection();
					damage.electric.damageValue = rangedDamage().getTotal();
					damage.addFlag(DamageFlag.ONLY_SHIELD);
					applyDamage(damageRand(damage.multiply(2), 20), this, target, "ranged");
				}
				else
				{
					output(" A seizing electrical current is run through your body, bringing you to your knees");
					if (intelligence() / 2 + rand(20) + 1 >= target.willpower() / 2 + 10 && !target.hasStatusEffect("Stun Immune")) output(" before you can rip the darts out and catch your breath.");
					else
					{
						output(" and even to all fours. When the current stops, the darts are reeled back in by a smug rat.");
						if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO) output(" <i>“Gotcha. [pc.Mister] CEO!");
						else output(" <i>“That’s a better look for you.");
						if (ratCount(false) > 1) output(" Now, get [pc.himHer]!");
						output("”</i>");
						CombatAttacks.applyStun(target, 5);
					}
				}
			}
		}
		
		// [HEALING]
		private function shieldBoost(target:Creature):void
		{
			shields(shieldsMax()/2);
			createStatusEffect("Rat Boost Used");
			kGAMECLASS.setTarget(this);
			output("[target.Short] jumps back and digs through [target.hisHer] belongings, pulling out a small battery and plugging it into [target.hisHer] belt. Once the energy cell is drained it’s tossed aside, leaving [target.himHer] with a replenished barrier!");
			var damageResult:DamageResult = new DamageResult();
			damageResult.shieldDamage = (-1 * Math.floor(shieldsMax()/2));
			outputDamage(damageResult);
		}
		private function revive(target:Creature):void
		{
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally is RatsRaider)
					ally.createStatusEffect("Rat Revive Used");

			target.alreadyDefeated = false;
			target.createStatusEffect("NO AI");
			kGAMECLASS.setTarget(target);
			
			output("Kneeling next to " + (ratCount(false) == 1 ? "a" : "the") + " knocked out rat, " + (ratCount(false) == 1 ? "the" : "a") + " mousey pirate flips [target.himHer] over, pinning [target.himHer] to stop the struggling.");

			output("\n\n<i>“Hold still, hold still!”</i> beckons the mouse " + mf("boy", "girl") + " clambering over " + mf("his", "her") + " fallen friend. " + mf("He", "She") + " produces a large needle filled with orange liquid and jams it in the writhing outlaw’s neck. A loud gasp precedes a frantic pawing; the once fallen rat stands and gathers [target.hisHer] gear after a brief conniption fit, ready to face you down again!");
			
			/* OLD & JANKY:
			var damageResult:DamageResult = new DamageResult();
			damageResult.hpDamage = (-1 * Math.floor(target.HPMax()*0.75));
			outputDamage(damageResult);*/

			//New and Sexy:
			target.changeHP(target.HPMax()*0.75);
			
			output("\n\nCrap!");
		}
		
		//loost
		// When a rodent is teased to 80 lust or higher, or is maxed out, their own lust can infect everyone else. Other rats start taking lust damage as the over-teased ones try to relieve themselves.
		private function lustCade(target:Creature):void
		{
			createStatusEffect("Rat Cascade Used");
			var rats:int = 0;
			var sameRats:int = 0
			var loost:int;
			var otherRat:RatsRaider;
			var lustOutput:Array = [];
			for each (var rat:Creature in CombatManager.getHostileActors())
			{
				if (!(rat is RatsRaider) || rat == this) continue;
				otherRat = rat as RatsRaider;
				loost = Math.min(10+rand(11), rat.lustMax() - rat.lust());
				rat.lust(loost);
				lustOutput.push(loost);
				if (rat.mf("a","b") == mf("a","b")) ++sameRats;
				++rats;
			}
				
			if (mf("m", "f") == "f")
			{
				if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO && rand(3) == 0)
				{
					output("<i>“Ohhh... Oh, come on...”</i> " + (sameRats == 0 ? "the": "a") + " sexy rat girl whines. She falls heavily to one knee, fondling her perky tits, tending the nubby attention-seeking erections through her undersuit. <i>“If you wanted to fuck you could have...”</i> The lustful mouse-pirate moans like a needy whore, squirming on the spot and touching herself much more brazenly");
					if (rats > 0)
					{
						output(" as the other");
						if (rats > 1) output(" rats watch");
						else output(" rat watches");
					}
					output(".");
				}
				else if (kGAMECLASS.ratputation() > RAT_REP_NONE && rand(3) == 0)
				{
					output("<i>“Wuh...”</i> " + (sameRats == 0 ? "the" : "a") + " female rat grunts and heaves. She falls to one knee holding her chest, grinding an arm against her own tits. <i>“You... Is this what you learned from all the sluts under your desk!? Sc... <b>Screw you!</b>”</i> she rasps, smacking her fist into the ground and standing. You opt not to tell her that she’s still grinding her thighs together.");
					if (rats > 0) output(" The " + (rats == 1 ? "other is" : "others are") + " getting pretty turned on despite her irascible defiance.");
				
				}
				else if (rand(2) == 0)
				{
					output("<i>“Ughh..! Y-you slut! Why... unnhhh... why are you acting like a slave in a fight!?”</i> " + (rats > 0 ? "a" : "the") + " furry mouse wails, aching from pent up lust. She strokes herself brazenly and scrapes at her crotch, desperately looking for entrance and relief");
					if (rats > 0) output(" as the other" + (rats > 1 ? "s eye hump" : " rodent eye humps") + " her. You can tell " + (rats > 1 ? "they’re" : otherRat.mf("he’s", "she’s")) + " enjoying the show");
					output(".");
				}
				else
				{
					output("<i>“W-what the hell are you doing? Wasn’t this supposed to be a fight!? You... uhnnn...! YOU BIMBO!!”</i> the mouse girl cries and gasps, pawing frantically at her crotch. Unable to focus on both the fight and self-service, she growls in a surly tone.");
					if (rats > 0) output(" The other" + (rats > 1 ? "s are" : " rodent is") + " distracted by her moaning, but you can tell " + (rats > 1 ? "they’re" : otherRat.mf("he’s", "she’s")) + " secretly enjoying the struggle to touch oneself.");
				}
			}
			else
			{
				if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO && rand(3) == 0)
				{
					output("<i>“Hey, why are we fighting if you’re... just doing that...”</i> " + (sameRats == 0 ? "the" : "a") + " mouse-boy’s voice trails off. He collapses to his knees, grinding his bosomy thighs together, stroking his uncomfortable erection through his undersuit. <i>“Aah, my clothes... Uhhmmm,”</i> he moans, <i>“you’re so sexy...”</i> He drops his baton, temporarily giving himself to excess");
					if (rats > 0)
					{
						output(" as the other");
						if (rats > 1) output(" rats watch");
						else output(" rat watches");
					}
					output(".");
				}
				else if (kGAMECLASS.ratputation() > RAT_REP_NONE && rand(3) == 0)
				{
					output("<i>“Did... What... What is this...”</i>" + (sameRats == 0 ? "the" : "a") + " rodent boy whines, hunching over with both hands on his junk. He tends a large erection through his undersuit, pressed painfully against his armor, making him rub his legs together. <i>“F-for someone so evil you’re so sexy-”</i> he hums");
					if (rats == 0) output(" only to shout and resume his stance, looking no less turned on. He’s still got some fight in him!");
					else output(", only to get a smack on the side of the head by another rat.");
				}
				else if (rand(2) == 0)
				{
					output("<i>“No... I’m... You s...s...!!”</i> " + (sameRats == 0 ? "The" : "A") + " mouse-eared pirate staggers back and forth, loud breaths accompanying his every stomp. <i>“M-my clothes are... Uhm...”</i> With his balance eroding and his dick pressing against his armor, he struggles to relieve himself. Unfortunately, he can’t focus on you and getting under his clothes at the same time. He scowls cutely when exchanging glances between your smirking face and his aching boner.");
					if (rats > 0) output(" The others watch him, getting equally turned on by the attempts at self-service.");
				}
				else
				{
					output("<i>“Ah... haa..! My clothes..!”</i> " + (sameRats == 0 ? "The" : "A") + " mouse boy stumbles to and fro, thick and heavy breaths behind every planted foot. <i>“It’s too much...”</i> His teeth grit and he rubs his hand over his crotch where his tenting manhood must be. Unfortunately for him, he can’t give himself the relief he needs through his armor while also concentrating on the fight. He scowls, glancing at you and his clenching legs");
					if (rats > 0) output(" as the others watch him nervously, getting turned on by the attempts at self-servicing");
					output(".");
				}
			}
			
			for(var i:int = 0; i < lustOutput.length; i++)
			{
				var damageResult:DamageResult = new DamageResult();
				damageResult.lustDamage = (-1 * lustOutput[i]);
				outputDamage(damageResult);
			}
		}
		
		//MADNESS AWAITS ALL WHO DARE READ THE FOLLOWING CODE
		private function ratpileStart(target:Creature):void
		{
			var dialog:Array = ["Our prize awaits!", "Now you’re in for it!", "All you had to do was pay up!", "Come on, [pc.he]’s open!"];
			if (kGAMECLASS.silly) dialog.push("No-no, mustn’t let [pc.himHer] get away!");
			if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO) dialog.push("Ha-ha! [pc.Mister] CEO, you know what’s coming!");
			else if (kGAMECLASS.ratputation() != RAT_REP_NONE) dialog.push("Ha! The corporate stooge is out of [pc.hisHer] element! Now, now, take all of it!");

			output("<i>“" + RandomInCollection(dialog) + "”</i> yells one of the raiders, and you feel " + num2Text(ratCount()) + " bodies smash into you. Unable to resist, you are tackled to the floor. You flail defiant, madly struggling against their quick-fingered hands and constricting tails as they crawl upon and pin you. If you don’t shake your stupor, <b>who knows what they’re going to do</b>!");

			target.removeStatusEffect("Stunned");
			CombatAttacks.applyGrapple(target, 65);
			//Store rat count
			target.setStatusValue("Grappled",3,ratCount());
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally is RatsRaider && !ally.isDefeated())
					ally.createStatusEffect("NO AI");
		}
		private function ratpile(target:Creature):void
		{
			if (!isLeaderRat()) return;

			var dmg:TypeCollection = new TypeCollection();
			dmg.tease.damageValue = 15;
			
			kGAMECLASS.setTarget(this);
			
			//Turn counter (v4)
			target.addStatusValue("Grappled",4,1);
			//Lust for gold
			for each (var ally:Creature in CombatManager.getHostileActors())
			{
				if (ally is RatsRaider && !ally.isDefeated())
				{
					ally.lust(5+rand(10)+rand(6));
					ally.createStatusEffect("NO AI");
				}
			}
			
			//Actual grapple. Use on first turn and if other abilities have been used.
			if (target.statusEffectv4("Grappled") == 1 || (target.hasStatusEffect("RatRobbed") && target.hasStatusEffect("Disarmed")))
			{
				if (target.hasStatusEffect("Disarmed")) output("Heavy legs and firm arms settle on your biceps, denying any resistance");
				else output("Your grip on your [pc.weapon] loosens in the fight against the firm arms and heavy legs on your biceps");
				output("; shaking the exuberant mouse off your face is already proving to be difficult. The thought of getting to your valuables excites them beyond belief - they laugh triumphantly as their sticky fingers dig through your exposed inventory in search of wealth, mineral or digital, feeling you up in the ecstatic process.");

				if (ratCount() == 2) output("\n\nWhilst one saucer-eared thief probes your vulnerable belongings, the other plants [target.hisHer] crotch on your neck, blinding you under [target.hisHer] round butt, your protests muffled beneath [target.hisHer] plump thighs. The rapacious rat can’t help but grope you in between countering your fleeting moments of limp resistance, forcing you to groan into indistinct nether regions with a mix of lust and pain.");
				else output("\n\nTwo mouse pirates pin you down painfully, one sitting atop your groin and the other above your chin. Your face-sitter’s damp and quivering butt drags over your face, led by roaming hands and followed by happy chitters. No matter how hard you thrash, it’s all limp resistance to them, and worse, they can’t help but steal gropes at your body. You writhe feebly under their combined bodyweight, getting hit back and turned on in equal measure.");
				
				dmg.kinetic.damageValue = 65;
			}
			//Disarm - 50% chance, forced if robbed
			else if (!target.hasStatusEffect("Disarmed") && (rand(2) == 0 || target.hasStatusEffect("RatRobbed")))
			{
				if (ratCount() == 2)
				{
					output("When your struggles die down for but a moment, you feel the rat locking your noggin lean over and scoop up your [pc.meleeWeapon], and - equally distressing - hear the second rascal scrounging for your [pc.rangedWeapon].");
					if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO) output(" <i>“Looks like you’re in some trouble, [pc.mister] CEO!”</i>");
					else output(" <i>“Just give up, and we’ll make this easy on you!”</i>");
					output(" one says as your weapons are tossed in separate directions. If you manage to break free, you’re gonna have to get your gear back, <b>as you’ve been disarmed!</b>");
					output("\n\nThey quickly resume their search. Lewd moans are coaxed from you as a pair of dainty, adept paws travel down your sides. Pretentious laughs ring in your [pc.ears], fueling the indignant fire burning inside that makes every bounce and pushback stronger.");
				}
				else
				{
					if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO) output("<i>“Oops! Can’t let you do that, [pc.mister] CEO!”</i>");
					else output("<i>“Enough!”</i>");
					output(" one rat stomps on your wrist, your weapon slipping from your grasp. You cry out, though the wail is suppressed below your head-locking assailant’s backside. You feel your [pc.meleeWeapon] and [pc.rangedWeapon] pulled from your limp fingers.");
					if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO) output(" <i>“Looks like you’re in some trouble now, huh [pc.mister] CEO?”</i>");
					else output(" <i>“You should give up while you have the chance, you don’t have to get hurt!”</i>");
					output(" a female voice titters as your weapons are flung in two directions. If you manage to break free you’re gonna have to get your gear back, <b>as you have been disarmed!</b>");
					output("\n\nYou push back desperately against the hands holding you down, still defiling the sanctity of your precious inventory and of your body too. Dainty, adept paws skip and jump across your [pc.skinFurScalesNoun], searching for plunder while pillaging your body. Strength gradually stokes the indignant fire inside, fueled by the pretentious laughter ringing in your [pc.ears].");
				}
				CombatAttacks.applyDisarm(target, 2, true);
			}
			//Robbery
			else
			{
				var thief:RatsRaider = makeRatThief(target);
				if (!thief) return;
				kGAMECLASS.setTarget(thief);

				if (ratCount() == 2) output("<i>“Bingo, jackpot, score! This is it!”</i> you hear. There’s a universal pause that dilates your [pc.eyes]. Even through the " + (skinType == GLOBAL.SKIN_TYPE_FUR ? "fuzzy" : "smooth") + " butt on your face you know exactly the reason for their caterwauling: you feel a pouch yanked off your waist. <i>“Here we go, here we go, this is perfect!”</i> the mouse [target.boyGirl] exclaims. Your heart sinks hearing the pack open, its contents spilling out. <i>“");
				else output("<i>“Here, here! I have it! Wealth and treasure in spades, surely a payday!”</i> Comes an exuberant cry of utter victory. There’s a universal pause when your [pc.eyes] widen, and even blinded by butt you know exactly the reason for their caterwauling: they yank a pouch from your waist and rip it open with delighted squeals, oohs, and ahhs. The contents spill out, those sounds so very audible compared to everything else. <i>“");

				if (thief.hasStatusEffect("Plunder over Pillage!"))
				{
					var ratReactions:Array = new Array();
					if (ratCount() == 2)
					{
						if (thief.statusEffectv2("Plunder over Pillage!") > 5000) ratReactions.push("Plenty of gems for us to sell, our best payday in months!");
						if (thief.statusEffectv3("Plunder over Pillage!") > 0) ratReactions.push("A valuable gem for us to sell, fortune favors us!");
						ratReactions.push("Wow, [pc.heShe]’s loaded! Quick, take what you can!");
					}
					else
					{
						if (thief.statusEffectv2("Plunder over Pillage!") > 5000) ratReactions.push("Waha! Look, valuable gems! We’ll make so much selling this!");
						if (thief.statusEffectv3("Plunder over Pillage!") > 0) ratReactions.push("A valuable gem for us to sell, fortune favors us!");
						ratReactions.push("Wow, so much money, look-look! Quick, take everything you can!");
					}
					output(RandomInCollection(ratReactions) + "”</i>");
					
					output("\n\nAn infuriating ‘ha-ha!’ escapes the cocksure thief’s mouth as they");
					if (thief.statusEffectv2("Plunder over Pillage!") > 5000)
					{
						if (thief.credits > 0) output(" pool your gems and some chits into one");
						else output(" throw your gems into a");
					}
					else if (thief.statusEffectv3("Plunder over Pillage!") > 0)
					{
						output(" throw your gem");
						if (thief.credits > 0) output("and some chits");
						output(" into a");
					}
					else output(" throw some chits into a");
					output(" sack! You buck savagely against the " + (hasSkinFlag(GLOBAL.FLAG_FURRED) ? "fuzzy" : "smooth") + " limbs wrestling with you, desperate to prevent these damn vermin from absconding with what is rightfully yours!");
				}
				else
				{
					output("W-what!? Nothing? Then why didn’t you say anything!?”</i>");
					target.createStatusEffect("BreakRatpile");
				}
			}
			
			applyDamage(damageRand(dmg, 50), this, target, "minimal");
		}
		public static function grappleInterrupt(alliedCreatures:Array, target:Creature):void
		{
			//This kills the grapple
			if (target.hasStatusEffect("BreakRatpile"))
			{
				output("\n\nThe raiders scramble from your body, giving you a chance to breathe and collect yourself. They regard you resentfully, grumbling that you had nothing for them to ‘earn’.");
				if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO) output(" <i>“Hey, come on, we wouldn’t have done this if you said something!”</i>");
				else output(" <i>“You’re still going to pay for our time!”</i>");
				target.removeStatusEffect("Grappled");
				target.removeStatusEffect("BreakRatpile");
				return;
			}
			
			//Real function starts here
			var fallenRats:int = 0;
			var hornyRats:int = 0;
			var hornyRat:RatsRaider;
			
			for each (var rat:Creature in alliedCreatures)
			{
				if (rat is RatsRaider && rat.isDefeated() && !rat.alreadyDefeated)
				{
					//Show defeated rat thing
					rat.alreadyDefeated = true;
					(rat as RatsRaider).setLastFallenRat();
					if (rat.HP() <= 0) ++fallenRats;
					else
					{
						++hornyRats;
						hornyRat = rat as RatsRaider;
					}
				}
			}
			
			var recoveredRat:Boolean = (ratCount() + fallenRats + hornyRats) > target.statusEffectv3("Grappled");
					
			// Rats dogpiling but others fall off due to DoT effects
			if (fallenRats)
			{
				if (fallenRats == 1) output("\n\nOne bandit slides off your body, groaning and slumping to the ground with a dull thud."); 
				else output("\n\n" + (fallenRats == 2 ? "Two" : "The") + " bandits slide off your body, groaning and slumping to the ground with a dull thud.");
				if (fallenRats + hornyRats < target.statusEffectv3("Grappled"))
				{
					kGAMECLASS.setTarget(getLeaderRat());
					if (fallenRats == 1) output("<i>“Stop whining, hey, we’re winning! What’s up with that?!”</i> one rat squeals. At least it’ll be a bit easier to break free!");
					else ("<i>“Hey, how can... Crap!”</i> one rat squeals, leaping off while eyeing [target.hisHer] friends nervously.");
				}
			}
			
			if (hornyRats)
			{
				// If all rats (two or three) max out their lust during ratpile, somehow. Lol sure.
				if (hornyRats + fallenRats >= target.statusEffectv3("Grappled"))
				{
					output("\n\nThe laughs die down into reactionary moans, and those moans aren’t of pain. The " + (hornyRats == 1 ? "body atop you slides" : num2Text(hornyRats) + " bodies atop you slide") + " off, thudding to the ground amidst a cacophany of pleasurable squeaks. It’s so bizarre that you can’t help but shake your head. You hurriedly check yourself for damages, monetary or physical, before turning your attentions to the bandits now debilitatingly aroused...");
					target.createStatusEffect("Rats Lusted Themselves");
				}
				// If three rats, two get lustified
				else if (hornyRats == 2) output("\n\nLike Atlas setting the world down, relief wrings the pain from your body when two rats, for whatever reason, slip off your body. Inundated by blissful squeals and squeaks, the one over your face scampers away, leaving you to rise, check yourself, and figure out just what happened. <i>“H-how are you two like this!?”</i> the one rat asks, the other two bandits flush with all-consuming lust masturbating furiously. You scratch your head before getting back into the fight!");
				//Three rats, one rat gets turned on during this (Dogpile continues)
				else if (target.statusEffectv3("Grappled") - fallenRats == 3) output("\n\nA noticeable burden is relieved from your body, though you can’t understand why. <i>“H-hey, are you really? Hey we’re so close, what are you doing!?”</i> By the sounds of it, whoever just bailed is close to something themselves...");
				// Two rats, one rat gets turned on during Dogpile (Dogpile Ends, need 2 rats)
				else output("\n\nAs quick as the pressure came, one rat, for whatever reason, gives up the counter-resistance and flops off your prone form. The last remaining rat shouts, <i>“Hey, what are... You can’t be serious!”</i> You see just why it happened: " + hornyRat.mf("he", "she") + " is masturbating like a rabid animal.");
			}
				
			//rat comes back
			if (recoveredRat && hornyRats + fallenRats < target.statusEffectv3("Grappled"))
			{
				output("\n\n<i>“Oh, decided to wake up huh?”</i> you hear, and then feel another weight press on you. Another pair of grabby hands roams over you, signaling the assault of the third rat previously out of whack. <i>“Now let’s find that treasure!”</i>");
			}
			
			//Update rat count
			target.setStatusValue("Grappled",3,ratCount());
			//Not enough rats to continue or ratpile runs its course. Don't end the grapple if the rats lose.
			if (target.isDefeated()) return;
			else if (ratCount() < 2) target.removeStatusEffect("Grappled");
			else if (target.statusEffectv4("Grappled") >= 3)
			{
				output("\n\nThey scramble away from you, impishly tittering as they get some distance. You hastily rise to your [pc.footOrFeet], facing them down.. You hastily rise to your [pc.footOrFeet], facing them down once again as if that hadn’t occurred.");
				if (getThiefRat()) 
				{
					output(" A tell-tale sack is draped over one rat’s shoulder. Just the sight of the wobbling bag fills you with anger. It tells you <i>exactly</i> who needs a foot up their ass.");
					output("\n\n<i>“Are you still going to fight us? We’ll call it even, just walk away!”</i> one calls.");
					if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO) output(" <i>“Think you can take it back? You really don’t want to walk away now?”</i> Fuck that! No way you’re walking away, not without your stuff!");
					else if (kGAMECLASS.ratputation() > RAT_REP_NONE) output(" <i>“Besides, you had this coming, you crook! It’s time you pay for the damage you’ve caused!”</i> Fuck that! And fuck the lies your cousin has spread, too!");
				}
				else 
				{
					output("\n\n<i>“Are you still going to fight us? We’ll call it even, just walk away!”</i> one calls.");
				}
				
				target.removeStatusEffect("Grappled");
			}
		}
		
		private function makeRatThief(target:Creature):RatsRaider
		{
			//Find available rat
			var ratPool:Array = new Array();
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally is RatsRaider && ally.originalRace != "rodenian" && !ally.isDefeated()) ratPool.push(ally);
			var thief:RatsRaider = RandomInCollection(ratPool);
			if (!thief) return null;
			
			kGAMECLASS.ratsStealRiches(thief, target, true);

			return thief;
		}
		private function fleeWithTheMoney(target:Creature):void
		{
			var friendRats:int = 0;
			var friendRat:RatsRaider = null;
			for each (var allyRat:Creature in CombatManager.getHostileActors())
			{
				if (allyRat == this || allyRat.isDefeated() || !(allyRat is RatsRaider)) continue;
				if (friendRat == null || rand(2) == 0) friendRat = allyRat as RatsRaider;
				++friendRats;
			}
			switch(statusEffectv1("Plunder over Pillage!"))
			{
				case 0:
					output("Hesitantly looking around");
					if (friendRat != null) output(" and exchanging knowing looks with " + mf("his", "her") + (friendRats > 1 ? " friends" : " friend"));
					output(", the thieving sack-rat glances over " + mf("his", "her") + " shoulder. She steps back, but with lightning reflexes you " + target.rangedWeapon.attackVerb + " your [pc.rangedWeapon] at their feet. <b>Looks like " + mf("he", "she") + "’s trying to make off with <i>your</i> stuff! Better take " + mf("him", "her") + " down fast before they get an opening!</b>");
					break;
				case 1:
					output("The rat " + mf("boy", "girl") + " carrying the loot-laden pack gains hops back and you snap off another shot at their feet. " + mf("He", "She") + " hops again and yelps, looking at you with sweat beading on " + mf("his", "her") + " face. <b>That rat’s about to dart. If you don’t want to lose your hard-earned cash, you’ve got to make the next attack count!</b>");
					break;
				case 2:
					if (friendRat != null) output("<i>“Go, " + (friendRats > 1 ? "we’ve" : "I’ve") + " got this! We’ll catch you later!”</i> " + (friendRats > 1 ? "another" : "the other") + " rat shouts, jumping to guard " + friendRat.mf("his", "her") + " friend. ");
					output("You dash for the sack-rat, shooting and swinging manically");
					if (ratCount(false) > 1) output(" around the body-blocking runt");
					output(". " + mf("He", "She") + " proves too quick, however, hopping and slinking away. <i>“It’s mine now, mine, mine!”</i> The thief cackles infuriatingly, dodging your shots and disappearing into darkness. <i>Damn it!</i>");
					break;
			}
			addStatusValue("Plunder over Pillage!",1,1);
		}
		//This part is done at the end of the turn to avoid skipping actions
		public static function sackRatFlees(alliedCreatures:Array):void
		{
			var thief:RatsRaider = getThiefRat();
			if (!thief) return;
			if (thief.statusEffectv1("Plunder over Pillage!") < 3) return;
			alliedCreatures.splice(alliedCreatures.indexOf(thief),1);
			thief.setLastFallenRat();
		}
	
		public static function processTallHate(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var hornyRats:int = 0;
			var noTallbois:Boolean = true;
			for each (var enemy:Creature in hostileCreatures)
				if (enemy.tallness >= 6*12+5) noTallbois = false;
			for each (var rat:Creature in alliedCreatures)
				if (rat is RatsRaider && rat.lust() > 80) ++hornyRats;
			
			if (noTallbois || hornyRats >= 2 || rand(3) != 0) return;
			
			kGAMECLASS.setTarget(getLeaderRat(false));
			if (ratCount(false) > 1) output("\n\nYour sheer height and imposing stature fuels a fire burning in the rodents. Whether that fire is the ubiquitous desire for victory or a financially grand delusion you’re not sure. But one thing’s certain: their steely determination is pushing their lust out, and they only seem to get riled up the longer things go on...");
			else output("\n\nEven though you tower over the hunching rodent, your looming frame only fuels a fire burning in [target.hisHer] belly. That fire is certainly burning away whatever lust may eating at the edge of [target.hisHer] mind, and [target.heShe] is becoming dangerously riled...");
			
			var lustLoss:int;
			for each (rat in alliedCreatures)
			{
				if (rat.isDefeated() || !(rat is RatsRaider)) continue;
				lustLoss = Math.min(15, rat.lust());
				rat.lust(-lustLoss);
				if (lustLoss > 0) {
					var damageResult:DamageResult = new DamageResult();
					damageResult.lustDamage = (-1 * lustLoss);
					outputDamage(damageResult);
				}
			}
			//Show lust loss
			CombatManager.showCombatUI();
		}
		
		public function setLastFallenRat():void
		{
			kGAMECLASS.flags["RAT_LAST_DOWN"] = this;
		}
	}
}