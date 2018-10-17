package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Armor.RattyArmor;
	import classes.Items.Protection.SalamanderShield;
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
	
	public class RatsRaider extends Creature
	{
		private var bustName:String = "YAMMI";
		private static const specialCost:int = 40;
		private var specialAttacks:Array;
		
		public static const PINK_RODENIAN:int = 0;
		public static const TAN_MOUSEBOY:int = 1;
		public static const HALF_GIRL:int = 2;
		public static const WHITE_RODENIAN:int = 3;
		public static const FAIR_MOUSEBOY:int = 4;
		public static const HALF_BOY:int = 5;
		
		public static const RAT_REP_NONE:int = 0;
		public static const RAT_REP_LOW:int = 1;
		public static const RAT_REP_MID:int = 2;
		public static const RAT_REP_HIGH:int = 3;
		public static const RAT_REP_GOOD_CEO:int = 4;
		
		public function RatsRaider(ratVariety:int = 0)
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.btnTargetText = "Rodent";
			this.short = "rodent";
			this.a = "the ";
			this.capitalA = "The ";
						
			this.hipRatingRaw = 5;
			this.buttRatingRaw = 5;
			
			this.hairLength = 7;
			
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
			
			//Set race
			switch (ratVariety)
			{
				//Rodenians
				case PINK_RODENIAN: case WHITE_RODENIAN:					
					bustName = "MABBS";
					originalRace = "rodenian";
					
					hairLength = 12;
					
					hipRatingRaw = 7;
					buttRatingRaw = 9;
					
					skinType = GLOBAL.SKIN_TYPE_FUR;
					faceType = GLOBAL.TYPE_MOUSE;
					addFaceFlag(GLOBAL.FLAG_MUZZLED);
					break;
				//Mouse-boys
				case TAN_MOUSEBOY: case FAIR_MOUSEBOY:
					hipRatingRaw = 7;
					buttRatingRaw = 4;
					
					clearArmFlags();
					legType = GLOBAL.TYPE_HUMAN;
					legFlags = [GLOBAL.FLAG_PLANTIGRADE];
					
					//Check Butts
					if (kGAMECLASS.flags["RAT_ANUSES_TAKEN"] == undefined) analVirgin = true;
					else if (kGAMECLASS.flags["RAT_ANUSES_TAKEN"] & 1<<ratVariety) analVirgin = false;
					else analVirgin = true;

					bustName = "ANNO";
					
					break;
				//Half-rodenians
				case HALF_BOY: case HALF_GIRL: default:
					originalRace = "half-rodenian";
					break;
			}
			
			//Set gender
			switch (ratVariety)
			{
				//Females
				case PINK_RODENIAN: case WHITE_RODENIAN: case HALF_GIRL: default:
					btnTargetText += " Girl";
					short += " girl";
					
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
					intelligenceRaw = 36;
					willpowerRaw = 16;
					
					specialAttacks = ["flashbang", "stun gun"];
					
					break;
				//Males
				case TAN_MOUSEBOY: case FAIR_MOUSEBOY: case HALF_BOY:
					btnTargetText += " Boy";
					short += " boy";
					tallness = 64; //default

					nippleColor = "peach";
					
					characterClass = GLOBAL.CLASS_MERCENARY;
					
					thickness = 25;
					tone = 70;
					femininity = 35;
					
					physiqueRaw = 36;
					reflexesRaw = 32;
					intelligenceRaw = 16;
					willpowerRaw = 24;
					
					createCock(8);
					cocks[0].cThicknessRatioRaw = 1.1;
					balls = 2;
					ballSizeRaw = 6;
					
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
					eyeColor = "bright green";
					hairColor = "golden-blonde with purple highlights";
					nippleColor = "light pink";
					break;
				case WHITE_RODENIAN:
					tallness = 61;
					skinTone = "tan";
					furColor = "white";
					eyeColor = "red";
					hairColor = "dirty-blonde";
					nippleColor = "dark red";
					break;
				case TAN_MOUSEBOY:
					tallness = 62;
					skinTone = "tan";
					eyeColor = "hazel";
					hairColor = "black";
					break;
				case FAIR_MOUSEBOY:
					tallness = 66;
					skinTone = "fair";
					eyeColor = "brown";
					hairColor = "light brown";
					break;
				case HALF_GIRL:
					tallness = 59;
					skinTone = "fair";
					furColor = "gray";
					eyeColor = "blue";
					hairColor = "white";
					nippleColor = "dark red";
					
					hipRatingRaw = 8;
					buttRatingRaw = 6;
					
					createVagina();
					vaginas[0].hymen = false;
					vaginas[0].wetnessRaw = 4;
					clitLength = 0.9;
					
					bustName = "ERRA";
					break;
				case HALF_BOY:
					tallness = 65;
					femininity = 40;
					skinTone = "chocolate";
					furColor = "black";
					eyeColor = "violet";
					hairColor = "light brown";
					
					hipRatingRaw = 9;
					buttRatingRaw = 8;
					
					bustName = "LIAMME";
					break;
			}
			
			//Set likes
			switch(ratVariety)
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
			
			createPerk("Appearance Enabled");
			createPerk("Inhuman Desire", 25);
			createPerk("Giant Slayer", 6*12+1, 10);

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return bustName;
		}
		
		public function isLeaderRat():Boolean
		{
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally is RatsRaider && !ally.isImmobilized() && !ally.isDefeated())
					return ally == this;
			return false;
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var possibleAttacks:Array = ["shock prod", "tail lash"];
			if (energy() >= specialCost)
			{
				if (specialAttacks.indexOf("headbutt") >= 0 && !target.hasStatusEffect("Stunned"))
					possibleAttacks.push("headbutt");
				if (specialAttacks.indexOf("leg strike") >= 0 && !target.hasStatusEffect("Tripped"))
					possibleAttacks.push("leg strike");
				if (specialAttacks.indexOf("stun gun") >= 0 && !target.hasStatusEffect("Stunned"))
					possibleAttacks.push("stun gun");
				if (specialAttacks.indexOf("flashbang") >= 0 && !target.isBlind())
					possibleAttacks.push("flashbang");
			}
			if (shields() < shieldsMax()/2 && !hasStatusEffect("Rat Boost Used"))
				possibleAttacks.push("shield boost", "shield boost", "shield boost");
			if (dogpileReady(target)) possibleAttacks = [dogpileStart];
			
			/*if (!hasStatusEffect("Rat Revive Used"))
				for each (var ally:Creature in alliedCreatures)
					if (ally is RatsRaider && ally.HP() <= 0)
						possibleAttacks = ["revive"];*/
			
			if (target.isGrappled()) possibleAttacks = [dogpile];	
			
			if (isLeaderRat() && HPQ() < 75 && !target.hasStatusEffect("Stunned") && rand(2))
			{
				CombatAttacks.applyStun(target);
				output("The leader stuns you in preparation!\n");
				return;
			}	
			
			var move:* = RandomInCollection(possibleAttacks);
			if (move is String) output("The rat uses " + move + "!");
			else if (move is Function) move(target);
		}
		
		public static function ratCount():Number
		{
			var rats:Number = 0;
			for each (var ally:Creature in CombatManager.getHostileActors())
				if ((ally is RatsRaider && !ally.isImmobilized() && !ally.isDefeated())) ++rats;
			return rats;
		}	
		
		private function dogpileReady(target:Creature):Boolean
		{
			if (!isLeaderRat()) return false;
			if (!target.hasStatusEffect("Stunned")) return false;
			if (target.hasStatusEffect("Dogpiled")) return false;
			if (ratCount() < 2) return false;
			return true;
		}
		
		private function dogpileStart(target:Creature):void
		{
			var dialog:Array = ["Our prize awaits!", "Now you're in for it!", "All you had to do was pay up!", "Come on, [pc.he]'s open!"];
			if (kGAMECLASS.silly) dialog.push("No-no, mustn't let [pc.himHer] get away!");
			if (kGAMECLASS.ratputation() == RAT_REP_GOOD_CEO) dialog.push("Ha-ha! [pc.Mister] CEO, you know what's coming!");
			else if (kGAMECLASS.ratputation() != RAT_REP_NONE) dialog.push("Ha! The corporate stooge is out of [pc.hisHer] element! Now, now, take all of it!");

			output("<i>\"" + RandomInCollection(dialog) + "\"</i> yells one of the raiders, and you feel " + num2Text(ratCount()) + " bodies smash into you. Unable to resist, you are tackled to the floor. You flail defiant, madly struggling against their quick-fingered hands and constricting tails as they crawl upon and pin you. If you don't shake your stupor, <b>who knows what they're going to do</b>!");

			target.removeStatusEffect("Stunned");
			CombatAttacks.applyGrapple(target);
		}
		
		private function dogpile(target:Creature):void
		{
			if (!isLeaderRat()) return;
			
			kGAMECLASS.setTarget(this);
			
			if (target.statusEffectv4("Grappled") == 0)
			{
				output("You lose grip of your [pc.weapon], fighting against the arms and heavy legs on your biceps to shake the mouse [target.boyGirl] off your face. The thought of getting to your valuables excites them beyond belief - they laugh triumphantly as their sticky fingers dig through your exposed inventory in search of wealth, mineral or digital.");
		
				if (CombatManager.enemiesAlive() == 2) output("\n\nWhilst one saucer-eared thief probes your vulnerable belongings, the other plants [target.hisHer] crotch on your neck, blinding you under [target.hisHer] round butt and muffling sound with plump thighs. The rapacious rat can't help but grope you in between countering your fleeting moments of limp resistance, forcing you to groan into indistinct nether regions with a mix of lust and pain.");
				else output("\n\nTwo mouse pirates pin you down, one sitting atop your groin and the other above your chin. [target.HeShe] snickers happily with [target.hisHer] hands on your [pc.chest] and [target.hisHer] damp, quivering butt dragging over your face. No matter how hard you think you're thrashing, it's all limp resistance to them, and worse, they can't help but steal gropes at your body. You can only writhe feebly under their combined bodyweight.");
			}
			else if (rand(2) == 0)
			{
			
			}
			else
			
			//Lust for gold
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally is RatsRaider && !ally.isDefeated())
					ally.lust(3+rand(5));
			target.
					
			target.addStatusValue("Grappled",4,1);
			if (target.statusEffectv4("Grappled") >= 3)
			{
				target.removeStatusEffect("Grappled");
				target.createStatusEffect("Dogpiled",0,0,0,0,true,"","",true);
			}
		}
	}
}