package classes {
	import classes.Characters.*;
	import classes.CockClass;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.SingleCombatAttack;
	import classes.Items.Accessories.*;
	import classes.Items.Apparel.SavicitePanties;
	import classes.Items.Armor.*;
	import classes.Items.Armor.Unique.Omnisuit;
	import classes.Items.Guns.*;
	import classes.Items.Melee.*;
	import classes.Items.Miscellaneous.*;
	import classes.Items.Piercings.*;
	import classes.Items.Transformatives.*;
	import classes.Items.Treasures.Savicite;
	import classes.Items.Treasures.Lucinite;
	import classes.Ships.IOwner;
	import classes.Ships.Modules.ShipModule;
	import classes.VaginaClass;
	import classes.BreastRowClass;
	import classes.StorageClass;
	import classes.ItemSlotClass;
	import classes.DataManager.Serialization.*;
	import flash.utils.describeType;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import classes.GameData.StatTracking;
	import classes.Engine.Utility.*;
	import flash.utils.ByteArray;
	import classes.GLOBAL;
	import classes.GameData.Pregnancy.PregnancyManager;
	import classes.Util.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.inCombat;
	import classes.GameData.CodexManager;
	import classes.Engine.Interfaces.*;

	/**
	 * I cannot yet implement "smart" detection of which characters (or furthermore, what *properties* of which characters)
	 * actually need to be serialized, because the raw storage types used throughout the Creature class (f.ex Cocks Array) are
	 * not aware of their parent class. One of the next goals will be to replace the raw storage containers with some form of
	 * interface container that can be aware of it's parent, and tie back into the serialization state.
	 * This needs to be done ti chain the getSaveObject()/loadSaveObject() to completion anyway, but we can then also hook back
	 * into a property on the parent container to detect changes-over-default. This would enable "deltasaves" in effect, where
	 * the only values stored are values that differ from compile-time values for each creature.
	 * Note to self: mx.utils has some describeType caching which may be a thing to look at. It also has some handy-dandy features
	 * for checking class properties (isDynamic etc, mx.utils.ObjectUtil)
	 */
	public class Creature extends VersionedSaveable implements IOwner {
		/**
		 * NeverSerialize is a seperate flag that can be applied on a creature-by-creature basis. Any creature with the
		 * NeverSerialize flag set will be omitted from the save/load process. There are probably many Creatures that will
		 * never actually need persistent storage throughout the lifetime of the game, so storing their state in player saves
		 * seems much overkill.
		 */
		protected var _neverSerialize: Boolean = false;
		public function get neverSerialize(): Boolean {
			return _neverSerialize;
		}

		private static const STAT_CLAMP_VALUE:Number = 0;
		
		//Constructor
		public function Creature() {
			_ignoredFields.push(
				"neverSerialize", 
				"droneTarget", 
				"concentratedFireTarget",
				"uniqueName",
				"flags",
				"bustDisplay",
				"buttonText",
				"btnTargetText",
				"alreadyDefeated",
				"shieldDisplayName",
				"hpDisplayName",
				"skipIntercept",
				"skipTurn",
				"_skipRound",
				"OnTakeDamageOutput",
				"isUniqueInFight",
				"_long",
				"assignedModule",
				"Index"
			);
			
			cocks = new Array();
			vaginas = new Array();
			breastRows = new Array();
			breastRows[0] = new BreastRowClass();
			perks = new Array();
			statusEffects = new Array();
			keyItems = new Array();
			inventory = new Array();
			sexualPreferences = new SexualPreferences();
			
			pregnancyData = new Array();
			for (var i:int = 0; i < 4; i++)
			{
				pregnancyData.push(new PregnancyData());
			}
		}

		//For enemies
		public var short: String = "";
		public var originalRace: String = "human";
		public var a: String = "a ";
		
		// This is an end-run around trying to wrangle overrideable static functions. It means setup is a little messier but it can be hidden.
		public function get Index():String
		{
			return kGAMECLASS.charDict[this];
		}
		
		// Tired of playing silly bastard games with long
		private var _long:String = "You scrawny, yo."
		public function get long():String { return _long; }
		public function set long(v:String):void { _long = v; }
		
		public var capitalA: String = "A ";

		//Is a creature a 'pluralize' encounter - mob, etc. 
		public var isPlural:Boolean = false;

		public var fluidSimulate:Boolean = false;
		public var lustSimulate:Boolean = false;
		public var statusSimulate:Boolean = false;

		public var customDodge: String = "";
		public var customBlock: String = "";

		//Clothing/Armor
		public var meleeWeapon: ItemSlotClass = new EmptySlot();
		public var rangedWeapon: ItemSlotClass = new EmptySlot();
		public var armor: ItemSlotClass = new EmptySlot();
		public var upperUndergarment: ItemSlotClass = new EmptySlot();
		public var lowerUndergarment: ItemSlotClass = new EmptySlot();
		public var accessory: ItemSlotClass = new EmptySlot();
		public var shield: ItemSlotClass = new EmptySlot();

		public var inventory: Array = new Array();

		public var typesBought: Array = new Array();
		public var sellMarkup: Number = 1;
		public var buyMarkdown: Number = 1;
		public var keeperGreeting: String = "<i>“Hello and welcome to my shop. Take a gander and let me know if you see anything you like,”</i> " + a + short + " says with a smile.\n";
		public var keeperBuy: String = "What would you like to buy?\n";
		public var keeperSell: String = "What would you like to sell?\n";

		//Primary stats
		private var _physiqueRaw: Number = 3;
		public function get physiqueRaw():Number
		{
			return _physiqueRaw;
		}
		public function set physiqueRaw(v:Number):void
		{
			if (v < Creature.STAT_CLAMP_VALUE)
			{
				_physiqueRaw = Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				_physiqueRaw = v;
			}
		}

		private var _reflexesRaw: Number = 3;
		public function get reflexesRaw():Number
		{
			return _reflexesRaw;
		}
		public function set reflexesRaw(v:Number):void
		{
			if (v < Creature.STAT_CLAMP_VALUE)
			{
				_reflexesRaw = Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				_reflexesRaw = v;
			}
		}

		private var _aimRaw: Number = 3;
		public function get aimRaw():Number
		{
			return _aimRaw;
		}
		public function set aimRaw(v:Number):void
		{
			if (v < Creature.STAT_CLAMP_VALUE)
			{
				_aimRaw = Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				_aimRaw = v;
			}
		}

		private var _intelligenceRaw: Number = 3;
		public function get intelligenceRaw():Number
		{
			return _intelligenceRaw;
		}
		public function set intelligenceRaw(v:Number):void
		{
			if (v < Creature.STAT_CLAMP_VALUE)
			{
				_intelligenceRaw = Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				_intelligenceRaw = v;
			}
		}

		private var _willpowerRaw: Number = 3;
		public function get willpowerRaw():Number
		{
			return _willpowerRaw;
		}
		public function set willpowerRaw(v:Number):void
		{
			if (v < Creature.STAT_CLAMP_VALUE)
			{
				_willpowerRaw = Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				_willpowerRaw = v;
			}
		}

		private var _libidoRaw: Number = 5;
		public function get libidoRaw():Number
		{
			return _libidoRaw;
		}
		public function set libidoRaw(v:Number):void
		{
			if (v < Creature.STAT_CLAMP_VALUE)
			{
				_libidoRaw = Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				_libidoRaw = v;
			}
		}

		private var _taintRaw: Number = 0;
		public function get taintRaw():Number
		{
			return _taintRaw;
		}
		public function set taintRaw(v:Number):void
		{
			if (v < Creature.STAT_CLAMP_VALUE)
			{
				_taintRaw = Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				_taintRaw = v;
			}
		}
		
		public var physiqueMod: Number = 0;
		public var reflexesMod: Number = 0;
		public var aimMod: Number = 0;
		public var intelligenceMod: Number = 0;
		public var willpowerMod: Number = 0;
		public var libidoMod: Number = 0;
		public var taintMod: Number = 0;

		public var affinity: String = "intelligence";
		public var characterClass: int = GLOBAL.CLASS_SMUGGLER;
		public var personality: int = 50;
		public var exhibitionismRaw: Number = 0;

		//Combat Stats
		// I think some of my UI work has highlighted some areas where stats are doing things that aren't intended, or otherwise possibly broken.
		// The safest way I can think of fixing these issues, is to clamp the potential possible values given to the raw vars.
		
		// HP should probably never go BELOW 0, as it has implications on rest mechanics.
		private var _HPRaw: int = 0;
		
		public function get HPRaw():int { return _HPRaw; }
		public function set HPRaw(v:int):void
		{
			if (v < 0)
			{
				_HPRaw = 0;
			}
			else
			{
				_HPRaw = v;
			}
		}
		
		public var HPMod: int = 0;

		public var shieldsRaw: int = 0;
		public var lustRaw: Number = 0;
		public var lustMod: Number = 0;
		public var energyRaw: Number = 100;
		public var energyMod: Number = 0;
		public var teaseLevel: Number = 0;
		public var teaseXP: Number = 0;

		//Resistances
		public var baseHPResistances:TypeCollection = new TypeCollection();
		public var baseShieldResistances:TypeCollection = new TypeCollection();
		
		public function getShieldResistances():TypeCollection
		{
			var r:TypeCollection = baseShieldResistances.makeCopy();
			if (!(shield is EmptySlot)) r.combineResistances(shield.resistances);
			if (hasPerk("Enhanced Dampeners"))
			{
				for (var i:uint = 0; i < DamageType.NUMTYPES; i++)
				{
					var type:DamageType = r.getType(i);
					if (type.resistanceValue < 0) type.resistanceValue /= 2;
				}
			}
			return r;
		}
		
		public function getHPResistances():TypeCollection
		{
			var r:TypeCollection = baseHPResistances.makeCopy();
			if (!(armor is EmptySlot)) r.combineResistances(armor.resistances);
			if (!(lowerUndergarment is EmptySlot)) r.combineResistances(lowerUndergarment.resistances);
			if (!(upperUndergarment is EmptySlot)) r.combineResistances(upperUndergarment.resistances);
			if (!(accessory is EmptySlot)) r.combineResistances(accessory.resistances);
			
			// Effect: Boosts max HP and poison resistance by 10% for 24 hours
			if (hasStatusEffect("Heart Tea")) r.poison.damageValue = r.poison.damageValue * 1.1;
			if (hasStatusEffect("Hot Meal")) r.freezing.resistanceValue += 10.0;
			
			// Effect: Adds +10% Electric, -10% Burning, +10% Kinetic, +10% Corrosive
			// Fen Nerf: -35% Burning
			if (hasStatusEffect("Resin"))
			{
				r.electric.damageValue += 10;
				r.burning.damageValue -= 35;
				r.kinetic.damageValue += 10;
				r.corrosive.damageValue += 10;
			}
			
			if (hasStatusEffect("Oil Warmed"))
			{
				r.freezing.damageValue += Math.ceil(MathUtil.LinearInterpolate(5, 15, getStatusMinutes("Oil Warmed") / 1440));
			}
			if (hasStatusEffect("Oil Cooled"))
			{
				r.burning.damageValue += Math.ceil(MathUtil.LinearInterpolate(5, 15, getStatusMinutes("Oil Cooled") / 1440));
			}
			
			if ((accessory.hasFlag(GLOBAL.ITEM_FLAG_SHELTER) || armor.hasFlag(GLOBAL.ITEM_FLAG_SHELTER) || shield.hasFlag(GLOBAL.ITEM_FLAG_SHELTER)) && !inCombat())
			{
				r.kinetic.resistanceValue += 60;
				r.electric.resistanceValue += 60;
				r.burning.resistanceValue += 60;
				r.freezing.resistanceValue += 60;
				r.corrosive.resistanceValue += 60;
				r.poison.resistanceValue += 60;
			}
			
			//-20% electric, kinetic, +40% lust. maybe rebalance? -lighter
			if (hasStatusEffect("Tenderized"))
			{
				r.kinetic.damageValue -= 20;
				r.electric.damageValue -= 20;
				r.drug.damageValue += 40;
				r.tease.damageValue += 40;
				r.psionic.damageValue += 40;
				r.pheromone.damageValue += 40;
			}
			//-10% everything (including lust, right now)
			if (hasStatusEffect("Brutalized"))
			{
				r.add(-10);//TEST
			}
			
			if (hasStatusEffect("Torra Lust Weakness")) r.tease.damageValue -= statusEffectv2("Torra Lust Weakness");
			
			//drop cold resist 10% for each chunk of lucinite carried
			if (hasItemByClass(Lucinite)) r.freezing.resistanceValue -= (10 * numberOfItemByClass(Lucinite));
			
			return r;
		}
		
		public function getLustResistances():TypeCollection
		{
			var r:TypeCollection = new TypeCollection();
			if (shieldsRaw > 0) r.combineResistances(getShieldResistances());
			r.combineResistances(getHPResistances());
			return r;
		}
		
		public var isLustImmune:Boolean = false;

		//Level Caps
		public function levelMin():int
		{
			return 1;
		}
		public function levelMax():int
		{
			return levelEnd();
		}
		public function levelEnd():int
		{
			return 20;
		}
		
		//Level Stats
		public var XPRaw: Number = 0;
		public var level: Number = 1;
		public var credits: Number = 500;
		//Perks used to store 'queued' perk buys
		public var perkPoints: Number = 0;
		
		// Stats NaN Hotfix
		public function updateStats():void 
		{
			if(isNaN(XPRaw)) XPRaw = 0;
			if(isNaN(level)) level = 1;
			if(isNaN(credits)) credits = 0;
			if(isNaN(perkPoints)) perkPoints = 0;
		}

		//Appearance Variables
		public var femininity: Number = 50;
		public function femininityUnlocked(newFem:Number):Boolean 
		{
			if(newFem < femininityMin() || newFem > femininityMax()) return false;
			return true;
		}
		public function femininityLockedMessage():String 
		{
			return "Your [pc.face] warms, but nothing happens.";
		}
		
		public var eyeType: Number = 0;
		public function eyeTypeUnlocked(newEyeType:int):Boolean 
		{
			if (eyeType == GLOBAL.TYPE_SYNTHETIC) return false;
			return true;
		}
		public function eyeTypeLockedMessage():String
		{
			return "Your [pc.eye] twitches, resisting a change.";
		}
		
		public var eyeColor: String = "";
		public function eyeColorUnlocked(newEyeColor:String):Boolean 
		{
			if (eyeType == GLOBAL.TYPE_SYNTHETIC) return false;
			return true;
		}
		public function eyeColorLockedMessage():String 
		{
			return "Your [pc.eye] twitches, resisting a change.";
		}
		public function eyeCount():int
		{
			if (eyeType == GLOBAL.TYPE_ARACHNID) return 4;
			if (eyeType == GLOBAL.TYPE_XHELARFOG) return 3;
			return 2;
		}
		//New piercing hotness:
		public var eyebrowPiercing:ItemSlotClass = new EmptySlot();
		
		public var tallness: Number = 0;
		public function tallnessUnlocked(newTallness:Number):Boolean
		{
			return true;
		}
		public function tallnessLockedMessage():String
		{
			return "You feel momentarily drawn out, stretched even. The sensation passes as soon as it came.";
		}

		public var thickness: Number = 0;
		public function thicknessMin():Number
		{
			return 0;
		}
		public function thicknessMax():Number
		{
			return 100;
		}
		public function thicknessUnlocked(newThickness:Number):Boolean
		{
			return true;
		}
		public function thicknessLockedMessage():String
		{
			return "You feel momentarily bloated. It passes without incident.";
		}

		public var tone: Number = 0;
		public function toneMin():Number
		{
			return 0;
		}
		public function toneMax():Number
		{
			if(hasSkinFlag(GLOBAL.FLAG_SQUISHY))
			{
				if (this is PlayerCharacter && flags["AMBER_SEED_USED"] != undefined && (flags["AMBER_SEED_USED"] & AmberSeed.FLAG_GOO_TONE) == AmberSeed.FLAG_GOO_TONE) return 70;
				return 30;
			}
			return 100;
		}
		public function toneUnlocked(newTone:Number):Boolean
		{
			if(hasSkinFlag(GLOBAL.FLAG_SQUISHY) && newTone > tone && newTone >= toneMax()) return false;
			return true;
		}
		public function toneLockedMessage():String
		{
			if(hasSkinFlag(GLOBAL.FLAG_SQUISHY)) return "You feel a slight soreness but nothing seems to come of it. Your squishy body makes it apparent that you can’t get any more tone than you are now!";
			return "You twitch, feeling momentarily sore. Nothing seems to come of it.";
		}

		public var hairColor: String = "no";
		public function hairColorUnlocked(newHairColor:String):Boolean
		{
			return true;
		}
		public function hairColorLockedMessage():String
		{
			return "Your scalp briefly tingles, but your [pc.hair] remains unchanged.";
		}

		public var beardColor: String = hairColor;
		public function beardColorUnlocked(newBeardColor:String):Boolean
		{
			return true;
		}
		public function beardColorLockedMessage():String
		{
			return "Your chin briefly tingles, but your [pc.beard] remains unchanged.";
		}

		public var scaleColor: String = "blue";
		public function scaleColorUnlocked(newScaleColor:String):Boolean
		{
			if (hasStatusEffect("Gel Body")) return false;
			return true;
		}
		public function scaleColorLockedMessage():String
		{
			return "Your scales briefly itch, but nothing happens.";
		}

		public var furColor: String = "brown";
		public function furColorUnlocked(newFurColor:String):Boolean
		{
			if (hasStatusEffect("Gel Body")) return false;
			return true;
		}
		public function furColorLockedMessage():String
		{
			return "Your fur briefly itches, but nothing happens.";
		}

		public var hairLength: Number = 0;
		public var hairStyle:String = "null";
		public function hairLengthUnlocked(newHairLength:Number):Boolean
		{
			if (hasPerk("Mane") && newHairLength <= 3 && newHairLength < hairLength) return false;
			if (hairType == GLOBAL.HAIR_TYPE_GOO && (skinType == GLOBAL.SKIN_TYPE_GOO || hasStatusEffect("Goo Vent"))) return false;
			return true;
		}
		public function hairLengthLockedMessage():String
		{
			if (hasPerk("Mane")) return "Your scalp briefly tingles, but your [pc.hair] refuses to change. It seems your mane can’t get any shorter!";
			return "Your scalp briefly tingles, but your [pc.hair] remains unchanged.";
		}

		public var hairType: Number = 0;
		public function hairTypeUnlocked(newHairType:Number):Boolean
		{
			if (hairType == GLOBAL.HAIR_TYPE_GOO && (skinType == GLOBAL.SKIN_TYPE_GOO || hasStatusEffect("Goo Vent"))) return false;
			return true;
		}
		public function hairTypeLockedMessage():String
		{
			return "Your scalp briefly tingles, but your [pc.hair] remains unchanged.";
		}

		public var beardType: Number = hairType;
		public function beardTypeUnlocked(newBeardType:Number):Boolean
		{
			if (beardType == GLOBAL.HAIR_TYPE_GOO && (skinType == GLOBAL.SKIN_TYPE_GOO || hasStatusEffect("Goo Vent"))) return false;
			return true;
		}
		public function beardTypeLockedMessage():String
		{
			return "Your chin briefly tingles, but your [pc.beard] remains unchanged.";
		}
		
		public var beardLength: Number = 0;
		public function beardLengthUnlocked(newBeardLength:Number):Boolean
		{
			return true;
		}
		public function beardLengthLockedMessage():String
		{
			return "Your chin briefly tingles, but your [pc.beard] remains unchanged.";
		}

		public var beardStyle: Number = 0;
		public function beardStyleUnlocked(newBeardStyle:Number):Boolean
		{
			if (beardStyle == 11 && hasMuzzle()) return false; // lynx sideburns are not exactly beard
			return true;
		}
		public function beardStyleLockedMessage():String
		{
			return "Your chin briefly tingles, but your [pc.beard] remains unchanged.";
		}

		public var skinType: Number = 0;
		public function skinTypeUnlocked(newSkinType:Number):Boolean
		{
			if(hasPerk("Black Latex") && newSkinType != GLOBAL.SKIN_TYPE_LATEX) return false;
			return true;
		}
		public function skinTypeLockedMessage():String
		{
			if(hasPerk("Black Latex")) return "Your rubbery skin briefly tingles, but stops shortly after, blocking any attempt to change it.";
			return "Your [pc.skin] briefly itches, but nothing happens.";
		}

		public var skinTone: String = "albino";
		public var skinAccent: String = "";
		public function hasAccentMarkings():Boolean
		{
			if(skinAccent == "") return false;
			return (hasStatusEffect("Vanae Markings") || hasStatusEffect("Shark Markings") || hasStatusEffect("Body Markings") || hasPerk("Primorditatts"));
		}
		public function clearAccentMarkings():void
		{
			removeStatusEffect("Vanae Markings");
			removeStatusEffect("Hyena Fur");
			removeStatusEffect("Shark Markings");
			removeStatusEffect("Body Markings");
			removePerk("Primorditatts");
			skinAccent = "";
		}
		public function accentMarkings():int
		{
			if(!hasAccentMarkings()) return -1;
			var accentType:int = -1;
			if(hasStatusEffect("Vanae Markings")) accentType = 0;
			if(hasStatusEffect("Hyena Fur")) accentType = statusEffectv1("Hyena Fur");
			if(hasStatusEffect("Shark Markings")) accentType = statusEffectv1("Shark Markings");
			if(hasStatusEffect("Body Markings")) accentType = statusEffectv1("Body Markings");
			if(hasPerk("Primorditatts")) accentType = 7;
			return accentType;
		}
		public function getAccentMarking(accentType:int = -1, asNoun:Boolean = true):String
		{
			switch(accentType)
			{
				case 0: return (asNoun ? "markings" : "marked"); break;
				case 1: return (asNoun ? "stripes" : "striped"); break;
				case 2: return (asNoun ? "spots" : "spotted"); break;
				case 3: return (asNoun ? "blotch" : "blotched"); break;
				case 4: return (asNoun ? "speckles" : "speckled"); break;
				case 5: return (asNoun ? "dapples" : "dappled"); break;
				case 6: return (asNoun ? "piebald" : "piebald"); break;
				case 7: return (asNoun ? "tattoos" : "tattooed"); break;
			}
			return "NO MARKING PATTERN FOUND!";
		}
		public function accentMarkingsDescript(asNoun:Boolean = true, simple:Boolean = false):String
		{
			var desc:String = "";
			if(skinAccent != "" && !simple) desc += skinAccent;
			if(desc != "") desc += " ";
			desc += getAccentMarking(accentMarkings(), asNoun);
			return desc;
		}
		public function skinToneUnlocked(newSkinTone:String):Boolean
		{
			if (hasStatusEffect("Gel Body")) return false;
			if (InCollection(skinType, [GLOBAL.SKIN_TYPE_PLANT, GLOBAL.SKIN_TYPE_BARK])) return false;
			return true;
		}
		public function skinToneLockedMessage():String
		{
			return "Your [pc.skin] briefly itches, but nothing happens.";
		}

		public var skinFlags: Array = new Array();
		public function skinFlagsUnlocked(newFlags:*):Boolean
		{
			return true;
		}
		public function skinFlagsLockedMessage():String
		{
			return "Your [pc.skin] briefly itches, but nothing happens.";
		}

		public var faceType: Number = 0;
		public function faceTypeUnlocked(newFaceType:Number):Boolean
		{
			return true;
		}
		public function faceTypeLockedMessage():String
		{
			return "Your [pc.face] briefly itches, but nothing happens.";
		}

		public var faceFlags: Array = new Array();
		public function faceFlagsUnlocked(newFlags:*):Boolean
		{
			return true;
		}
		public function faceFlagsLockedMessage():String
		{
			return "Your [pc.face] briefly itches, but nothing happens.";
		}
		//New piercing hotness:
		public var nosePiercing:ItemSlotClass = new EmptySlot();

		public var tongueType: Number = 0;
		public function tongueTypeUnlocked(newTongueType:Number):Boolean
		{
			return true;
		}
		public function tongueTypeLockedMessage():String
		{
			return "Your [pc.tongue] feels odd in your mouth but doesn’t change.";
		}

		public var tongueFlags: Array = new Array();
		public function tongueFlagsUnlocked(newFlags:*):Boolean
		{
			return true;
		}
		public function tongueFlagsLockedMessage():String
		{
			return "Your [pc.tongue] feels odd in your mouth but doesn’t change.";
		}
		//New piercing hotness:
		public var tonguePiercing:ItemSlotClass = new EmptySlot();

		public var lipMod:Number = 0;
		public function lipModMin():Number
		{
			var rating:Number = 0;
			rating += statusEffectv3("Mimbrane Face");
			return rating;
		}
		public function lipModUnlocked(newLipMod:Number):Boolean
		{
			if(hasBeak()) return false;
			return true;
		}
		public function lipModLockedMessage():String
		{
			return "Your [pc.lips] feel momentarily hot, but a quick lick confirms that nothing has changed.";
		}
		public var lipColor:String = "peach";
		//New piercing hotness:
		public var lipPiercing:ItemSlotClass = new EmptySlot();

		public var earType: Number = 0;
		public var earLength:Number = 0;
		public function earTypeUnlocked(newEarType:Number):Boolean
		{
			return true;
		}
		public function earTypeLockedMessage():String
		{
			return "Your [pc.ears] are burning. Someone must be talking about you.";
		}
		//New piercing hotness:
		public var earPiercing:ItemSlotClass = new EmptySlot();

		public var antennae: Number = 0;
		public function antennaeUnlocked(newAntennaeNumber:Number):Boolean
		{
			return true;
		}
		public function antennaeLockedMessage():String
		{
			if(antennae == 0) return "Your forehead is burning but nothing changes.";
			if(antennae == 1) return "Your [pc.antenna] tingles for a moment. Someone must be thinking about you.";
			return "Your [pc.antennae] are burning. Someone must be thinking about you.";
		}
		
		public var antennaeType: Number = 0;
		public function antennaeTypeUnlocked(newAntennaeType:Number):Boolean
		{
			return true;
		}
		public function antennaeTypeLockedMessage():String
		{
			if(antennae == 0) return "Your forehead is burning but nothing changes.";
			if(antennae == 1) return "Your [pc.antenna] tingles for a moment. Someone must be thinking about you.";
			return "Your [pc.antennae] are burning. Someone must be thinking about you.";
		}
		
		public var horns:Number = 0;
		public function hornsUnlocked(newHornsNumber:Number):Boolean
		{
			return true;
		}
		public function hornsLockedMessage():String
		{
			if(horns == 0) return "You have a brief headache. It fades as quickly as it came, changing nothing.";
			return "You have a brief headache, centered around your [pc.horns]. It fades as quickly as it came, changing nothing.";
		}
		
		public var hornType: Number = 0;
		public function hornTypeUnlocked(newHornType:Number):Boolean
		{
			return true;
		}
		public function hornTypeLockedMessage():String
		{
			if(horns == 0) return "You have a brief headache. It fades as quickly as it came, changing nothing.";
			return "You have a brief headache, centered around your [pc.horns]. It fades as quickly as it came, changing nothing.";
		}
		
		public var hornLength: Number = 0;
		public function hornLengthUnlocked(newHornLength:Number):Boolean
		{
			return true;
		}
		public function hornLengthLockedMessage():String
		{
			if(horns == 0) return "You have a brief headache. It fades as quickly as it came, changing nothing.";
			return "You have a brief headache, centered around your [pc.horns]. It fades as quickly as it came, changing nothing.";
		}
		
		public var armType: Number = 0;
		public function armTypeUnlocked(newArmType:Number):Boolean
		{
			return true;
		}
		public function armTypeLockedMessage():String
		{
			return "Your [pc.arms] twitch yet resist changing.";
		}
		public var armFlags: Array = new Array();
		
		public var gills: Boolean = false;
		public function gillsUnlocked(newGills:Boolean):Boolean
		{
			return true;
		}
		public function gillsLockedMessage():String
		{
			if(!gills) return "Your neck tingles but nothing changes.";
			return "Your [pc.gills] flutter but do not change.";
		}
		
		public var wingCount:Number = 0;
		public var wingType:Number = 0;
		public function wingTypeUnlocked(newWingType:Number):Boolean
		{
			return true;
		}
		public function wingTypeLockedMessage():String
		{
			if(wingType == 0 || wingCount <= 0) return "There is a tickling sensation around and between your shoulder blades, but nothing changes.";
			if(wingCount == 1) return "Your [pc.wing] radiates with warmth but nothing about it changes.";
			if(!hasWings()) return "Your [pc.wings] radiate with warmth but nothing about them changes.";
			return "Your [pc.wings] flutter but do not change.";
		}

		public var legType: Number = 0;
		public function legTypeUnlocked(newLegType:Number):Boolean
		{
			if (!InCollection(newLegType, [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_SUCCUBUS]) && (hasStatusEffect("Mimbrane Foot Left") || hasStatusEffect("Mimbrane Foot Right"))) return false;
			if (isGoo() && statusEffectv1("Gel Body") >= 1) return false;
			return true;
		}
		public function legTypeLockedMessage():String
		{
			if (hasStatusEffect("Mimbrane Foot Left") && hasStatusEffect("Mimbrane Foot Right")) return "Suddenly your toes flex and dig, showing faint signs of your impending transformation. The appearance subsides, however, and you’re left with your " + feet() + ". With a heavy sigh, it would seem your Mimbranes refuse to give up the shape of your feet to whatever was in store for you before.";
			if (hasStatusEffect("Mimbrane Foot Left") || hasStatusEffect("Mimbrane Foot Right")) return "Suddenly your toes flex and dig, showing faint signs of your impending transformation. The appearance subsides, however, and you’re left with your " + foot() + ". With a heavy sigh, it would seem your Mimbrane refuses to give up the shape of your feet to whatever was in store for you before.";
			if (isGoo() && statusEffectv1("Gel Body") >= 1) return "Your gooey carriage suddenly tingles. A warmth bubbles up and quickly fizzles out, making you feel very much like a carbonated soft-drink.... It seems whatever tried to change didn’t have an effect on you.";
			return "Despite the heat in your [pc.legOrLegs], nothing changes.";
		}
		
		public var legCount: Number = 2;
		public function legCountUnlocked(newLegCount:Number):Boolean
		{
			if ((hasStatusEffect("Mimbrane Foot Left") || hasStatusEffect("Mimbrane Foot Right")) && newLegCount != 2) return false;
			return true;
		}
		public function legCountLockedMessage():String
		{
			if (hasStatusEffect("Mimbrane Foot Left") && hasStatusEffect("Mimbrane Foot Right")) return "Your " + feet() + " clench to an uncomfortable degree, refusing to be removed. The Mimbranes surrounding the extremities seem to counteract any attempts to remove their home.";
			if (hasStatusEffect("Mimbrane Foot Left") || hasStatusEffect("Mimbrane Foot Right")) return "Your " + foot() + " clenches to an uncomfortable degree, refusing to be removed. The Mimbrane surrounding the extremity seems to counteract any attempts to remove its home.";
			return "Despite the heat in your [pc.legOrLegs], nothing changes.";
		}
		
		public var legFlags: Array = new Array();
		public function legFlagsUnlocked(newFlags:*):Boolean
		{
			return true;
		}
		public function legFlagsLockedMessage():String
		{
			return "Despite the heat in your [pc.legOrLegs], nothing changes.";
		}

		public var earFlags: Array = new Array();
		public function earFlagsUnlocked(newFlags:*):Boolean
		{
			return true;
		}
		public function earFlagsLockedMessage():String
		{
			return "Despite the heat in your [pc.ears], nothing changes.";
		}
		
		public var cumType: Number = GLOBAL.FLUID_TYPE_CUM;
		public function cumTypeUnlocked(newCumType:Number):Boolean
		{
			if(cumType == GLOBAL.FLUID_TYPE_SPECIAL_GOO || cumType == GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO) return false;
			return true;
		}
		public function cumTypeLockedMessage():String
		{
			return "Your body fights an internal change, resisting a transformation.";
		}
		
		//0 - Waist
		//1 - Middle of a long tail. Defaults to waist on bipeds.
		//2 - Between last legs or at end of long tail.
		//3 - On underside of a tail, used for driders and the like, maybe?
		public var genitalSpot: Number = 0;
		public function genitalSpotUnlocked(newGenitalSpot:Number):Boolean
		{
			return true;
		}
		public function genitalSpotLockedMessage():String
		{
			return "Your body fights an internal change, resisting a transformation.";
		}

		public function genitalLocation(): Number {
			if (genitalSpot == 1 && legCount == 2) return 0;
			else if (genitalSpot == 3 && isDrider()) return 3;
			return genitalSpot;
		}
		public function resetGenitalLocation(): Number
		{
			if(isDrider()) genitalSpot = 3;
			else if(isTaur()) genitalSpot = 2;
			else if(isNaga()) genitalSpot = 1;
			else genitalSpot = 0;
			
			return genitalSpot;
		}

		public var tailType: Number = 0;
		public function tailTypeUnlocked(newTailType:Number):Boolean
		{
			if (hasTail(GLOBAL.TYPE_VULPINE) && tailCount == 9 && (hasPerk("Enlightened Nine-tails") || hasPerk("Nine-tails") || hasPerk("Corrupted Nine-tails"))) return false;
			if (tailType == GLOBAL.TYPE_CUNTSNAKE) return false;
			if (tailType == GLOBAL.TYPE_COCKVINE) return false;
			return true;
		}
		public function tailTypeLockedMessage():String
		{
			var msg:String = "";
			if (hasTail(GLOBAL.TYPE_VULPINE) && tailCount == 9 && (hasPerk("Enlightened Nine-tails") || hasPerk("Nine-tails") || hasPerk("Corrupted Nine-tails"))) {
				msg += "You are startled by sudden burst of dazzling ";
				if (hasPerk("Enlightened Nine-tails") || hasPerk("Nine-tails")) msg += "azure";
				else msg += "lavender";
				msg += " sparks from your [pc.tails], but nothing is changed.";
				return msg;
			}
			if (tailType == GLOBAL.TYPE_CUNTSNAKE || tailType == GLOBAL.TYPE_COCKVINE)
			{
				msg = "The creature masquerading as a tail seems pretty spooked about something all of a sudden;";
				if (isBiped()) msg += " it’s wrapped itself around your [pc.thigh], clinging on tightly and chirping to itself quietly...."
				else msg += " it’s busy chirping away to itself and thrashing around, almost as if it were trying to seek out a predator....";
				return msg;
			}
			return "Despite the heat at the base of your spine, nothing changes back there.";
		}
		
		public var tailCount: Number = 0;
		public function tailCountUnlocked(newTailCount:Number):Boolean
		{
			if (hasTail(GLOBAL.TYPE_VULPINE) && tailCount == 9 && (hasPerk("Enlightened Nine-tails") || hasPerk("Nine-tails") || hasPerk("Corrupted Nine-tails"))) return false;
			if (tailType == GLOBAL.TYPE_CUNTSNAKE) return false;
			if (tailType == GLOBAL.TYPE_COCKVINE) return false;
			return true;
		}
		public function tailCountLockedMessage():String
		{
			var msg:String = "";
			if (hasTail(GLOBAL.TYPE_VULPINE) && tailCount == 9 && (hasPerk("Enlightened Nine-tails") || hasPerk("Nine-tails") || hasPerk("Corrupted Nine-tails"))) {
				msg += "You are startled by sudden burst of dazzling ";
				if (hasPerk("Enlightened Nine-tails") || hasPerk("Nine-tails")) msg += "azure";
				else msg += "purple";
				msg += " sparks from your [pc.tails], but nothing is changed.";
				return msg;
			}
			if (tailType == GLOBAL.TYPE_CUNTSNAKE || tailType == GLOBAL.TYPE_COCKVINE)
			{
				msg = "The creature masquerading as a tail seems pretty spooked about something all of a sudden;";
				if (isBiped()) msg += " it’s wrapped itself around your [pc.thigh], clinging on tightly and chirping to itself quietly...."
				else msg += " it’s busy chirping away to itself and thrashing around, almost as if it were trying to seek out a predator....";
				return msg;
			}
			return "Despite the heat at the base of your spine, nothing changes back there.";
		}

		public var tailFlags: Array = new Array();
		public function tailFlagsUnlocked(newFlags:*):Boolean
		{
			return true;
		}
		public function tailFlagsLockedMessage():String
		{
			return "Despite the heat at the base of your spine, nothing changes back there.";
		}
		
		//Used to set cunt or dick type for cunt/dick tails!
		public var tailGenitalArg:Number = 0;
		public function tailGenitalArgUnlocked(newTailGenitalArg:Number):Boolean
		{
			return true;
		}
		public function tailGenitalArgLockedMessage():String
		{
			return "Despite the heat in your [pc.tails], nothing changes back there.";
		}
		
		//tailGenital:
		//0 - none.
		//1 - cock
		//2 - vagina
		public var tailGenital: int = 0; // This one is now used to determine if tail genital is native (!=0) or parasitic (==0)
		public function tailGenitalUnlocked(newTailGenital:Number):Boolean
		{
			return true;
		}
		public function tailGenitalLockedMessage():String
		{
			return "Despite the heat in your [pc.tails], nothing changes back there.";
		}
		
		public var tailGenitalColor:String = "pink";
		public function tailGenitalColorUnlocked(newTailGenitalColor:String):Boolean
		{
			return true;
		}
		public function tailGenitalColorLockedMessage():String
		{
			return "Despite the heat in your [pc.tails], nothing changes back there.";
		}

		//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
		public var tailVenom: Number = 0;
		//Tail recharge determines how fast venom/webs comes back per hour.
		public var tailRecharge: Number = 5;
		//hipRating
		//0 - boyish
		//2 - slender
		//4 - average
		//6 - noticable/ample
		//10 - curvy//flaring
		//15 - child-bearing/fertile
		//20 - inhumanly wide
		public var hipRatingRaw:Number = 0;
		public var hipRatingMod:Number = 0;
		public function hipRatingRawMin():Number
		{
			var rating:Number = 0;
			if(hasPerk("Hips Don't Lie") && rating < 18) rating = 18;
			return rating;
		}
		public function hipRatingModMin():Number
		{
			var rating:Number = 0;
			rating += statusEffectv3("Bimboleum");
			return rating;
		}
		
		public function hipRating(arg:Number = 0, apply:Boolean = false):Number
		{
			if (apply)
			{
				hipRatingRaw = arg;
			}
			else
			{
				hipRatingRaw += arg;
			}
			
			var bonus:Number = 0;
			if(hasPerk("Fecund Figure")) bonus += perkv1("Fecund Figure");
			
			var currHipRating:Number = hipRatingRaw + hipRatingMod + bonus;
			
			if (currHipRating < 0)
			{
				return 0;
			}
			else
			{
				return currHipRating;
			}
		}
		
		public function hipRatingUnlocked(newHipRating:Number):Boolean
		{
			return true;
		}
		public function hipRatingLockedMessage():String
		{
			return "Your [pc.hips] tremble, assaulted by sudden warmth, but it fades away without changing a thing. Your body resisted that transformation for some reason.";
		}

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
		public var buttRatingRaw:Number = 0;
		public var buttRatingMod:Number = 0;
		public function buttRatingRawMin():Number
		{
			var rating:Number = 0;
			if(hasPerk("Buttslut") && rating < 18) rating = 18;
			return rating;
		}
		public function buttRatingModMin():Number
		{
			var rating:Number = 0;
			rating += statusEffectv3("Mimbrane Ass");
			rating += statusEffectv4("Bimboleum");
			return rating;
		}
		
		public function buttRating(arg:Number = 0, apply:Boolean = false):Number
		{
			if (apply)
			{
				buttRatingRaw = arg;
			}
			else if (arg != 0)
			{
				buttRatingRaw += arg;
			}
			
			var bonus:Number = 0;
			if(hasPerk("Fecund Figure")) bonus += perkv2("Fecund Figure");
			
			var currButtRating:Number = buttRatingRaw + buttRatingMod + bonus;
			
			if (currButtRating < 0)
			{
				return 0;
			}
			else
			{
				return currButtRating;
			}
		}
		
		public function buttRatingUnlocked(newButtRating:Number):Boolean
		{
			//if(hasPerk("Buttslut") && newButtRating < buttRatingRaw) return false;
			if(hasPerk("Bubble Butt") && newButtRating < 10) return false;
			return true;
		}
		public function buttRatingLockedMessage():String
		{
			return "Your [pc.butt] warms, but nothing happens.";
		}
		
		//Key items
		public var keyItems: Array;

		//Piercings
		public var nipplesPierced: Number = 0;
		public var nipplesPShort: String = "";
		public var nipplesPLong: String = "";
		public var lipPierced: Number = 0;
		public var lipPShort: String = "";
		public var lipPLong: String = "";
		public var tonguePierced: Number = 0;
		public var tonguePShort: String = "";
		public var tonguePLong: String = "";
		public var eyebrowPierced: Number = 0;
		public var eyebrowPShort: String = "";
		public var eyebrowPLong: String = "";
		public var earsPierced: Number = 0;
		public var earsPShort: String = "";
		public var earsPLong: String = "";
		public var nosePierced: Number = 0;
		public var nosePShort: String = "";
		public var nosePLong: String = "";
		
		public function hasPiercingOfClass(ref:Class):Boolean
		{
			if(earPiercing is ref) return true;
			if(eyebrowPiercing is ref) return true;
			if(nosePiercing is ref) return true;
			if(lipPiercing is ref) return true;
			if(tonguePiercing is ref) return true;
			if(bellyPiercing is ref) return true;
			//Nipple.
			var x:int = 0;
			if(bRows() > 0)
			{
				for(x = 0; x < breastRows.length; x++)
				{
					if(breastRows[x].piercing is ref) return true;
				}
			}
			//Vag.
			if(vaginas.length > 0)
			{
				for(x = 0; x < vaginas.length; x++)
				{
					if(vaginas[x].piercing is ref) return true;
				}
			}
			//Clit.
			if(vaginas.length > 0)
			{
				for(x = 0; x < vaginas.length; x++)
				{
					if(vaginas[x].clitPiercing is ref) return true;
				}
			}
			//Cock
			if(cocks.length > 0)
			{
				for(x = 0; x < cocks.length; x++)
				{
					if(cocks[x].piercing is ref) return true;
				}
			}
			return false;
		}
		public function hasPiercing():Boolean
		{
			return (hasEarPiercing() || hasEyebrowPiercing() || hasNosePiercing() || hasLipPiercing() || hasTonguePiercing() || hasBellyPiercing() || hasNipplePiercing() || hasCockPiercing() || hasVaginaPiercing() || hasClitPiercing());
		}
		public function hasEarPiercing():Boolean
		{
			return (!(earPiercing is EmptySlot));
		}
		public function hasEyebrowPiercing():Boolean
		{
			return (!(eyebrowPiercing is EmptySlot));
		}
		public function hasNosePiercing():Boolean
		{
			return (!(nosePiercing is EmptySlot));
		}
		public function hasLipPiercing():Boolean
		{
			return (!(lipPiercing is EmptySlot));
		}
		public function hasTonguePiercing():Boolean
		{
			return (!(tonguePiercing is EmptySlot));
		}
		public function hasBellyPiercing():Boolean
		{
			return (!(bellyPiercing is EmptySlot));
		}
		public function hasNipplePiercing(idx:int = -1):Boolean
		{
			return (hasPiercedNipples(idx));
		}
		public function hasPiercedNipples(idx:int = -1):Boolean
		{
			if(breastRows.length <= 0 || idx >= breastRows.length) return false;
			if(idx < 0)
			{
				for(idx = 0; idx < breastRows.length; idx++)
				{
					if(!(breastRows[idx].piercing is EmptySlot)) return true;
				}
				return false;
			}
			return (!(breastRows[idx].piercing is EmptySlot));
		}
		public function hasCockPiercing(idx:int = -1):Boolean
		{
			return (hasPiercedCocks(idx));
		}
		public function hasPiercedCocks(idx:int = -1):Boolean
		{
			if(cocks.length <= 0 || idx >= cocks.length) return false;
			if(idx < 0)
			{
				for(idx = 0; idx < cocks.length; idx++)
				{
					if(!(cocks[idx].piercing is EmptySlot)) return true;
				}
				return false;
			}
			return (!(cocks[idx].piercing is EmptySlot));
		}
		public function hasVaginaPiercing(idx:int = -1):Boolean
		{
			return (hasPiercedVaginas(idx));
		}
		public function hasPiercedVaginas(idx:int = -1):Boolean
		{
			if(vaginas.length <= 0 || idx >= vaginas.length) return false;
			if(idx < 0)
			{
				for(idx = 0; idx < vaginas.length; idx++)
				{
					if(!(vaginas[idx].piercing is EmptySlot)) return true;
				}
				return false;
			}
			return (!(vaginas[idx].piercing is EmptySlot));
		}
		public function hasClitPiercing(idx:int = -1):Boolean
		{
			return (hasPiercedClits(idx));
		}
		public function hasPiercedClits(idx:int = -1):Boolean
		{
			if(vaginas.length <= 0 || idx >= vaginas.length) return false;
			if(idx < 0)
			{
				for(idx = 0; idx < vaginas.length; idx++)
				{
					if(!(vaginas[idx].clitPiercing is EmptySlot)) return true;
				}
				return false;
			}
			return (!(vaginas[idx].clitPiercing is EmptySlot));
		}
		// Cock-socks
		public function hasCocksock(idx:int = -1, sockType:Class = null):Boolean
		{
			return (hasSockedCocks(idx, sockType));
		}
		public function hasSockedCocks(idx:int = -1, sockType:Class = null):Boolean
		{
			if(cocks.length <= 0 || idx >= cocks.length) return false;
			if(idx < 0)
			{
				for(idx = 0; idx < cocks.length; idx++)
				{
					if (sockType == null && !(cocks[idx].cocksock is EmptySlot)) return true;
					if (sockType != null && (cocks[idx].cocksock is sockType)) return true;
				}
				return false;
			}
			return (sockType == null && !(cocks[idx].cocksock is EmptySlot))
					|| (sockType != null && (cocks[idx].cocksock is sockType));
		}
		//return total lust gain from piercings that cause it
		public function piercingLustGainTotal():Number
		{
			if (!hasPiercing()) return 0;
			var lustGain:Number = 0;
			
			lustGain += piercingLustGainByClass(earPiercing);
			lustGain += piercingLustGainByClass(eyebrowPiercing);
			lustGain += piercingLustGainByClass(nosePiercing);
			lustGain += piercingLustGainByClass(lipPiercing);
			lustGain += piercingLustGainByClass(tonguePiercing);
			lustGain += piercingLustGainByClass(bellyPiercing);
			//Nipple.
			var x:int = 0;
			if(bRows() > 0)
			{
				for(x = 0; x < breastRows.length; x++)
				{
					lustGain += piercingLustGainByClass(breastRows[x].piercing);
				}
			}
			//Vag.
			if(vaginas.length > 0)
			{
				for(x = 0; x < vaginas.length; x++)
				{
					lustGain += piercingLustGainByClass(vaginas[x].piercing);
				}
			}
			//Clit.
			if(vaginas.length > 0)
			{
				for(x = 0; x < vaginas.length; x++)
				{
					lustGain += piercingLustGainByClass(vaginas[x].clitPiercing);
				}
			}
			//Cock
			if(cocks.length > 0)
			{
				for(x = 0; x < cocks.length; x++)
				{
					lustGain += piercingLustGainByClass(cocks[x].piercing);
				}
			}
			
			return lustGain;
		}
		//lust gain for a specific piercing
		public function piercingLustGainByClass(ref:ItemSlotClass=null):Number
		{
			if (ref == null) return 0;
			if (ref is CrudeSaviciteBarPiercing) return .05;
			if (ref is CrudeSaviciteBarPiercings) return .15;
			if (ref is CrudeSaviciteHoopPiercing) return .05;
			if (ref is CrudeSaviciteHoopPiercings) return .1;
			if (ref is CrudeSaviciteRingPiercing) return .05;
			if (ref is CrudeSaviciteRingPiercings) return .1;
			if (ref is CrudeSaviciteStudPiercing) return .05;
			if (ref is CrudeSaviciteStudPiercings) return .15;
			
			return 0;
		}
		//return total min lust from all worn piercings
		public function piercingLustMinTotal():Number
		{
			if (!hasPiercing()) return 0;
			var lustMin:Number = 0;
			
			lustMin += piercingLustMinByClass(earPiercing);
			lustMin += piercingLustMinByClass(eyebrowPiercing);
			lustMin += piercingLustMinByClass(nosePiercing);
			lustMin += piercingLustMinByClass(lipPiercing);
			lustMin += piercingLustMinByClass(tonguePiercing);
			lustMin += piercingLustMinByClass(bellyPiercing);
			//Nipple.
			var x:int = 0;
			if(bRows() > 0)
			{
				for(x = 0; x < breastRows.length; x++)
				{
					lustMin += piercingLustMinByClass(breastRows[x].piercing);
				}
			}
			//Vag.
			if(vaginas.length > 0)
			{
				for(x = 0; x < vaginas.length; x++)
				{
					lustMin += piercingLustMinByClass(vaginas[x].piercing);
				}
			}
			//Clit.
			if(vaginas.length > 0)
			{
				for(x = 0; x < vaginas.length; x++)
				{
					lustMin += piercingLustMinByClass(vaginas[x].clitPiercing);
				}
			}
			//Cock
			if(cocks.length > 0)
			{
				for(x = 0; x < cocks.length; x++)
				{
					lustMin += piercingLustMinByClass(cocks[x].piercing);
				}
			}
			
			return lustMin;
		}
		//min lust gain per piercing
		public function piercingLustMinByClass(ref:ItemSlotClass=null):Number
		{
			if (ref == null) return 0;
			if (ref is SaviciteBarPiercing) return 2;
			if (ref is SaviciteBarPiercings) return 6;
			if (ref is SaviciteHoopPiercing) return 2;
			if (ref is SaviciteHoopPiercings) return 4;
			if (ref is SaviciteRingPiercing) return 2;
			if (ref is SaviciteRingPiercings) return 4;
			if (ref is SaviciteStudPiercing) return 2;
			if (ref is SaviciteStudPiercings) return 6;
			
			return 0;
		}
		//Sexual Stuff
		public var cocks:/*CockClass*/Array;
		public function cockLengthUnlocked(cockIndex:int, newCockLength:Number):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			if(isCumCow() && hasStatusEffect("The Treatment")) return false;
			return true;
		}
		public function cockLengthLockedMessage():String
		{
			return "Your crotch warms, but nothing happens.";
		}

		public function cockThicknessUnlocked(cockIndex:int, newCockThickness:Number):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function cockThicknessLockedMessage():String
		{
			return "Your crotch warms, but nothing happens.";
		}

		public function cockTypeUnlocked(cockIndex:int, newCockType:Number):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function cockTypeLockedMessage():String
		{
			return "Your crotch warms, but nothing happens.";
		}

		public function knotMultiplierUnlocked(cockIndex:int, newKnotMulti:Number):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function knotMultiplierLockedMessage():String
		{
			return "Your knot warms, but nothing happens.";
		}

		public function flaccidMultiplierUnlocked(cockIndex:int, newFlaccidMulti:Number):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function flaccidMultiplierLockedMessage():String
		{
			return "Your crotch warms, but nothing happens.";
		}

		public function cockFlagsUnlocked(cockIndex:int, newFlags:*):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function cockFlagsLockedMessage():String
		{
			return "Your crotch warms, but nothing happens.";
		}

		//balls
		public var balls: Number = 0;
		public function hasBalls(minBalls:Number = 0):Boolean
		{
			// Minimum number of testicles, like checking for plural (2 or more).
			if(minBalls > 0) return (balls >= minBalls);
			// At least one testicle.
			return (balls > 0);
		}
		public function ballsUnlocked(newBalls:Number):Boolean
		{
			if (newBalls == 0 && hasStatusEffect("Mimbrane Balls")) return false;
			if(hasStatusEffect("Goo Crotch")) return false;
			if(isCumCow() && hasStatusEffect("The Treatment")) return false;
			return true;
		}
		public function ballsLockedMessage():String
		{
			if (hasStatusEffect("Mimbrane Balls")) return "A powerful tug around your " + ballsDescript() + " keeps them from disappearing into your body. The Mimbrane encapsulating your " + sackDescript() + " seems poised to act against any attempts to fully remove your cum factories.";
			if(balls > 0) return "Despite the heat in your [pc.balls], nothing changed down there.";
			return "Despite the heat in your groin, nothing changed down there.";
		}

		public var ballSizeRaw:Number = 1;
		public var ballSizeMod:Number = 1;
		public function ballSizeRawMin():Number
		{
			var rating:Number = 0;
			return rating;
		}
		public function ballSizeModMin():Number
		{
			var rating:Number = 0;
			rating += statusEffectv3("Mimbrane Balls");
			return rating;
		}
		
		public function ballDiameter():Number
		{
			return ballSize()/Math.PI;
		}

		public function ballVolume():Number
		{
			var radius:Number = ballDiameter()/2;
			return 4/3*Math.PI*radius*radius*radius;
		}

		public function ballSize(arg:Number = 0, apply:Boolean = false):Number
		{
			if(isNaN(ballSizeRaw)) ballSizeRaw = 1;
			if(isNaN(ballSizeMod)) ballSizeMod = 1;
			
			if (apply)
			{
				ballSizeRaw = arg;
			}
			else if (arg != 0)
			{
				ballSizeRaw += arg;
			}
			
			var currBallSize:Number = ballSizeRaw + ballSizeMod;
			
			if (currBallSize < 0)
			{
				return 0;
			}
			else
			{
				return currBallSize;
			}
		}
		
		public function ballSizeUnlocked(newBallSize:Number):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			if(isCumCow() && hasStatusEffect("The Treatment") && newBallSize < ballSizeRaw) return false;
			return true;
		}
		public function ballSizeLockedMessage():String
		{
			if(balls > 0) return "Despite the heat in your [pc.balls], nothing changed down there.";
			return "Despite the heat in your groin, nothing changed down there.";
		}
		
		public function makeBallsInternal(): void
		{
			// Convert total ball cum volume to prostate cum volume--to simulate "internal" balls.
			if(balls > 0) 
			{
				//Cut the below due to it actually massively inflating internal ball size.
				//ballSizeRaw = ((ballSizeRaw * ballSizeRaw * balls) / 2);
				
				//If diameter is greater than six inches, reduce size to make diameter be six. Only so much room inside.
				//if(ballDiameter() >= 6) ballSizeRaw = 6*Math.PI;
				
				// WhyNotBoth.gif?
				ballSizeRaw = Math.min((6 * Math.PI), ((ballSizeRaw * ballSizeRaw * balls) / 2));
			}
			balls = 0;
			removeStatusEffect("Mimbrane Balls");
		}
		public function removeBalls(): void
		{
			balls = 0;
			resetBallSize();
			removeStatusEffect("Uniball");
		}
		public function resetBallSize(): void
		{
			// Revert 'Nuki Ball size changes first
			if(hasPerk("'Nuki Nuts")) setPerkValue("'Nuki Nuts", 1, 0);
			// Revert ball size to default value.
			ballSizeRaw = 1;
			ballSizeMod = 1;
		}
		public function resetCumProduction(): void
		{
			// Revert cum production values to default.
			ballFullness = 50;
			ballEfficiency = 3;
			refractoryRate = 1;
			cumMultiplierRaw = 1;
			cumMultiplierMod = 0;
		}
		public function resetGirlCumProduction(): void
		{
			// Revert cum production values to default.
			girlCumMultiplierRaw = 1;
			girlCumMultiplierMod = 0;
		}
		
		public function scrotumType(): int
		{
			var ballsackType:int = 0;
			
			if(hasStatusEffect("Special Scrotum")) ballsackType = statusEffectv1("Special Scrotum");
			else if(InCollection(skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_FEATHERS)) ballsackType = GLOBAL.FLAG_FURRED;
			else if(skinType == GLOBAL.SKIN_TYPE_SCALES || (legType == GLOBAL.TYPE_GRYVAIN && hasLegFlag(GLOBAL.FLAG_SCALED))) ballsackType = GLOBAL.FLAG_SCALED;
			else if(skinType == GLOBAL.SKIN_TYPE_GOO) ballsackType = GLOBAL.FLAG_GOOEY;
			
			return ballsackType;
		}
		public function scrotumColor(): String
		{
			var ballsackColor:String = "";
			
			if(hasStatusEffect("Special Scrotum")) ballsackColor = getStatusTooltip("Special Scrotum");
			else
			{
				var ballsackType:int = scrotumType();
				switch(ballsackType)
				{
					case GLOBAL.FLAG_FURRED: ballsackColor = furColor; break;
					case GLOBAL.FLAG_SCALED: ballsackColor = scaleColor; break;
					case GLOBAL.FLAG_GOOEY: ballsackColor = skinTone; break;
					default: ballsackColor = skinTone; break;
				}
			}
			
			return ballsackColor;
		}
		
		// @FENCUMFIX - Switch these two blocks around if you want to easily stick a breakpoint on what this value is getting set to
		public var ballFullness: Number = 50;
		
		// Using getter/setters breaks my save/loading code iirc. To do with how I'm reflecting the class to find properties.
		// I THINK you can load/save with this code active instead of the raw property, but it MAY fuck stuff up, so I just do this when I need to debug
		// how a value is getting set.
		
		/*
		private var _ballFullness:Number = 50;
		public function get ballFullness():Number 
		{ 
			return _ballFullness;
		}
		public function set ballFullness(v:Number):void
		{
			if (v < 0)
			{
				trace("bp");
			}
			_ballFullness = v;
		}
		*/

		public function ballFullnessUnlocked(newBallFullness:Number):Boolean
		{
			return true;
		}
		public function ballFullnessLockedMessage():String
		{
			if(balls > 0) return "Despite the heat in your [pc.balls], nothing changed down there.";
			return "Despite the heat in your groin, nothing changed down there.";
		}
		
		//Number of cumshots a day the PC can hold
		public var ballEfficiency: Number = 3;
		//Scales from 0 (never produce more) to infinity.
		public var refractoryRate: Number = 1;
		public var minutesSinceCum: Number = 0;
		public var timesCum: Number = 0;
		public var cockVirgin: Boolean = true;
		public var vaginas:/*VaginaClass*/Array;

		public function vaginaTypeUnlocked(vagIndex:int, newVagType:int):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function vaginaTypeLockedMessage():String
		{
			return "Despite the heat in your groin, nothing changed down there.";
		}

		public function clitsUnlocked(vagIndex:int, newClitNumber:int):Boolean
		{
			// Vaginas always have one clit?
			if(vaginas[vagIndex].clits == 1 && newClitNumber < 1) return false;
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function clitsLockedMessage():String
		{
			return "Despite the heat in your groin, nothing changed down there.";
		}

		public function wetnessUnlocked(vagIndex:int, newWetness:Number):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function wetnessLockedMessage():String
		{
			return "Despite the heat in your groin, nothing changed down there.";
		}
		
		public function analWetnessUnlocked(newWetness:Number):Boolean
		{
			return true;
		}
		public function analWetnessLockedMessage():String
		{
			return "Despite the heat in your groin, nothing changed down there.";
		}

		public function loosenessUnlocked(vagIndex:int, newLooseness:Number):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function loosenessLockedMessage():String
		{
			return "Despite the heat in your groin, nothing changed down there.";
		}

		public var clitLength: Number = .5;
		public function clitLengthUnlocked(newClitLength:Number):Boolean
		{
			if(hasStatusEffect("Goo Crotch")) return false;
			return true;
		}
		public function clitLengthLockedMessage():String
		{
			return "Despite the heat in your groin, nothing changed down there.";
		}
		
		public var elasticity: Number = 1;
		
		public var girlCumType: Number = GLOBAL.FLUID_TYPE_GIRLCUM;
		public function girlCumTypeUnlocked(newGirlCumType:Number):Boolean
		{
			if(girlCumType == GLOBAL.FLUID_TYPE_SPECIAL_GOO) return false;
			return true;
		}
		public function girlCumTypeLockedMessage():String
		{
			return "Despite the heat in your groin, nothing changed down there.";
		}
		
		public var vaginalVirgin: Boolean = true;
		public var breastRows:/*BreastRowClass*/Array;

		public function breastsUnlocked(bRowIndex:int, newBreastCount:Number):Boolean
		{
			if (hasStatusEffect("Gel Body")) return false;
			return true;
		}
		public function breastsLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}

		public function nippleTypeUnlocked(bRowIndex:int, newNippleType:Number):Boolean
		{
			if (hasStatusEffect("Gel Body")) return false;
			return true;
		}
		public function nippleTypeLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}
		public function areolaFlagUnlocked(bRowIndex:int, newNippleFlag:Number):Boolean
		{
			if (hasLipples(bRowIndex)) return false;
			return true;
		}

		public function areolaFlagLockedMessage():String
		{
			return "Your [pc.nipples] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}
		
		public function breastRatingUnlocked(bRowIndex:int, newBreastRating:Number):Boolean
		{
			if (hasStatusEffect("Gel Body")) return false;
			if(hasStatusEffect("The Treatment") && InCollection(statusEffectv1("The Treatment"), [0, 2]) && breastRows[bRowIndex].breastRatingRaw < newBreastRating) return false;
			return true;
		}
		public function breastRatingLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}

		public var nippleColor: String = "pink";
		public function nippleColorUnlocked(newNippleColor:String):Boolean
		{
			return true;
		}
		public function nippleColorLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}
		
		public var nipplesPerBreast: int = 1;
		public function nipplesPerBreastUnlocked(newNipplesPerBreast:int):Boolean
		{
			if (hasStatusEffect("Gel Body")) return false;
			return true;
		}
		public function nipplesPerBreastLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}
		
		public var nippleLengthRatio: Number = 1;
		public function nippleLengthRatioUnlocked(newNippleLengthRatio:Number):Boolean
		{
			return true;
		}
		public function nippleLengthRatioLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}
		
		public var nippleWidthRatio: Number = 1;
		public function nippleWidthRatioUnlocked(newNippleWidthRatio:Number):Boolean
		{
			return true;
		}
		public function nippleWidthRatioLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}
		
		public var dickNippleMultiplier: int = 3;
		public function dickNippleMultiplierUnlocked(newDickNippleMultiplier:int):Boolean
		{
			return true;
		}
		public function dickNippleMultiplierLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}
		
		public var dickNippleType: int = 0;
		public function dickNippleTypeUnlocked(newDickNippleType:int):Boolean
		{
			return true;
		}
		public function dickNippleTypeLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}
		//This tracks whether or not the PC is actually producing yet. 0 to 100 with milk lactation starting above 50.
		public var milkMultiplier: Number = 0;
		public var milkType: Number = 0;
		public function milkTypeUnlocked(newMilkType:Number):Boolean
		{
			return true;
		}
		public function milkTypeLockedMessage():String
		{
			if(biggestTitSize() < 1) return "Your [pc.chest] throbs and pulses but does not change. The unnatural sensations fade as quickly as they came.";
			return "Your [pc.chest] throb and pulse but do not change. The unnatural sensations fade as quickly as they came.";
		}
		//This effects how much milk your tits can hold relative to human norms. High numbers = milk singularity
		public var milkStorageMultiplier:Number = 1;
		//This is a 1 to 100% measurement of how full yer tits are
		public var milkFullness:Number = 0;
		//The rate at which you produce milk. Scales from 0 to INFINITY.
		public var milkRate: Number = 10;

		public var ass:VaginaClass = new VaginaClass(false);
		public var analVirgin: Boolean = true;
		public var perks: Array;
		public var statusEffects:/*StorageClass*/Array;

		//Used for misc shit
		private var list:Array = new Array();

		public var sexualPreferences: SexualPreferences;

		//Functions
		//UTILITIES

		public function buysType(arg: int): Boolean {
			for (var x: int = 0; x < typesBought.length; x++) {
				if (typesBought[x] == GLOBAL.ALL) return true;
				if (arg == typesBought[x]) return true;
			}
			return false;
		}

		public function getDescription(arg: String, arg2: * ): String {
			//trace("Legacy! Please access object members directly!")
			var firstLetter: String = arg.substr(0, 1);
			firstLetter = firstLetter.toLowerCase();
			var restOfString: String = arg.substr(1, arg.length);
			var desc: String = firstLetter + restOfString;
			//var desc = arg;
			var buffer: String = "<b>Error, invalid description. Passed description call: \"" + arg + "\" with argument: \"" + arg2 + "\"</b>";
			if (!arg2)
			{
				switch (desc) {
					case "cockOrStrapon":
					case "cockOrHardlight":
					case "cockOrStraponNoun":
					case "cockOrHardlightNoun":
					case "cockOrStraponFull":
					case "cockOrHardlightFull":
					case "cockOrStraponHead":
						arg2 = -3; break;
					case "clitsNoun":
					case "clits":
						arg2 = -1; break;
					default: arg2 = 0; break;
				}
			}
			switch (desc) {
				case "height":
					buffer = height();
					break;
				case "gear":
					buffer = gearDescript();
					break;
				case "clothes":
					buffer = clothesDescript(); // isolates layer unlike gear -- armor if its there, otherwise both undergarments
					break;
				case "ship":
					if(this is PlayerCharacter) buffer = kGAMECLASS.PCShipName(true);
					else buffer = "ship";
					break;
				case "shipModel":
					if(this is PlayerCharacter) buffer = kGAMECLASS.PCShipModel();
					else buffer = "ship";
					break;
				case "short":
				case "name":
					buffer = nameDisplay();
					break;
				case "fullName":
				case "fullname":
					buffer = short;
					if (this is PlayerCharacter) buffer += " Steele";
					break;
				case "race":
					buffer = race();
					break;
				case "raceType":
				case "raceShort":
				case "raceSimple":
				case "simpleRace":
				case "raceStrip":
				case "stripRace":
					buffer = raceShort();
					break;
				case "raceTypeStrict":
				case "raceTypeHuman":
					buffer = raceShort(true);
					break;
				case "raceCute":
					buffer = raceCute();
					break;
				case "raceCuteShort":
				case "raceCuteSimple":
					buffer = raceCute(true);
					break;
				case "raceBoyGirl":
					buffer = raceCute(false, true);
					break;
				case "raceBoyGirlShort":
				case "raceBoyGirlSimple":
					buffer = raceCute(true, true);
					break;
				case "aRace":
					buffer = indefiniteArticle(race());
					break;
				case "aRaceType":
				case "aRaceShort":
				case "aRaceSimple":
				case "aSimpleRace":
				case "aRaceStrip":
				case "aStripRace":
					buffer = indefiniteArticle(raceShort());
					break;
				case "aRaceTypeStrict":
				case "aRaceTypeHuman":
					buffer = indefiniteArticle(raceShort(true));
					break;
				case "aRaceCute":
					buffer = indefiniteArticle(raceCute());
					break;
				case "aRaceCuteShort":
				case "aRaceCuteSimple":
					buffer = indefiniteArticle(raceCute(true));
					break;
				case "aRaceBoyGirl":
					buffer = indefiniteArticle(raceCute(false, true));
					break;
				case "aRaceBoyGirlShort":
				case "aRaceBoyGirlSimple":
					buffer = indefiniteArticle(raceCute(true, true));
					break;
				case "class":
				case "classType":
				case "characterClass":
				case "startingCareer":
				case "occupation":
					buffer = GLOBAL.CLASS_NAMES[characterClass].toLowerCase();
					break;
				case "aClass":
				case "aClassType":
				case "aCharacterClass":
				case "aStartingCareer":
				case "anOccupation":
					buffer = indefiniteArticle(GLOBAL.CLASS_NAMES[characterClass].toLowerCase());
					break;
				case "armor":
					buffer = armor.longName;
					break;
				case "weapon":
					buffer = getWeaponName(true);
					break;
				case "meleeWeapon":
				case "weaponMelee":
					buffer = meleeWeapon.longName;
					break;
				case "rangedWeapon":
				case "weaponRanged":
					buffer = rangedWeapon.longName;
					break;
				case "rangedNoun":
				case "gunNoun":
				case "bowNoun":
					buffer = getRangedNoun();
					break;
				case "mainWeapon":
				case "weaponMain":
				case "weaponStat":
					buffer = getWeaponName(true);
					break;
				case "heldWeapon":
					buffer = heldWeaponName();
					break;
				case "draw":
					buffer = weaponActionReady(false, "stat", false);
					break;
				case "holster":
					buffer = weaponActionRelax(false, "stat", false);
					break;
				case "drawing":
					buffer = weaponActionReady(true, "stat", false);
					break;
				case "holstering":
					buffer = weaponActionRelax(true, "stat", false);
					break;
				case "drawWeapon":
				case "readyWeapon":
					buffer = weaponActionReady(false, "stat");
					break;
				case "holsterWeapon":
				case "relaxWeapon":
					buffer = weaponActionRelax(false, "stat");
					break;
				case "drawingWeapon":
				case "readyingWeapon":
					buffer = weaponActionReady(true, "stat");
					break;
				case "holsteringWeapon":
				case "relaxingWeapon":
					buffer = weaponActionRelax(true, "stat");
					break;
				case "readyMelee":
					buffer = weaponActionReady(false, "melee");
					break;
				case "relaxMelee":
					buffer = weaponActionRelax(false, "melee");
					break;
				case "readyingMelee":
					buffer = weaponActionReady(true, "melee");
					break;
				case "relaxingMelee":
					buffer = weaponActionRelax(true, "melee");
					break;
				case "readyRanged":
					buffer = weaponActionReady(false, "ranged");
					break;
				case "relaxRanged":
					buffer = weaponActionRelax(false, "ranged");
					break;
				case "readyingRanged":
					buffer = weaponActionReady(true, "ranged");
					break;
				case "relaxingRanged":
					buffer = weaponActionRelax(true, "ranged");
					break;
				case "move":
					buffer = moveAction();
					break;
				case "walk":
					buffer = moveAction(false, true);
					break;
				case "moving":
					buffer = moveAction(true);
					break;
				case "walking":
					buffer = moveAction(true, true);
					break;
				case "lowerUndergarment":
					buffer = lowerUndergarment.longName;
					break;
				case "upperUndergarment":
					buffer = upperUndergarment.longName;
					break;
				case "upperGarment":
					buffer = upperGarmentDescript();
					break;
				case "upperGarmentOuter":
					buffer = upperGarmentOuterDescript();
					break;
				case "upperGarments":
					buffer = upperGarmentsDescript();
					break;
				case "lowerGarments":
					buffer = lowerGarmentsDescript();
					break;
				case "lowerGarment":
					buffer = lowerGarmentDescript();
					break;
				case "underGarment":
					buffer = underGarmentDescript();
					break;
				case "underGarments":
					buffer = underGarmentsDescript();
					break;
				case "lowerGarmentOuter":
					buffer = lowerGarmentOuterDescript();
					break;
				case "covers":
				case "coverings":
					buffer = covers();
					break;
				case "crotchCover":
					buffer = crotchCover();
					break;
				case "crotchCoverUnder":
					buffer = crotchCoverUnder();
					break;
				case "crotchCovers":
					buffer = crotchCovers();
					break;
				case "assCover":
					buffer = assCover();
					break;
				case "assCoverUnder":
					buffer = assCoverUnder();
					break;
				case "assCovers":
					buffer = assCovers();
					break;
				case "chestCover":
					buffer = chestCover();
					break;
				case "chestCoverUnder":
					buffer = chestCoverUnder();
					break;
				case "chestCovers":
					buffer = chestCovers();
					break;
				case "skinNoun":
					buffer = skinNoun(true);
					break;
				case "skinFurScalesNoun":
				case "skinScalesFurNoun":
					buffer = skinNoun(false);
					break;
				case "skinNounSimple":
					buffer = skinNoun(true, true);
					break;
				case "skinFurScalesNounSimple":
					buffer = skinNoun(false, true);
					break;
				case "skinFurScalesColor":
					buffer = skinFurScalesColor();
					break;
				case "skinFurScales":
				case "skinfurscales":
					buffer = skinFurScales();
					break;
				case "skin":
					buffer = skin();
					break;
				case "skinColor":
				case "skinTone":
					buffer = skinTone;
					break;
				case "accentColor":
				case "skinAccent":
					buffer = skinAccent;
					break;
				case "accentMarkings":
					buffer = accentMarkingsDescript();
					break;
				case "accentMarked":
					buffer = accentMarkingsDescript(false);
					break;
				case "accentMarkingsNoun":
					buffer = accentMarkingsDescript(true, true);
					break;
				case "accentMarkedSimple":
					buffer = accentMarkingsDescript(false, true);
					break;
				case "furColor":
					buffer = furColor;
					break;
				case "scaleColor":
					buffer = scaleColor;
					break;
				case "chitinColor":
					buffer = chitinColor("", true);
					break;
				case "chitinColorBody":
					buffer = chitinColor("body", true);
					break;
				case "chitinColorArm":
					buffer = chitinColor("arm", true);
					break;
				case "chitinColorLeg":
					buffer = chitinColor("leg", true);
					break;
				case "chitinColorTail":
					buffer = chitinColor("tail", true);
					break;
				case "ears":
					buffer = earsDescript();
					break;
				case "ear":
					buffer = earDescript();
					break;
				case "eyes":
					buffer = eyesDescript();
					break;
				case "eye":
					buffer = eyeDescript();
					break;
				case "eyePigment":
				case "eyeColor":
					buffer = eyeColor;
					break;
				case "nose":
					buffer = noseDescript();
					break;
				case "hairsDescript":
					buffer = hairsDescript();
					break;
				case "hairDescript":
				case "hair":
					buffer = hairDescript();
					break;
				case "hairNoun":
					buffer = hairNoun();
					break;
				case "hairs":
				case "hairsNoun":
					buffer = hairsNoun();
					break;
				case "hairColor":
					buffer = hairColor;
					break;
				case "beard":
					buffer = beard();
					break;
				case "beardNoun":
					buffer = beardStyles(true);
					break;
				case "beardColor":
					buffer = beardColor;
					break;
				case "face":
					buffer = face();
					break;
				case "mouth":
					buffer = mouthDescript();
					break;
				case "mouthFull":
					buffer = mouthDescript(true, false);
					break;
				case "mouthFullChaste":
					buffer = mouthDescript(true, true);
					break;
				case "mouthChaste":
					buffer = mouthDescript(false, true);
					break;
				case "lips":
					buffer = lipsDescript();
					break;
				case "lipsChaste":
					buffer = lipsDescript(false,true);
					break;
				case "lip":
					buffer = lipDescript();
					break;
				case "lipChaste":
					buffer = lipDescript(false,true);
					break;
				case "lipColor":
					buffer = lipColor;
					break;
				case "tongue":
					buffer = tongueDescript();
					break;
				case "tongueNoun":
					buffer = tongueNoun();
					break;
				case "tongueNounSimple":
					buffer = tongueNoun(true,false);
					break;
				case "tonguePierced":
					buffer = tongueNoun(false,true);
					break;
				case "gills":
					buffer = gillsDesc();
					break;
				case "gill":
					buffer = gillDesc();
					break;
				case "tail":
					buffer = tailDescript();
					break;
				case "tailNoun":
					buffer = tailDescript(true);
					break;
				case "onetail":
				case "oneTail":
					buffer = oneTailDescript();
					break;
				case "eachtail":
				case "eachTail":
					buffer = eachTailDescript();
					break;
				case "tails":
					buffer = tailsDescript();
					break;
				case "tailsIsAre":
					buffer = (hasTails() ? tailsDescript() + " are" : tailsDescript() + " is");
					break;
				case "crotch":
				case "groin":
				case "genitals":
					buffer = crotchDescript();
					break;
				case "base":
				case "cockBase":
				case "sheath":
				case "sheathDescript":
				case "sheathOrBase":
					buffer = sheathDescript(arg2);
					break;
				case "biggestSheath":
				case "sheathBiggest":
					buffer = sheathDescript(biggestCockIndex());
					break;
				case "knot":
				case "knotOrBase":
					buffer = knotDescript(arg2);
					break;
				case "knots":
					buffer = (hasCocks() ? plural(knotDescript(arg2)) : knotDescript(arg2));
					break;
				case "knotBiggest":
					buffer = knotDescript(biggestCockIndex());
					break;
				case "sheathOrKnot":
					buffer = sheathOrKnot(arg2);
					break;
				case "knotOrSheath":
					buffer = knotOrSheath(arg2);
					break;
				case "knotBallsHilt":
					buffer = knotBallsHilt(arg2);
					break;
				case "multiCockDescript":
				case "multiCocks":
					buffer = multiCockDescript();
					break;
				case "cockLength":
				case "cocklength":
					buffer = num2Text(Math.floor(cLength(arg2)));
					break;
				case "cockCount":
					buffer = num2Text(cocks.length);
					break;
				case "cocks":
				case "cocksDescript":
				case "dicks":
					buffer = cocksDescript();
					break;
				case "cocksDescriptLight":
				case "cocksLight":
				case "dicksLight":
					buffer = cocksDescriptLight();
					break;
				case "cocksIsAre":
				case "dicksIsAre":
					buffer = (hasCocks() ? cocksDescript() + " are" : cockDescript(arg2) + " is");
					break;
				case "cocksLightIsAre":
				case "dicksLightIsAre":
					buffer = (hasCocks() ? cocksDescriptLight() + " are" : simpleCockNoun(arg2) + " is");
					break;
				case "cocksSimple":
				case "cocksShort":
				case "cocksNoun":
				case "cocksNounSimple":
					buffer = simpleCocksNoun();
					break;
				case "cockComplex":
				case "cockNounComplex":
					buffer = cockNounComplex(arg2);
					break;
				case "cockLight":
				case "cockSimple":
				case "cockNounSimple":
				case "cockShort":
				case "cockNoun":
					buffer = simpleCockNoun(arg2);
					break;
				case "dicksNounIsAre":
				case "cocksNounIsAre":
					buffer = (hasCocks() ? simpleCocksNoun() + " are" : simpleCockNoun(arg2) + " is");
					break;
				case "cockNounBiggest":
					buffer = simpleCockNoun(biggestCockIndex());
					break;
				case "cockSkin":
				case "dickSkin":
					buffer = cockSkin(arg2);
					break;
				case "cockColor":
				case "dickColor":
					buffer = cockColor(arg2);
					break;
				case "vaginaColor":
				case "cuntColor":
				case "pussyColor":
					buffer = vaginaColor(arg2);
					break;
				case "cockHead":
				case "cockhead":
					buffer = cockHead(arg2);
					break;
				case "cockHeadNoun":
					buffer = cockHeadNoun(arg2);
					break;
				case "cockHeads":
				case "cockheads":
					buffer = cockHeads(arg2);
					break;
				case "cockHeadsNoun":
					buffer = cockHeadsNoun();
					break;
				case "cockDescript":
				case "cock":
					buffer = cockDescript(arg2);
					break;
				case "biggestCockDescript":
				case "biggestCock":
				case "cockBiggest":
					buffer = cockDescript(biggestCockIndex());
					break;
				case "biggestCockNoun":
				case "cockBiggestNoun":
					buffer = simpleCockNoun(biggestCockIndex());
					break;
				case "biggestCockHead":
				case "biggestCockhead":
				case "cockHeadBiggest":
				case "cockheadBiggest":
					buffer = cockHead(biggestCockIndex());
					break;
				case "smallestCockHead":
				case "smallestCockhead":
				case "cockHeadSmallest":
				case "cockheadSmallest":
					buffer = cockHead(smallestCockIndex());
					break;
				case "smallestCockDescript":
				case "smallestCock":
				case "cockSmallest":
					buffer = cockDescript(smallestCockIndex());
					break;
				case "smallestCockNoun":
				case "cockSmallestNoun":
					buffer = simpleCockNoun(smallestCockIndex());
					break;
				case "shortestCockDescript":
				case "shortestCock":
				case "cockShortest":
					buffer = cockDescript(shortestCockIndex());
					break;
				case "shortestCockNoun":
				case "cockShortestNoun":
					buffer = simpleCockNoun(shortestCockIndex());
					break;
				case "eachCockHead":
					buffer = eachCockHead();
					break;
				case "tailCock":
				case "cockTail":
					buffer = tailCockDescript();
					break;
				case "tailCockHead":
					buffer = tailCockHead();
					break;
				case "tailCockHeads":
					buffer = tailCockHeads();
					break;
				case "tailCocks":
				case "cockTails":
					buffer = tailCocksDescript();
					break;
				case "cockOrStrapon":
				case "cockOrHardlight":
					buffer = cockOrStrapon(arg2,0);
					break;
				case "cockOrStraponNoun":
				case "cockOrHardlightNoun":
					buffer = cockOrStrapon(arg2,-1);
					break;
				case "cockOrStraponFull":
				case "cockOrHardlightFull":
					buffer = cockOrStrapon(arg2,1);
					break;
				case "hardlightCock":
					buffer = cockOrStrapon(-1,0);
					break;
				case "hardlightCockNoun":
					buffer = cockOrStrapon(-1,-1);
					break;
				case "hardlightCockFull":
					buffer = cockOrStrapon(-1,1);
					break;
				case "cockOrStraponHead":
					buffer = cockOrStraponHead(arg2);
					break;
				case "cockOrVag":
					buffer = cockOrVag();
					break;
				case "nippleNoun":
					buffer = nippleNoun(arg2);
					break;
				case "nipplesNoun":
					buffer = nipplesNoun(arg2);
					break;
				case "nippleNounSimple":
					buffer = nippleNoun(arg2, true);
					break;
				case "nipplesNounSimple":
					buffer = nipplesNoun(arg2, true);
					break;
				case "nipple":
				case "nippleDescript":
				case "lipple":
					buffer = nippleDescript(arg2);
					break;
				case "nipples":
				case "nipplesDescript":
				case "lipples":
					buffer = nipplesDescript(arg2);
					break;
				case "milkyNipple":
					buffer = nippleDescript(arg2, false, true);
					break;
				case "milkyNipples":
					buffer = nipplesDescript(arg2, true);
					break;
				case "nippleCuntDescript":
				case "nippleCunt":
				case "cuntNipple":
					buffer = nippleCuntDescript();
					break;
				case "nippleCuntsDescript":
				case "nippleCunts":
				case "cuntNipples":
					buffer = nippleCuntsDescript();
					break;
				case "nippleCockDescript":
				case "nippleCock":
				case "dickNipple":
					buffer = nippleCockDescript();
					break;
				case "nippleCocksDescript":
				case "nippleCocks":
				case "dickNipples":
					buffer = nippleCocksDescript();
					break;
				case "nippleColor":
					buffer = nippleColor;
					break;
				case "nipplePiercings":
					buffer = "nipple piercings"; // 9999
					break;
				case "nippleHarden":
				case "nipplesHarden":
					buffer = nipplesErect(arg2);
					break;
				case "nippleHardening":
				case "nipplesHardening":
					buffer = nipplesErect(arg2, true);
					break;
				case "areola":
				case "areolaDescript":
					buffer = areolaDescript(arg2);
					break;
				case "areolae":
				case "areolaeDescript":
					buffer = areolaeDescript(arg2);
					break;
				case "eachCock":
					buffer = eachCock();
					break;
				case "eachCockIsAre":
					buffer = eachCock() + (hasCocks() ? " are" : " is");
					break;
				case "oneCock":
					buffer = oneCock();
					break;
				case "oneCockHead":
					buffer = oneCockHead();
					break;
				case "erectCock":
				case "flaccidCock":
					buffer = cockDescript(arg2, true);
					break;
				case "erectCocks":
				case "flaccidCocks":
					buffer = cocksDescript(true);
					break;
				case "erectMultiCocks":
				case "flaccidMultiCocks":
					buffer = multiCockDescript(true);
					break;
				case "eachErectCock":
				case "eachFlaccidCock":
					buffer = eachCock(true);
					break;
				case "oneErectCock":
				case "oneFlaccidCock":
					buffer = oneCock(true);
					break;
				case "balls":
					buffer = ballsDescript();
					break;
				case "ballsNoun":
					buffer = ballNoun(true);
					break;
				case "ballNoun":
					buffer = ballNoun(false);
					break;
				case "ballsNounSimple":
					buffer = ballsNounSimple();
					break;
				case "ballNounSimple":
					buffer = ballsNounSimple(true);
					break;
				case "ballsNounIsAre":
					buffer = ballNoun(true) + " " + (balls == 1 ? "is" : "are");
					break;
				case "ballsNounSimpleIsAre":
					buffer = ballsNounSimple() + " " + (balls == 1 ? "is" : "are");
					break;
				case "ball":
					buffer = ballsDescript();
					break;
				case "ballsIsAre":
					buffer = hasBalls() ? ballsDescript() + " are" : ballDescript() + " is";
					break;
				case "prostate":
				case "sack":
				case "ballsack":
				case "ballSack":
				case "nutsack":
				case "scrotum":
					buffer = sackDescript();
					break;
				case "sackTexture":
					buffer = sackTexture();
					break;
				case "chestDesc":
				case "chest":
					buffer = chestDesc();
					break;
				case "chestSimple":
				case "chestNoun":
				case "breastsNoun":
					buffer = chestNoun(arg2);
					break;
				case "breastNoun":
				case "breast":
					buffer = breastNoun(arg2);
					break;
				case "breastNounChaste":
				case "breastChaste":
				case "breastNounDry":
				case "breastDry":
					buffer = breastNoun(arg2, true);
					break;
				case "cupSize":
				case "breastCup":
				case "breastCupSize":
					buffer = breastCup(arg2);
					break;
				case "allChestDescript":
				case "fullChest":
				case "chestFull":
					buffer = allChestDesc();
					break;
				case "biggestBreastDescript":
					buffer = biggestBreastDescript();
					break;
				case "breastDescript":
				case "breasts":
				case "boobs":
				case "tits":
					buffer = breastDescript(arg2);
					break;
				case "lowestBreasts":
					buffer = breastDescript(bRows()-1);
					break;
				case "cockClit":
					buffer = cockClit(arg2);
					break;
				case "anus":
				case "assholeDescript":
				case "asshole":
				case "butthole":
					buffer = assholeDescript();
					break;
				case "anusSimple":
				case "assholeSimple":
				case "anusNoun":
				case "assholeNoun":
					buffer = assholeDescript(true);
					break;
				case "buttDescript":
				case "butt":
				case "ass":
					buffer = buttDescript();
					break;
				case "buttcheek":
				case "asscheek":
					buffer = buttDescript(false, true);
					break;
				case "buttsDescript":
				case "buttcheeks":
				case "asscheeks":
				case "cheeks":
				case "butts":
				case "asses":
					buffer = buttDescript(true);
					break;
				case "hipDescript":
				case "hip":
					buffer = hipDescript();
					break;
				case "hipsDescript":
				case "hips":
					buffer = hipsDescript();
					break;
				case "thighDescript":
				case "thigh":
					buffer = thighDescript(true);
					break;
				case "thighsDescript":
				case "thighs":
					buffer = thighsDescript(true);
					break;
				case "vagina":
				case "pussy":
				case "cunt":
					buffer = vaginaDescript(arg2);
					break;
				//Complex Noun
				case "vaginaNounComplex":
				case "pussyNounComplex":
					buffer = vaginaNounComplex(arg2);
					break;
				//Simple Noun
				case "vaginaSimple":
				case "pussySimple":
				case "cuntSimple":
				case "vaginaNounSimple":
					buffer = vaginaNounSimple(arg2);
					break;
				//Generic cuntnoun
				case "vaginaNoun":
				case "pussyNoun":
				case "cuntNoun":
					buffer = vaginaNounDescript(arg2);
					break;
				case "multiCunt":
				case "multiCunts":
				case "multiVaginas":
				case "multiVagina":
					buffer = multiCuntDescript();
					break;
				case "vaginasNoun":
				case "pussiesNoun":
				case "cuntsNoun":
				case "vaginasSimple":
				case "pussiesSimple":
				case "cuntsSimple":
				case "vaginasNounSimple":
					buffer = simpleVaginasNoun();
					break;
				case "vaginas":
				case "pussies":
				case "cunts":
					buffer = vaginasDescript();
					break;
				case "vaginasLight":
				case "pussiesLight":
				case "cuntsLight":
					buffer = vaginasDescriptLight();
					break;
				case "eachVagina":
				case "eachPussy":
				case "eachCunt":
					buffer = eachVagina();
					break;
				case "oneVagina":
				case "onePussy":
				case "oneCunt":
					buffer = oneVagina();
					break;
				case "biggestVagina":
				case "vaginaBiggest":
				case "cuntBiggest":
				case "biggestCunt":
					buffer = vaginaDescript(biggestVaginaIndex());
					break;
				case "biggestVaginaNoun":
				case "vaginaBiggestNoun":
				case "cuntBiggestNoun":
				case "biggestCuntNoun":
					buffer = vaginaNounDescript(biggestVaginaIndex());
					break;
				case "vaginasIsAre":
				case "cuntsIsAre":
				case "pussiesIsAre":
					buffer = (hasVaginas() ? vaginasDescript() + " are" : vaginaDescript() + " is");
					break;
				case "vaginasLightIsAre":
				case "cuntsLightIsAre":
				case "pussiesLightIsAre":
					buffer = simpleVaginasNoun() + (hasVaginas() ?" are" : " is");
					break;	
				case "vagOrAss":
				case "vagOrAsshole":
				case "vaginaOrAss":
				case "vaginaOrAsshole":
				case "pussyOrAss":
				case "pussyOrAsshole":
					buffer = vagOrAss(arg2);
					break;
				case "vagOrAssNoun":
				case "vagOrAssSimple":
					buffer = vagOrAssNoun(arg2);
					break;
				case "womb":
				case "uterus":
					buffer = wombDescript(arg2);
					break;
				case "wombs":
				case "uteruses":
				case "uteri":
					buffer = wombsDescript();
					break;
				case "clit":
				case "clitoris":
					buffer = clitDescript(arg2);
					break;
				case "clitNoun":
				case "clitorisNoun":
					buffer = clitDescript(arg2, true);
					break;
				case "biggestCuntClit":
					buffer = clitDescript(biggestVaginaIndex());
					break;
				case "eachClit":
				case "eachClitoris":
					buffer = eachClit();
					break;
				case "oneClit":
				case "oneClitoris":
					buffer = oneClit();
					break;
				case "oneClitPerVagina":
					buffer = oneClitPerVagina(arg2);
					break;
				case "clits":
					buffer = clitsDescript(arg2);
					break;
				case "clitsNoun":
					buffer = clitsDescript(arg2, true);
					break;
				case "clitsIsAre":
					buffer = (totalClits() != 1 ? clitsDescript(arg2) + " are" : clitDescript(arg2) + " is");
					break;
				case "tailVagina":
				case "tailCunt":
				case "cuntTail":
				case "tailgina":
					buffer = tailVaginaDescript();
					break;
				case "tailVaginas":
				case "tailCunts":
				case "cuntTails":
				case "tailginas":
					buffer = tailVaginasDescript();
					break;
				case "oneTailgina":
				case "oneTailCunt":
					buffer = oneTailVaginaDescript();
					break;
				case "milkNoun":
				case "milkType":
					buffer = fluidNoun(milkType);
					break;
				case "milkDescript":
				case "milk":
					buffer = milkDescript();
					break;
				case "cumDescript":
				case "cum":
					buffer = cumDescript();
					break;
				case "femCum":
				case "femcum":
				case "girlCumDescript":
				case "girlCum":
				case "girlcum":
					buffer = girlCumDescript();
					break;
				case "cumNoun":
				case "cumType":
					buffer = fluidNoun(cumType);
					break;
				case "femCumNoun":
				case "femCumType":
				case "girlCumNoun":
				case "girlCumType":
					buffer = fluidNoun(girlCumType);
					break;
				case "cumColor":
					buffer = cumColor();
					break;
				case "cumColorNoun":
				case "cumColorSimple":
					buffer = fluidColorSimple(cumType);
					break;
				case "cumGem":
					buffer = cumGem();
					break;
				case "femCumGem":
				case "girlCumGem":
					buffer = girlCumGem();
					break;
				case "milkGem":
					buffer = milkGem();
					break;
				case "femCumColor":
				case "girlCumColor":
					buffer = girlCumColor();
					break;
				case "femCumColorNoun":
				case "femCumColorSimple":
				case "girlCumColorNoun":
				case "girlCumColorSimple":
					buffer = fluidColorSimple(girlCumType);
					break;
				case "milkColor":
					buffer = milkColor();
					break;
				case "milkColorNoun":
				case "milkColorSimple":
					buffer = fluidColorSimple(milkType);
					break;
				case "cumVisc":
					buffer = fluidViscosity(cumType);
					break;
				case "femCumVisc":
				case "girlCumVisc":
					buffer = fluidViscosity(girlCumType);
					break;
				case "milkVisc":
					buffer = fluidViscosity(milkType);
					break;
				case "cumFlavor":
					buffer = fluidFlavor(cumType);
					break;
				case "femCumFlavor":
				case "girlCumFlavor":
					buffer = fluidFlavor(girlCumType);
					break;
				case "milkFlavor":
					buffer = fluidFlavor(milkType);
					break;
				case "wing":
					buffer = wingDescript();
					break;
				case "wings":
					buffer = wingsDescript();
					break;
				case "wingNoun":
					buffer = wingDescript(true);
					break;
				case "wingsNoun":
					buffer = wingsDescript(true);
					break;
				case "arm":
					buffer = armDescript();
					break;
				case "arms":
					buffer = armsDescript();
					break;
				case "armFull":
					buffer = armDescript(true);
					break;
				case "armsFull":
					buffer = armsDescript(true);
					break;
				case "armNoun":
					buffer = armNoun();
					break;
				case "armsNoun":
					buffer = armsNoun();
					break;
				case "hand":
					buffer = hand();
					break;
				case "hands":
					buffer = hands();
					break;
				case "finger":
					buffer = finger();
					break;
				case "fingers":
					buffer = fingers();
					break;
				case "lowerbody":
				case "lowerBody":
					buffer = lowerBody();
					break;
				case "leg":
					buffer = leg();
					break;
				case "legNoun":
					buffer = legNoun();
					break;
				case "legsNoun":
					buffer = legsNoun();
					break;
				case "legs":
					buffer = legs();
					break;
				case "leg(s)":
				case "legOrLegs":
				case "legsOrLeg":
					buffer = legOrLegs();
					break;
				case "thighsOrLegs":
				case "legsOrThighs":
					buffer = thighsOrLegs();
					break;
				case "legOrLegsNoun":
					buffer = (legCount == 1 ? legNoun() : legsNoun());
					break;
				case "legFurScales":
					buffer = legFurScales();
					break;
				case "knee":
					buffer = kneeDescript();
					break;
				case "knees":
					buffer = kneesDescript();
					break;
				case "footOrFeet":
				case "feetOrFoot":
				case "feet":
					buffer = feet();
					break;
				case "foot":
					buffer = foot();
					break;
				case "toe":
					buffer = toe();
					break;
				case "toes":
					buffer = toes();
					break;
				case "belly":
				case "stomach":
				case "tummy":
				case "abdomen":
					buffer = bellyDescript();
					break;
				case "bellySize":
					buffer = bellyDescript(true);
					break;
				case "mistress":
				case "master":
				case "masterMistress":
					buffer = mf("master", "mistress");
					break;
				case "he":
				case "she":
				case "heShe": // Shamelessly stole these from Alderbro. :3
				case "ey":
					buffer = mf("he", "she");
					break;
				case "him":
				case "himHer":
				case "em":
					buffer = mf("him", "her");
					break;
				case "himHerIt":
					buffer = mfn("him","her","it");
					break;
				case "his":
				case "hisHer":
				case "eir":
					buffer = mf("his", "her");
					break;
				case "hisHers":
				case "eirs":
					buffer = mf("his", "hers");
					break;
				case "sir":
				case "ma'am":
					buffer = mf("sir", "ma’am");
					break;
				case "misterMiss":
				case "mister":
				case "miss":
					buffer = mf("mister", "miss");
					break;
				case "mr":
				case "ms":
					buffer = mf("Mr", "Ms");
					break;
				case "man":
				case "woman":
				case "manWoman":
					buffer = mf("man", "woman");
					break;
				case "boy":
				case "girl":
				case "boyGirl":
				case "girlBoy":
					buffer = mf("boy", "girl");
					break;
				case "guy":
				case "girl":
				case "guyGirl":
					buffer = mf("guy","girl");
					break;
				case "son":
				case "daughter":
				case "sonDaughter":
				case "daughterSon":
					buffer = mf("son", "daughter");
					break;
				case "daddy":
				case "mommy":
				case "daddyMommy":
					buffer = mf("daddy", "mommy");
					break;
				case "son":
				case "daughter":
				case "sonDaughter":
					buffer = mf("son", "daughter");
					break;
				case "brother":
				case "sister":
				case "brotherSister":
				case "bro":
				case "sis":
				case "broSis":
					buffer = mf("brother", "sister");
					break;
				case "uncle":
				case "aunt":
				case "uncleAunt":
					buffer = mf("uncle", "aunt");
					break;
				case "nephew":
				case "niece":
				case "nephewNiece":
					buffer = mf("nephew", "niece");
					break;
				case "handsome":
				case "cute":
				case "handsomeCute":
					buffer = mf("handsome", "cute");
					break;
				case "cockShape":
				case "cockshape":
				case "cockType":
				case "cocktype":
					buffer = cockShape(arg2);
					break;
				case "accurateCockName":
					buffer = accurateCockName(arg2);
					break;
				case "tailGenital":
				case "genitalTail":
				case "genitail":
					buffer = tailGenitalDescript();
					break;
				case "tailGenitals":
				case "genitalTails":
				case "genitails":
					buffer = tailGenitalsDescript();
					break;
				case "oneTailGenital":
				case "oneGenitalTail":
				case "oneGenitail":
					buffer = oneTailGenitalDescript();
					break;
				case "oneTailCock":
				case "oneCockTail":
					buffer = oneTailGenitalDescript("cock");
					break;
				case "oneTailVagina":
				case "oneTailCunt":
				case "oneCuntTail":
				case "oneTailgina":
					buffer = oneTailGenitalDescript("cunt");
					break;
				case "eachTailGenital":
				case "eachGenitalTail":
					buffer = eachTailGenitalDescript();
					break;
				case "eachTailCock":
				case "eachCockTail":
					buffer = eachTailGenitalDescript("cock");
					break;
				case "eachTailVagina":
				case "eachTailCunt":
				case "eachCuntTail":
				case "eachTailgina":
					buffer = eachTailGenitalDescript("cunt");
					break;
				case "tailCockColor":
				case "tailCuntColor":
				case "tailGenitalColor":
					buffer = tailGenitalColorDesc();
					break;
				case "horn":
					buffer = hornDescript();
					break;
				case "eachHorn":
					buffer = eachHorn();
					break;
				case "oneHorn":
					buffer = oneHorn();
					break;
				case "horns":
					buffer = hornsDescript();
					break;
				case "hornNoun":
					buffer = hornNoun();
					break;
				case "hornsNoun":
					buffer = hornsNoun();
					break;
				case "hornColor":
					buffer = hornColor();
					break;
				case "antenna":
					buffer = antennaeDescript(false);
					break;
				case "antennae":
					buffer = antennaeDescript();
					break;
				case "combatName":
					buffer = getCombatName();
					break;
				case "combatPronoun":
				case "combatHimHer":
					buffer = getCombatPronoun("o");
					break;
				case "combatHeShe":
					buffer = getCombatPronoun("s");
					break;
				case "combatHisHer":
					buffer = getCombatPronoun("pa");
					break;
				case "combatHisHers":
					buffer = getCombatPronoun("pp");
					break;
				case "combatHimself":
				case "combatHerself":
				case "combatYourself":
				case "combatHimselfHerself":
					buffer = getCombatPronoun("sl");
					break;
				case "has":
				case "have":
				case "hasHave":
					buffer = (this is PlayerCharacter || isPlural ? "have" : "has");
					break;
				case "barkMeow":
					buffer = catDog("meow", "bark", true);
					break;
				case "meowBark":
					buffer = catDog("meow", "bark", false);
					break;
					
				default:
					// error production is now done up-stream in the parser
					// Gedan: I ain't seeing no errors, so I'm gonna Throw on unknown tags to make their presence 120% obvious when turbotesting scenes.
					//throw new Error("Unmatched tag descriptor: " + desc);
					trace("ERROR: Unmatched tag descriptor detected: " + desc);
					return "<b>Error, invalid description for " + short + ". Passed description call: \"" + arg + "\" with argument: \"" + arg2 + "\"</b>";
					
					break;
			}
			if (buffer == null) return "<b>Error, description for " + short + " returned undefined/null. Passed description call: \"" + arg + "\" with argument: \"" + arg2 + "\"</b>";
			if (arg.charCodeAt(0) > 64 && arg.charCodeAt(0) < 90) buffer = upperCase(buffer);
			// trace("BUFFER OUT: " + buffer);
			return buffer;
		}
		public function nameDisplay():String
		{
			return a + short;
		}
		public function Num2Text(number: int): String {
			return upperCase(num2Text(number));
		}
		public function numTwoText(number: int): String {
			var returnVar: String = null;
			var numWords:Array = new Array("zero", "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth");
			if (number > 10) {
				returnVar = "" + number + "th";
			} else {
				returnVar = numWords[number];
			}
			return (returnVar);
		}
		public function NumTwoText(number: int): String {
			return upperCase(numTwoText(number));
		}
		public function upperCase(str: String): String {
			var firstChar: String = str.substr(0, 1);
			var restOfString: String = str.substr(1, str.length);
			return firstChar.toUpperCase() + restOfString;
		}
		public function inventorySlots(): int {
			var slots:int = 10;
			if(accessory is Cargobot) slots += 2;
			if(armor is InsulatedCoat) slots += 1;
			if(hasPerk("Hidden Loot")) slots += 2;
			slots += statusEffectv1("Backpack Upgrade");
			return slots;
		}
		public function freeInventorySlots():int {
			return (inventorySlots() - inventory.length);
		}
		public function hasFreeInventorySlot(slots:int = 1):Boolean {
			return (freeInventorySlots() >= slots);
		}
		
		/*
		public function hasItem(arg:ItemSlotClass,amount:int = 1):Boolean
		{
			if(arg == null || inventory.length == 0) return false;
			var foundAmount:int = 0;
			for(var x:int = 0; x < inventory.length; x++)
			{
				if(inventory[x].shortName == arg.shortName) foundAmount += inventory[x].quantity;
			}
			if(foundAmount >= amount) return true;
			return false;
		}
		public function hasItemByName(arg:String, amount:int = 1):Boolean
		{
			if (arg == null || inventory.length == 0) return false;
			
			var foundAmount:int = 0;
			for(var x:int = 0; x < inventory.length; x++)
			{
				if(inventory[x].shortName == arg) foundAmount += inventory[x].quantity;
			}
			if(foundAmount >= amount) return true;
			return false;
		}
		*/
		public function numberOfItemByClass(ref:Class):int
		{
			if (ref == null || inventory.length == 0) return 0;
			
			var amt:int = 0;
			
			for (var i:uint = 0; i < inventory.length; i++)
			{
				if (inventory[i] is ref) amt += inventory[i].quantity;
			}
			return amt;
		}
		public function numberOfItemType(arg:int):int
		{
			if (inventory.length == 0) return 0;
			
			var amt:int = 0;
			
			for (var i:uint = 0; i < inventory.length; i++)
			{
				if (inventory[i].type == arg) amt += inventory[i].quantity;
			}
			return amt;
		}
		public function numberOfItemByReference(item:ItemSlotClass):int
		{
			return numberOfItemByClass(getDefinitionByName(getQualifiedClassName(item)) as Class);
		}
		public function hasItemByClass(ref:Class, amount:int = 1):Boolean
		{
			if (ref == null || inventory.length == 0) return false;
			
			var amt:int = numberOfItemByClass(ref);
			
			if (amt >= amount) return true;
			return false;
		}
		public function hasItemType(arg:int, amount:int = 1):Boolean
		{
			if (inventory.length == 0) return false;
			
			var amt:int = numberOfItemType(arg);
			
			if (amt >= amount) return true;
			return false;
		}
		public function hasItemByReference(item:ItemSlotClass, amount:int = 1):Boolean
		{
			if (item == null || inventory.length == 0 || amount == 0) return false;

			var amt:int = numberOfItemByReference(item);

			if (amt >= amount) return true;
			return false;
		}
		/*
		public function destroyItemByName(arg:String, amount:int = 1):void
		{
			if (arg == null || inventory.length == 0 || amount == 0) return;
			
			var i:int = 0;
			
			// Remove all!
			if (amount < 0)
			{
				while (i < inventory.length)
				{
					if (inventory[i].shortName == arg)
					{
						inventory[i].quantity = 0;
						inventory.splice(i, 1);
					}
					else i++;
				}
			}
			// Normal
			else
			{
				while (amount > 0 && i < inventory.length)
				{
					//Item in the slot?
					if (inventory[i].shortName == arg) 
					{
						//If we still need to eat some, eat em up!
						while (amount > 0 && inventory[i].quantity > 0 && inventory[i].shortName == arg) 
						{
							inventory[i].quantity--;
							amount--;
							if (inventory[i].quantity <= 0)
							{
								inventory[i].quantity = 0;
								inventory.splice(i, 1);
							}
						}
					}
					else i++;
				}
			}
			return;
		}
		*/
		public function destroyItemByReference(arg:ItemSlotClass):void
		{
			if (arg == null || inventory.length == 0) return;
			
			arg.quantity--;
			
			if (arg.quantity <= 0)
			{
				var i:int = inventory.indexOf(arg);
				inventory[i].quantity = 0;
				inventory.splice(i, 1);
			}
		}
		/*
		public function destroyItem(arg:ItemSlotClass, amount:int = 1):void
		{
			if (arg == null || inventory.length == 0 || amount == 0) return;
			
			var i:int = 0;
			
			// Remove all!
			if (amount < 0)
			{
				while (i < inventory.length)
				{
					if (inventory[i].shortName == arg.shortName)
					{
						inventory[i].quantity = 0;
						inventory.splice(i, 1);
					}
					else i++;
				}
			}
			// Normal
			else
			{
				while (amount > 0 && i < inventory.length)
				{
					//Item in the slot?
					if (inventory[i].shortName == arg.shortName) 
					{
						//If we still need to eat some, eat em up!
						while (amount > 0 && inventory[i].quantity > 0 && inventory[i].shortName == arg.shortName) 
						{
							inventory[i].quantity--;
							amount--;
							if (inventory[i].quantity <= 0)
							{
								inventory[i].quantity = 0;
								inventory.splice(i, 1);
							}
						}
					}
					else i++;
				}
			}
			return;
		}
		*/
		public function destroyItemByClass(arg:Class, amount:int = 1):void
		{
			if (arg == null || inventory.length == 0 || amount == 0) return;
			
			var i:int = (inventory.length - 1);
			
			// Remove all!
			if (amount < 0)
			{
				while (i >= 0)
				{
					if (inventory[i] is arg)
					{
						inventory[i].quantity = 0;
						inventory.splice(i, 1);
					}
					i--;
				}
			}
			// Normal
			else
			{
				while (amount > 0 && i >= 0)
				{
					//Item in the slot?
					if (inventory[i] is arg)
					{
						var nFromSlot:int = Math.min(amount, inventory[i].quantity);
						amount -= nFromSlot;
						inventory[i].quantity -= nFromSlot;
						if (inventory[i].quantity == 0)
						{
							inventory.splice(i, 1);
						}
					}
					i--;
				}
				if(amount > 0) output("<b>ERROR - Inventory item quantity needed: " + amount + "!</b>");
			}
		}
		
		public function getWeaponName(fromStat:Boolean = false):String
		{
			if(hasStatusEffect("Disarmed") && hasKeyItem("Lasso")) return "lasso";
			if(!fromStat)
			{
				if (!(rangedWeapon is EmptySlot)) return rangedWeapon.longName;
				if (!(meleeWeapon is EmptySlot)) return meleeWeapon.longName;
			}
			else
			{
				if (hasMeleeWeapon() && (physique() > aim() || (physique() == aim() && affinity == "physique"))) return meleeWeapon.longName;
				else if (hasRangedWeapon()) return rangedWeapon.longName;
			}
			if((meleeWeapon is Rock) || (rangedWeapon is Rock)) return "rock";
			return "fist";
		}
		
		public function heldWeaponName(fromStat:Boolean = false):String
		{
			if(!(rangedWeapon is EmptySlot) && !(rangedWeapon is Rock) && ((meleeWeapon is EmptySlot) || (meleeWeapon is Rock))) return rangedWeapon.longName;
			if(!(meleeWeapon is EmptySlot) && !(meleeWeapon is Rock) && ((rangedWeapon is EmptySlot) || (rangedWeapon is Rock))) return meleeWeapon.longName;
			return getWeaponName(true);
		}

		public function getRangedNoun():String
		{
			if(!(rangedWeapon is EmptySlot))
			{
				if (rangedWeapon is Rock) return "rock"
				if(rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON)) return "bow";
				var nouns:Array = ["gun"];
				if(rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_RIFLE_WEAPON)) nouns.push("rifle");
				if(rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_PISTOL_WEAPON)) nouns.push("pistol");
				if(rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_SHOTGUN_WEAPON)) nouns.push("shotgun");
				if(rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_THROWER_WEAPON)) nouns.push("thrower");
				if(rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_LAUNCHER_WEAPON)) nouns.push("launcher");
				
				//Basically checks if the last word in a weapons name is a number and if it isn't, adds that to the list of possible outputs.
				//Makes for a far nicer pool, and covers some more details than just "rifle" and the like.
				//Doesn't work with things like MK.IV, but the current ranged weapon convention has that at the front of the long range
				
				var gName:Array = rangedWeapon.longName.split(" ");
				var nameDesc:String = gName[gName.length - 1];
				if (isNaN(Number(nameDesc))) nouns.push(nameDesc);				

				return RandomInCollection(nouns);
			}
			return "fists";
		}
		
		public function weaponActionReady(present:Boolean = false, weapon:String = "", full:Boolean = true):String
		{
			var desc:String = "";
			var actions:Array = [];
			var singular:Boolean = ((this is PlayerCharacter) || isPlural);
			var weaponName:String = getWeaponName();
			
			if (weapon == "stat")
			{
				if (hasMeleeWeapon() && (physique() > aim() || (physique() == aim() && affinity == "physique"))) weapon = "melee";
				else if (hasRangedWeapon()) weapon = "ranged";
			}
			else if (weapon == "default")
			{
				if (hasRangedWeapon()) weapon = "ranged";
				else if (hasMeleeWeapon()) weapon = "melee";
			}
			
			if (present) actions.push("readying", "preparing");
			else if (singular) actions.push("ready", "prepare");
			else actions.push("readies", "prepares");
			
			if (weapon == "ranged")
			{
				if(present) actions.push("taking out", "getting out", "pulling out");
				else if (singular) actions.push("take out", "get out", "pull out");
				else actions.push("takes out", "gets out", "pulls out");
				if (hasRangedEnergyWeapon())
				{
					if (present) actions.push("charging", "loading");
					else if (singular) actions.push("charge", "load");
					else actions.push("charges", "loads");
				}
				if (hasBowWeaponEquipped())
				{
					if (present) actions.push("drawing", "mounting", "equipping", "tightening");
					else if (singular) actions.push("draw", "mount", "equip", "tighten");
					else actions.push("draws", "mounts", "equips", "tightens");
				}
				else
				{
					if (present) actions.push("drawing", "loading", "cocking", "uncovering");
					else if (singular) actions.push("draw", "load", "cock", "uncover");
					else actions.push("draws", "loads", "cocks", "uncovers");
				}
				weaponName = rangedWeapon.longName;
			}
			else if (weapon == "melee")
			{
				if (present) actions.push("taking out", "getting out", "pulling out");
				else if (singular) actions.push("take out", "get out", "pull out");
				else actions.push("takes out", "gets out", "pulls out");
				if (hasMeleeEnergyWeapon())
				{
					if (present) actions.push("charging", "activating");
					else if (singular) actions.push("charge", "activate");
					else actions.push("charges", "activates");
				}
				if (meleeWeapon.attackNoun == "whip")
				{
					if(present) actions.push("unraveling", "loosening", "flourishing");
					else if(singular) actions.push("unravel", "loosen", "flourish");
					else actions.push("unravels", "loosens", "flourishes");
				}
				else
				{
					if (present) actions.push("drawing", "unsheathing", "brandishing", "flourishing", "wielding");
					else if (singular) actions.push("draw", "unsheathe", "brandish", "flourish", "wield");
					else actions.push("draws", "unsheathes", "brandishes", "flourishes", "wields");
				}
				weaponName = meleeWeapon.longName;
			}
			
			desc += RandomInCollection(actions);
			
			if (full)
			{
				if (this is PlayerCharacter) desc += " your " + weaponName;
				else if (isPlural) desc += " their " + weaponName;
				else desc += " " + mfn("his", "her", "its") + " " + weaponName;
			}
			return desc;
		}
		public function weaponActionRelax(present:Boolean = false, weapon:String = "", full:Boolean = true):String
		{
			var desc:String = "";
			var actions:Array = [];
			var singular:Boolean = ((this is PlayerCharacter) || isPlural);
			var weaponName:String = getWeaponName();
			
			if (weapon == "stat")
			{
				if (hasMeleeWeapon() && (physique() > aim() || (physique() == aim() && affinity == "physique"))) weapon = "melee";
				else if (hasRangedWeapon()) weapon = "ranged";
			}
			else if (weapon == "default")
			{
				if (hasRangedWeapon()) weapon = "ranged";
				else if (hasMeleeWeapon()) weapon = "melee";
			}
			
			if (present) actions.push("relaxing", "resting");
			else if (singular) actions.push("relax", "rest");
			else actions.push("relaxes", "rest");
			
			if (weapon == "ranged")
			{
				if (present) actions.push("putting away", "putting back", "placing back");
				else if (singular) actions.push("put away", "put back", "place back");
				else actions.push("puts away", "puts back", "places back");
				if (hasRangedEnergyWeapon())
				{
					if (present) actions.push("decharging", "powering down");
					else if (singular) actions.push("decharge", "power down");
					else actions.push("decharges", "powers down");
				}
				if (hasBowWeaponEquipped())
				{
					if (present) actions.push("retracting", "relinquishing", "renouncing", "loosening");
					else if (singular) actions.push("retract", "relinquish", "renounce", "loosen");
					else actions.push("retracts", "relinquishes", "renounces", "loosens");
				}
				else
				{
					if (present) actions.push("retracting", "locking", "storing", "holstering");
					else if (singular) actions.push("retract", "lock", "store", "holster");
					else actions.push("retracts", "locks", "stores", "holsters");
				}
				weaponName = rangedWeapon.longName;
			}
			else if (weapon == "melee")
			{
				if (present) actions.push("putting away", "putting back", "placing back");
				else if (singular) actions.push("put away", "put back", "place back");
				else actions.push("puts away", "puts back", "places back");
				if (hasMeleeEnergyWeapon())
				{
					if (present) actions.push("turning off", "deactivating");
					else if (singular) actions.push("turn off", "deactivate");
					else actions.push("turns off", "deactivates");
				}
				if (meleeWeapon.attackNoun == "whip")
				{
					if(present) actions.push("recoiling", "tightening", "packing away");
					else if(singular) actions.push("recoil", "tighten", "pack away");
					else actions.push("recoils", "tightens", "packs away");
				}
				else
				{
					if (present) actions.push("putting down", "sheathing", "stashing", "saving", "covering");
					else if (singular) actions.push("put down", "sheathe", "stash", "save", "cover");
					else actions.push("puts down", "sheathes", "stashes", "saves", "covers");
				}
				weaponName = meleeWeapon.longName;
			}
			
			desc += RandomInCollection(actions);
			
			if (full)
			{
				if (this is PlayerCharacter) desc += " your " + weaponName;
				else if (isPlural) desc += " their " + weaponName;
				else desc += " " + mfn("his", "her", "its") + " " + weaponName;
			}
			return desc;
		}
		public function moveAction(present:Boolean = false, travel:Boolean = false):String
		{
			var desc:String = "";
			var actions:Array = [];
			if(present) {
				actions = ["going"];
				if(!travel) actions.push("moving");
			}
			else {
				actions = ["go"];
				if(!travel) actions.push("move");
			}
			
			if(hasLegs()) {
				if(present) {
					actions.push("walking", "walking");
					if(!travel) actions.push("stepping");
				}
				else {
					actions.push("walk", "walk");
					if(!travel) actions.push("step");
				}
			}
			if(isGoo()) {
				if(present) {
					actions.push("crawling");
					if(!travel) actions.push("sliding");
				}
				else {
					actions.push("crawl");
					if(!travel) actions.push("slide");
				}
			}
			if(isNaga()) {
				if(present) {
					actions.push("slithering", "slinking");
					if(!travel) actions.push("wriggling");
				}
				else {
					actions.push("slither", "slink");
					if(!travel) actions.push("wriggle");
				}
			}
			if(isCentaur()) {
				if(present) actions.push("galloping", "cantering");
				else actions.push("gallop", "canter");
			}
			if(isTaur()) {
				if(present) {
					actions.push("trotting");
					if(!travel) actions.push("loping");
				}
				else {
					actions.push("trot");
					if(!travel) actions.push("lope");
				}
			}
			if(isDrider()) {
				if(present) {
					actions.push("skittering");
					if(!travel) actions.push("flitting");
				}
				else {
					actions.push("skitter");
					if(!travel) actions.push("flit");
				}
			}
			if(legType == GLOBAL.TYPE_DZAAN) {
				if(present) {
					actions.push("tip-toeing");
				}
				else {
					actions.push("tip-toe");
				}
			}
			if(legType == GLOBAL.TYPE_MLP) {
				if(present) {
					actions.push("galloping", "cantering", "trotting");
					if(!travel) actions.push("loping", "hoofing it");
				}
				else {
					actions.push("gallop", "canter", "trot");
					if(!travel) actions.push("lope", "hoof it");
				}
			}
			
			desc += RandomInCollection(actions);
			return desc;
		}
		// Easy to wipe off
		public function simpleClean():void
		{
			removeStatusEffect("Sweaty");
			removeStatusEffect("Cum Soaked");
			removeStatusEffect("Pussy Drenched");
			removeStatusEffect("Milk Bathed");
			removeStatusEffect("Oil Warmed");
			removeStatusEffect("Oil Cooled");
			removeStatusEffect("Oil Numbed");
			removeStatusEffect("Oil Aroused");
			removeStatusEffect("Oil Slicked");
		}
		// Requires running water
		public function shower():void
		{
			if(statusEffectv1("Shower Douche Toggle") == 1)
			{
				flushCumflation();
				removeStatusEffect("Shower Douche Toggle");
			}
			simpleClean();
			removeStatusEffect("Mare Musk");
			removeStatusEffect("Roehm Slimed");
			if(hasStatusEffect("Painted Penis") || hasStatusEffect("Painted Tits") || hasStatusEffect("Body Paint"))
			{
				if(this is PlayerCharacter) AddLogEvent("Washing yourself has cleaned off any and all paint that had been covering your body.");
				if(hasStatusEffect("Painted Penis")) clearPaintedPenisEffect();
				if(hasStatusEffect("Painted Tits")) clearPaintedTitsEffect();
				removeStatusEffect("Body Paint");
			}
			if(pluggedVaginas() > 0 || isPlugged(-1))
			{
				if(isPlugged(-1)) ass.delFlag(GLOBAL.FLAG_PLUGGED);
				for(var i:int = 0; i < vaginas.length; i++)
				{
					if(isPlugged(i)) vaginas[i].delFlag(GLOBAL.FLAG_PLUGGED);
				}
				removeStatusEffect("Pussy Plugged");
				if(this is PlayerCharacter)
				{
					AddLogEvent("<b>After the cleaning, you’re delighted to find that the hardened substance plugging you up has dissolved away!</b>");
					flags["SHOWERED_OUT_PLUG"] = 1;
				}
			}
		}
		public function flushCumflation():void
		{
			removeStatusEffect("Anally-Filled");
			removeStatusEffect("Vaginally-Filled");
			removeStatusEffect("Orally-Filled");
		}
		public function canMasturbate():Boolean
		{
			// Effects that prevent maturbations:
			if
			(	hasStatusEffect("Myr Venom Withdrawal")
			||	hasStatusEffect("Grappled")
			||	hasStatusEffect("Stunned")
			||	hasStatusEffect("Paralyzed")
			)	return false;
			return true;
		}
		public function orgasm(): void
		{
			var msg:String = "";
			
			// NaN production was down to maxCum
			// if the player didn't have a cock, maxCum returns 0.
			// anything / 0 = NaN
			if (hasCock())
			{
				// @FENCUMFIX
				// How to fix this will depend on how you want to handle it Fen:
				// Either limit cumQ to never allow a value greater than currentCum()
				// Or allow CumQ to produce whatever, and simply clamp the ballFullness set value here to 0.
				
				//ballFullness = Math.round(((currentCum() - cumQ()) / maxCum()) * 100);
				var cumAmt:Number = Math.round(((currentCum() - cumQ()) / maxCum()) * 100);
				if (cumAmt < 0) cumAmt = 0;
				
				if(this is PlayerCharacter || fluidSimulate) ballFullness = cumAmt;

				if(this is PlayerCharacter)
				{
					//Mimbrane feeding
					kGAMECLASS.mimbraneFeed("cock");
				}
				if(balls > 0)
				{
					if(hasStatusEffect("Blue Balls", true) && ballFullness < 100)
					{
						if(this is PlayerCharacter) AddLogEvent(ParseText("With a satisfied sigh, your [pc.balls] " + (balls <= 1 ? "is" : "are") + " finally relieved of all the pent-up " + (rand(2) == 0 ? "seed" : "[pc.cumNoun]") + "."), "passive", -1);
						removeStatusEffect("Blue Balls", true);
					}
					//'Nuki Ball Reduction
					if(perkv1("'Nuki Nuts") > 0)
					{
						if(this is PlayerCharacter)
						{
							msg = "Your";
							if(balls == 1) msg += " testicle is back to its";
							else msg += " balls are back to their";
							msg += " normal size once more. What an incredible relief!";
							AddLogEvent(msg, "passive", -1);
						}
						ballSizeMod -= perkv1("'Nuki Nuts");
						setPerkValue("'Nuki Nuts",1,0);
					}
					kGAMECLASS.nutStatusCleanup();
				}
				if(statusEffectv1("Nyrea Eggs") > 0 && hasOvipositor())
				{
					var nyreaEggs:Number = Math.round((6 + rand(5)) * statusEffectv2("Nyrea Eggs"));
					if(this is PlayerCharacter)
					{
						if ((statusEffectv1("Nyrea Eggs") - nyreaEggs) < 0) nyreaEggs = statusEffectv1("Nyrea Eggs");
						msg = "You’ve manage to expel";
						if(nyreaEggs == 1) msg += " one faux nyrea egg";
						else msg += " " + num2Text(nyreaEggs) + " faux nyrea eggs";
						msg += " from your orgasm!";
						AddLogEvent(msg, "passive", -1);
					}
					addStatusValue("Nyrea Eggs", 1, -1 * (nyreaEggs));
					if(statusEffectv1("Nyrea Eggs") < 0) setStatusValue("Nyrea Eggs", 1, 0);
				}
				// Priapism timer down if no special toggle
				if(hasStatusEffect("Priapism") && statusEffectv1("Priapism") == 0)
				{
					addStatusMinutes("Priapism", (-15 * 60));
					if(getStatusMinutes("Priapism") < 1) setStatusMinutes("Priapism", 1);
				}
			}
			if (hasVagina())
			{
				if(this is PlayerCharacter)
				{
					//Mimbrane feeding
					kGAMECLASS.mimbraneFeed("vagina");
				}
			}
			
			if (this is PlayerCharacter) 
			{
				//Biomass vent
				if(statusEffectv1("Goo Vent") == 1 && hasGenitals())
				{
					flags["GOO_BIOMASS"] = 0;
				}
				//Slamazon shit
				if(hasStatusEffect("Amazonian Endurance Report Needed", true)) 
				{
					kGAMECLASS.amazonEnduranceNotice();
					removeStatusEffect("Amazonian Endurance Report Needed", true);
				}
				//Luca Submission
				if(hasStatusEffect("Denied By Luca"))
				{
					if (statusEffectv1("Denied By Luca") == 1) kGAMECLASS.lucaSubmission(-5);
					removeStatusEffect("Denied By Luca");
				}
				StatTracking.track("sex/player/orgasms");
			}
			else
			{
				StatTracking.track("characters/" + short + "/orgasms");
			}
			
			lustRaw = 0;
			if (this is PlayerCharacter) 
			{
				//Dumbfuck orgasms
				if (hasStatusEffect("Dumbfuck"))
				{
					if(!hasStatusEffect("Dumbfuck Orgasm Procced"))
					{
						createStatusEffect("Dumbfuck Orgasm Procced", 0, 0, 0, 0, true, "", "", false, 0);
					}
					addStatusValue("Dumbfuck Orgasm Procced",1,1);
					trace("DUMBFUCK STATUS:" + statusEffectv1("Dumbfuck Orgasm Procced"));
				}
				//Energy loss/gain checks
				var energyLoss:Boolean = true;
				if(hasPerk("Snu-Snu Queen") || hasPerk("Energizing Libido"))
				{
					// Lost if libido goes below 40
					if(libido() < 40)
					{
						createStatusEffect("Remove Energizing Libido", 0, 0, 0, 0, true, "", "", false, 0);
						energy(-10);
					}
					// 1/4 chance to gain 1-3 energy per sexual encounter. Guaranteed at >95 libido
					else if(libido() >= 95 || rand(4) == 0)
					{
						energy(1 + rand(3));
					}
					energyLoss = false;
				}
				if(hasPerk("Amazonian Endurance")) energyLoss = false;
				if(energyLoss) energy(-5);
			}
			
			//Sore Tubes debuff
			if (hasStatusEffect("Sore Tubes")) HP((hasStatusEffect("Blue Balls") ? -20 : -10));
			
			minutesSinceCum = 0;
			timesCum++;
		}
		
		public function isNude(): Boolean {
			if(hasStatusEffect("Temporary Nudity Cheat")) return true;
			//return (armor.shortName == "" && lowerUndergarment.shortName == "" && upperUndergarment.shortName == "");
			return (!isCrotchGarbed() && !isChestCovered());
		}
		public function isCoveredUp(): Boolean {
			if(accessory.hasFlag(GLOBAL.ITEM_FLAG_COVER_BODY)) return true;
			return false;
		}
		public function canCoverSelf(checkGenitals:Boolean = false, part:String = "all"): Boolean {
			// Part-specific checks
			if(part == "wings" && !hasJointedWings()) return false;
			// Omnisuit
			if(part != "wings" && armor is Omnisuit) return true;
			// See if your body can cover itself
			if(part != "wings" && canUseTailsOrFurAsClothes()) return true;
			// Normal genital location
			if(!checkGenitals || genitalLocation() <= 1)
			{
				// Cover yourself with your fuckton of wings
				if(wingType == GLOBAL.TYPE_DOVE)
				{
					if(wingCount >= 4) return true;
					return false;
				}
				if(hasJointedWings())
				{
					if(checkGenitals && statusEffectv1("Wing Position") != 1) return false;
					return true;
				}
			}
			
			return false;
		}
		public function canUseTailsOrFurAsClothes():Boolean
		{
			var coverage:int = 0;
			var bitsNeedCover:int = 0;
			var hasFurOrFeathers:Boolean = (hasFur() || hasFeathers());
			var isFluffy:Boolean = hasFurOrFeathers && hasSkinFlag(GLOBAL.FLAG_FLUFFY);
			
			if (isChestVisible())
			{
				var titSize:int = 0;
				for (var i:int = 0; i < breastRows.length; i++) 
				{
					titSize = breastRows[i].breastRating();
					if (titSize >= 100 && breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_FLAT) return false; // Can't hide hyper-sized tits!
					if
					(	titSize > (isFluffy ? (i < 2 ? 2 : 1) : 0) // fluffy fur can disguise B-cups on chest (due to that fluffy fur ball in description) and A-cups on belly
					//|| 	breastRows[i].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES // lipples? they should look quite obscene, but this is not checked in main function
					//|| 	InCollection(breastRows[i].nippleType, GLOBAL.NIPPLE_TYPE_NORMAL, GLOBAL.NIPPLE_TYPE_DICK, GLOBAL.NIPPLE_TYPE_TENTACLED) && nippleLength(biggestTitRow()) >= 1 // even with flats, too long nipples are quite obscene, but this is not checked in main function
					) bitsNeedCover++;
				}
				// Wings or long hair can cover tits.
				if
				(	(wingType == GLOBAL.TYPE_DOVE && wingCount >= 4)
				||	(hasJointedWings() && statusEffectv1("Wing Position") == 1)
				||	(hairLength >= tallness/4 && !InCollection(hairStyle, ["ponytail", "mohawk", "afro", "spikes", "front wave", "backwards slick", "messy chignon", "tight chignon", "side plait", "single braid", "crown braid", "pigtail buns"]))
				) bitsNeedCover = 0;
			}
			
			// Tails + Fur
			coverage = tailCount;
			
			// Alternate anatomy
			if (genitalLocation() > 1 && bitsNeedCover > 0)
			{
				return false; // you can't cover your breasts with your tails if you are taur, but you can go for the classic tauric scheme with wearing clothes only on humanoid part
				// actually, should also check if you are taur with genitals on humanoid location, but I doubt that this arrangement is actually supported or will be ever
			}
			
			if (isCrotchVisible())
			{
				if(hasCock() && !hasStatusEffect("Genital Slit")) // consider genital slit effectively covering your male bits
				{
					var hasSheathed:Boolean = false;
					var currLength:int = 0;
					var totalLength:int = 0;
					for (var j:int = 0; j < cocks.length; j++) 
					{
						currLength = cLength(j, true);
						if (hasSheath(j) && lust() < 66) hasSheathed = true; // consider sheath working if you are not desperately aroused
						else
						{
							if ((currLength >= 50 || currLength/tallness >= 0.75)) return false; // you can't hide leithan-grade boner!
							totalLength += currLength;
						}
					}
					if (hasSheathed || isFluffy) bitsNeedCover++; // Sheathes are modest enough to be covered with one tail all, or even just be covered by a long fur
					else bitsNeedCover += Math.ceil(totalLength / 18); // consider that you'll need one tail for every 18 inches of cock
				}
				
				if (balls > 0) // Genital Slit effect on balls is ambiguous, so I'm not counting it
				{
					if (scrotumType() == GLOBAL.FLAG_FURRED && ballSize() <= (hasStatusEffect("Uniball") ? 1 : 0.75)) { }
					else if (scrotumType() == GLOBAL.FLAG_FURRED && isFluffy && ballSize() <= (hasStatusEffect("Uniball") ? 1.5 : 1)) { }
					else
					{
						bitsNeedCover += Math.ceil(ballDiameter() * (hasStatusEffect("Uniball") ? 0.75 : 1) * Math.sqrt(balls) / 6);
					}
				}
				
				if (hasVagina())
				{
					if
					(	!(vaginaTotal(GLOBAL.TYPE_FELINE) + vaginaTotal(GLOBAL.TYPE_AVIAN) == vaginaTotal() && hasFurOrFeathers) // Feline ones are modest enough to be hidden just by fur from casual glance
					||	(puffiestVaginalPuffiness() >= 2 && !hasFurOrFeathers)
					||	(puffiestVaginalPuffiness() >= 4 && !isFluffy)
					) {
						bitsNeedCover++; // I guess 1 tail would be enough for all of them, unless we have something really freaky
					}
				}
			}
			
			if (isAssVisible())
			{
				if(analPuffiness() >= 2 || (analPuffiness() >= 1 && !isFluffy) || !hasFurOrFeathers)
				{
					bitsNeedCover++; // you always need at least 1 tail to cover your ass, unless you have fluffy fur
				}
			}
			
			// Exceptions for taurs/driders (as long as one eligible tail exists, it can "cover" non-hyper-sized bits)
			if (bitsNeedCover > 1 && genitalLocation() > 1) bitsNeedCover = 1;
			
			// No bits to cover?
			if (bitsNeedCover <= 0) return true;
			
			if (hasTail())
			{
				if(hasTailFlag(GLOBAL.FLAG_LONG) || hasTailFlag(GLOBAL.FLAG_PREHENSILE)) return (bitsNeedCover <= coverage);
			} // you need long, furred tails to do this
			
			return false;
		}
		
		public function isCrotchGarbed(): Boolean {
			if(hasStatusEffect("Temporary Nudity Cheat")) return false;
			else if(armor is EmptySlot && lowerUndergarment is EmptySlot) return false;
			return true;
		}
		public function isChestCovered(): Boolean {
			if(hasStatusEffect("Temporary Nudity Cheat")) return false;
			else if(armor is EmptySlot && upperUndergarment is EmptySlot) return false;
			return true;
		}
		public function isChestGarbed(): Boolean {
			return isChestCovered();
		}
		
		//Used to see if boobs are hanging out instead of isChestGarbed/Covered.
		public function isChestExposed(tight:Boolean = false): Boolean
		{
			return (isChestExposedByArmor(tight) && isChestExposedByUpperUndergarment(tight));
		}
		//Used to see if wing-wang-doodles and hatchet-wounds are accessible. Should probably replace most isCrotchGarbed() calls.
		public function isCrotchExposed(tight:Boolean = false): Boolean
		{
			return (isCrotchExposedByArmor(tight) && isCrotchExposedByLowerUndergarment(tight));
		}
		//Badonkadonk check
		public function isAssExposed(tight:Boolean = false):Boolean
		{
			return (isAssExposedByArmor(tight) && isAssExposedByLowerUndergarment(tight));
		}
		
		public function isAssExposedByArmor(tight:Boolean = false):Boolean
		{
			if(tight && armor.hasFlag(GLOBAL.ITEM_FLAG_SKIN_TIGHT)) return true;
			return (armor is EmptySlot || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS));
		}
		public function isCrotchExposedByArmor(tight:Boolean = false):Boolean
		{
			if(tight && armor.hasFlag(GLOBAL.ITEM_FLAG_SKIN_TIGHT)) return true;
			return (armor is EmptySlot || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN));
		}
		public function isChestExposedByArmor(tight:Boolean = false):Boolean
		{
			if(tight && armor.hasFlag(GLOBAL.ITEM_FLAG_SKIN_TIGHT)) return true;
			return (armor is EmptySlot || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST));
		}
		public function isAssExposedByLowerUndergarment(tight:Boolean = false):Boolean
		{
			if(tight && lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_SKIN_TIGHT)) return true;
			return (lowerUndergarment is EmptySlot || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS));
		}
		public function isCrotchExposedByLowerUndergarment(tight:Boolean = false):Boolean
		{
			if(tight && lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_SKIN_TIGHT)) return true;
			return (lowerUndergarment is EmptySlot || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN));
		}
		public function isChestExposedByUpperUndergarment(tight:Boolean = false):Boolean
		{
			if(tight && upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_SKIN_TIGHT)) return true;
			return (upperUndergarment is EmptySlot || upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST));
		}
		public function isExposed(tight:Boolean = false):Boolean
		{
			return (isChestExposed(tight) && isCrotchExposed(tight) && isAssExposed(true));
		}
		
		public function isChestVisible(tight:Boolean = false): Boolean
		{
			if(armor is EmptySlot || wornItemIsTransparent(armor) || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST))
			{
				return (upperUndergarment is EmptySlot || wornItemIsTransparent(upperUndergarment) || upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST));
			}
			return isChestExposed(tight);
		}
		public function isCrotchVisible(tight:Boolean = false): Boolean
		{
			if(armor is EmptySlot || wornItemIsTransparent(armor) || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN))
			{
				return (lowerUndergarment is EmptySlot || wornItemIsTransparent(lowerUndergarment) || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN));
			}
			return isCrotchExposed(tight);
		}
		public function isAssVisible(tight:Boolean = false):Boolean
		{
			if(armor is EmptySlot || wornItemIsTransparent(armor) || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
			{
				return (lowerUndergarment is EmptySlot || wornItemIsTransparent(lowerUndergarment) || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS));
			}
			return isAssExposed(tight);
		}
		public function exposureLevel(alsoVisible:Boolean = false):Number
		{
			var exhibitionismPoints:Number = 0;
		
			// Chest
			if(biggestTitSize() >= 1)
			{
				if((alsoVisible && isChestVisible()) || isChestExposed()) exhibitionismPoints++;
			}
			// Genitals
			if((hasGenitals() || balls > 0))
			{
				if((alsoVisible && isCrotchVisible()) || isCrotchExposed()) exhibitionismPoints++;
			}
			// Ass
			if((alsoVisible && isAssVisible()) || isAssExposed()) exhibitionismPoints++;
			// Nudity
			if(isNude()) exhibitionismPoints++;
			
			return exhibitionismPoints;
		}
		public function isFullyExposed(alsoVisible:Boolean = false):Boolean
		{
			if(isNude()) return true;
			
			return (exposureLevel(alsoVisible) > 0);
		}
		
		public function hasArmor():Boolean
		{
			return !(armor is EmptySlot);
		}
		
		public function hasUpperGarment():Boolean
		{
			return !(upperUndergarment is EmptySlot);
		}
		
		public function hasLowerGarment():Boolean
		{
			return !(lowerUndergarment is EmptySlot);
		}
		
		public function inSwimwear(strict:Boolean = false):Boolean
		{
			if(hasStatusEffect("Temporary Swimwear Cheat")) return true;
			// Armor/Outfit check:
			if (hasArmor() && armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR))
			{
				// Swimsuit outfits should not have undergarments on. That's not fashionable!
				if ((hasUpperGarment() && !upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR)) || (hasLowerGarment() && !lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR))) return false;
				// Swimsuit outfits with no undies? Yes.
				return true;
			}
			// Undergarment check:
			if (!hasArmor() && (hasLowerGarment() || hasUpperGarment()))
			{
				// All undergarments are eligible swimwear, unless it's a strict check
				if (strict)
				{
					if (hasLowerGarment() && hasUpperGarment())
						return (lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR) && upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR));
					if (hasLowerGarment())
						return (lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR));
					if (hasUpperGarment())
						return (upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR));
				}
				return true;
			}
			// Nope, no valid swim clothes (or is probably nude!).
			return false;
		}
		
		public function inPowerArmor():Boolean
		{
			if(armor.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR)) return true;
			return false;
		}
		public function hasPowerArmorItem():Boolean
		{
			if(meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR) || rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR) || accessory.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR) || shield.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR) || armor.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR) || upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR) || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR)) return true;
			for(var i:int = 0; i < inventory.length; i++)
			{
				if(inventory[i].hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR)) return true;
			}
			return false;
		}
		public function canUsePowerArmorWeapon():Boolean
		{
			return (inPowerArmor() || physique() >= 40 || hasPerk("Bigger Guns"));
		}
		
		public function canDropItem(item:ItemSlotClass):Boolean
		{
			if(item.hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) return false;
			return true;
		}
		public function removeClothes(item:String = "all"):void
		{
			var newItems:Array = [];
			if(item == "all" || item == "underwear" || item == "upperUndergarment")
			{
				upperUndergarment.onRemove(this);
				if(!canDropItem(upperUndergarment)) newItems.push(upperUndergarment);
				upperUndergarment = new EmptySlot();
			}
			if(item == "all" || item == "underwear" || item == "lowerUndergarment")
			{
				lowerUndergarment.onRemove(this);
				if(!canDropItem(lowerUndergarment)) newItems.push(lowerUndergarment);
				lowerUndergarment = new EmptySlot();
			}
			if(item == "all" || item == "clothing" || item == "armor")
			{
				armor.onRemove(this);
				if(!canDropItem(armor)) newItems.push(armor);
				armor = new EmptySlot();
			}
			if(newItems.length > 0)
			{
				for(var i:int = 0; i < newItems.length; i++) { inventory.push(newItems[i]); }
			}
		}
		public function removeEquipment(item:String = "all"):void
		{
			var newItems:Array = [];
			if(item == "all" || item == "weapons" || item == "meleeWeapon")
			{
				meleeWeapon.onRemove(this);
				if(!canDropItem(meleeWeapon)) newItems.push(meleeWeapon);
				meleeWeapon = new Rock();
			}
			if(item == "all" || item == "weapons" || item == "rangedWeapon")
			{
				rangedWeapon.onRemove(this);
				if(!canDropItem(rangedWeapon)) newItems.push(rangedWeapon);
				rangedWeapon = new Rock();
			}
			if(item == "all" || item == "accessory")
			{
				accessory.onRemove(this);
				if(!canDropItem(accessory)) newItems.push(accessory);
				accessory = new EmptySlot();
			}
			if(item == "all" || item == "shield")
			{
				shield.onRemove(this);
				if(!canDropItem(shield)) newItems.push(shield);
				shield = new EmptySlot();
			}
			if(newItems.length > 0)
			{
				for(var i:int = 0; i < newItems.length; i++) { inventory.push(newItems[i]); }
			}
		}
		public function removeAll():void
		{
			removeClothes();
			removeEquipment();
		}
		public function clearInventory():void
		{
			var i:int = 0;
			while (i < inventory.length)
			{
				if (canDropItem(inventory[i]))
				{
					inventory[i].quantity = 0;
					inventory.splice(i, 1);
				}
				else i++;
			}
		}
		
		public function onEquipClothes(item:String = "all"):void
		{
			if(item == "all" || item == "underwear" || item == "upperUndergarment") { upperUndergarment.onEquip(this); }
			if(item == "all" || item == "underwear" || item == "lowerUndergarment") { lowerUndergarment.onEquip(this); }
			if(item == "all" || item == "clothing" || item == "armor") { armor.onEquip(this); }
		}
		public function onEquipEquipment(item:String = "all"):void
		{
			if(item == "all" || item == "weapons" || item == "meleeWeapon") { meleeWeapon.onEquip(this); }
			if(item == "all" || item == "weapons" || item == "rangedWeapon") { rangedWeapon.onEquip(this); }
			if(item == "all" || item == "accessory") { accessory.onEquip(this); }
			if(item == "all" || item == "shield") { shield.onEquip(this); }
		}
		public function onEquipAll():void
		{
			onEquipClothes();
			onEquipEquipment();
		}
		
		//STATS!
		//Personalities!
		public function isNice(): Boolean {
			return (personality <= 33);
		}
		public function isMischievous(): Boolean {
			return (personality <= 66 && personality > 33);
		}
		// BECAUSE NOBODY EVER SPELLS IT CORRECTLY OR COMPLETELY
		public function isMisch():Boolean { return isMischievous(); }
		public function isMisc():Boolean { return isMischievous(); }
		
		public function isAss(): Boolean {
			return (personality > 66);
		}
		//Placeholders for when i rework the personality system soon-ish."
		public function addHard(arg:Number):void
		{
			personality += arg;
			if(personality > 100) personality = 100;
		}
		public function addNice(arg:Number):void
		{
			personality -= arg;
			if(personality < 0) personality = 0;
		}
		public function addMischievous(arg:Number):void
		{
			var originalPersonality:Number = personality;
			if(personality < 50)
			{
				personality += arg;
				if(personality > 50) personality = 50;
			}
			else
			{
				personality -= arg
				if(personality < 50) personality = 50;
			}
		}
		public function isMasculine(ignorePref:Boolean = false):Boolean
		{
			return (mf("m", "f", ignorePref) == "m");
		}
		public function isFeminine(ignorePref:Boolean = false):Boolean
		{
			return (mf("m", "f", ignorePref) == "f");
		}
		public function isBimbo():Boolean
		{
			if(hasStatusEffect("Temporary Treatment")) return true;
			if(this is PlayerCharacter && flags["DR_BADGER_BIMBOED_PC"] != undefined) return true;
			return hasPerk("Ditz Speech");
		}
		public function isBro():Boolean
		{
			return hasPerk("Brute Speech");
		}
		public function isSexless():Boolean
		{
			if(!hasCock() && !hasVagina()) return true;
			return false;
		}
		public function isMale():Boolean
		{
			if(hasCock() && !hasVagina()) return true;
			return false;
		}
		public function isFemale():Boolean
		{
			if(hasVagina() && !hasCock()) return true;
			return false;
		}
		public function isMan():Boolean
		{
			if(isMale() && mfn("m", "f", "n", true) == "m") return true;
			return false;
		}
		public function isWoman():Boolean
		{
			if(isFemale() && mfn("m", "f", "n", true) == "f") return true;
			return false;
		}
		public function isFemboy():Boolean
		{
			if(isMale() && mfn("m", "f", "n", true) != "m" && biggestTitSize() < 3) return true;
			return false;
		}
		public function isShemale():Boolean
		{
			if(isMale() && mfn("m", "f", "n", true) != "m" && biggestTitSize() >= 3) return true;
			return false;
		}
		public function isCuntboy():Boolean
		{
			if(isFemale() && mfn("m", "f", "n", true) == "m" && !hasBreasts()) return true;
			return false;
		}
		public function isFemmyMale():Boolean
		{
			if(isMale() && mfn("m", "f", "n", true) != "m") return true;
			return false;
		}
		public function isManlyFemale():Boolean
		{
			if(isFemale() && mfn("m", "f", "n", true) == "m") return true;
			return false;
		}
		public function isFemHerm():Boolean
		{
			if(isHerm() && mfn("m", "f", "n", true) != "m") return true;
			return false;
		}
		public function isManHerm():Boolean
		{
			if(isHerm() && mfn("m", "f", "n", true) == "m") return true;
			return false;
		}
		// For special case alien sex/gender override text in combat!
		public function genderTextOverride():String
		{
			var autoSex:String = "";
			var race:String = raceShort();
			
			// Goo races
			if
			(	originalRace == "galotian" || race.indexOf("galotian") != -1
			||	originalRace.indexOf("rahn") != -1 || isRahn()
			||	originalRace == "conglomerate"
			||	originalRace == "ganrael" || race.indexOf("ganrael") != -1
			)
			{
				autoSex = "Unisex";
			}
			// Bothrioc
			if(originalRace == "bothrioc" || race.indexOf("bothrioc") != -1)
			{
				autoSex = (!CodexManager.entryViewed("Bothrioc") ? "???" : "Unisex");
			}
			// Nyrea
			if(originalRace == "nyrea" || race.indexOf("nyrea") != -1)
			{
				if(isFemale()) autoSex = "Male";
				if(isMale()) autoSex = "Female";
				if(!CodexManager.entryViewed("Nyrea")) autoSex += "???";
			}
			// Plural mobs
			if(isPlural)
			{
				if(isSexless()) autoSex = "???";
				else if(isFemale()) autoSex = "Female";
				else if(isMale()) autoSex = "Male";
				else autoSex = "Mixed";
			}
			
			return autoSex;
		}
		/**
		 * Brynn has a bunch of shit that leans on this that kinda needs to be expanded.
		 * @Fen- if you decide how you're going to handle differentiating the type of treatment applied, remind me after to go through and clean it up to match.
		 * I'd suggest maybe doing something with args to filter it- maybe stuff the types into GLOBAL so you can do singular if (isTreated()) checks, and then break it
		 * into smaller chunks for each variant like if (isTreated(GLOBAL.FAUXCOW)) etc
		 * @return
		 */
		public function isTreated():Boolean
		{
			//Used for Millie's temporary treatment sampling.
			if(hasStatusEffect("Temporary Treatment")) return true;
			return hasStatusEffect("Treated");
		}
		
		// These are shit for the time being, as I assume you'd wanna divorce Physical & Mental changes (ie get a Female physical+mental change set, but then tf to male or some shit idk)
		public function isTreatedFemale():Boolean
		{
			if (isTreated() && mf("m", "f") == "f") return true;
			return false;
		}
		public function isTreatedMale():Boolean
		{
			if (isTreated() && mf("m", "f") == "m") return true;
			return false;
		}
		public function isTreatedCow():Boolean
		{
			if(!isTreated()) return false;
			if(hasStatusEffect("Treated Amazon")) return false;
			if(hasStatusEffect("Treated Faux Cow")) return false;
			return (hasPerk("Treated Milk") || hasPerk("Ditz Speech"));
		}
		public function isTreatedBull():Boolean
		{
			if(!isTreated()) return false;
			if(hasStatusEffect("Treated Amazon")) return false;
			if(hasStatusEffect("Treated Faux Cow")) return false;
			return (hasPerk("Pheromone Cloud") || hasPerk("Brute Speech"));
		}
		public function isAmazon(treatedOnly:Boolean = true):Boolean
		{
			if(!treatedOnly && amazonScore() >= 4) return true;
			return (isTreated() && hasStatusEffect("Treated Amazon"));
		}
		public function isCumCow():Boolean
		{
			return (isTreated() && hasStatusEffect("Cum-Cow"));
		}
		public function isCumSlut():Boolean
		{
			return (isCumCow() || hasPerk("Dumb4Cum") || isDependant(DEPENDANT_CUM));
		}
		public function isFauxCow():Boolean
		{
			return (isTreated() && hasStatusEffect("Treated Faux Cow"));
		}
		public function hasPheromones():Boolean
		{
			return (pheromoneLevel() > 0);
		}
		public function pheromoneLevel():Number
		{
			var muskLevel:Number = 0;
			
			if(hasPerk("Pheromone Cloud")) muskLevel += 4;
			if(hasPerk("Musky Pheromones")) muskLevel += 5;
			if(hasPerk("Alpha Scent")) muskLevel += 4;
			if(hasPerk("Jungle Queen Scent")) muskLevel += 4;
			if(hasPerk("Pheromone Sweat"))
			{
				muskLevel += Math.min(statusEffectv1("Sweaty"), 5);
				if(this is PlayerCharacter && flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] != undefined) muskLevel += 2;
				if(hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) muskLevel += 2;
			}
			if(accessory is Allure) muskLevel += 1;
			if(hasStatusEffect("Roehm Slimed")) muskLevel += Math.min((statusEffectv4("Roehm Slimed") * 3), statusEffectv3("Roehm Slimed"));
			if(hasStatusEffect("Zil Pheromones")) muskLevel += statusEffectv1("Zil Pheromones");
			//Modifies by % elsewhere, just setting to 1 for "hasPheromones"
			if(hasStatusEffect("\"Rutting\"")) muskLevel += 1;
			
			return muskLevel;
		}
		public function canDeepthroat():Boolean
		{
			if(this is PlayerCharacter && flags["USED_SNAKEBYTE"] != undefined) return true;
			return (isBimbo() || isTreated());
		}
		public function skinIsSoaked():Boolean
		{
			if(this is PlayerCharacter && flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] != undefined) return true;
			if(hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) return true;
			if(statusEffectv1("Sweaty") > 2) return true;
			return false;
		}
		//Mild exhib scene: arg = +1;
		//Full exhib scene: arg = +2
		public function exhibitionism(arg:Number = 0):Number
		{
			var originalExhibtionism:Number = exhibitionismRaw;
			if(this is PlayerCharacter) trace("Initial exhibition level: " + exhibitionismRaw);
			if(arg > 0)
			{
				//Mild exhib scene gainz! GET SWOLE
				if(arg <= 1)
				{
					//Diminishing returns at different thresholds
					if(exhibitionismRaw < 20) arg *= 2;
					else if(exhibitionismRaw < 40) {} //Nuttin'!
					else if(exhibitionismRaw < 50) arg /= 2;
					//Cannot push it past 50
					if(exhibitionismRaw < 50)
					{
						if(exhibitionismRaw + arg > 50) exhibitionismRaw = 50;
						else exhibitionismRaw += arg;
					}
					//Already at cap for this tier of exhibition gain
				}
				//Full exhib scene gainz. VERY SWOLE.
				else
				{
					if(exhibitionismRaw < 50) {} //No adjustments at this tier
					else if(exhibitionismRaw < 60) arg /= 2;
					else arg /= 4;
					//Cannot push it past 100
					if(exhibitionismRaw < 100)
					{
						if(exhibitionismRaw + arg > 100) exhibitionismRaw = 100;
						else exhibitionismRaw += arg;
					}
				}
				if(this is PlayerCharacter)
				{
					var msg:String = "";
					
					if(originalExhibtionism < 10 && exhibitionismRaw >= 10) msg += "Maybe having sex in front of an audience wouldn’t be that bad.";
					else if(originalExhibtionism < 20 && exhibitionismRaw >= 20) msg += "You’re still feeling a little bit of residual thrill. Who knew audiences could be so... intriguing.";
					else if(originalExhibtionism < 33 && exhibitionismRaw >= 33) msg += "You’ve got to admit to yourself that you’re developing a bit of an <b>exhibitionism fetish</b>. Sure, you get nervous as hell about the idea of showing yourself off, but you get horny as hell too. At least it’s a pretty common, socially accepted fetish... in most places.";
					else if(originalExhibtionism < 50 && exhibitionismRaw >= 50) msg += ParseText("Your mind keeps supplying you with excuses to bare a little [pc.skinFurScales] around others, or ways to risk getting caught mid-coitus. <b>If you don’t stop caving into those thoughts you’re going to wind up being a hard-core exhibitionist!</b>");
					else if(originalExhibtionism < 66 && exhibitionismRaw >= 66) msg += "Maybe you could buy a stand for your Codex and rig up a live holostream for when you’re getting naughty. It’d probably be too bulky to carry around all the time, but once you win your inheritance, you could probably turn a pretty penny banging ultraporn stars in front of a broadcasting prism. It’s telling that <b>you’ve almost completely obliterated your inhibitions about exhibitionism.</b>";
					else if(originalExhibtionism < 100 && exhibitionismRaw >= 100) msg += "Fuck, you love getting naked, particularly in front of an audience - the bigger the better. If you could, you’d bone in front of a full house at the TerraDome (brought to you by JoyCo). Maybe you’ll be able to rent it out someday? <b>You’re as much of an exhibitionist as anyone can be.</b>";
					
					if(!hasPerk("Ultra-Exhibitionist"))
					{
						if(exhibitionismRaw >= 100)
						{
							var ultra:String = kGAMECLASS.extraExhibitionismGain((originalExhibtionism >= 100));
							if(ultra != "")
							{
								if(msg != "") msg += "\n\n";
								msg += ultra;
							}
						}
					}
					else setPerkValue("Ultra-Exhibitionist", 2, 0);
					
					if(msg != "") AddLogEvent(msg, "passive");
				}
			}
			//Negative points
			else if(arg < 0 && !hasPerk("Ultra-Exhibitionist"))
			{
				//no mods!
				exhibitionismRaw += arg;
				if(exhibitionismRaw < 0) exhibitionismRaw = 0;
			}
			trace("Final reported exhibition level: " + exhibitionismRaw);
			return exhibitionismRaw;
		}
		
		public static const DEPENDANT_ANY:uint = 0;
		public static const DEPENDANT_MYRVENOM:uint = 1;
		public static const DEPENDANT_CUM:uint = 2;
		public static const DEPENDANT_ANAL:uint = 3;
	
		// Is the character dependent on some external drug/chemical/etc
		public function isDependant(dependantType:uint = DEPENDANT_ANY):Boolean
		{
			if(dependantType == DEPENDANT_MYRVENOM || dependantType == DEPENDANT_ANY)
			{
				if(hasPerk("Venom Slut") || hasStatusEffect("Myr Venom Withdrawal")) return true;
			}
			if(dependantType == DEPENDANT_CUM || dependantType == DEPENDANT_ANY)
			{
				if(hasPerk("Cum Guzzler") || hasStatusEffect("Oral Fixation")) return true;
			}
			if(dependantType == DEPENDANT_ANAL || dependantType == DEPENDANT_ANY)
			{
				if(hasPerk("Buttslut") || hasStatusEffect("Anal Addiction")) return true;
			}
			
			return false;
		}
		
		public function cumflationEnabled():Boolean
		{
			if(hasStatusEffect("Cumflation Immune")) return false;
			return (fluidSimulate || this is PlayerCharacter);
		}
		public function maxOutCumflation(orifice:String, cumFrom:Creature):void
		{
			var minMaxFluid:Number = 100000; // mLs
			
			minMaxFluid -= cumFrom.cumQ();
			if(minMaxFluid < 0) minMaxFluid = 0;
			
			if(InCollection(orifice, ["all", "vaginas", "vagina 0"]) && hasVagina(0))
			{
				cumflationHappens(cumFrom, 0);
				addStatusValue("Vaginally-Filled", 1, minMaxFluid);
				if(statusEffectv1("Vaginally-Filled") > statusEffectv2("Vaginally-Filled")) setStatusValue("Vaginally-Filled", 2, statusEffectv1("Vaginally-Filled"));
			}
			if(InCollection(orifice, ["all", "vaginas", "vagina 1"]) && hasVagina(1))
			{
				cumflationHappens(cumFrom, 1);
				addStatusValue("Vaginally-Filled", 1, minMaxFluid);
				if(statusEffectv1("Vaginally-Filled") > statusEffectv2("Vaginally-Filled")) setStatusValue("Vaginally-Filled", 2, statusEffectv1("Vaginally-Filled"));
			}
			if(InCollection(orifice, ["all", "vaginas", "vagina 2"]) && hasVagina(2))
			{
				cumflationHappens(cumFrom, 2);
				addStatusValue("Vaginally-Filled", 1, minMaxFluid);
				if(statusEffectv1("Vaginally-Filled") > statusEffectv2("Vaginally-Filled")) setStatusValue("Vaginally-Filled", 2, statusEffectv1("Vaginally-Filled"));
			}
			if(InCollection(orifice, ["all", "ass", "anus", "butt"]))
			{
				cumflationHappens(cumFrom, 3);
				addStatusValue("Anally-Filled", 1, minMaxFluid);
				if(statusEffectv1("Anally-Filled") > statusEffectv2("Anally-Filled")) setStatusValue("Anally-Filled", 2, statusEffectv1("Anally-Filled"));
			}
			if(InCollection(orifice, ["all", "mouth", "oral"]))
			{
				cumflationHappens(cumFrom, 4);
				addStatusValue("Orally-Filled", 1, minMaxFluid);
				if(statusEffectv1("Orally-Filled") > statusEffectv2("Orally-Filled")) setStatusValue("Orally-Filled", 2, statusEffectv1("Orally-Filled"));
			}
		}
		
		//XP!
		public function XP(arg:int = 0):Number
		{
			var bMulti:Number = 1.0;
			if (hasStatusEffect("Shrike!")) bMulti += 0.2;
			
			arg *= bMulti;
			
			XPRaw += arg;
			//if (XPRaw >= XPMax() && level >= levelEnd()) XPRaw = XPMax();
			if (XPRaw <= 0) XPRaw = 0;
			return XPRaw;
		}
		public function XPMax(): Number {
			var amount:Number = level * level * level * level * 100;
			if(level >= 5) amount *= 1.5;
			if(level >= 8) amount *= 1.5;
			return Math.round(amount);
		}
		//Automatic, consistant XP generator based on level.
		public function normalXP():Number
		{
			return autoXPRando(XPMax() / (2 + level*2));
		}
		//Double normal XP.
		public function bossXP():Number
		{
			return autoXPRando(normalXP() * 2);
		}
		public function autoXPRando(arg:Number):Number
		{
			var multi:Number = (85 + rand(31))/100;
			if(kGAMECLASS.pc.hasStatusEffect("Cupid’s Kiss")) multi *= 2;
			return Math.round(arg * multi);
		}
		//HP
		public function HP(arg: Number = 0): Number {
			HPRaw += arg;
			if (HPRaw > HPMax()) HPRaw = HPMax();
			return HPRaw;
		}
		public function HPMax(): Number {
			var bonus:int = 0;
			bonus = fortification();
			var hitPoints: Number = 15 + (level - 1) * 15 + HPMod + bonus;
			if (characterClass == GLOBAL.CLASS_MERCENARY)
				hitPoints += level * 5;
			if (characterClass == GLOBAL.CLASS_ENGINEER)
				hitPoints -= level * 5;
				
			if (hasStatusEffect("Heart Tea")) hitPoints *= 1.1;
			if (hasStatusEffect("Well-Groomed")) hitPoints *= statusEffectv1("Well-Groomed");
				
			return hitPoints;
		}
		public function maxHP(): Number {
			return HPMax();
		}
		public function maxOutHP(): void {
			HPRaw = HPMax();
		}
		public function HPQ():Number
		{
			return (HPMax() == 0 ? 0 : Math.round((HP() / HPMax()) * 100));
		}
		public function changeHP(arg:Number = 0,outputText:Boolean = true):void
		{
			//Cap healing display for actual accuracy?
			var hpy:Number = HP();
			var hpyMax:Number = HPMax();
			if(arg > 0 && (arg + hpy > hpyMax)) arg = Math.ceil(hpyMax-hpy);

			if(outputText)
			{
				var healTxt:String = " (<b>";
				healTxt += "HP: " + (arg > 0 ? "+<span class='hpHeal'>" : "<span class='hp'>") + Math.round(arg) + "</span></b>)";
				kGAMECLASS.output(healTxt);
			}
			this.HP(arg);
		}
		//ENERGY
		public function energy(arg: Number = 0): Number {
			if(arg > 0)
			{
				if(hasStatusEffect("Worn Out")) return 0;
				if(hasStatusEffect("Very Sore")) arg /= 4;
				if(hasStatusEffect("Sore")) arg /= 2;
			}
			energyRaw += arg;
			if (energyRaw > energyMax()) energyRaw = energyMax();
			else if (energyRaw < energyMin()) energyRaw = energyMin();
			return energyRaw;
		}
		public function energyMax(): Number {
			var bonus:int = 0;
			bonus += statusEffectv1("Royal Nectar");
			bonus += statusEffectv1("Cum High");
			if(hasPerk("Heroic Reserves")) bonus += 33;
			return (energyMod + 100 + bonus);
		}
		public function energyMin(): Number {
			return 0;
		}
		public function maxOutEnergy(): void {
			energyRaw = energyMax();
		}
		public function energyQ():Number
		{
			return (energyMax() == 0 ? 0 : Math.round((energy() / energyMax()) * 100));
		}
		public function changeEnergy(arg:Number = 0,outputText:Boolean = true):void
		{
			//Cap healing display for actual accuracy?
			var energyy:Number = energy();
			var energyyMax:Number = energyMax();
			if(arg > 0 && (arg + energyy > energyyMax)) arg = Math.ceil(energyyMax-energyy);

			if(outputText)
			{
				var healTxt:String = " (<b>";
				healTxt += "E: " + (arg > 0 ? "+<span class='energyHeal'>" : "<span class='energy'>") + Math.round(arg) + "</span></b>)";
				kGAMECLASS.output(healTxt);
			}
			this.energy(arg);
		}
		//Lust
		public function lust(arg:Number = 0, apply:Boolean = false): Number 
		{
			if (apply) 
			{
				lustRaw = arg;
			}
			else if (arg != 0) 
			{
				lustRaw += arg;
				if (lustRaw > lustMax()) 
				{
					lustRaw = lustMax();
				}
				if (lustRaw < lustMin()) 
				{
					lustRaw = lustMin();
				}
			}
			
			var currLust:int = lustRaw + lustMod;

			if (currLust > lustMax()) 
			{
				return lustMax();
			}
			else if (currLust < lustMin())
			{
				return lustMin();
			}
			else 
			{
				return currLust;
			}
		}
		public function maxOutLust(): void {
			lustRaw = lustMax();
		}
		public function teaseSkill():int
		{
			var teaseSkill:Number = libido();
			if(hasPerk("Ice Cold")) teaseSkill = (100-libido());

			//Prorate for level, because sucking ass at this blows.
			//Fen note: Nahhh, leave as is.
			//teaseSkill = (teaseSkill / (level * 5)) * 100;

			//Cap Dat Shiiiiit
			if(teaseSkill > 100) teaseSkill = 100;
			else teaseSkill = Math.round(teaseSkill);


			return teaseSkill;
		}
		public function teaseResistSkill():int
		{
			return (willpower());
		}
		public function lustDef():Number
		{
			return Math.ceil(level/1.5 + willpower()/4 + resolve());
		}
		public function resolve():Number
		{
			var res:Number = 0;
			return armor.resolve + lowerUndergarment.resolve + upperUndergarment.resolve;
		}
		public function lustQ():Number
		{
			return (lustMax() == 0 ? 0 : Math.round((lust() / lustMax()) * 100));
		}
		public function changeLust(arg:Number = 0,outputText:Boolean = true):void
		{
			//Cap healing display for actual accuracy?
			if(arg > 0 && (arg + lust() > lustMax())) arg = Math.ceil(lustMax()-lust());
			if(outputText && arg != 0)
			{
				var healTxt:String = " (<b>";
				healTxt += "L: " + (arg > 0 ? "+<span class='lust'>" : "<span class='lustHeal'>") + Math.round(arg) + "</span></b>)";
				kGAMECLASS.output(healTxt);
			}
			this.lust(arg);
		}
		public function changeLustTo(arg:Number = 0, outputText:Boolean = true):void
		{
			//Cap healing display for actual accuracy?
			if(arg > lustMax()) arg = lustMax();
			if(arg < lustMin()) arg = lustMin();
			if(outputText)
			{
				//Track what lust was
				var oldLust:Number = lust();
				//Set new lust
				lust(arg,true);
				//Figure out the difference
				oldLust = lust() - oldLust;
				//Display it :3
				if(oldLust != 0)
				{
					var healTxt:String = " (<b>";
					healTxt += "L: " + (arg > 0 ? "+<span class='lust'>" : "<span class='lustHeal'>") + Math.round(oldLust) + "</span></b>)";
					kGAMECLASS.output(healTxt);
				}
			}
			else lust(arg,true);
		}
		//% of max. Useful for determining things like how strong a PC is for his/her level.
		public function PQ():Number
		{
			return Math.round(physique()/physiqueMax()*100);
		}
		public function physique(arg:Number = 0, apply:Boolean = false):Number 
		{
			if (apply) 
			{
				physiqueRaw = arg;
			}
			else if (arg != 0) 
			{
				physiqueRaw += arg;
				if (physiqueRaw > physiqueMax(true)) 
				{
					physiqueRaw = physiqueMax(true);
				}
			}

			var currPhys:int = physiqueRaw + physiqueMod;

			currPhys += statusEffectv1("Dispassion Fruit");
			if (hasStatusEffect("Tripped")) currPhys -= 4;
			if (hasStatusEffect("Crunched")) currPhys -= (8 * statusEffectv1("Crunched"));
			if (hasStatusEffect("Tranquilized")) currPhys *= 0.5;
			if (hasStatusEffect("Psychic Leech")) currPhys *= 0.85;
			if (hasStatusEffect("Full Stomach")) currPhys *= 0.9;
			if (hasStatusEffect("Pumped!")) currPhys *= 1.15;
			if (accessory is SignetOfBravery) currPhys += 5;

			if (currPhys > physiqueMax()) 
			{
				return physiqueMax();
			}
			else if (currPhys < Creature.STAT_CLAMP_VALUE)
			{
				return Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				return currPhys;
			}
		}
		public function RQ():Number
		{
			return Math.round(reflexes()/reflexesMax()*100);
		}
		public function reflexes(arg:Number = 0, apply:Boolean = false):Number
		{
			if (apply) 
			{
				reflexesRaw = arg;
			}
			else if (arg != 0) 
			{
				reflexesRaw += arg;
				if (reflexesRaw > reflexesMax(true))
				{
					reflexesRaw = reflexesMax(true);
				}
			}

			var bonus:int = 0;
			bonus += statusEffectv1("Sera Spawn Reflex Mod");
			bonus += statusEffectv1("Riya Spawn Reflex Mod");
			bonus += statusEffectv1("Lah Pregnancy Reflex Mod");
			bonus += statusEffectv1("Zil Pregnancy Reflex Mod");
			bonus += statusEffectv2("Cum High");

			var currReflexes:int = reflexesRaw + reflexesMod + bonus;

			//Debuffs!
			currReflexes += statusEffectv2("Dispassion Fruit");
			currReflexes += statusEffectv1("Plumpkin");
			currReflexes += statusEffectv1("Peprika");
			if (hasStatusEffect("Tripped")) currReflexes -= 4;
			if (isStaggered()) currReflexes *= 0.8;
			if (hasStatusEffect("Watered Down")) currReflexes *= 0.9;
			if (hasStatusEffect("Pitch Black")) currReflexes *= 0.66;
			if (hasStatusEffect("Psychic Leech")) currReflexes *= 0.85;
			if (hasStatusEffect("Full Stomach")) currReflexes *= 0.9;
			if (hasStatusEffect("Bulky Belly")) currReflexes *= statusEffectv1("Bulky Belly");
			if (hasStatusEffect("Stumble Strobed")) currReflexes = Math.ceil(currReflexes * 0.5);

			if (currReflexes > reflexesMax())
			{
				return reflexesMax();
			}
			else if (currReflexes < Creature.STAT_CLAMP_VALUE)
			{
				return Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				return currReflexes;
			}
		}

		public function aim(arg:Number = 0, apply:Boolean = false):Number 
		{
			if (apply)
			{
				aimRaw = arg;
			}
			else if (arg != 0)
			{
				aimRaw += arg;
				if (aimRaw > aimMax(true))
				{
					aimRaw = aimMax(true);
				}
			}
			
			var bonus:Number = 0;

			var currAim:int = aimRaw + aimMod + bonus;
			
			if (isStaggered()) currAim *= 0.8;
			if (hasStatusEffect("Pitch Black")) currAim *= 0.66;
			if (hasStatusEffect("Pumped!")) currAim *= 1.15;

			if (accessory is SignetOfBravery) currAim += 5;
			
			if (currAim > aimMax())
			{
				return aimMax();
			}
			else if (currAim < Creature.STAT_CLAMP_VALUE)
			{
				return Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				return currAim;
			}
		}

		// HUE
		public function IQ():Number
		{
			return Math.round(intelligence()/intelligenceMax()*100);
		}
		
		public function AQ():Number
		{
			return Math.round(aim() / aimMax() * 100);
		}
		
		public function LQ():Number
		{
			return Math.round(libido() / libidoMax() * 100);
		}
		
		public function bimboIntelligence():Number
		{
			var amount:Number = intelligence();
			//Bimbos actually do better with LESS intelligence!
			if (hasPerk("Fuck Sense")) 
			{
				//Inverse intelligence + libido - bimbo tech specs can minmax easier whynot~
				var bimbInt:Number = (intelligenceMax() - intelligence() + 1);
				bimbInt += libido()/10;
				//Gotta cap it so it doesn't get FUCKED SILLY
				if(bimbInt >= level * 5) bimbInt = level * 5;
				//Compare actual intelligence (for exceptions like Dumb4Cum and extra smart bimbos)
				return Math.max(bimbInt, amount);
			}
			return amount;
		}
		public function intelligence(arg:Number = 0, apply:Boolean = false):Number 
		{
			if (apply)
			{
				intelligenceRaw = arg;
			}
			else if (arg != 0)
			{
				//Certain bimbo TFs reduce gains by 50%.
				if(hasPerk("Drug Fucked") && arg > 0) arg /= 2;
				if(hasPerk("Weak Mind") && arg < 0) arg *= 2;
				intelligenceRaw += arg;
				if(intelligenceRaw > intelligenceMax(true))
				{
					intelligenceRaw = intelligenceMax(true);
				}
			}
			var bonus:Number = 0;
			bonus -= statusEffectv1("Adorahol");
			bonus += statusEffectv3("Cum High");
			if(accessory is GooCore && isGoo()) bonus += 20;

			var currInt:int = intelligenceRaw + intelligenceMod + bonus;
			
			if (hasStatusEffect("Focus Pill")) currInt += 5;
			if(hasPerk("Dumb4Cum"))
			{
				currInt += level*2;
				
				// Save max intelligence (if any)
				if(perkv3("Dumb4Cum") < currInt) setPerkValue("Dumb4Cum",3,currInt);
				
				if(perkv1("Dumb4Cum") > 24) currInt -= (perkv1("Dumb4Cum") - 24);
			}
			// Slave collar multiplier.
			if(hasStatusEffect("Psi Slave Collar")) currInt = Math.floor(currInt * statusEffectv1("Psi Slave Collar"));
			// Status effect reduction
			if(hasStatusEffect("Ditzy Strobed")) currInt = Math.ceil(currInt * 0.5);		

			if (currInt > intelligenceMax())
			{
				return intelligenceMax();
			}
			else if (currInt < Creature.STAT_CLAMP_VALUE)
			{
				return Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				return currInt;
			}
		}
		public function WQ():Number
		{
			var val:Number = Math.round(willpower()/willpowerMax()*100);
			return val;
		}
		public function willpower(arg:Number = 0, apply:Boolean = false):Number 
		{
			if (apply)
			{
				willpowerRaw = arg;
			}
			else if (arg != 0)
			{
				if(arg < 0 && hasStatusEffect("Weak Will")) arg *= 2;
				if(hasPerk("Weak Mind") && arg < 0) arg *= 2;
				willpowerRaw += arg;
				if (willpowerRaw > willpowerMax(true))
				{
					willpowerRaw = willpowerMax(true);
				}
			}

			var bonus:Number = resolve();
			if(accessory is BeatricesScarf) bonus += 3;
			if(accessory is GooCore && isGoo()) bonus += 20;
			bonus += statusEffectv4("Cum High");

			var currWill:int = willpowerRaw + willpowerMod + bonus;

			//Level 7 Merc Perk
			if(hasPerk("Iron Will")) currWill += Math.floor(physique()/5);
			//Roshan Blue gives 25% more xp and lowers willpower by 30% until next rest
			if(hasStatusEffect("Roshan Blue")) currWill -= Math.floor(currWill*0.3);
			// Slave collar multiplier.
			if(hasStatusEffect("Psi Slave Collar")) currWill = Math.floor(currWill * statusEffectv2("Psi Slave Collar"));
			
			if(HP()/HPMax() <= 0.5 && hasPerk("Single Minded")) currWill = willpowerMax();

			if (currWill > willpowerMax())
			{
				return willpowerMax();
			}
			else if (currWill < Creature.STAT_CLAMP_VALUE)
			{
				return Creature.STAT_CLAMP_VALUE;
			}
			else
			{
				return currWill;
			}
		}

		public function libido(arg:Number = 0, apply:Boolean = false):Number 
		{
			if (apply)
			{
				libidoRaw = arg;
			}
			else if (arg != 0)
			{
				//Certain bimbo TFs double gains
				if(hasPerk("Drug Fucked") && arg > 0) arg *= 2;
				libidoRaw += arg;
				if (libidoRaw > libidoMax(true))
				{
					libidoRaw = libidoMax(true);
				}
				if (libidoRaw < libidoMin())
				{
					libidoRaw = libidoMin();
				}
			}
			
			var currLib:int = libidoMod + libidoRaw + sexiness();
			if (hasStatusEffect("Myr Venom")) currLib += Math.floor(currLib * 0.15);
			if (accessory is Allure) currLib += 20;
			if (hasStatusEffect("Myr Venom Withdrawal")) currLib /= 2;
			if (hasStatusEffect("Mare Musk")) currLib += 10;
			if (hasStatusEffect("Adorahol")) currLib += (5 * statusEffectv1("Adorahol"));
			if (hasGenitals() && isCrotchGarbed())
			{
				if (hasPerk("Barcoded")) currLib += 10;
				currLib += perkv1("Slut Stamp");
			}
			if (perkv1("Dumb4Cum") > 24) currLib += (perkv1("Dumb4Cum") - 24);
			currLib += statusEffectv3("Dispassion Fruit");
			currLib += statusEffectv3("Heat");
			currLib += statusEffectv1("Rut");
			currLib += statusEffectv1("Lagonic Rut");
			currLib += statusEffectv1("Undetected Locofever");
			currLib += statusEffectv1("Locofever");
			currLib += statusEffectv1("Fried Cunt Snake");
			if (hasStatusEffect("Soak") && currLib < 100) currLib = 100;
			if (hasStatusEffect("Priapin")) currLib *= statusEffectv3("Priapin");
			if (pluggedVaginas() > 0 || isPlugged(-1)) currLib *= 2;
			if (currLib > libidoMax())
			{
				return libidoMax();
			}
			else if (currLib < libidoMin())
			{
				return libidoMin();
			}
			else
			{
				return currLib;
			}
		}
		public function maxOutLibido(raw:Boolean = false): void {
			libidoRaw = libidoMax(raw);
		}

		public function TQ():Number
		{
			return Math.round(taint()/taintMax()*100);
		}
		//Light taint = 1, moderate = 2-4, high = 5-7, extreme = 8-10
		public function taint(arg:Number = 0, apply:Boolean = false):Number 
		{
			//Set to a specific value. Probably never used.
			if (apply) taintRaw = arg;
			
			//If we're changing it, change it.
			else if (arg != 0)
			{
				taintRaw += arg;
				if (taintRaw > taintMax(true)) taintRaw = taintMax(true);
				else if (taintRaw < taintMin(true)) taintRaw = taintMin(true);
				//Reset countdown till next reduction (72 days!)
				if(arg > 0 && !hasPerk("Corrupted") && this is PlayerCharacter)
				{
					if(!hasStatusEffect("Taint_CD")) createStatusEffect("Taint_CD",0,0,0,0);
					setStatusMinutes("Taint_CD",72*60);
					//Warning 1 - 5 taint
					if(taintRaw - arg < 5 && taintRaw >= 5) AddLogEvent(("Something isn’t quite right. You feel a little off, like something inside you is <i>twisted</i> out of place. A quick scan with your Codex informs you that you’ve suffered some genetic <b>taint</b>." + (CodexManager.entryViewed("Taint") ? "" : " Information on causes and treatments can be found in the <u>Medical -> General Knowledge -> Taint</u> section.")),"passive");
					//Warning "Corruptish" - 30 taint
					else if(taintRaw - arg < 30 && taintRaw >= 30) AddLogEvent("A beep from your Codex informs you <b>that you have surpassed a 30% taint measurement</b>. Whoah! You guess you have been sort of strangely randy lately, but is that so bad?");
					//Warning: Corrupt! - 50 taint
					else if(taintRaw - arg < 50 && taintRaw >= 50) AddLogEvent("A warning from your Codex states that you’ve gone past <b>50% genetic taint</b>. It doesn’t feel like it. You may get turned on a little more easily... maybe you’re a little more down for a quick roll in the hay than before, but that’s never gotten in the way yet. It’ll be fine.");
					//Warning: Fucky! - 75 Taint
					else if(taintRaw - arg < 75 && taintRaw >= 75) AddLogEvent("You feel like... like fucking really. It doesn’t matter if you’re actually horny right now or not - you’ve got fingers and a mouth, right? You glance down at your Codex to see a warning blaring about <b>75% genetic taint</b>, but warnings are meant to be ignored.");
				}
			}
			
			//Figure out the current value with all modifiers:
			var currTaint:int = taintMod + taintRaw;
			
			//Check to see if the PC is acquiring the "Corrupted" Perk
			if(currTaint >= 100 && !hasPerk("Corrupted") && this is PlayerCharacter)
			{
				AddLogEvent("Your Codex blares warnings, but you run your hands over your oh-so-fuckable form. You’re past caring about fucking up your genes. You just want to <i>fuck</i>, get fucked, and maybe become a multi-trillionaire in the process.\n\n(<b>Perk Gained: Corrupted</b> - Your libido maximum is raised to 200 - but you are irrevocably tainted!)","passive");
				createPerk("Corrupted",0,0,0,0,"Increases your maximum libido but prevents the loss of taint.");
			}

			//Make sure the result is in bounds of modifier values.
			if (currTaint > taintMax()) return taintMax();
			else if (currTaint < taintMin()) return taintMin();
			else return currTaint;
		}
		public function lustMax(): Number {
			var bonus:int = 0;
			bonus += perkv1("Inhuman Desire");
			//trace("Max lust: " + (bonus + 100));
			if(hasPerk("Venom Slut") && hasStatusEffect("Red Myr Venom")) bonus += 35;
			if(hasStatusEffect("Perfect Simulant")) bonus += 50;
			return (100 + bonus);
		}
		public function lustMin(): Number {
			var bonus:int = 0;
			if (hasPerk("Drug Fucked")) bonus += 10;
			if (hasPerk("Amazonian Needs")) bonus += perkv1("Amazonian Needs");
			if (hasPerk("Black Latex")) bonus += 10;
			//Doesn't stack for reasons.
			if (perkv1("Flower Power") > 0) bonus += perkv2("Flower Power");
			if (perkv1("Ultra-Exhibitionist") > 0 && isFullyExposed(true)) bonus += (bonus < 23 ? 33 : 10);
			//Halloween boost
			if (hasPerk("Face Fucker")) bonus += perkv1("Face Fucker");

			//Temporary Stuff
			if (hasStatusEffect("Ellie's Milk")) bonus += 33;
			if (hasStatusEffect("Aphrodisiac Milk")) bonus += 33;
			if (hasStatusEffect("Butt Bug (Female)")) bonus += 15;
			if (perkv1("Dumb4Cum") > 24) bonus += (perkv1("Dumb4Cum") - 24);
			if (hasStatusEffect("Adorahol")) bonus += (5 * statusEffectv1("Adorahol"));
			bonus += statusEffectv1("Sexy Costume");
			bonus += statusEffectv4("Priapin");
			bonus += statusEffectv2("Heat");
			bonus += statusEffectv2("Rut");
			bonus += statusEffectv2("Lagonic Rut");
			bonus += statusEffectv1("Omega Oil");
			bonus += statusEffectv2("Fried Cunt Snake");

			//Venom brings minimum up to 35.
			if (bonus < 10 && statusEffectv1("MirrinPregStage") > 0) bonus = 10;
			if (bonus < 20 && hasStatusEffect("Paradise!")) bonus = 20;
			if (bonus < 20 && hasPerk("Peace of Mind")) bonus = 20;
			if (bonus < 33 && lowerUndergarment is SavicitePanties) bonus = 33;
			if (bonus < 33 && hasSockedCocks(-1,SaviciteCockring)) bonus = 33;
			if (bonus < 33 && hasPerk("Treated Readiness")) bonus = 33;
			if (bonus < 33 && hasStatusEffect("Priapism")) bonus = 33;
			if (bonus < 35 && hasStatusEffect("Red Myr Venom")) bonus = 35;
			if (hasStatusEffect("Lane Detoxing Weakness"))
			{
				if (bonus < statusEffectv2("Lane Detoxing Weakness")) bonus = statusEffectv2("Lane Detoxing Weakness");
			}
			//piercing lust min stacks with other lust min effects
			if (hasPiercing()) bonus += piercingLustMinTotal();
			return Math.min((0 + bonus), lustMax());
		}
		public function physiqueMax(raw:Boolean = false): Number {
			var bonuses:int = 0;
			if(hasStatusEffect("Perfect Simulant")) bonuses += 3;
			if(!raw) {
				if(hasStatusEffect("Quivering Quasar")) bonuses += 5;
			}
			if (accessory is SignetOfBravery) bonuses += 5;
			return ((level * 5) + bonuses);
		}
		public function reflexesMax(raw:Boolean = false): Number {
			var bonuses:int = 0;
			bonuses += statusEffectv2("Peprika");
			if(hasStatusEffect("Perfect Simulant")) bonuses += 3;
			if(hasStatusEffect("Vipris")) bonuses += 10;
			if(hasStatusEffect("Sinthine")) bonuses += 5;
			if(hasStatusEffect("Cromesc")) bonuses += 5;
			
			var scalar:Number = 1;
			if(hasPerk("Resin")) scalar *= perkv1("Resin");
			if(!raw) {
				if(hasStatusEffect("Bulky Belly")) scalar *= statusEffectv1("Bulky Belly");
			}
			
			return ((level * 5 * scalar) + bonuses);
		}
		public function aimMax(raw:Boolean = false): Number {
			var bonuses:int = 0;
			if(hasStatusEffect("Perfect Simulant")) bonuses += 3;
			if (accessory is SignetOfBravery) bonuses += 5;
			if(hasStatusEffect("Cromesc")) bonuses += 5;
			if(!raw) {
				// Nothing yet!
			}
			return ((level * 5) + bonuses);
		}
		public function intelligenceMax(raw:Boolean = false): Number {
			var bonuses:int = 0;
			if(hasStatusEffect("Perfect Simulant")) bonuses += 3;
			if(hasPerk("Cybernetic Synchronization")) bonuses += (perkv1("Cybernetic Synchronization") * cyborgScore());
			if(hasPerk("Dumb4Cum")) bonuses += level*2;
			if(hasStatusEffect("Sinthine")) bonuses += 5;
			if(!raw) {
				// Nothing yet!
			}
			
			var amount:Number = ((level * 5) + bonuses);
			if(amount < Creature.STAT_CLAMP_VALUE) amount = Creature.STAT_CLAMP_VALUE;
			return amount;
		}
		public function willpowerMax(raw:Boolean = false): Number {
			var bonuses:int = resolve()/2;
			if(hasStatusEffect("Perfect Simulant")) bonuses += 3;
			if(hasStatusEffect("Xanose")) bonuses += 5;
			if(hasPerk("Iron Will")) bonuses += Math.floor(physiqueMax()/5);
			if(!raw) {
				// Nothing yet!
			}
			//OD Soak = 1/2.
			if(hasStatusEffect("Soak Overdose")) return (((level * 5) + bonuses)/2);
			else return ((level * 5) + bonuses);
		}
		public function libidoMax(raw:Boolean = false): Number {
			var bonuses:int = sexiness()/2;
			if(hasStatusEffect("Perfect Simulant")) bonuses += 50;
			if(hasPerk("Barcoded")) bonuses += 10;
			bonuses += perkv3("Slut Stamp");
			if(hasStatusEffect("Xanose")) bonuses += 15;
			if(!raw) {
				// Nothing yet!
			}
			//Corrupted perk GOOO
			if(hasPerk("Corrupted") && 100 + bonuses < 200) return 200;
			return (100 + bonuses);
		}
		public function libidoMin(): Number {
			var bonus:int = 0;
			if(hasPerk("Drug Fucked")) bonus += 40;
			if(hasPerk("Barcoded")) bonus += 10;
			bonus += perkv2("Slut Stamp");
			if(perkv1("Flower Power") > 0) bonus += perkv3("Flower Power");
			// Slave collar increases minimum by set level.
			if(hasStatusEffect("Psi Slave Collar")) bonus += statusEffectv3("Psi Slave Collar");
			if(hasStatusEffect("Roehm Slimed")) bonus += statusEffectv1("Roehm Slimed");

			//Taint is always minimum libido if all things are equal.
			if(taint() > (0+bonus)) return taint();
			//If Taint isn't a factor, use the normal maths!
			return (0 + bonus);
		}
		public function taintMax(raw:Boolean = false): Number {
			var bonuses:int = 0;
			if(!raw) {
				// Nothing yet!
			}
			return (100 + bonuses);
		}
		public function taintMin(raw:Boolean = false): Number {
			var bonus:int = 0;
			return (0 + bonus);
		}
		public function slowStatLoss(stat:String, arg:Number = 0):Number
		{
			return slowStatGain(stat, arg > 0 ? 0 - arg : arg);
		}
		public function slowStatGain(stat:String, arg:Number = 0):Number {
			var statCurrent: Number = 0;
			var statPercent: Number = 0;
			var change: Number = 0;
			// Affinity
			if(stat == affinity)
			{
				arg *= 1.5;
			}
			// Normal
			switch(stat)
			{
				case "physique":
					statCurrent = physiqueRaw;
					statPercent = statCurrent / physiqueMax(true) * 100;
					break;
				case "reflexes":
					statCurrent = reflexesRaw;
					statPercent = statCurrent / reflexesMax(true) * 100;
					break;
				case "aim":
					statCurrent = aimRaw;
					statPercent = statCurrent / aimMax(true) * 100;
					break;
				case "intelligence":
					statCurrent = intelligenceRaw;
					statPercent = statCurrent / intelligenceMax(true) * 100;
					break;
				case "willpower":
					statCurrent = willpowerRaw;
					statPercent = statCurrent / willpowerMax(true) * 100;
					break;
				case "libido":
					statCurrent = libidoRaw;
					statPercent = statCurrent / libidoMax(true) * 100;
					break;
				default:
					output("ERROR: slowStatGain called with stat argument of " + stat + ". This isn’t a real stat!");
				return 0;
					break;
			}
			
			var isGain:Boolean = arg > 0;
			arg = Math.abs(arg);
			
			if (isGain)
			{
				while (arg > 0) {
					arg--;
					if (statPercent < 30) change++;
					else if (statPercent < 40) change += .9;
					else if (statPercent < 50) change += .8;
					else if (statPercent < 60) change += .7;
					else if (statPercent < 65) change += .6;
					else if (statPercent < 70) change += .5;
					else if (statPercent < 75) change += .4;
					else if (statPercent < 80) change += .3;
					else if (statPercent < 85) change += .25;
					else if (statPercent < 90) change += .2;
					else if (statPercent < 95) change += .15;
					else change += .1;
					if(arg < 0) arg = 0;
				}
			}
			else
			{
				while (arg > 0) {
					arg--;
					if (statPercent >= 95) change++;
					else if (statPercent >= 90) change += .9;
					else if (statPercent >= 85) change += .8;
					else if (statPercent >= 80) change += .7;
					else if (statPercent >= 75) change += .6;
					else if (statPercent >= 70) change += .5;
					else if (statPercent >= 65) change += .4;
					else if (statPercent >= 60) change += .3;
					else if (statPercent >= 50) change += .25;
					else if (statPercent >= 40) change += .2;
					else if (statPercent >= 30) change += .15;
					else change += .1;
				}
				change = 0 - change;
			}
			
			switch(stat)
			{
				case "physique": statCurrent = physique(change); break;
				case "reflexes": statCurrent = reflexes(change); break;
				case "aim": statCurrent = aim(change); break;
				case "intelligence": statCurrent = intelligence(change); break;
				case "willpower": statCurrent = willpower(change); break;
				case "libido": statCurrent = libido(change); break;
				default:
				trace("ERROR: slowStatGain got to the end with a stat that should’ve called the earlier error. Looks like the function has been changed, added to, or bugged. Make sure top stat list matches bottom!");
					statCurrent = 0;
					break;
			}
			return statCurrent;
		}
		public function hasWeapon(weaponName:String = "any"):Boolean
		{
			// Search on-hand
			if(hasEquippedWeapon())
			{
				if(weaponName == "any") return true;
				else if(weaponName == meleeWeapon.shortName || weaponName == rangedWeapon.shortName) return true;
			}
			// Search inventory
			if(inventory.length == 0) return false;
			for(var x:int = 0; x < inventory.length; x++)
			{
				if(InCollection(inventory[x].type, GLOBAL.MELEE_WEAPON, GLOBAL.RANGED_WEAPON, GLOBAL.EXPLOSIVECONSUMABLE))
				{
					if(weaponName == "any") return true;
					else if(inventory[x].shortName == weaponName) return true;
				}
			}
			// No weapons!
			return false;
		}
		public function hasEquippedWeapon():Boolean
		{
			return (hasMeleeWeapon() || hasRangedWeapon());
		}
		public function hasRangedWeapon():Boolean
		{
			return (!(rangedWeapon is EmptySlot) && !(rangedWeapon is Rock));
		}
		public function hasMeleeWeapon():Boolean
		{
			return (!(meleeWeapon is EmptySlot) && !(meleeWeapon is Rock));
		}
		public function hasEnergyWeapon():Boolean
		{
			return hasMeleeEnergyWeapon() || hasRangedEnergyWeapon();
		}
		public function hasMeleeEnergyWeapon():Boolean
		{
			if (meleeWeapon.baseDamage.hasFlag(DamageFlag.ENERGY_WEAPON) || meleeWeapon.baseDamage.hasFlag(DamageFlag.LASER) || meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON)) return true;
			return false;
		}
		public function hasRangedEnergyWeapon():Boolean
		{
			if (rangedWeapon.baseDamage.hasFlag(DamageFlag.ENERGY_WEAPON) || rangedWeapon.baseDamage.hasFlag(DamageFlag.LASER) || rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON)) return true;
			return false;
		}
		public function hasShieldGenerator(active:Boolean = false):Boolean
		{
			if(active && shield.shields <= 0) return false;
			return !(shield is EmptySlot);
		}
		public function hasAccessory():Boolean
		{
			return !(accessory is EmptySlot);
		}
		public function hasCombatDrone(robotOnly:Boolean = false, accessoryOnly:Boolean = false):Boolean
		{
			if(!robotOnly)
			{
				if(hasStatusEffect("Varmint Buddy") || accessory is KordiiakLeash || accessory is ShoulderGrunchLeash) return true;
			}
			if(!accessoryOnly)
			{
				if(hasPerk("Attack Drone")) return true;
			}
			return (accessory.hasFlag(GLOBAL.ITEM_FLAG_COMBAT_DRONE));
		}
		public function hasActiveCombatDrone(robotOnly:Boolean = false, accessoryOnly:Boolean = false):Boolean
		{
			if(hasCombatDrone(robotOnly, accessoryOnly))
			{
				if(hasStatusEffect("Drone Disabled") || hasStatusEffect("Combat Drone Disabled")) return false;
				return true;
			}
			return false;
		}
		public function hasBowWeaponAvailable():Boolean
		{
			if (hasBowWeaponEquipped()) return true;
			
			for (var i:uint = 0; i < inventory.length; i++)
			{
				if ((inventory[i] as ItemSlotClass).hasFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON)) return true;
			}
			
			return false;
		}
		public function hasBowWeaponEquipped():Boolean
		{
			if (meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON)) return true;
			if (rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON)) return true;
			return false;
		}
		
		//Item bonus stats!
		public function attack(melee: Boolean = true): Number 
		{
			var temp: int = 0;
			if (melee) temp += meleeWeapon.attack;
			else temp += rangedWeapon.attack;
			//Bonus to hit for Tech Specialists above level 7!
			if (hasPerk("Fight Smarter")) temp += Math.round(bimboIntelligence()/7);
			//Bonus to hit with Rage and Calm Aim perks
			if (hasPerk("Rage Aim") && (HP() < (HPMax() / 2))) temp += 1;
			else if (hasPerk("Calm Aim") && (HP() > (HPMax() / 2))) temp += 1;
			//Lieve Buff
			if(hasStatusEffect("Lieve Buff")) temp += 2;
			//Akkadi Bot Buffs
			if(hasStatusEffect("Target Link")) temp += statusEffectv2("Target Link");
			if(hasStatusEffect("Tracer Rounds")) temp += statusEffectv2("Tracer Rounds");
			if(hasStatusEffect("Chaff Grenade")) return 0;
			temp += armor.attack + upperUndergarment.attack + lowerUndergarment.attack + accessory.attack + shield.attack;
			return temp;
		}
		
		public function meleeDamage():TypeCollection
		{ 
			var d:TypeCollection = damage(true); 
			d.add(physique() / 2);
			return d;
		}
		public function rangedDamage():TypeCollection 
		{ 
			var d:TypeCollection = damage(false);
			d.add(aim() / 2);
			return d;
		}
		
		public function damage(melee:Boolean = true):TypeCollection
		{
			var modifiedDamage:TypeCollection;
			var lustOnly:Boolean = false;
			
			if (melee) 
			{
				modifiedDamage = meleeWeapon.baseDamage.makeCopy();
				if(meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON)) lustOnly = true;
				
				if(hasPerk("Low Tech Solutions") && !hasMeleeEnergyWeapon()) 
					modifiedDamage.multiply(1.2);
					
				if(hasPerk("Weapon Tweaks") && hasMeleeEnergyWeapon()) 
					modifiedDamage.multiply(1.2);
			}
			else 
			{
				modifiedDamage = rangedWeapon.baseDamage.makeCopy();
				if(rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON)) lustOnly = true;
				
				if(hasPerk("Heavy Weapons") && !hasRangedEnergyWeapon()) 
					modifiedDamage.multiply(1.2);
					
				if(hasPerk("Gun Tweaks") && hasRangedEnergyWeapon()) 
					modifiedDamage.multiply(1.2);
					
				// Easiest way I can think of conveying base damage - might be better to add this as a flat bonus some other way.
				// Only add bonus if the weapons already doing SOME HP damage
				if (modifiedDamage.hasHPDamage())
				{
					modifiedDamage.unresistable_hp.damageValue += statusEffectv1("Concentrated Fire"); 
				}
			}
			
			modifiedDamage.add(armor.baseDamage);
			modifiedDamage.add(upperUndergarment.baseDamage);
			modifiedDamage.add(lowerUndergarment.baseDamage);
			modifiedDamage.add(accessory.baseDamage);
			modifiedDamage.add(shield.baseDamage);
			
			//Add bonus to both melee and ranged attacks
			if (hasStatusEffect("Lightning Moves")) modifiedDamage.multiply(1.05);
			if (hasStatusEffect("Valden-Possessed")) modifiedDamage.multiply(1.75);
			
			// Lust-only weapons, zero out all shield or hp damage values! 
			if(lustOnly) {
				modifiedDamage.kinetic.damageValue = 0;
				modifiedDamage.electric.damageValue = 0;
				modifiedDamage.burning.damageValue = 0;
				modifiedDamage.freezing.damageValue = 0;
				modifiedDamage.corrosive.damageValue = 0;
				modifiedDamage.poison.damageValue = 0;
				modifiedDamage.unresistable_hp.damageValue = 0;
			}
			
			return modifiedDamage;
		}
		public function defense(): Number 
		{
			var temp: int = 0;
			temp += meleeWeapon.defense;
			temp += rangedWeapon.defense;
			temp += armor.defense + upperUndergarment.defense + lowerUndergarment.defense + accessory.defense + shield.defense;
			if (hasStatusEffect("Harden")) temp += 1;
			//Gain defense for evasion, cap at level * 2.
			if (hasPerk("Lucky Breaks"))
			{
				var evas:Number = evasion();
				if(evas / 3 > level * 2) temp += level*2;
				else temp += Math.round(evas/3);
			}
			if (hasStatusEffect("Crystal Coated")) temp += 4;
			if (hasStatusEffect("Burning")) 
			{
				temp -= 5;
				if(temp < 0) temp = 0;
			}
			if (hasPerk("Armor Tweaks")) temp += Math.round(armor.defense * .2);
			//Sundered - -50% armor!
			if (hasStatusEffect("Sundered")) 
			{
				if (hasPerk("Heavily Armored")) temp *= 0.75;
				else temp *= 0.5;
			}
			return temp;
		}
		public function shieldDefense(): Number 
		{
			var temp: int = 0;
			temp += meleeWeapon.shieldDefense;
			temp += rangedWeapon.shieldDefense;
			temp += armor.shieldDefense + upperUndergarment.shieldDefense + lowerUndergarment.shieldDefense + accessory.shieldDefense + shield.shieldDefense;
			if(hasPerk("Advanced Shielding")) temp += Math.floor(bimboIntelligence()/4);
			return temp;
		}
		public function shields(arg: Number = 0): Number {
			if(kGAMECLASS.easy && arg < 0 && this is PlayerCharacter) arg *= .5;
			shieldsRaw += arg;
			if (shieldsRaw > shieldsMax())
				shieldsRaw = shieldsMax();
			if (shieldsRaw < 0) shieldsRaw = 0;
			return shieldsRaw;
		}
		public function shieldsMax(): Number {
			//No proper shield generator? NO SHIELD!
			if(hasShields() && !hasShieldGenerator(true)) return 0;
			
			var temp: int = 0;
			temp += meleeWeapon.shields;
			temp += rangedWeapon.shields;
			temp += armor.shields + upperUndergarment.shields + lowerUndergarment.shields + accessory.shields + shield.shields;
			if (hasPerk("Shield Tweaks")) temp += level * 2;
			if (hasPerk("Shield Booster")) temp += level * 8;
			if (hasPerk("Attack Drone") && hasActiveCombatDrone(true, false) && !hasCombatDrone(false, true)) temp += (3 * level);
			if (hasStatusEffect("Valden-Possessed")) temp *= 1 + AkkadiSecurityRobots.valdenShieldBuffMult;
			
			//Debuffs!
			if(hasStatusEffect("Rusted Emitters")) temp = Math.round(temp * 0.75);
			
			if (temp < 0) temp = 0;
			return temp;
		}
		public function shieldsQ():Number
		{
			return (shieldsMax() == 0 ? 0 : Math.round((shields() / shieldsMax()) * 100));
		}
		public function changeShields(arg:Number = 0,outputText:Boolean = true):void
		{
			var shieldy:Number = shields();
			var shieldyMax:Number = shieldsMax();
			//Cap healing display for actual accuracy?
			if(arg > 0 && (arg + shieldy > shieldyMax)) arg = Math.ceil(shieldyMax-shieldy);
			if(outputText)
			{
				var healTxt:String = " (<b>";
				healTxt += "S: " + (arg > 0 ? "+<span class='shieldHeal'>" : "<span class='shield'>") + Math.round(arg) + "</span></b>)";
				kGAMECLASS.output(healTxt);
			}
			shields(arg);
		}
		public function sexiness(): Number {
			var temp: int = 0;
			temp += meleeWeapon.sexiness;
			temp += rangedWeapon.sexiness;
			temp += outfitSexiness() + itemSexiness(accessory) + itemSexiness(shield);
			// she grants a bonus to Sexiness equal to the same
			if (accessory is SiegwulfeItem)
			{
				if(this is PlayerCharacter && !kGAMECLASS.chars["WULFE"].isBimbo())
				{
					//While equipped, bimbo-dom siegwulfe will add a bonus to both evasion and sexiness equal to 8% of intelligence that Steele has.
					//FEN NOTE: NOPE! It's now 3 points to each.
					if (kGAMECLASS.siegwulfeIsDom()) temp += 3;
					else { /* Nada! */ }
				}
				else temp += 5;
			}
			/*Sweaty penalties!
			Instead of being hard-coded extra checks, this is being worked into the sexual preferences system.
			if(hasStatusEffect("Sweaty"))
			{
				if(hasFur()) temp -= statusEffectv1("Sweaty") * 5;
				temp -= statusEffectv1("Sweaty") * 5;
			}*/
			//Apply sexy moves before flat boni effects
			if (hasStatusEffect("Sexy Moves")) temp *= 1.1;
			if (hasPerk("Innocent Allure")) temp += perkv1("Innocent Allure");
			if (hasPerk("True Doll")) temp += perkv2("True Doll");
			if (hasStatusEffect("Mare Musk")) temp += 2;
			temp += statusEffectv1("Iyla’s Milk");
			//You cannot handle the Mango!
			temp += statusEffectv1("The Mango");
			//Gain Sexy Thinking - gives sexiness bonus equal to (100-IQ-25)/20 + (100-WQ-25)/20
			if(hasPerk("Sexy Thinking"))
			{
				if(100 - IQ() - 25 >= 0) temp += Math.round((100 - IQ() - 25)/25);
				if(100 - WQ() - 25 >= 0) temp += Math.round((100 - WQ() - 25)/25);
			}
			//-10 is as bad as it gets
			if(temp < -10) temp = -10;
			return temp;
		}
		public function outfitSexiness(): Number
		{
			var sexi:Number = 0;
			if(armor is EmptySlot) sexi += 5;
			else sexi += itemSexiness(armor);
			if(lowerUndergarment is EmptySlot) sexi += 3;
			else sexi += itemSexiness(lowerUndergarment);
			if(upperUndergarment is EmptySlot) sexi += 3;
			else sexi += itemSexiness(upperUndergarment);

			return (sexi);
		}
		public function itemSexiness(item:*): Number
		{
			if((item is EmptySlot) || item == null) return 0;
			
			var bonus: int = item.sexiness;
			
			// Transparent sexiness adjustments
			if(item.sexiness > 0 && wornItemIsTransparent(item))
			{
				var tmod:int = 1;
				switch(item.type)
				{
					case GLOBAL.ARMOR:
					case GLOBAL.CLOTHING:
						if(!isChestVisible()) tmod++;
						if(!isCrotchVisible()) tmod++;
						if(!isAssVisible()) tmod++;
						break;
					case GLOBAL.UPPER_UNDERGARMENT:
						if(!isChestVisible()) tmod++;
						break;
					case GLOBAL.LOWER_UNDERGARMENT:
						if(!isCrotchVisible()) tmod++;
						if(!isAssVisible()) tmod++;
						break;
				}
				bonus /= tmod;
			}
			
			return bonus;
		}
		public function wornItemIsTransparent(item:*): Boolean
		{
			return (item.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT));
		}
		public function critBonus(melee: Boolean = true): Number {
			var temp: int = 5;
			if (melee) temp += meleeWeapon.critBonus;
			else temp += rangedWeapon.critBonus;
			if (hasPerk("Linked Emitters") && shields() > 0)
			{
				if ((melee && hasMeleeEnergyWeapon()) || (!melee && hasRangedEnergyWeapon())) temp += 5;
			} 
			if (hasPerk("Critical Blows")) temp += 10;
			if (hasStatusEffect("Quaramarta!")) temp += 15;
			if (hasStatusEffect("Lieve Buff")) temp += 10;
			//7% when below 50% for smugglebro perks!
			if (hasPerk("Desperation") && HP()/HPMax() < 0.5) temp += 7;
			temp += armor.critBonus + upperUndergarment.critBonus + lowerUndergarment.critBonus + accessory.critBonus + shield.critBonus;
			if(temp > 50) temp = 50;
			return temp;
		}
		public function evasion(): Number {
			var temp: int = 0;
			temp += meleeWeapon.evasion;
			temp += rangedWeapon.evasion;
			temp += armor.evasion + upperUndergarment.evasion + lowerUndergarment.evasion + accessory.evasion + shield.evasion;
			// Evasion bonus equal to 10% of your Intelligence
			if (accessory is SiegwulfeItem)
			{
				if(this is PlayerCharacter && kGAMECLASS.chars["WULFE"].isBimbo())
				{
					//While equipped, bimbo-dom siegwulfe will add a bonus to both evasion and sexiness equal to 8% of intelligence that Steele has.
					if (kGAMECLASS.siegwulfeIsDom()) temp += 3;
					else { /* Nada! */ }
				}
				//Bimbowulf gives more sexy.
				else temp += 2;
			}
			if (hasPerk("Agility")) {
				if (temp < 0 || (temp * 0.5) < 10) temp += 10;
				else temp = Math.round(temp * 1.5);
			}
			if (hasPerk("Improved Agility")) temp += 10;
			//Apply sexy moves before flat boni effects
			if (hasStatusEffect("Sexy Moves")) temp = temp * (temp < 0 ? 0.9 : 1.1);
			if (hasStatusEffect("Riposting")) temp += 15;
			if (hasStatusEffect("DaggerCloaked")) temp += 5;
			if (hasStatusEffect("Stealth Field Generator")) temp += 80;
			if (hasStatusEffect("Resolve")) temp += 50;
			if (hasStatusEffect("Spear Wall")) temp += 50;
			if (hasStatusEffect("Leech Empowerment")) temp += 50;
			if (hasStatusEffect("Roehm Slimed")) temp += statusEffectv2("Roehm Slimed");
			if (hasStatusEffect("Brute Wall")) temp += 20;
			temp += statusEffectv2("Water Veil");
			temp += statusEffectv2("Deep Freeze");
			temp += statusEffectv1("Evasion Boost");
			temp += statusEffectv2("Fade-cloak");
			temp -= statusEffectv1("Evasion Reduction");
			//Nonspecific evasion boost status effect enemies can use.
			//Now reduced by restraints - 25% per point
			temp -= (statusEffectv1("Restrained") * 0.25);

			//Preggo belly slows ya down!
			if (hasStatusEffect("Bulky Belly")) temp = temp * (temp < 0 ? (2.0 - statusEffectv1("Bulky Belly")) : (statusEffectv1("Bulky Belly")));

			if (temp > 90) temp = 90;
			//if (temp < 1) temp = 1; // Possible to have negative evasion for combat!
			
			return temp;
		}
		public function fortification(): Number {
			var temp: int = 0;
			temp += meleeWeapon.fortification;
			temp += rangedWeapon.fortification;
			temp += armor.fortification + upperUndergarment.fortification + lowerUndergarment.fortification + accessory.fortification + shield.fortification;
			return temp;
		}
		public function hasSkinFlag(arg:int): Boolean {
			var temp: int = 0;
			while (temp < skinFlags.length) {
				if (skinFlags[temp] == arg) return true;
				temp++;
			}
			return false;
		}
		public function addSkinFlag(arg:int): void {
			if (!hasSkinFlag(arg)) skinFlags[skinFlags.length] = arg;
		}
		public function clearSkinFlags(): void {
			skinFlags = new Array();
		}
		public function removeSkinFlag(arg:int):void
		{
			if (hasSkinFlag(arg))
			{
				skinFlags.splice(skinFlags.indexOf(arg), 1);
			}
		}
		public function hasFaceFlag(arg:int): Boolean {
			var temp: int = 0;
			while (temp < faceFlags.length) {
				if (faceFlags[temp] == arg) return true;
				temp++;
			}
			return false;
		}
		public function removeFaceFlag(arg:int):void
		{
			if (hasFaceFlag(arg))
			{
				faceFlags.splice(faceFlags.indexOf(arg), 1);
			}
		}
		public function addFaceFlag(arg:int): void {
			if (!hasFaceFlag(arg)) faceFlags[faceFlags.length] = arg;
		}
		public function clearFaceFlags(): void {
			faceFlags = new Array();
		}
		public function hasEarFlag(arg:int): Boolean {
			for (var temp: int = 0; temp < earFlags.length; temp++) {
				if (earFlags[temp] == arg) return true;
			}
			return false;
		}
		public function removeEarFlag(arg:int):void
		{
			if (hasEarFlag(arg))
			{
				earFlags.splice(earFlags.indexOf(arg), 1);
			}
		}
		public function addEarFlag(arg:int): void {
			if (!hasEarFlag(arg)) earFlags[earFlags.length] = arg;
		}
		public function clearEarFlags(): void {
			earFlags = new Array();
		}
		public function hasTailFlag(arg:int): Boolean {
			for (var temp: int = 0; temp < tailFlags.length; temp++) {
				if (tailFlags[temp] == arg) return true;
			}
			return false;
		}
		public function addTailFlag(arg:int): void {
			if (!hasTailFlag(arg)) tailFlags[tailFlags.length] = arg;
		}
		public function removeTailFlag(arg:int):void
		{
			if (hasTailFlag(arg))
			{
				tailFlags.splice(tailFlags.indexOf(arg), 1);
			}
		}
		public function clearTailFlags(): void {
			tailFlags = new Array();
		}
		public function hasArmFlag(arg:int): Boolean {
			for (var temp: int = 0; temp < armFlags.length; temp++) {
				if (armFlags[temp] == arg) return true;
			}
			return false;
		}
		public function addArmFlag(arg:int): void {
			if (!hasArmFlag(arg)) armFlags[armFlags.length] = arg;
		}
		public function removeArmFlag(arg:int):void
		{
			if (hasArmFlag(arg))
			{
				armFlags.splice(armFlags.indexOf(arg), 1);
			}
		}
		public function clearArmFlags(): void {
			armFlags = new Array();
		}
		public function hasLegFlag(arg:int): Boolean {
			for (var temp: int = 0; temp < legFlags.length; temp++) {
				if (legFlags[temp] == arg) return true;
			}
			return false;
		}
		public function removeLegFlag(arg:int):void
		{
			if (hasLegFlag(arg))
			{
				legFlags.splice(legFlags.indexOf(arg), 1);
			}
		}
		public function addLegFlag(arg:int): void {
			if (!hasLegFlag(arg)) legFlags[legFlags.length] = arg;
		}
		public function clearLegFlags(): void {
			legFlags = new Array();
		}
		public function hasLeg(): Boolean {
			return (hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) || hasLegFlag(GLOBAL.FLAG_PLANTIGRADE));
		}
		public function hasLegs(): Boolean {
			return (hasLeg() && legCount > 1);
		}
		public function hasTongueFlag(arg:int): Boolean {
			var temp: int = 0;
			while (temp < tongueFlags.length) {
				if (tongueFlags[temp] == arg) return true;
				temp++;
			}
			return false;
		}
		public function removeTongueFlag(arg:int):void
		{
			if (hasTongueFlag(arg))
			{
				tongueFlags.splice(tongueFlags.indexOf(arg), 1);
			}
		}
		public function clearTongueFlags():void
		{
			if (tongueFlags.length > 0) tongueFlags = [];
		}
		public function addTongueFlag(arg:int): void {
			if (!hasTongueFlag(arg)) tongueFlags[tongueFlags.length] = arg;
		}
		public function displayTallness(): String {
			var buffer: String = "";
			buffer = Math.floor(tallness / 12) + "\'";
			if (Math.round(tallness % 12) != 0) buffer += Math.round(tallness % 12) + "\"";
			return buffer;
		}
		public function lipRating(): Number {
			return lipMod + femininity / 25;
		}
		public function lipsDescript(forcedAdjectives:Boolean = false, chaste:Boolean = false): String {
			return plural(lipDescript(forcedAdjectives, chaste));
		}
		public function lipDescript(forcedAdjectives:Boolean = false, chaste:Boolean = false): String {
			//lipMod + some femininity divided by something to get result.
			var lips:int = lipRating();
			var result:String = "";
			var adjectives:Array = new Array();
			//Size Adjectives
			if(rand(3) == 0 || forcedAdjectives)
			{
				//Lips
				if(lips < 0)
				{
					adjectives.push("non-existent");
					adjectives.push("absent");
					adjectives.push("insubstantial");
				}
				else if(lips <= 1)
				{
					adjectives.push("pencil-thin");
					adjectives.push("lean");
					adjectives.push("slender");
				}
				else if(lips <= 2)
				{
					adjectives.push("nice");
					adjectives.push("petite");
					adjectives.push("supple");
				}
				else if(lips <= 3)
				{
					adjectives.push("full");
					adjectives.push("pouty");
					adjectives.push("shapely");
					adjectives.push("plump");
				}
				else if(lips <= 4)
				{
					adjectives.push("succulent");
					adjectives.push("juicy");
					adjectives.push("luscious");
				}
				else if(lips <= 5)
				{
					adjectives.push("voluptuous");
					adjectives.push("bee-stung");
					adjectives.push("swollen");
				}
				else if(lips <= 6)
				{
					adjectives.push("hypnotic");
					adjectives.push("dazzling");
					adjectives.push("fat");
					adjectives.push("exquisitely large");
				}
				else if(lips <= 7)
				{
					adjectives.push("hyper-engorged");
					adjectives.push("constantly pursed");
					adjectives.push("bloated");
				}
				else if(lips <= 8)
				{
					adjectives.push("‘O’ shaped");
					adjectives.push("whorish");
					adjectives.push("permanently puckered");
				}
				//Serious this is too big, bro
				else
				{
					adjectives.push("jacquesian");
					adjectives.push("scylla-tier");
					adjectives.push("impossibly large");
					adjectives.push("universe-distorting");
					adjectives.push("universe-distorting");
				}
				if(adjectives.length > 0) result += adjectives[rand(adjectives.length)];
				// Silicone
				var silicone:Number = siliconeRating("lips");
				var siliconePref:int = statusEffectv1("Silicone Preference");
				if(silicone > 0 && siliconePref != -1 && rand(2) == 0) {
					adjectives.length = 0;
					if(silicone >= 2) adjectives.push("gravity defying");
					if(siliconePref != 1 && siliconePref != 2) adjectives.push("fake", "plastic");
					if(siliconePref != 2) adjectives.push("collagen-enhanced", "augmented", "silicone-filled");
					if(lips >= 3) adjectives.push("perfectly rounded");
					if(result != "") result += ", ";
					result += adjectives[rand(adjectives.length)];
				}
			}
			//Color!
			if(rand(4) == 0 && lipColor != "peach")
			{
				if(result != "") result += ", ";
				result += lipColor;
			}
			//Nouns
			var nouns:Array = new Array();
			//Build up the choices!
			nouns[nouns.length] = "lip";
			nouns[nouns.length] = "lip";
			nouns[nouns.length] = "lip";
			nouns[nouns.length] = "lip";
			if(!chaste)
			{
				//High libido sluttery
				if(lust() >= 80 && libido() >= 50 && lips >= 2 && (hasVagina() || femininity >= 75)) nouns[nouns.length] = "dick-sucker";
				if(lust() >= 80 && libido() >= 60 && lips >= 3 && (hasVagina() || femininity >= 75)) nouns[nouns.length] = "cock-sucker";
				if(lust() >= 80 && libido() >= 65 && lips >= 4) nouns[nouns.length] = "dick-pillow";
				if(lust() >= 80 && libido() >= 70 && lips >= 4) nouns[nouns.length] = "cock-pillow";
				if(lust() >= 80 && libido() >= 80 && lips >= 5) nouns[nouns.length] = "fuck-pillow";
				//if(lust() >= 80 && libido() >= 90 && lips >= 5) nouns[nouns.length] = "oral fuck-cushion";
				if(lust() >= 80 && libido() >= 90 && lips >= 6) nouns[nouns.length] = "pleasure-pillow";
			}
			else
			{
				if(lips >= 4) nouns[nouns.length] = "pillow";
				if(lips >= 4 && adjectives.indexOf("permanently puckered") == -1) nouns[nouns.length] = "pucker";
			}
			//Tack the selected choice onto result
			if(result != "") result += " ";
			result += nouns[rand(nouns.length)];
			return result;
		}
		public function mouthDescript(forcedAdjectives:Boolean = false, chaste:Boolean = false): String
		{
			var lips:int = lipRating();
			var result:String = "";
			var adjectives:Array = [];
			var nouns:Array = ["mouth", "mouth", "mouth", "maw"];
			
			if(!chaste)
			{
				if(isBimbo() || (lust() >= 80 && libido() >= 50 && lips >= 2)) adjectives.push("sexy ", "sexy ", "alluring ", "lusty ");
				if(isDependant(DEPENDANT_MYRVENOM)) adjectives.push("slutty ", "venom-coated ", "venom-coated ");
				if(isDependant(DEPENDANT_CUM)) adjectives.push("slutty ", "cum-hungry ", "orally-fixated ");
			}
			if(hasTongueFlag(GLOBAL.FLAG_LUBRICATED)) adjectives.push("lubricated ", "well-lubricated ", "lubed ", "well-lubed ");
			if(hasMuzzle()) adjectives.push("muzzle-", "bestial ");
			if(hasBeak())
			{
				if(rand(2) == 0) adjectives.push("beaked ", "avian ");
				else nouns.push("beak");
			}
			
			if(adjectives.length > 0 && (forcedAdjectives || rand(2) == 0)) result += adjectives[rand(adjectives.length)];
			result += nouns[rand(nouns.length)];
			
			return result;
		}
		public function hasLongEars(): Boolean
		{
			// For ear types that support the earLength value. At least 1 inch long or more to count.
			if(earLength >= 1 && InCollection(earType, GLOBAL.TYPE_SYLVAN, GLOBAL.TYPE_LEITHAN, GLOBAL.TYPE_RASKVEL, GLOBAL.TYPE_LAPINE, GLOBAL.TYPE_QUAD_LAPINE, GLOBAL.TYPE_GABILANI, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_DOGGIE, GLOBAL.TYPE_DZAAN)) return true;
			return hasEarFlag(GLOBAL.FLAG_LONG);
		}
		public function hasEmoteEars(): Boolean
		{
			// For ear types that move emotively, like cute animal ears.
			if(InCollection(earType, [GLOBAL.TYPE_CANINE, GLOBAL.TYPE_DOGGIE, GLOBAL.TYPE_KORGONNE, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_BOVINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_LAPINE, GLOBAL.TYPE_QUAD_LAPINE, GLOBAL.TYPE_KANGAROO, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_KUITAN, GLOBAL.TYPE_MOUSE, GLOBAL.TYPE_PANDA, GLOBAL.TYPE_REDPANDA, GLOBAL.TYPE_LEITHAN, GLOBAL.TYPE_RASKVEL, GLOBAL.TYPE_DEER, GLOBAL.TYPE_SWINE, GLOBAL.TYPE_LUPINE, GLOBAL.TYPE_SHEEP, GLOBAL.TYPE_GOAT, GLOBAL.TYPE_SIMII, GLOBAL.TYPE_BADGER, GLOBAL.TYPE_HYENA]) || (InCollection(earType, [GLOBAL.TYPE_SYLVAN, GLOBAL.TYPE_DZAAN, GLOBAL.TYPE_GABILANI]) && earLength > 1)) return true;
			return false;
		}
		public function hasFlatEars(): Boolean
		{
			// For ear types that are mostly flat, hidden or inset, like reptile/bird ears.
			if(InCollection(earType, GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_FROG, GLOBAL.TYPE_OVIR, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_DAYNAR, GLOBAL.TYPE_MOTHRINE, GLOBAL.TYPE_SAURMORIAN)) return true;
			return false;
		}
		public function hasNonScritchEars(): Boolean
		{
			// For ear types that are not scritchable.
			if(hasFlatEars() || InCollection(earType, GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SIREN, GLOBAL.TYPE_VANAE, GLOBAL.TYPE_DRIDER)) return true;
			return false;
		}
		public function earDescript(): String
		{
			var adjectives:Array = new Array();
			var nouns:Array = ["ear"];
			var description:String = "";
			var sRace:String = "";
			var nonFurrySkin:Boolean = (InCollection(skinType, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_LATEX) || hasPerk("Black Latex"));
			
			switch (earType)
			{
				case GLOBAL.TYPE_CANINE:
					adjectives = ["pointed", "upraised", "anubis-like"];
					sRace = race();
					if(sRace.indexOf("ausar") != -1) adjectives.push("ausar");
					if(sRace.indexOf("huskar") != -1) adjectives.push("huskar");
					if(!nonFurrySkin) adjectives.push("furry");
					break;
				case GLOBAL.TYPE_DOGGIE:
					adjectives = ["expressive", "dog-like"];
					if(earLength >= 6) adjectives.push("droopy");
					if(earLength >= 3) adjectives.push("floppy");
					else adjectives.push("rounded");
					if(isBimbo()) adjectives.push("doggie", "puppy");
					if(kGAMECLASS.silly) adjectives.push("doge");
					if(!nonFurrySkin) adjectives.push("furry");
					break;
				case GLOBAL.TYPE_KORGONNE:
					adjectives = ["cute","triangular","rounded","floppy","dog-like","korgonne-like","canine"];
					if(!nonFurrySkin) adjectives.push("furry","fuzzy");
					break;
				case GLOBAL.TYPE_EQUINE:
					adjectives = ["equine", "horse-like", "inhuman"];
					if(!nonFurrySkin) adjectives.push("furry", "bestial");
					break;
				case GLOBAL.TYPE_BOVINE:
					adjectives = ["bovine", "cow-like", "floppy"];
					if(!nonFurrySkin) adjectives.push("softly furred");
					break;
				case GLOBAL.TYPE_FELINE:
					adjectives = ["pointed", "feline", "cat-like", "cat-like"];
					sRace = race();
					if(sRace.indexOf("kaithrit") != -1) adjectives.push("kaithrit");
					if(!nonFurrySkin) adjectives.push("furry");
					break;
				case GLOBAL.TYPE_SAURMORIAN:
				case GLOBAL.TYPE_LIZAN:
					adjectives = ["reptilian", "small", "circular"];
					break;
				case GLOBAL.TYPE_LAPINE:
				case GLOBAL.TYPE_QUAD_LAPINE:
					if(hasEarFlag(GLOBAL.FLAG_FLOPPY)) adjectives = ["lop", "droopy", "floppy"];
					adjectives = ["bunny", "rabbit-like", "lapine"];
					if(!nonFurrySkin) adjectives.push("furry");
					break;
				case GLOBAL.TYPE_KANGAROO:
					adjectives = ["kangaroo", "oval-shaped", "elliptical", "pointed"];
					if(!nonFurrySkin) adjectives.push("furry");
					break;
				case GLOBAL.TYPE_VULPINE:
					adjectives = ["vulpine", "fox-like", "pointed", "triangular"];
					if(!nonFurrySkin) adjectives.push("furry");
					break;
				case GLOBAL.TYPE_LUPINE:
					adjectives = ["lupine", "wolf-like", "pointed", "triangular"];
					if(!nonFurrySkin) adjectives.push("furry");
					break;
				case GLOBAL.TYPE_DEMONIC:
					adjectives = ["demonic", "demon-like", "pointy", "inhuman", "pointed"];
					break;
				case GLOBAL.TYPE_FROSTWYRM:
				case GLOBAL.TYPE_DRACONIC:
				case GLOBAL.TYPE_GRYVAIN:
					adjectives = ["draconic", "dragon-like", "fin-like", "fan-shaped"];
					if(skinType != GLOBAL.SKIN_TYPE_GOO) adjectives.push("beastial");
					break;
				case GLOBAL.TYPE_KUITAN:
					adjectives = ["tanuki", "egg-shaped", "rounded"];
					if(!nonFurrySkin) adjectives.push("furry", "beastial");
					break;
				case GLOBAL.TYPE_BADGER:
					adjectives = ["badger", "mustelid", "triangular", "rounded"];
					if(!nonFurrySkin) adjectives.push("furry", "fuzzy");
					break;
				case GLOBAL.TYPE_MOUSE:
					adjectives = ["mousey", "mouse-like", "rounded", "circular"];
					if(!nonFurrySkin) adjectives.push("furry");
					break;
				case GLOBAL.TYPE_PANDA:
					adjectives = ["panda", "bear-like", "rounded"];
					if(!nonFurrySkin) adjectives.push("furry", "softly furred");
					break;
				case GLOBAL.TYPE_REDPANDA:
					adjectives = ["panda", "panda-like", "pointed"];
					if(!nonFurrySkin) adjectives.push("furry", "softly furred");
					break;
				case GLOBAL.TYPE_LEITHAN:
					adjectives = ["leithan", "elven-like", "pointy", "inhuman", "pointed"];
					break;
				case GLOBAL.TYPE_OVIR:
					adjectives = ["ovir", "reptilian", "dot", "hidden"];
					break;
				case GLOBAL.TYPE_RASKVEL:
					adjectives = ["raskvel", "obscenely long", "oh-so sensitive", "lengthy"];
					if(skinType != GLOBAL.SKIN_TYPE_GOO) adjectives.push("smooth-scaled");
					break;
				case GLOBAL.TYPE_SYLVAN:
					adjectives = ["elven", "sensitive", "pointy", "elvish"];
					break;
				case GLOBAL.TYPE_VANAE:
					adjectives = ["pointy", "vanae", "fin-like", "inhuman"];
					break;
				case GLOBAL.TYPE_DEER:
					adjectives = ["deer", "pointed", "oval-shaped", "pointy"];
					if(!nonFurrySkin) adjectives.push("softly furred");
					break;
				case GLOBAL.TYPE_GABILANI:
					adjectives = ["gabilani", "pointy goblin", "long triangular", "sharp alien", "elven-like"];
					break;
				case GLOBAL.TYPE_FROG:
					adjectives = ["amphibian", "frog-like", "dot", "hidden"];
					break;
				case GLOBAL.TYPE_SHARK:
					adjectives = ["pointed","sail-like","finned"];
					break;
				case GLOBAL.TYPE_SIREN:
					adjectives = ["sail-like","pointed","pisine"];
					break;
				case GLOBAL.TYPE_SWINE:
					adjectives = ["swine", "pig-like", "floppy"];
					if(isBimbo()) adjectives.push("piggy");
					break;
				case GLOBAL.TYPE_SHEEP:
					adjectives = ["sheep", "lamb-like", "floppy"];
					if(!nonFurrySkin) adjectives.push("softly furred");
					break;
				case GLOBAL.TYPE_GOAT:
					adjectives = ["goat", "flickering", "narrow"];
					if(!nonFurrySkin) adjectives.push("furred");
					break;
				case GLOBAL.TYPE_SIMII:
					adjectives = ["simii", "simian", "monkey", "monkey-like", "oddly-shaped"];
					if(hasFaceFlag(GLOBAL.FLAG_FURRED)) adjectives.push("furry", "softly furred");
					break;
				case GLOBAL.TYPE_MOTHRINE:
					adjectives = ["mothrine", "round", "unassuming"];
					break;
				case GLOBAL.TYPE_HYENA:
					adjectives = ["pointed", "large", "broad"];
					break;
				case GLOBAL.TYPE_DZAAN:
					adjectives = ["dzaan", "pointy dzaan", "long triangular", "sharp alien", "elven-like"];
					break;
			}
			if (hasLongEars()) 
			{
				//adjectives.push(num2Text(Math.round(earLength)) + "-inch long");
				adjectives.push("long");
			}
			if (skinType == GLOBAL.SKIN_TYPE_GOO && rand(5) == 0) adjectives.push("gooey", "slimy", "slick");
			if (hasPerk("Black Latex") && rand(4) == 0) adjectives.push("rubber", "latex", "latex");
			//Pick an adjective about 40% of the time
			if (rand(10) <= 3 && adjectives.length > 0) description = adjectives[rand(adjectives.length)] + " ";
			//Pick a noun.
			description += nouns[rand(nouns.length)];
			return description;
		}
		public function earsDescript(): String {
			return plural(earDescript());
		}
		public function eyeDescript(): String {
			var adjectives:Array = new Array();
			var nouns:Array = ["eye"];
			var description:String = "";
			
			var hasLuminousEyes:Boolean = kGAMECLASS.colorIsLuminous(eyeColor);
			
			adjectives.push(eyeColor);
			if(eyeType == GLOBAL.TYPE_WORG && !hasLuminousEyes) adjectives.push("glowing");
			//Show color 50% of the time
			if(rand(2) == 0 && adjectives.length > 0) description = adjectives[rand(adjectives.length)] + " ";
			//Pick a noun.
			description += nouns[rand(nouns.length)];
			return description;
		}
		public function eyesDescript(): String {
			return plural(eyeDescript());
		}
		
		public function hasLongTongue():Boolean
		{
			return hasTongueFlag(GLOBAL.FLAG_LONG) || hasTongueFlag(GLOBAL.FLAG_PREHENSILE);
		}
		
		public function noseDescript(): String
		{
			var adjectives:Array = [];
			var nouns:Array = ["nose"];
			var description:String = "";
			
			if(hasNosePiercing()) adjectives.push("pierced");
			
			if(rand(2) == 0 && adjectives.length > 0) description = adjectives[rand(adjectives.length)] + " ";
			description += nouns[rand(nouns.length)];
			return description;
		}
		
		public function tongueDescript(): String {
			var adjectives:Array = new Array();
			var types:Array = new Array();
			var description:String = "";
			var descripted:int = 0;
			var sRace:String = "";
			
			//Pick adjective
			if(hasTongueFlag(GLOBAL.FLAG_LONG))
			{
				adjectives.push("lengthy", "long", "large","sizeable");
				if (InCollection(tongueType, [GLOBAL.TYPE_LEITHAN, GLOBAL.TYPE_OVIR, GLOBAL.TYPE_FROG])) adjectives.push("extendable");
				else if (tongueType == GLOBAL.TYPE_BOVINE) adjectives.push("foot-long");
				else if (tongueType == GLOBAL.TYPE_DEMONIC) adjectives.push("two-foot long");
				else if (tongueType == GLOBAL.TYPE_DRACONIC) adjectives.push("four-foot long");
				else if (tongueType == GLOBAL.TYPE_KORGONNE) adjectives.push("nearly foot-long");
			}
			if(hasTongueFlag(GLOBAL.FLAG_PREHENSILE))
				adjectives.push("talented", "flexible", "prehensile");
			if(hasTongueFlag(GLOBAL.FLAG_TAPERED))
				adjectives.push("tapered", "pointy");
			if(hasTongueFlag(GLOBAL.FLAG_HOLLOW))
				adjectives.push("tubular", "hollow");
			if(hasTongueFlag(GLOBAL.FLAG_SMOOTH))
				adjectives.push("smooth", "sleek");
			if(hasTongueFlag(GLOBAL.FLAG_GOOEY) && tongueType != GLOBAL.TYPE_GOOEY)
				adjectives.push("slimy", "slick", "gooey");
			if(hasTongueFlag(GLOBAL.FLAG_STICKY))
				adjectives.push("sticky", "glutinous", "viscous");
			if(hasTongueFlag(GLOBAL.FLAG_NUBBY))
				adjectives.push("textured", "rough", "abrasive", "raspy");
			if(hasTongueFlag(GLOBAL.FLAG_SQUISHY))
				adjectives.push("squishy", "soft");
			if(hasTongueFlag(GLOBAL.FLAG_LUBRICATED))
			{
				adjectives.push("lubricated", "wet", "slippery");
				if(tongueType != GLOBAL.TYPE_GOOEY) adjectives.push("slimy", "slick");
			}
			if(tongueType == GLOBAL.TYPE_KORGONNE) adjectives.push("blue","floppy");
			if(tongueType == GLOBAL.TYPE_CANINE) adjectives.push("large","broad");

			
			//Show adjective 33% of the time
			if(rand(3) == 0 && adjectives.length > 0) 
			{
				description += adjectives[rand(adjectives.length)];
				descripted++;
			}
			
			//Mention of piercings
			if (hasTonguePiercing())
			{
				if (descripted > 0) description += ", ";
				description += tongueNoun(false,true);
				descripted++;
			}
			
			//Pick type
			switch (tongueType)
			{
				case GLOBAL.TYPE_HUMAN:
					if(!InCollection(faceType, [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_DZAAN]))
					{
						if(isHuman() || isHalfHuman())
						{
							if(rand(5) == 0) types.push("human", "terran");
						}
						else types.push("humanoid");
					}
					break;
				case GLOBAL.TYPE_NAGA:
					types.push("forked", "reptilian", "flitting", "snake-like");
					break;
				case GLOBAL.TYPE_DEMONIC:
					types.push("slowly undulating", "retractable", "demonic");
					break;
				case GLOBAL.TYPE_DRACONIC:
					types.push("thick", "fleshy", "draconic");
					break;
				case GLOBAL.TYPE_LEITHAN:
					types.push("narrow", "forked", "leithan");
					break;
				case GLOBAL.TYPE_OVIR:
					types.push("smooth", "ovir", "thick");
					break;
				case GLOBAL.TYPE_LAPINE:
					types.push("rabbit-like", "cute", "lapine");
					break;
				case GLOBAL.TYPE_EQUINE:
					types.push("horse-like", "equine");
					break;
				case GLOBAL.TYPE_CANINE:
					types.push("dog-like", "canine", "floppy");
					sRace = race();
					if(sRace.indexOf("ausar") != -1) types.push("ausar");
					if(sRace.indexOf("huskar") != -1) types.push("huskar");
					break;
				case GLOBAL.TYPE_VULPINE:
					types.push("fox-like", "narrow", "cute", "vulpine");
					break;
				case GLOBAL.TYPE_FELINE:
					types.push("cat-like", "feline", "cute");
					sRace = race();
					if(sRace.indexOf("kaithrit") != -1) types.push("kaithrit");
					break;
				case GLOBAL.TYPE_AVIAN:
					types.push("bird-like", "avian");
					break;
				case GLOBAL.TYPE_BOVINE:
					types.push("cow-like", "taurine", "wide-set", "broad", "bovine");
					break;
				case GLOBAL.TYPE_RASKVEL:
					types.push("purple", "thick", "alien", "raskvel");
					break;
				case GLOBAL.TYPE_GOOEY:
					types.push("goo-like", "amorphous", "gelatinous", "slimy", "gooey");
					sRace = race();
					if(isRahn()) types.push("rahn");
					if(sRace == "galotian") types.push("galotian");
					if(sRace == "conglomerate") types.push("nanomite");
					break;
				case GLOBAL.TYPE_BEE:
					types.push("bright yellow", "insectile", "straw-like", "bee-like");
					break;
				case GLOBAL.TYPE_FROG:
					types.push("frog", "whip-like", "thick");
					break;
				case GLOBAL.TYPE_TENTACLE:
					types.push("writhing", "tentacle-like");
					break;
				case GLOBAL.TYPE_KORGONNE:
					types.push("alien","dog-like","korgonne-like","alien");
					break;
				case GLOBAL.TYPE_MOTHRINE:
					types.push("alien", "insectile", "straw-like", "moth-like");
					break;
			}
			
			//Show type 25% of the time
			if(rand(4) == 0 && types.length > 0) 
			{
				if (descripted > 0) description += ", ";
				description += types[rand(types.length)];
				descripted++;
			}
			if(descripted > 0) description += " ";
			//Pick a noun.
			description += tongueNoun(true,false);
			return description;
		}
		public function tongueNoun(bNoun:Boolean = true, bPiercings:Boolean = true): String {
			var nouns:Array = ["tongue"];
			var description:String = "";
			var descripted:int = 0;
			
			//Mention of piercings. 9999
			if (bPiercings)
			{
				if (tonguePierced < 2) description += "pierced";
				else if (tonguePierced < 3) description += "double-pierced";
				else if (tonguePierced < 4) description += "triple-pierced";
				else if (tonguePierced < 7) description += "multi-pierced";
				else description += "heavily-pierced";
				descripted++;
			}
			
			if(tongueType == GLOBAL.TYPE_BEE) nouns[nouns.length] = "proboscis";
			
			//Pick a noun.
			if(bNoun)
			{
				if (descripted > 0) description += " ";
				description += nouns[rand(nouns.length)];
			}
			return description;
		}
		public function hasSmallNose(): Boolean {
			return InCollection(faceType, GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_DZAAN, GLOBAL.TYPE_NALEEN_FACE, GLOBAL.TYPE_LAPINE, GLOBAL.TYPE_HUMANMASKED, GLOBAL.TYPE_KUITAN, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_MOUSEMAN, GLOBAL.TYPE_MOUSE, GLOBAL.TYPE_SIMII, GLOBAL.TYPE_SHEEP, GLOBAL.TYPE_GOAT);
		}
		public function faceDesc(): String {
			var faceo: String = "";
			var bSmallNose: Boolean = hasSmallNose();
			if(hasPerk("Perma-cute")) {
				faceo = "a boyish " + face();
				if (hasBeard()) faceo += " and " + beard();
				faceo += " with " + plural(lipDescript(true)) + faceLipMimbraneDescript();
				if (bSmallNose) faceo += ", an adorable nose";
				faceo += " and noticeable eyelashes";
			}
			else if (hasPerk("Androgyny")) {
				faceo = "an androgynous " + face();
				if (mfn("m", "f", "n", true) == "n") faceo += " that would work on either a male or a female"
				else faceo += " which leaves a subtle " + mf("boyish", "girly", true) + " impression";
				if (lipRating() > 1 && !hasBeak()) faceo += " with " + plural(lipDescript(true)) + faceLipMimbraneDescript();
				if (hasBeard()) faceo += " in addition to " + (this is PlayerCharacter ? "your ":mf("his ","her ")) + beard();
			}
			//0-10
			else if (femininity < 10) {
				faceo = "a square chin";
				if (!hasBeard() && lipRating() > 2) faceo += ", " + plural(lipDescript(true)) + faceLipMimbraneDescript() + ", and chiseled jawline";
				else if (!hasBeard()) faceo += " and chiseled jawline";
				else faceo += ", chiseled jawline, and " + beard();
			}
			//10+ -20
			else if (femininity < 20) {
				faceo = "a rugged looking " + face() + " ";
				if (hasBeard()) faceo += "and " + beard() + " that are";
				else if (lipRating() > 2) faceo += "and " + plural(lipDescript(true)) + faceLipMimbraneDescript() + " that are";
				else faceo += "that’s";
				faceo += " surely handsome";
			}
			//21-28
			else if (femininity < 28)
			{
				faceo = "a well-defined jawline";
				if (hasBeard()) faceo += " and " + beard();
				faceo += ", a pair of " + plural(lipDescript(true)) + faceLipMimbraneDescript() + ", and a fairly masculine profile";
			}
			//28+-35
			else if (femininity < 35)
			{
				faceo = "a somewhat masculine, angular jawline";
				if (hasBeard()) faceo += ", " + beard() + ",";
				faceo += " and " + plural(lipDescript(true)) + faceLipMimbraneDescript();
			}
			//35-45
			else if (femininity < 45)
			{
				faceo = "a pair of " + plural(lipDescript(true)) + faceLipMimbraneDescript() + " and the barest hint of masculinity in its structure";
				if (hasBeard()) faceo += "--that is, if it weren’t for " + (this is PlayerCharacter ? "your":mf("his","her")) + " " + beard();
			}
			//45-55
			else if (femininity <= 55)
			{
				faceo = "an androgynous set of features";
				if (hasBeard()) faceo += ", except for " + (this is PlayerCharacter ? "your":mf("his","her")) + " " + beard() + ",";
				faceo += " that would work on either a male or a female and " + plural(lipDescript(true)) + faceLipMimbraneDescript();
			}
			//55+-65
			else if (femininity <= 65)
			{
				faceo = "a tiny touch of femininity to it";
				if (hasBeard()) faceo += ", if not for " + (this is PlayerCharacter ? "your":mf("his","her")) + " " + beard();
				faceo += ", with gentle curves and " + plural(lipDescript(true)) + faceLipMimbraneDescript();
			}
			//65+-72
			else if (femininity <= 72)
			{
				faceo = "a nice set of cheekbones";
				if (hasBeard()) faceo += ", accompanied by " + (this is PlayerCharacter ? "your":mf("his","her")) + " " + beard() + ",";
				faceo += " and " + plural(lipDescript(true)) + faceLipMimbraneDescript();
			}
			//72+-80
			else if (femininity <= 80)
			{
				faceo = "a beautiful, feminine shapeliness that’s sure to draw attention";
				if (hasBeard()) faceo += ", despite " + (this is PlayerCharacter ? "your":mf("his","her")) + " " + beard() + ",";
				faceo += " and " + plural(lipDescript(true)) + faceLipMimbraneDescript();
			}
			//81-90
			else if (femininity <= 90)
			{
				faceo = "a gorgeous profile with " + plural(lipDescript(true)) + faceLipMimbraneDescript();
				if (bSmallNose) faceo += ", a button nose";
				faceo += " and noticeable eyelashes";
				if (hasBeard()) faceo += "--though contrasted by " + (this is PlayerCharacter ? "your":mf("his","her")) + " " + beard();
			}
			//91-100
			else
			{
				faceo = "a jaw-droppingly feminine shape with " + plural(lipDescript(true)) + faceLipMimbraneDescript();
				if (bSmallNose) faceo += ", an adorable nose";
				faceo += " and long, beautiful eyelashes";
				if (hasBeard()) faceo += "--in striking contrast to " + (this is PlayerCharacter ? "your":mf("his","her")) + " " + beard();
			}
			return faceo;
		}
		
		public function faceHasFangs():Boolean
		{
			return InCollection(faceType, [GLOBAL.TYPE_NALEEN_FACE, GLOBAL.TYPE_SNAKE, GLOBAL.TYPE_ARACHNID]);
		}
		
		public function faceLipMimbraneDescript(): String {
			//Mimbrane additions in relation to face.
			var facemim: String = "";
			
			//Player character check--not sure if NPCs can get the Mims since the flag is probably global...
			if (this is PlayerCharacter && hasStatusEffect("Mimbrane Face"))
			{
				//Birthmark
				if (flags["MIMBRANE_FACE_APPEARANCE"] == 1) facemim = " adorned with beauty marks just above them";
				//Lip piercings
				else if (flags["MIMBRANE_FACE_APPEARANCE"] == 2) facemim = " decorated with a pair of lip piercings";
			}
			
			return facemim;
		}
		//Modify femininity!
		public function modFem(change: Number, strength: Number = 1): String {
			var output: String = "";
			var old: String = face(true);
			//If already perfect!
			if (change == 0) return "";
			//Abord if at an end of the scale
			if (femininity <= femininityMin() && change < 0) return "";
			if (femininity >= femininityMax() && change > 0) return "";
			//Make the change!
			femininity += change;
			//Stay in bounds.
			if (femininity < femininityMin()) {
				change = (femininity - change) - femininityMin();
				femininity = femininityMin();
			}
			if (femininity > femininityMax()) {
				change = femininityMax() - (femininity - change);
				femininity = femininityMax();
			}
			//Large change
			if (Math.abs(change) > 5) {
				if (change > 0) output = "\n\n<b>Your facial features soften as your body becomes more feminine. (+" + Math.round(change * 10) / 10 + " femininity)</b>";
				else output = "\n\n<b>Your facial features harden as your body becomes more masculine. (-" + Math.round(change * 10) / 10 + " femininity)</b>";
			}
			//Barely noticable change!
			else {
				if (change > 0) output = "\n\nThere’s a tingling in your " + old + " as it changes imperceptibly towards being more feminine. (+" + Math.round(change * 10) / 10 + " femininity)";
				else if (change < 0) output = "\n\nThere’s a tingling in your " + old + " as it changes imperciptibly towards being more masculine. (-" + Math.round(change * 10) / 10 + " femininity)";
			}
			return output;
		}
		public function femininityMax(): Number
		{
			// Perk override
			if (hasPerk("Perma-cute")) return perkv2("Perma-cute");
			if (hasPerk("Androgyny")) return 100;
			// Race override
			var sRace:String = race();
			if (sRace.indexOf("nyrea") != -1) return 100;
			if (sRace.indexOf("ovir") != -1)
			{
				if (hasCock()) return 100;
				if (hasVagina()) return 70;
			}
			//Herms + genderless
			if ((!hasVagina() && !hasCock()) || (hasCock() && hasVagina())) return 85;
			else if (hasCock() && !hasVagina()) return 70;
			return 100;
		}
		public function femininityMin(): Number
		{
			// Perk override
			if (hasPerk("Perma-cute")) return perkv1("Perma-cute");
			if (hasPerk("Androgyny")) return 0;
			// Race override
			var sRace:String = race();
			if (sRace.indexOf("ovir") != -1)
			{
				if (hasCock()) return 80;
				if (hasVagina()) return 50;
			}
			//Herms + genderless
			if ((!hasVagina() && !hasCock()) || (hasCock() && hasVagina())) return 20;
			else if (!hasCock() && hasVagina()) return 30;
			return 000;
		}
		//Run this every hour to 'fix' femininity.
		public function canFixFemininity(): Boolean {
			if(hasPerk("Perma-cute")) return true;
			return false;
		}
		public function fixFemininity(): String {
			var output: String = "";
			//BELOW MINIMUM! GET MORE GIRLY!
			if (femininity < femininityMin()) {
				output += "<b>Your incredibly masculine, chiseled features become a little bit softer from your body’s changing hormones.";
				if (hasBeard()) {
					output += " As if that wasn’t bad enough, your " + beard() + " falls out too!";
					removeBeard();
				}
				output += "</b>";
				femininity = femininityMin();
			}
			//ABOVE MAX! GET LESS GIRLY!
			else if (femininity > femininityMax()) {
				output += "\n\n<b>You find your overly feminine face loses a little bit of its former female beauty due to your body’s changing hormones.</b>";
				femininity = femininityMax();
			}
			//LOSE DICK OR HAVE VAGINA? NO BEARD 4 U!
			if (!hasPerk("Androgyny") && (!hasCock() || hasVagina()) && hasBeard()) {
				removeBeard();
				output += "\n\n<b>Your beard falls out, leaving you with " + faceDesc() + ".</b>";
			}
			return output;
		}
		public function hasBeard(): Boolean {
			if (beardLength > 0) return true;
			return false;
		}
		public function beard(): String {
			if (hasBeard())
			{
				var description: String = "";
				var adjectives: Array = [];
				if (beardLength > 0.001 && beardLength <= 0.125) return RandomInCollection("stubble", "five o’clock shadow", "beard");
				if (rand(4) == 0)
				{
					if (beardLength < 1) adjectives.push("trim", "short");
					else adjectives.push(num2Text(Math.round(beardLength)) + "-inch long");
					if (beardLength >= 6) adjectives.push("lengthy", "long");
				}
				if (adjectives.length > 0 && rand(2) == 0) description += RandomInCollection(adjectives) + " ";
				// Beard styles
				if (description.length == 0 && beardStyle != 0 && rand(2) == 0)
				{
					description += beardStyles(true);
				}
				else description += beardNoun();
				return description;
			}
			return "ERROR: NO BEARD! <b>YOU ARE NOT A VIKING AND SHOULD TELL FEN IMMEDIATELY.</b>";
		}
		public function beardStyles(wNoun:Boolean = false): String
		{
			var bStyle:String = "";
			// List of styles
			switch (beardStyle)
			{
				default:
					bStyle = "unstyled";
					if(wNoun) bStyle += " beard"
					break;
					
				case 1:
					bStyle = "braided";
					if(wNoun) bStyle = RandomInCollection("braided", "weaved") + " beard";
					break;
				case 2:
					bStyle = "curly";
					if(wNoun) bStyle = RandomInCollection("curly", "curled", "frizzy") + " beard";
					break;
				case 3:
					bStyle = "untamed";
					if(wNoun) bStyle = RandomInCollection("untamed", "wild") + " beard";
					break;
				case 4:
					bStyle = "anchor";
					if(wNoun) bStyle = RandomInCollection("anchor", "anchor-shaped") + " beard";
					break;
				case 5:
					bStyle = "mutton chops";
					if(wNoun) bStyle = RandomInCollection("mutton chop", "mutton-chop beard");
					break;
				case 6:
					bStyle = "boxed";
					if(wNoun) bStyle = RandomInCollection("boxed", "box-shaped") + " beard";
					break;
				case 7:
					bStyle = "chin strap";
					if(wNoun) bStyle = RandomInCollection("chin strap", "chin-strap beard");
					break;
				case 8:
					bStyle = "mustache";
					break;
				case 9:
					bStyle = "handlebars";
					if(wNoun) bStyle = "handlebar mustache";
					break;
				case 10:
					bStyle = "goatee";
					break;
				case 11:
					bStyle = "sideburns";
					break;
			}
			// Special types:
			if(wNoun && rand(3) == 0)
			{
				var beardNoun:String = beardNoun();
				switch (beardType)
				{
					default: bStyle = beardNoun; break;
					case GLOBAL.HAIR_TYPE_FEATHERS: bStyle = "feather " + beardNoun; break;
					case GLOBAL.HAIR_TYPE_QUILLS: bStyle = "quill " + beardNoun; break;
					case GLOBAL.HAIR_TYPE_GOO: bStyle = "goo " + beardNoun; break;
					case GLOBAL.HAIR_TYPE_TENTACLES: bStyle = "tentacle " + beardNoun; break;
					case GLOBAL.HAIR_TYPE_PLANT: bStyle = "moss " + beardNoun; break;
				}
			}
			return bStyle;
		}
		public function beardNoun():String
		{
			var beardNoun:String = "beard";
			switch (beardStyle)
			{
				case 8:
				case 9:
					beardNoun = "mustache";
					break;
				case 10:
					beardNoun = RandomInCollection("goatee", "beard");
					break;
				case 11:
					beardNoun = "sideburns";
					break;
			}
			return beardNoun;
		}
		public function removeBeard():void
		{
			beardType = hairType;
			beardColor = hairColor;
			beardLength = 0;
			beardStyle = 0;
			return;
		}
		public function gillDesc(): String
		{
			var adjectives:Array = [];
			var nouns:Array = ["gill"];
			var description:String = "";
			
			// Shark-like
			if (sharkScore() >= 3) adjectives.push("slit-like", "slit-like", "slit-like", "fish-like", "scaly", "scaled");
			/*
			else if (9999 == 0) adjectives.push("fish-like");
			else if (9999 == 0) adjectives.push("bulbous");
			else if (9999 == 0) adjectives.push("dotted");
			else if (9999 == 0) adjectives.push("slimy", "gooey");
			else if (9999 == 0) adjectives.push("chitinous", "armored");
			else if (9999 == 0) adjectives.push("scaly", "scaled");
			else if (9999 == 0) adjectives.push("furry", "furred");
			else if (9999 == 0) adjectives.push("smooth", "sleek");
			*/
			// Other
			else adjectives.push("feathery", "feathery", "alien");
			
			if(rand(2) == 0 && adjectives.length > 0) description += adjectives[rand(adjectives.length)] + " ";
			
			description += nouns[rand(nouns.length)];
			return description;
		}
		public function gillsDesc(): String
		{
			return plural(gillDesc());
		}
		public function modThickness(change: Number, display:Boolean = true): String 
		{
			var oldN: Number = thickness;
			var minN: Number = thicknessMin();
			var maxN: Number = thicknessMax();
			
			// Mods to caps here
			
			//Check bounds
			if (change != 0) 
			{
				thickness += change;
				if (thickness > maxN) thickness = maxN;
				if (thickness < minN) thickness = minN;
			}
			change = thickness - oldN;
			if(display)
			{
				// Display 'U GOT FAT'
				if (change > 0) return "\n\nYour center of balance changes a little bit as your body noticeably widens. (+" + Math.round(change * 10) / 10 + " body thickness)";
				// GET THIN BITCH
				if (change < 0) return "\n\nEach movement feels a tiny bit easier than the last. Did you just lose a little weight!? (-" + Math.round(change * 10) / 10 + " body thickness)";
			}
			return "";
		}
		public function modTone(change: Number, display:Boolean = true): String 
		{
			var oldN: Number = tone;
			var minN: Number = toneMin();
			var maxN: Number = toneMax();
			
			// Mods to caps
			if(hasSkinFlag(GLOBAL.FLAG_SQUISHY) && change > 0 && (tone + change) > maxN) return "\n\nBeing naturally squishy, your body refuses to get more solid than it is now.";
			
			//Check bounds
			if (change != 0) 
			{
				tone += change;
				if (tone > maxN) tone = maxN;
				if (tone < minN) tone = minN;
			}
			change = tone - oldN;
			if(display)
			{
				// Display BITCH I WORK OUT
				if (change > 0) return "\n\nYour body feels a little more solid as you move, and your muscles look slightly more visible. (+" + Math.round(change * 10) / 10 + " muscle tone)";
				// Display DERP I HAVE GIRL MUSCLES
				if (change < 0) return "\n\nMoving brings with it a little more jiggle than you’re used to. You don’t seem to have gained weight, but your muscles look less visible. (-" + Math.round(change * 10) / 10 + " muscle tone)";
			}
			return "";
		}
		public function skinFurScalesColor():String
		{
			if(armor is Omnisuit) return "black";
			else if(skinType == GLOBAL.SKIN_TYPE_FUR || skinType == GLOBAL.SKIN_TYPE_FEATHERS) return furColor;
			else if(skinType == GLOBAL.SKIN_TYPE_SCALES || skinType == GLOBAL.SKIN_TYPE_CHITIN || skinType == GLOBAL.SKIN_TYPE_BARK) return scaleColor;
			return skinTone;
		}
		public function chitinColor(part:String = "", bonus:Boolean = false):String
		{
			// Special types of chitinous anatomy return the scale color, otherwise it's a black color.
			var colors:Array = ["black"];
			if (bonus) colors.push("ebony", "midnight-hued", "obsidian", "onyx", "pitch");
			if (part == "body" || skinType == GLOBAL.SKIN_TYPE_CHITIN)
			{
				if (skinType != GLOBAL.SKIN_TYPE_CHITIN) return "null";
				return scaleColor;
			}
			if (part == "arm" || hasArmFlag(GLOBAL.FLAG_CHITINOUS))
			{
				if (!hasArmFlag(GLOBAL.FLAG_CHITINOUS)) return "null";
				if (hasArmFlag(GLOBAL.FLAG_GOOEY)) return scaleColor;
				if (InCollection(armType, GLOBAL.TYPE_MYR, GLOBAL.TYPE_LEITHAN)) return scaleColor;
				return RandomInCollection(colors);
			}
			if (part == "leg" || hasLegFlag(GLOBAL.FLAG_CHITINOUS))
			{
				if (!hasLegFlag(GLOBAL.FLAG_CHITINOUS)) return "null";
				if (hasLegFlag(GLOBAL.FLAG_GOOEY)) return scaleColor;
				if (InCollection(legType, GLOBAL.TYPE_MYR, GLOBAL.TYPE_GOOEY)) return scaleColor;
				return RandomInCollection(colors);
			}
			if (part == "tail" || hasTailFlag(GLOBAL.FLAG_CHITINOUS))
			{
				if (!hasTailFlag(GLOBAL.FLAG_CHITINOUS)) return "null";
				if (hasTailFlag(GLOBAL.FLAG_GOOEY)) return scaleColor;
				if (InCollection(tailType, GLOBAL.TYPE_MYR)) return scaleColor;
				return RandomInCollection(colors);
			}
			return "null";
		}
		public function legFurScales():String 
		{
			var output: String = "";
			var noun:String = "";
			var adjectives:Array = [];
			//Figure out if we're talking skin or fur.
			if(hasLegFur()) noun += "fur";
			else if(hasLegFlag(GLOBAL.FLAG_SCALED) || skinType == GLOBAL.SKIN_TYPE_SCALES) noun += "scales";
			else if(hasLegFlag(GLOBAL.FLAG_CHITINOUS) || skinType == GLOBAL.SKIN_TYPE_CHITIN) noun += "chitin";
			else if(skinType == GLOBAL.SKIN_TYPE_BARK) noun += "bark";
			else if(legType == GLOBAL.TYPE_GOOEY || skinType == GLOBAL.SKIN_TYPE_GOO) noun += "goo";
			else if(hasLegFlag(GLOBAL.FLAG_FEATHERED)) noun += "feathers";
			else noun += "skin";

			//25% of the time, add an adjective.
			if (rand(4) == 0) {
				if (hasSkinFlag(GLOBAL.FLAG_SMOOTH) || hasLegFlag(GLOBAL.FLAG_SMOOTH)) adjectives.push("smooth");
				if (hasSkinFlag(GLOBAL.FLAG_THICK)) adjectives.push("thick");
				if (hasSkinFlag(GLOBAL.FLAG_STICKY)) adjectives.push("sticky");
				if (hasSkinFlag(GLOBAL.FLAG_FLUFFY))
				{
					if (noun == "fur") adjectives.push("fluffy");
					if (noun == "feathers") adjectives.push("downy");
				}
				if(adjectives.length > 0) output += RandomInCollection(adjectives);
			}
			//25% of time, describe tone.
			if (rand(4) == 0) {
				if (output != "") output += ", ";
				if (noun == "fur" || noun == "feathers") output += furColor;
				else if (noun == "scales" || noun == "chitin") output += scaleColor;
				else output += skinTone;
			}
			//Setup for words
			if (output != "") output += " ";
			//Set skin words.
			output += noun;
			return output;
		}
		public function skinFurScales(forceTone: Boolean = false, forceAdjective: Boolean = false, skin: Boolean = false, appearance: Boolean = false): String {
			var output: String = "";
			var adjectives:Array = [];
			//33% of the time, add an adjective.
			if (forceAdjective || rand(3) == 0) {
				//Omnisuit overrides normal skin descs.
				if(!appearance && !skin && armor is Omnisuit)
				{
					adjectives.push(RandomInCollection(["slick","artificial","body-encasing","sensation-enhancing","touch-enhancing","tactile-enhancing","gleaming","shining","perfectly molded"]));
				}
				else
				{
					if (skinType == GLOBAL.SKIN_TYPE_LATEX) adjectives.push(RandomInCollection(["slick","glistening","squeaky","glossy","oiled","lacquered","sleek","polished","supple"]));
					if (skinType == GLOBAL.SKIN_TYPE_PLANT || skinType == GLOBAL.SKIN_TYPE_BARK)
					{
						if (skinType == GLOBAL.SKIN_TYPE_BARK && !skin) adjectives.push(RandomInCollection(["hard","knotted","rigid","wooden","wooden"]));
						else adjectives.push(RandomInCollection(["smooth","plant-like","glossy","verdant","crisp","lush","verdurous"]));
					}
					if (skinType == GLOBAL.SKIN_TYPE_GEL)
					{
						if (hasSkinFlag(GLOBAL.FLAG_SCALED_PRETTY)) adjectives.push(RandomInCollection(scaleColor+" scaled", "glimmering"));
						adjectives.push(RandomInCollection("slightly sticky", "smooth", "spring", "gelatinous"));
					}
					if (hasSkinFlag(GLOBAL.FLAG_SMOOTH)) adjectives.push("smooth");
					if (hasSkinFlag(GLOBAL.FLAG_THICK) || (!skin && hasFur() && perkv1("Wooly") >= 1)) adjectives.push("thick");
					if (hasSkinFlag(GLOBAL.FLAG_STICKY)) adjectives.push("sticky");
					if (hasSkinFlag(GLOBAL.FLAG_FLUFFY) && !skin)
					{
						if (skinType == GLOBAL.SKIN_TYPE_FUR) adjectives.push("fluffy");
						if (skinType == GLOBAL.SKIN_TYPE_FEATHERS) adjectives.push("downy");
					}
					if (hasSkinFlag(GLOBAL.FLAG_LUBRICATED))
					{
						if (skinType == GLOBAL.SKIN_TYPE_SKIN) adjectives.push(RandomInCollection(["glistening", "shining", "sparkling", "shimmering"]));
						if (skinType == GLOBAL.SKIN_TYPE_FUR || skinType == GLOBAL.SKIN_TYPE_FEATHERS) adjectives.push(RandomInCollection(["shining", "sparkling", "shimmering"]));
						if (skinType == GLOBAL.SKIN_TYPE_SCALES || skinType == GLOBAL.SKIN_TYPE_CHITIN || skinType == GLOBAL.SKIN_TYPE_LATEX) adjectives.push(RandomInCollection(["glossy", "glistening", "slick"]));
						if (skinType == GLOBAL.SKIN_TYPE_PLANT || skinType == GLOBAL.SKIN_TYPE_BARK) adjectives.push(RandomInCollection(["dewy", "damp", "moist"]));
					}
				}
				if(adjectives.length > 0) output += RandomInCollection(adjectives);
			}
			//25% of time, describe skin tone.
			if (forceTone || rand(4) == 0) {
				if (output != "") output += ", ";
				if(!skin && armor is Omnisuit) output += RandomInCollection(["black","black","ebony","onyx","sable"]);
				else if ((skinType == GLOBAL.SKIN_TYPE_FUR || skinType == GLOBAL.SKIN_TYPE_FEATHERS) && !skin) output += furColor;
				else if ((skinType == GLOBAL.SKIN_TYPE_SCALES || skinType == GLOBAL.SKIN_TYPE_CHITIN || skinType == GLOBAL.SKIN_TYPE_BARK) && !skin) output += scaleColor;
				else output += skinTone;
			}
			//Setup for words
			if (output != "") output += " ";
			//Set flag to cut down skin nouns to "normal" ones for appearance screens and the like.
			var appearance:Boolean = (forceAdjective || forceTone);
			output += skinNoun(skin,appearance);
			return output;
		}
		public function hasMuzzle():Boolean
		{
			return (hasFaceFlag(GLOBAL.FLAG_MUZZLED));
		}
		public function hasBeak():Boolean
		{
			return (hasFaceFlag(GLOBAL.FLAG_BEAK));
		}
		public function hasSkin():Boolean
		{
			return (InCollection(skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_LATEX, GLOBAL.SKIN_TYPE_PLANT]));
		}
		public function hasFur():Boolean
		{
			return (skinType == GLOBAL.SKIN_TYPE_FUR);
		}
		public function hasScales():Boolean
		{
			return (skinType == GLOBAL.SKIN_TYPE_SCALES);
		}
		public function hasChitin():Boolean
		{
			return (skinType == GLOBAL.SKIN_TYPE_CHITIN);
		}
		public function hasGooSkin(semiSolid:Boolean = false):Boolean
		{
			if(semiSolid && skinType == GLOBAL.SKIN_TYPE_GEL) return true;
			return (skinType == GLOBAL.SKIN_TYPE_GOO);
		}
		public function hasFeathers():Boolean
		{
			return (skinType == GLOBAL.SKIN_TYPE_FEATHERS);
		}
		public function hasLegFur():Boolean
		{
			return (hasLegFlag(GLOBAL.FLAG_FLUFFY) || hasLegFlag(GLOBAL.FLAG_FURRED) || skinType == GLOBAL.SKIN_TYPE_FUR)
		}
		public function hasPartFur(part:String = "any"):Boolean
		{
			if(part == "any" &&
			(	hasArmFlag(GLOBAL.FLAG_FURRED) || hasLegFlag(GLOBAL.FLAG_FURRED) || hasTailFlag(GLOBAL.FLAG_FURRED)
			||	hasSkinFlag(GLOBAL.FLAG_FLUFFY)
			||	perkv1("Regal Mane") == GLOBAL.FLAG_FURRED
			||	statusEffectv1("Wing Style") == GLOBAL.FLAG_FURRED
			||	statusEffectv1("Special Scrotum") == GLOBAL.FLAG_FURRED
			||	hasACockFlag(GLOBAL.FLAG_FURRED) || hasAVaginaFlag(GLOBAL.FLAG_FURRED)
			)) return true;
			if(part == "arm") return hasArmFlag(GLOBAL.FLAG_FURRED);
			if(part == "leg") return hasLegFlag(GLOBAL.FLAG_FURRED);
			if(part == "tail") return hasTailFlag(GLOBAL.FLAG_FURRED);
			if(part == "chest") return hasSkinFlag(GLOBAL.FLAG_FLUFFY);
			if(part == "wing") return (statusEffectv1("Wing Style") == GLOBAL.FLAG_FURRED);
			if(part == "genital") return (statusEffectv1("Special Scrotum") == GLOBAL.FLAG_FURRED || hasACockFlag(GLOBAL.FLAG_FURRED) || hasAVaginaFlag(GLOBAL.FLAG_FURRED));
			return hasFur();
		}
		public function hasPartScales(part:String = "any"):Boolean
		{
			if(part == "any" &&
			(	hasArmFlag(GLOBAL.FLAG_SCALED) || hasLegFlag(GLOBAL.FLAG_SCALED) || hasTailFlag(GLOBAL.FLAG_SCALED)
			||	InCollection(wingType, [GLOBAL.TYPE_SMALLDRACONIC, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_SHARK])
			||	perkv1("Regal Mane") == GLOBAL.FLAG_SCALED
			||	statusEffectv1("Wing Style") == GLOBAL.FLAG_SCALED
			||	statusEffectv1("Special Scrotum") == GLOBAL.FLAG_SCALED
			||	hasACockFlag(GLOBAL.FLAG_SCALED) || hasAVaginaFlag(GLOBAL.FLAG_SCALED)
			||	hasSkinFlag(GLOBAL.FLAG_SCALED_PRETTY)
			)) return true;
			if(part == "arm") return hasArmFlag(GLOBAL.FLAG_SCALED);
			if(part == "leg") return hasLegFlag(GLOBAL.FLAG_SCALED);
			if(part == "tail") return hasTailFlag(GLOBAL.FLAG_SCALED);
			if(part == "wing") return (InCollection(wingType, [GLOBAL.TYPE_SMALLDRACONIC, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_SHARK]) || statusEffectv1("Wing Style") == GLOBAL.FLAG_SCALED);
			if(part == "genital") return (statusEffectv1("Special Scrotum") == GLOBAL.FLAG_SCALED || hasACockFlag(GLOBAL.FLAG_SCALED) || hasAVaginaFlag(GLOBAL.FLAG_SCALED));
			return hasScales();
		}
		public function hasPartChitin(part:String = "any"):Boolean
		{
			if(part == "any" &&
			(	hasArmFlag(GLOBAL.FLAG_CHITINOUS) || hasLegFlag(GLOBAL.FLAG_CHITINOUS) || hasTailFlag(GLOBAL.FLAG_CHITINOUS)
			||	perkv1("Regal Mane") == GLOBAL.FLAG_CHITINOUS
			||	statusEffectv1("Wing Style") == GLOBAL.FLAG_CHITINOUS
			||	statusEffectv1("Special Scrotum") == GLOBAL.FLAG_CHITINOUS
			||	hasACockFlag(GLOBAL.FLAG_CHITINOUS) || hasAVaginaFlag(GLOBAL.FLAG_CHITINOUS)
			)) return true;
			if(part == "arm") return hasArmFlag(GLOBAL.FLAG_CHITINOUS);
			if(part == "leg") return hasLegFlag(GLOBAL.FLAG_CHITINOUS);
			if(part == "tail") return hasTailFlag(GLOBAL.FLAG_CHITINOUS);
			if(part == "wing") return (statusEffectv1("Wing Style") == GLOBAL.FLAG_CHITINOUS);
			if(part == "genital") return (statusEffectv1("Special Scrotum") == GLOBAL.FLAG_CHITINOUS || hasACockFlag(GLOBAL.FLAG_CHITINOUS) || hasAVaginaFlag(GLOBAL.FLAG_CHITINOUS));
			return hasChitin();
		}
		public function hasPartGoo(part:String = "any"):Boolean
		{
			if(part == "any" &&
			(	hasArmFlag(GLOBAL.FLAG_GOOEY) || armType == GLOBAL.TYPE_GOOEY || hasLegFlag(GLOBAL.FLAG_GOOEY) || legType == GLOBAL.TYPE_GOOEY || hasTailFlag(GLOBAL.FLAG_GOOEY)
			||	perkv1("Regal Mane") == GLOBAL.FLAG_GOOEY
			||	statusEffectv1("Wing Style") == GLOBAL.FLAG_GOOEY
			||	statusEffectv1("Special Scrotum") == GLOBAL.FLAG_GOOEY
			||	hasACockFlag(GLOBAL.FLAG_GOOEY) || hasAVaginaFlag(GLOBAL.FLAG_GOOEY)
			)) return true;
			if(part == "arm") return (armType == GLOBAL.TYPE_GOOEY || hasArmFlag(GLOBAL.FLAG_GOOEY));
			if(part == "leg") return (legType == GLOBAL.TYPE_GOOEY || hasLegFlag(GLOBAL.FLAG_GOOEY));
			if(part == "tail") return hasTailFlag(GLOBAL.FLAG_GOOEY);
			if(part == "wing") return (statusEffectv1("Wing Style") == GLOBAL.FLAG_GOOEY);
			if(part == "genital") return (statusEffectv1("Special Scrotum") == GLOBAL.FLAG_GOOEY || hasACockFlag(GLOBAL.FLAG_GOOEY) || hasAVaginaFlag(GLOBAL.FLAG_GOOEY));
			return hasGooSkin();
		}
		public function hasPartFeathers(part:String = "any"):Boolean
		{
			if(part == "any" &&
			(	hasArmFlag(GLOBAL.FLAG_FEATHERED) || hasLegFlag(GLOBAL.FLAG_FEATHERED) || hasTailFlag(GLOBAL.FLAG_FEATHERED)
			||	InCollection(wingType, [GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_DOVE])
			||	perkv1("Regal Mane") == GLOBAL.FLAG_FEATHERED
			||	statusEffectv1("Wing Style") == GLOBAL.FLAG_FEATHERED
			||	statusEffectv1("Special Scrotum") == GLOBAL.FLAG_FEATHERED
			||	hasACockFlag(GLOBAL.FLAG_FEATHERED) || hasAVaginaFlag(GLOBAL.FLAG_FEATHERED)
			)) return true;
			if(part == "arm") return hasArmFlag(GLOBAL.FLAG_FEATHERED);
			if(part == "leg") return hasLegFlag(GLOBAL.FLAG_FEATHERED);
			if(part == "tail") return hasTailFlag(GLOBAL.FLAG_FEATHERED);
			if(part == "wing") return (InCollection(wingType, [GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_DOVE]) || statusEffectv1("Wing Style") == GLOBAL.FLAG_FEATHERED);
			if(part == "genital") return (statusEffectv1("Special Scrotum") == GLOBAL.FLAG_FEATHERED || hasACockFlag(GLOBAL.FLAG_FEATHERED) || hasAVaginaFlag(GLOBAL.FLAG_FEATHERED));
			return hasFeathers();
		}
		public function skinNoun(skin: Boolean = false,appearance:Boolean = false): String {
			var output: String = "";
			var temp: int = 0;
			//Set skin words.
			if(armor is Omnisuit && !skin && !appearance) output += RandomInCollection(["latex","rubber","suit"]);
			else if (skinType == GLOBAL.SKIN_TYPE_SKIN || skin) {
				temp = rand(10);
				//if (temp <= 8) 
				output += "skin";
				//else output += "dermis";
			} else if (skinType == GLOBAL.SKIN_TYPE_FUR) {
				temp = rand(10);
				if (temp <= 7 || appearance)
				{
					if (perkv1("Wooly") >= 1 && rand(2) == 0) output += "wool";
					else output += "fur";
				}
				else if (temp <= 8)
				{
					if (perkv1("Wooly") >= 1 && rand(2) == 0) output += "fleece";
					else output += "pelt";
				}
				else output += "coat";
			} else if (skinType == GLOBAL.SKIN_TYPE_SCALES) {
				temp = rand(10);
				if (temp <= 7 || appearance) output += "scales";
				else if (temp <= 8) output += "plates";
				else output += "lamina";
			} else if (skinType == GLOBAL.SKIN_TYPE_GOO) {
				temp = rand(10);
				if (temp <= 7 || appearance) output += "goo";
				else output += "membrane";
			} else if (skinType == GLOBAL.SKIN_TYPE_FEATHERS) {
				temp = rand(10);
				if (temp <= 7 || appearance) output += "feathers";
				else if (temp <= 8) output += "fringes";
				else output += "plumes";
			} else if (skinType == GLOBAL.SKIN_TYPE_CHITIN) {
				temp = rand(10);
				if (temp <= 7 || appearance) output += "chitin";
				else if (temp <= 8) output += "armor";
				else output += "carapace";
			} else if (skinType == GLOBAL.SKIN_TYPE_LATEX) {
				if(!skin) output += RandomInCollection(["latex","rubber","plastic","casing","dermis","film"]);
				else output += RandomInCollection(["skin","latex skin","rubber skin","plastic skin"]);
			} else if (skinType == GLOBAL.SKIN_TYPE_PLANT || skinType == GLOBAL.SKIN_TYPE_BARK) {
				if(skinType == GLOBAL.SKIN_TYPE_BARK && !skin) output += RandomInCollection(["armor","bark","skin","skin"]);
				else output += RandomInCollection(["skin","skin","epidermis","plant skin","nymph skin"]);
			}
			else if (skinType == GLOBAL.SKIN_TYPE_GEL)
			{
				temp = rand(10);
				if (appearance) output += "gel";
				else if (temp <= 7) output += "skin";
				else output += "membrane";
			}
			return output;
		}
		public function skin(forceTone: Boolean = false, forceAdjective: Boolean = false, appearance:Boolean = false): String {
			return skinFurScales(forceTone, forceAdjective, true, appearance);
		}
		public function face(forceAdjectives: Boolean = false): String {
			var output: String = "";
			var adjectives:Array = [];
			//1 in 4 chance unless forcing adjectives
			if (rand(4) == 0 || forceAdjectives)
			{
				switch (faceType)
				{
					case GLOBAL.TYPE_CANINE: adjectives.push("canine", "dog-like"); break;
					case GLOBAL.TYPE_FELINE: adjectives.push("feline", "cat-like"); break;
					case GLOBAL.TYPE_EQUINE: adjectives.push("equine", "horse-like", "bestial"); break;
					case GLOBAL.TYPE_BOVINE: adjectives.push("bovine", "cow-like", "bestial"); break;
					case GLOBAL.TYPE_LIZAN: adjectives.push("lizan", "reptilian"); break;
					case GLOBAL.TYPE_FROSTWYRM:
					case GLOBAL.TYPE_DRACONIC: adjectives.push("draconic", "reptilian"); break;
					case GLOBAL.TYPE_LAPINE: adjectives.push("lapine", "rabbit-like", "bunny"); break;
					case GLOBAL.TYPE_NAGA: adjectives.push("naga", "snake-like"); break;
					case GLOBAL.TYPE_HUMANMASKED: adjectives.push("masked"); break;
					case GLOBAL.TYPE_KUITAN: adjectives.push("kui-tan", "tanuki-like", "raccoon-like"); break;
					case GLOBAL.TYPE_VULPINE: adjectives.push("vulpine", "fox-like", "foxy"); break;
					case GLOBAL.TYPE_LUPINE: adjectives.push("lupine", "wolf-like", "bestial"); break;
					case GLOBAL.TYPE_MOUSEMAN: adjectives.push("mousey", "mouse-like"); break;
					case GLOBAL.TYPE_MOUSE: adjectives.push("mouse", "mousey", "mouse-like"); break;
					case GLOBAL.TYPE_PANDA: adjectives.push("panda", "bear-like"); break;
					case GLOBAL.TYPE_REDPANDA: adjectives.push("panda", "mustelid-like"); break;
					case GLOBAL.TYPE_BADGER: adjectives.push("badger", "mustelid"); break;
					case GLOBAL.TYPE_KANGAROO: adjectives.push("kangaroo", "‘roo-like"); break;
					case GLOBAL.TYPE_FROG: adjectives.push("flat", "frog-like"); break;
					case GLOBAL.TYPE_AVIAN: adjectives.push("avian", "bird-like"); break;
					case GLOBAL.TYPE_SHARK: adjectives.push("shark-like","shark-like","shark-like","piscine"); break;
					case GLOBAL.TYPE_SWINE: adjectives.push("pig-nosed"); break;
					case GLOBAL.TYPE_SIMII: adjectives.push("simian", "monkey-like"); break;
					case GLOBAL.TYPE_GOAT: adjectives.push("caprine", "goat-like"); break;
					case GLOBAL.TYPE_MOTHRINE: adjectives.push("mothrine", "alien", "insectoid", "insect-like"); break;
					case GLOBAL.TYPE_XHELARFOG: adjectives.push("noseless", "alien", "inhuman"); break;
					case GLOBAL.TYPE_SAURMORIAN: adjectives.push("armored", "gilded", "plated", "reptile-like", "reptilian");
				}
				if (hasFaceFlag(GLOBAL.FLAG_ANGULAR)) adjectives.push("angular");
				if (hasFaceFlag(GLOBAL.FLAG_LONG)) adjectives.push("long");
				if (hasFaceFlag(GLOBAL.FLAG_FRECKLED)) adjectives.push("freckled");
			}
			//Space if adjective'd
			if (adjectives.length > 0) output += RandomInCollection(adjectives) + " ";
			
			//Add Noun
			if (hasBeak() && rand(2) == 0)
				output += "beak";
			else if (!hasBeak() && hasMuzzle() && rand(2) == 0)
				output += "muzzle";
			else if (hasMuzzle() && rand(2) == 0 && InCollection(faceType, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_NAGA))
				output += "snout";
			else
				output += "face";
			
			return output;
		}
		public function isBiped(): Boolean {
			//Naga/Centaur
			if (legCount != 2) return false;
			return true;
		}
		public function isNaga(): Boolean {
			if (legCount == 1 && InCollection(legType, [GLOBAL.TYPE_NAGA, GLOBAL.TYPE_SHARK])) return true;
			if (legType == GLOBAL.TYPE_GOOEY && (hasLegFlag(GLOBAL.FLAG_PREHENSILE) || hasLegFlag(GLOBAL.FLAG_TENDRIL))) return true;
			return false;
		}
		public function isTaur(): Boolean {
			if (isGoo() || isNaga()) return false;
			if (legCount == 4) return true;
			if (legCount == 6) return true;
			return false;
		}
		public function isCentaur(): Boolean
		{
			return(legCount == 4 && legType == GLOBAL.TYPE_EQUINE);
		}
		public function isDrider(): Boolean {
			return (legCount >= 4 && (legType == GLOBAL.TYPE_DRIDER || legType == GLOBAL.TYPE_ARACHNID));
		}
		public function isGoo(): Boolean {
			if (legType == GLOBAL.TYPE_GOOEY)
			{
				if (hasLegFlag(GLOBAL.FLAG_PREHENSILE)) return false;
				if (legCount == 1 || hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) return true;
			}
			return false;
		}
		public function isImmobilized(): Boolean {
			return (hasStatusEffect("Stunned") || hasStatusEffect("Paralyzed") || isGrappled() || hasStatusEffect("Endowment Immobilized"));
		}
		public function isStaggered(): Boolean {
			return (hasStatusEffect("Staggered"));
		}
		public function isGrappled(): Boolean {
			return (hasStatusEffect("Grappled") || hasStatusEffect("Naleen Coiled") || hasStatusEffect("Mimbrane Smother"));
		}
		public function isDisarmed(): Boolean {
			return (hasStatusEffect("Disarmed"));
		}
		public function isBlind(): Boolean {
			return (hasStatusEffect("Blinded") || hasStatusEffect("Smoke Grenade"));
		}
		public function removeBlindness():void
		{
			removeStatusEffect("Blinded");
			removeStatusEffect("Smoke Grenade");
		}
		public function legs(forceType: Boolean = false, forceAdjective: Boolean = false): String 
		{
			return plural(leg(forceType, forceAdjective, true));
		}
		public function legOrLegs(forceType: Boolean = false, forceAdjective: Boolean = false): String {
			if (legCount == 1) return leg(forceType, forceAdjective);
			return legs(forceType, forceAdjective);
		}
		public function thighsOrLegs(forceType: Boolean = false, forceAdjective: Boolean = false): String {
			if (legCount == 1) return thighsDescript(forceAdjective);
			return legs(forceType, forceAdjective);
		}
		public function tailDescript(nounOnly:Boolean = false): String {
			var adjectives:Array = new Array();
			var nouns:Array = ["tail"];
			var description:String = "";
			var sRace:String = "";
			// Types
			switch (tailType)
			{
				case GLOBAL.TYPE_LAPINE:
					adjectives = ["twitching", "rabbit-like", "lapine","soft","bunny","fluffy","soft"];
					//Adds variety but still keeps "tail" as most common.
					nouns.push("poof","puffball","puff","tail","tail","tail");
					break;
				case GLOBAL.TYPE_EQUINE:
					adjectives = ["equine", "horse-like"];
					break;
				case GLOBAL.TYPE_CANINE:
				case GLOBAL.TYPE_KORGONNE:
					adjectives = ["canine", "dog-like"];
					sRace = race();
					if (sRace.indexOf("ausar") != -1) adjectives.push("ausar");
					if (sRace.indexOf("huskar") != -1) adjectives.push("huskar");
					if (tailType == GLOBAL.TYPE_KORGONNE) adjectives.push("curled");
					break;
				case GLOBAL.TYPE_BOVINE:
					adjectives = ["bovine", "cow-like"];
					break;
				case GLOBAL.TYPE_CUNTSNAKE:
					adjectives = ["snake-like"];
					break;
				case GLOBAL.TYPE_PANDA:
					adjectives = ["panda", "bear-like"];
					break;
				case GLOBAL.TYPE_REDPANDA:
					adjectives = ["lesser panda", "lesser panda-like"];
					break;
				case GLOBAL.TYPE_FELINE:
					adjectives = ["feline", "cat-like"];
					sRace = race();
					if (sRace.indexOf("kaithrit") != -1) adjectives.push("kaithrit");
					break;
				case GLOBAL.TYPE_DRIDER:
				case GLOBAL.TYPE_ARACHNID:
				case GLOBAL.TYPE_BEE:
				case GLOBAL.TYPE_MYR:
					nouns = ["abdomen"];
					adjectives = ["dangling", "insectile", "insect-like"];
					if (tailType == GLOBAL.TYPE_DRIDER || tailType == GLOBAL.TYPE_ARACHNID) adjectives.push("arachnid", "spherical");
					if (tailType == GLOBAL.TYPE_BEE) adjectives.push("zil", "bee-like");
					if (tailType == GLOBAL.TYPE_MYR) adjectives.push("myr", "ant-like");
					break;
				case GLOBAL.TYPE_DEMONIC:
					adjectives = ["demonic", "spade-tipped", "whip-like", "inhuman"];
					break;
				case GLOBAL.TYPE_SHARK:
				case GLOBAL.TYPE_SIREN:
					adjectives = ["shark", "finned", "fish-like", "fin-tipped"];
					break;
				case GLOBAL.TYPE_LIZAN:
					adjectives = ["reptilian", "lizard-like"];
					break;
				case GLOBAL.TYPE_AVIAN:
					adjectives = ["avian", "bird-like"];
					break;
				case GLOBAL.TYPE_KANGAROO:
					adjectives = ["kangaroo", "‘roo-like"];
					break;
				case GLOBAL.TYPE_VULPINE:
					adjectives = ["vulpine", "fox-like", "fox"];
					break;
				case GLOBAL.TYPE_LUPINE:
					adjectives = ["lupine", "wolf-like", "wolf"];
					break;
				case GLOBAL.TYPE_DRACONIC:
					adjectives = ["draconic", "dragon-like", "reptilian", "bestial"];
					break;
				case GLOBAL.TYPE_FROSTWYRM:
					adjectives = ["draconic", "dragon-like", "bestial", "blunt-tipped", "spiked"];
					break;
				case GLOBAL.TYPE_GRYVAIN:
					adjectives = ["draconic", "gryvain", "dragon-like"];
					break;
				case GLOBAL.TYPE_KUITAN:
					adjectives = ["tanuki", "racoon-like", "kui-tan"];
					break;
				case GLOBAL.TYPE_MOUSE:
					adjectives = ["mouse", "mousey", "mouse-like", "cute"];
					break;
				case GLOBAL.TYPE_BADGER:
					adjectives = ["badger", "mustelid", "tufted"];
					break;
				case GLOBAL.TYPE_RASKVEL:
					adjectives = ["raskvel", "reptilian"];
					break;
				case GLOBAL.TYPE_SNAKE:
					adjectives = ["reptilian", "snake-like", "serpent"];
					break;
				case GLOBAL.TYPE_SYDIAN:
					adjectives = ["sydian", "wicked-shaped"];
					break;
				case GLOBAL.TYPE_COCKVINE:
					adjectives = ["vine-like"];
					break;
				case GLOBAL.TYPE_OVIR:
					adjectives = ["ovir", "lizard-like"];
					break;
				case GLOBAL.TYPE_VANAE:
					adjectives = ["vanae", "tentacled-like", "sucker-lined"];
					break;
				case GLOBAL.TYPE_DEER:
					adjectives = ["deer", "tufted", "cute"];
					break;
				case GLOBAL.TYPE_FROG:
					adjectives = ["frog", "tadpole-like", "short", "nubby", "nubbed"];
					break;
				case GLOBAL.TYPE_SWINE:
					adjectives = ["swine", "pig-like"];
					break;
				case GLOBAL.TYPE_SHEEP:
					adjectives = ["sheep", "sheep-like"];
					break;
				case GLOBAL.TYPE_SIMII:
					adjectives = ["simii", "simian", "monkey", "monkey-like"];
					break;
				case GLOBAL.TYPE_XHELARFOG:
					adjectives = ["chunky", "stumpy"];
					if (hasTailFlag(GLOBAL.FLAG_SCALED)) adjectives.push("scale topped");
					break;
				case GLOBAL.TYPE_SAURMORIAN:
					adjectives = ["armored", "gilded", "plated"];
					break;
				case GLOBAL.TYPE_HYENA:
					adjectives = ["short", "coarse", "bushy"];
					break;
			}
			// Flags
			if (hasTailCock())
				adjectives.push("writhing", "tentacle-like", "penis-tipped");
			if (hasTailCunt())
				adjectives.push("writhing", "tentacle-like", "pussy-tipped");
			if (hasTailFlag(GLOBAL.FLAG_PREHENSILE))
				adjectives.push("talented", "nimble");
			if (hasTailFlag(GLOBAL.FLAG_LONG))
				adjectives.push("lengthy", "long");
			if (hasTailFlag(GLOBAL.FLAG_FLUFFY))
				adjectives.push("fluffy", "soft");
			if (hasTailFlag(GLOBAL.FLAG_SMOOTH))
				adjectives.push("smooth", "sleek");
			if (hasTailFlag(GLOBAL.FLAG_TAILCOCK) && hasTailFlag(GLOBAL.FLAG_TAILCUNT))
			{
				adjectives.push("versatile");
				nouns.push("genitail");
			}
			else if (hasTailFlag(GLOBAL.FLAG_TAILCOCK))
				nouns.push("tail-cock", "genitail");
			else if (hasTailFlag(GLOBAL.FLAG_TAILCUNT))
				nouns.push("tail-cunt", "genitail");
			if (hasTailFlag(GLOBAL.FLAG_FURRED))
				adjectives.push("furry", "furred");
			if (hasTailFlag(GLOBAL.FLAG_SCALED))
				adjectives.push("scaled", "scaly");
			if (hasTailFlag(GLOBAL.FLAG_OVIPOSITOR))
				nouns.push("ovipositor");
			if (hasTailFlag(GLOBAL.FLAG_THICK))
				adjectives.push("thick", "girthy");
			if (hasTailFlag(GLOBAL.FLAG_STINGER_TIPPED))
				adjectives.push("stinger-tipped", "dangerous");
			if (hasTailFlag(GLOBAL.FLAG_CHITINOUS))
				adjectives.push("chitinous", "armored");
			if (hasTailFlag(GLOBAL.FLAG_TAPERED))
				adjectives.push("tapered", "conical");
			if (hasTailFlag(GLOBAL.FLAG_FEATHERED))
				adjectives.push("feathered", "feathery");
			if (hasTailFlag(GLOBAL.FLAG_GOOEY))
				adjectives.push("slimy", "slick", "gooey");
			if (hasTailFlag(GLOBAL.FLAG_STICKY))
				adjectives.push("sticky");
			if (hasTailFlag(GLOBAL.FLAG_CORKSCREWED))
				adjectives.push("curled", "curly");
			
			//Show adjective 50% of the time
			if (!nounOnly && rand(2) == 0 && adjectives.length > 0) description = adjectives[rand(adjectives.length)] + " ";
			//Pick a noun.
			description += nouns[rand(nouns.length)];
			return description;
		}
		public function oneTailDescript():String
		{
			if (tailCount <= 0) return "ERROR: No tails!";
			else if (tailCount == 1) return "your " + tailDescript();
			return "one of your " + plural(tailDescript());
		}
		public function eachTailDescript():String
		{
			if (tailCount <= 0) return "ERROR: No tails!";
			else if (tailCount == 1) return "your " + tailDescript();
			return "each of your " + plural(tailDescript());
		}
		public function tailsDescript(nounOnly:Boolean = false):String {
			if(tailCount == 1) return tailDescript(nounOnly);
			else if(tailCount > 1) return plural(tailDescript(nounOnly));
			return "<b>ERROR: Taildescript called with no tails present</b>";
		}
		public function wingDescript(nounOnly:Boolean = false):String
		{
			var adjectives:Array = new Array();
			var nouns: Array = ["wing"];
			var description:String = "";
			
			switch (wingType)
			{
				default:
					adjectives.push("non-existent");
					break;
				case GLOBAL.TYPE_SMALLBEE:
				case GLOBAL.TYPE_MYR:
					adjectives.push("small", mf("tiny", "cute", true), "insect-like", "insectile", "shimmering");
					break;
				case GLOBAL.TYPE_BEE:
					adjectives.push("large", "insect-like", "insectile", "bee", "membrane-covered", "transparent");
					break;
				case GLOBAL.TYPE_SMALLDEMONIC:
					adjectives.push("small", mf("tiny", "cute", true), "bat-like", "demon-like");
					break;
				case GLOBAL.TYPE_DEMONIC:
					adjectives.push("large", "bat-like", "demon-like", "demonic", "wicked", mf("incubus", "succubus"));
					break;
				case GLOBAL.TYPE_SHARK:
					adjectives.push("large", "shark-like");
					nouns = ["dorsal fin"];
					break;
				case GLOBAL.TYPE_AVIAN:
					adjectives.push("large", "bird-like", "avian", "feathery");
					break;
				case GLOBAL.TYPE_SMALLDRACONIC:
					adjectives.push("small", mf("tiny","cute", true), "bat-like", "dragon-like", "scaled");
					break;
				case GLOBAL.TYPE_DRACONIC:
				case GLOBAL.TYPE_FROSTWYRM:
					adjectives.push("large", "bat-like", "dragon-like", "draconic", "scaled", "wicked", "magnificent", mf("mighty","majestic"));
					break;
				case GLOBAL.TYPE_GRYVAIN:
					adjectives.push("large", "dragon-like", "gryvain", "scaled");
					break;
				case GLOBAL.TYPE_DRAGONFLY:
					adjectives.push("large", "giant", "insectile", "dragonfly", "transparent", "iridescent");
					break;
				case GLOBAL.TYPE_SYLVAN:
					adjectives.push("sylvan", "delicate", "blue gossamer", "iridescent");
					break;
				case GLOBAL.TYPE_DARK_SYLVAN:
					adjectives.push("dark sylvan", "delicate", "black gossamer", "shadowy");
					break;
				case GLOBAL.TYPE_MOTHRINE:
					adjectives.push("mothrine", "patterned", "graceful");
					if(wingTexture() == GLOBAL.FLAG_FURRED) adjectives.push("fuzzy", "furred");
					else adjectives.push("fragile", "delicate");
					break;
				case GLOBAL.TYPE_DOVE:
					adjectives.push("large", "bird-like", "dove-like", "soft", "feathery");
					break;
				case GLOBAL.TYPE_JANERIA:
				case GLOBAL.TYPE_COCKVINE:
				case GLOBAL.TYPE_TENTACLE:
					adjectives.push("wriggling", "squirming", "undulating", "oily", "prehensile", "lithe", "snaky", "smooth", "slithery");
					if(wingType == GLOBAL.TYPE_COCKVINE) adjectives.push("plant-like", "vine-like");
					if(wingType == GLOBAL.TYPE_TENTACLE) adjectives.push("alien-like", "demon-like");
					nouns = ["tentacle"];
					if(!nounOnly)
					{
						nouns.push("dorsal cock", "back penis");
						if(wingType == GLOBAL.TYPE_COCKVINE) nouns.push("cockvine");
						if(wingType == GLOBAL.TYPE_TENTACLE) nouns.push("tentacle");
					}
					break;
			}
			
			if (!nounOnly && rand(2) == 0 && adjectives.length > 0) description += RandomInCollection(adjectives);
			if (!nounOnly && wingColor() != "" && rand(2) == 0)
			{
				if(description != "") description += ", ";
				description += wingColor();
			}
			if(description != "") description += " ";
			description += (nouns.length > 0 ? RandomInCollection(nouns) : "wing");
			return description;
		}
		public function wingsDescript(nounOnly:Boolean = false):String
		{
			if(wingCount == 1) return wingDescript(nounOnly);
			return plural(wingDescript(nounOnly));
		}
		public function armsDescript(forceAdjective: Boolean = false):String {
			return plural(armDescript(forceAdjective));
		}
		public function armDescript(forceAdjective: Boolean = false):String
		{
			var output: String = "";
			var adjective:Array = [];
			var type:Array = [];
			
			// Adjectives
			if (hasArmFlag(GLOBAL.FLAG_SMOOTH)) adjective.push("smooth");
			if (hasArmFlag(GLOBAL.FLAG_AMORPHOUS)) adjective.push("amorphous", "gooey");
			if (hasArmFlag(GLOBAL.FLAG_FURRED)) adjective.push("furred", "furry");
			if (hasArmFlag(GLOBAL.FLAG_SCALED)) adjective.push("scaled", "scaly");
			if (hasArmFlag(GLOBAL.FLAG_CHITINOUS)) adjective.push("chitinous", "armored");
			if (hasArmFlag(GLOBAL.FLAG_FEATHERED)) adjective.push("feathered", "feathery");
			if (hasArmFlag(GLOBAL.FLAG_GOOEY)) adjective.push("slimy", "slick", "gooey");
			if (hasArmFlag(GLOBAL.FLAG_SPIKED)) adjective.push("spiked", "spiky", "prickly");
			if (hasArmFlag(GLOBAL.FLAG_STICKY)) adjective.push("sticky");
			if (hasArmFlag(GLOBAL.FLAG_LUBRICATED)) adjective.push("moist", "slippery", "slick");
			if (armType == GLOBAL.TYPE_LAPINE && hasArmFlag(GLOBAL.FLAG_THICK)) adjective.push("big");
			if (armType == GLOBAL.TYPE_SIREN) adjective.push("harpy-like");
			if (armType == GLOBAL.TYPE_SAURMORIAN && hasArmFlag(GLOBAL.FLAG_SCALED)) adjective.push("armored", "gilded", "plated");
			// Build
			if ((forceAdjective || rand(2) == 0) && adjective.length > 0) output += RandomInCollection(adjective);
			// Noun
			if (output != "") output += " ";
			output += armNoun();
			
			return output;
		}
		public function armsNoun():String {
			return plural(armNoun());
		}
		public function armNoun():String {
			return "arm";
		}
		public function hands(): String {
			return plural(hand());
		}
		public function hand(): String {
			var output: String = "";
			var adjective:Array = [];
			// Adjectives: 50%
			if(rand(2) == 0)
			{
				if (hasClawedHands()) adjective.push("clawed");
				if (hasPaddedHands()) adjective.push("padded");
				if (armType == GLOBAL.TYPE_FROG) adjective.push("webbed", "sticky");
				if (InCollection(armType, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_BADGER, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_PANDA) || hasArmFlag(GLOBAL.FLAG_PAWS)) adjective.push("bestial");
				if (hasArmFlag(GLOBAL.FLAG_PAWS)) adjective.push("animalistic");
				if (hasArmFlag(GLOBAL.FLAG_GOOEY)) adjective.push("slimy", "slick", "gooey");
				else if (InCollection(armType, GLOBAL.TYPE_ARACHNID, GLOBAL.TYPE_DRIDER, GLOBAL.TYPE_BEE, GLOBAL.TYPE_MOTHRINE, GLOBAL.TYPE_LEITHAN)) adjective.push("chitinous");
				if (armType == GLOBAL.TYPE_SHARK) adjective.push("webbed","slick");
				if (armType == GLOBAL.TYPE_TENTACLE) adjective.push("tentacled", "tentacle-fingered");
				if (armType == GLOBAL.TYPE_LAPINE && hasArmFlag(GLOBAL.FLAG_THICK)) adjective.push("big","rabbit-like","broad","furry");
				else if(armType == GLOBAL.TYPE_LAPINE) adjective.push("padded","delicate","furry","bunny","rabbit-like");
			}
			// Build
			if (rand(2) == 0 && adjective.length > 0) output += RandomInCollection(adjective);
			//Noun
			if (output != "") output += " ";

			var nouns:Array = ["hand"];
			if(hasArmFlag(GLOBAL.FLAG_PAWS) && armType != GLOBAL.TYPE_AVIAN) nouns.push("paw");
			output += RandomInCollection(nouns);
			return output;
		}
		public function fingers(): String {
			return plural(finger());
		}
		public function finger(): String {
			var output: String = "";
			var adjective:Array = [];
			// Adjectives: 50%
			if(rand(2) == 0)
			{
				if (hasClawedHands()) adjective.push("clawed");
				if (hasPaddedHands()) adjective.push("padded");
				if (armType == GLOBAL.TYPE_FROG) adjective.push("webbed", "sticky");
				if (InCollection(armType, GLOBAL.TYPE_EQUINE)) adjective.push("hoof-tipped");
				if (hasArmFlag(GLOBAL.FLAG_GOOEY)) adjective.push("slimy", "slick", "gooey");
				else if (InCollection(armType, GLOBAL.TYPE_ARACHNID, GLOBAL.TYPE_DRIDER, GLOBAL.TYPE_BEE, GLOBAL.TYPE_MOTHRINE, GLOBAL.TYPE_LEITHAN)) adjective.push("chitinous");
			}
			// Build
			if (adjective.length > 0 && rand(2) == 0) output += RandomInCollection(adjective);
			// Noun
			if (output != "") output += " ";
			output += "finger";
			return output;
		}
		public function hasClawedHands(): Boolean {
			if(armType == GLOBAL.TYPE_AVIAN && hasArmFlag(GLOBAL.FLAG_PAWS)) return true;
			return InCollection(armType, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_BADGER, GLOBAL.TYPE_PANDA, GLOBAL.TYPE_REDPANDA, GLOBAL.TYPE_LEITHAN, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SIREN, GLOBAL.TYPE_LUPINE, GLOBAL.TYPE_FROSTWYRM, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_SAURMORIAN, GLOBAL.TYPE_HYENA);
		}
		public function hasPaddedHands(): Boolean {
			if (hasArmFlag(GLOBAL.FLAG_PAWS)) return true;
			return InCollection(armType, GLOBAL.TYPE_KUITAN, GLOBAL.TYPE_PANDA, GLOBAL.TYPE_REDPANDA);
		}
		public function hasPaddedLegs(): Boolean {
			if (hasLegFlag(GLOBAL.FLAG_PAWS))
			{
				// reptiles... not sure 'bout them
				if(InCollection(legType, GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_RASKVEL, GLOBAL.TYPE_SHARK)) return false;
				return true;
			}
			return InCollection(legType, GLOBAL.TYPE_KUITAN, GLOBAL.TYPE_PANDA, GLOBAL.TYPE_REDPANDA, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_LUPINE);
		}
		public function lowerBody():String {
			var output: String = "";
			// Status
			if (isImmobilized()) output += "immobilized ";
			var words:Array = [];
			// Variants
			if (isGoo()) words.push("gooey base", "lower half of goo", "lower body");
			else if (isNaga())
			{
				words.push("slithery lower half", "lower body");
				if(legType == GLOBAL.TYPE_SNAKE) words.push("snake-like half");
				if(legType == GLOBAL.TYPE_SHARK) words.push("shark-like half");
			}
			else if (isTaur()) words.push("tauric half", "bestial lower half", "lower body");
			else if (isDrider()) words.push("drider half", "arachnid lower half", "lower body");
			else words.push("lower body");
			return output + words[rand(words.length)];
		}
		public function leg(forceType: Boolean = false, forceAdjective: Boolean = false, pluralAdjective: Boolean = false): String
		{
			var output: String = "";
			var adjectives:Array = [];
			//SPECIAL CASES.
			if (legType == GLOBAL.TYPE_SNAKE) return RandomInCollection(["snake tail", "snake tail", "snake tail", "snake tail", "flexible tail", "flexible tail", "coiled bottom half", "coiled bottom half", "tail", "prehensile tail"]);
			else if(legType == GLOBAL.TYPE_GOOEY && hasLegFlag(GLOBAL.FLAG_PREHENSILE)) return RandomInCollection(["goo tail", "goo tail", "gel tail", "gel tail", "flexible tail", "flexible tail", "coiled bottom half", "coiled bottom half", "tail", "prehensile tail"]);
			else if (legType == GLOBAL.TYPE_GOOEY && hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) return RandomInCollection(["mound of goo", "gelatinous mound", "gooey base", "semi-solid mass"]);
			else if (legType == GLOBAL.TYPE_TENTACLE && hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) return RandomInCollection("writhing mound of tentacles", "tentacle base", "mass of tentacles");
			//NORMAL CASES.
			else
			{
				//Type 1/4 of the time.
				if (rand(4) == 0 || forceType)
				{
					switch (legType)
					{
						case GLOBAL.TYPE_EQUINE: adjectives = ["equine", "equine", "horse-like"]; break;
						case GLOBAL.TYPE_BOVINE: adjectives = ["bovine", "bovine", "cow-like"]; break;
						case GLOBAL.TYPE_CANINE: adjectives = ["canine", "canine", "dog-like"]; break;
						case GLOBAL.TYPE_KORGONNE: adjectives = ["canine", "canine", "dog-like"]; break;
						case GLOBAL.TYPE_FELINE: adjectives = ["feline", "feline", "cat-like", "graceful"]; break;
						case GLOBAL.TYPE_VULPINE: adjectives = ["vulpine", "vulpine", "fox-like", "foxy"]; break;
						case GLOBAL.TYPE_LUPINE: adjectives = ["lupine", "lupine", "wolf-like"]; break;
						case GLOBAL.TYPE_BEE: adjectives = ["chitinous", "armored", "insect-like", "carapace-covered"]; break;
						case GLOBAL.TYPE_ARACHNID: adjectives = ["chitinous", "armored", "insect-like", "carapace-covered"]; break;
						case GLOBAL.TYPE_DRIDER: adjectives = ["chitinous", "armored", "insect-like", "carapace-covered", "pointed"]; break;
						case GLOBAL.TYPE_LAPINE: adjectives = ["lapine", "lapine", "rabbit-like", "bunny"]; break;
						case GLOBAL.TYPE_AVIAN: adjectives = ["avian", "avian", "bird-like", "raptor"]; break;
						case GLOBAL.TYPE_FROSTWYRM:
						case GLOBAL.TYPE_DRACONIC: adjectives = ["draconic", "draconic", "dragon-like", "reptilian"]; break;
						case GLOBAL.TYPE_GRYVAIN: adjectives = ["draconic", "dragon-like", "dragon-like"]; break;
						case GLOBAL.TYPE_LIZAN:
							if(legCount < 6) adjectives = ["lizan", "lizan", "reptile-like", "reptilian"]; 
							else adjectives = ["leithan", "leithan", "reptile-like", "reptilian"];
							break;
						case GLOBAL.TYPE_DEMONIC: adjectives = ["demonic", "demon-like", "demon-like"]; break;
						case GLOBAL.TYPE_SUCCUBUS: adjectives = ["sensual", "alluring", "seductive", "sexy"]; break;
						case GLOBAL.TYPE_GOOEY: adjectives = ["gooey", "semi-solid", "gelatinous", "jiggly"]; break;
						case GLOBAL.TYPE_KANGAROO: adjectives = ["kangaroo-like", "kangaroo-like", "powerful", "‘roo"]; break;
						case GLOBAL.TYPE_TANUKI: adjectives = ["tanuki-like", "tanuki-like", "dexterous", "nimble"]; break;
						case GLOBAL.TYPE_DEER: adjectives = ["deer-like", "deer-like", "hooved", "nimble", "lithe", "agile"]; break;
						case GLOBAL.TYPE_PANDA: adjectives = ["panda", "panda", "bear-like", "thick"]; break;
						case GLOBAL.TYPE_REDPANDA: adjectives = ["panda", "panda", "lesser panda-like", "cute"]; break;
						case GLOBAL.TYPE_MLP: adjectives = ["pony", "pony-like", "cartoony", "cute"]; break;
						case GLOBAL.TYPE_RASKVEL: adjectives = ["reptilian"]; break;
						case GLOBAL.TYPE_OVIR: adjectives = ["human-like"]; break;
						case GLOBAL.TYPE_MYR: adjectives = ["chitinous", "armored", scaleColor + "-armored", "chitinous"]; break;
						case GLOBAL.TYPE_FROG: adjectives = ["frog", "amphibious", "frog-like", "powerful"]; break;
						case GLOBAL.TYPE_NYREA: adjectives = ["chitinous", "armored", "insect-like", "carapace-covered"]; break;
						case GLOBAL.TYPE_SIREN:
						case GLOBAL.TYPE_SHARK: adjectives = ["finned", "shark-like", "aquatic"]; break;
						case GLOBAL.TYPE_SWINE: adjectives = ["swine", "swine", "pig-like"]; break;
						case GLOBAL.TYPE_JANERIA:
						case GLOBAL.TYPE_TENTACLE: adjectives = ["tentacle-toed", "tentacled", "tentacle imitation", "tentacle formed"]; break;
						case GLOBAL.TYPE_SHEEP: adjectives = ["sheep", "sheep", "sheep-like", "lamb-like"]; break;
						case GLOBAL.TYPE_GOAT: adjectives = ["goat", "goat", "caprine", "goat-like"]; break;
						case GLOBAL.TYPE_SIMII: adjectives = ["simii", "simian", "simiiforme", "monkey-like"]; break;
						case GLOBAL.TYPE_MOTHRINE: adjectives = ["slender", "svelte", "graceful", "insect-like", "carapace-covered"]; break;
						case GLOBAL.TYPE_MOUSE: adjectives = ["mouse-like", "agile", "mousey", "limber"]; break;
						case GLOBAL.TYPE_XHELARFOG: adjectives = ["mostly humanoid"]; break;
						case GLOBAL.TYPE_SAURMORIAN: adjectives = ["armored", "gilded", "plated", "reptile-like", "reptilian"]; break;
						case GLOBAL.TYPE_HYENA: adjectives = ["hyena", "hyena-like", "hyaenidae", "thin"]; break;
						case GLOBAL.TYPE_DZAAN: adjectives = ["dzaan", "hyper-feminine", "sensual", "seductive", "sexy"]; break;
					}
				}
				//ADJECTIVE!
				else if (rand(3) == 0 || forceAdjective)
				{
					if (pluralAdjective && legCount > 2 && rand(2) == 0) { adjectives.push("numerous"); }
					//Coulda sworn there was a reason I didn't include these originally, but it's slipping away from me now.
					if (hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) adjectives.push("amorphous", "fluid", "ever-changing");
					if (hasLegFlag(GLOBAL.FLAG_SCALED)) adjectives.push("scaled", "scaly");
					if (hasLegFlag(GLOBAL.FLAG_FURRED)) adjectives.push("furry", "fuzzy", "fur-covered");
					if (hasLegFlag(GLOBAL.FLAG_TENDRIL)) adjectives.push("wiggling", "wriggling", "tendril-like");
					if (hasLegFlag(GLOBAL.FLAG_PREHENSILE)) adjectives.push("prehensile");
					if (hasLegFlag(GLOBAL.FLAG_SMOOTH)) adjectives.push("smooth");
					if (hasLegFlag(GLOBAL.FLAG_CHITINOUS)) adjectives.push("chitinous", "armored", "carapace-covered");
					if (hasLegFlag(GLOBAL.FLAG_FEATHERED)) adjectives.push("feathered", "feathery");
					if (hasLegFlag(GLOBAL.FLAG_GOOEY) && legType != GLOBAL.TYPE_GOOEY) adjectives.push("slimy", "slick", "gooey");
					if (hasLegFlag(GLOBAL.FLAG_STICKY)) adjectives.push("sticky");
					if (hasLegFlag(GLOBAL.FLAG_LUBRICATED)) adjectives.push("moist", "slippery", "slick");
				}
				//Random goes here!
				if (adjectives.length > 0) output += RandomInCollection(adjectives) + " ";
				//NOUN IT UP BITCHES!
				output += legNoun();
			}
			return output;
		}
		
		public function legNoun():String
		{
			if (legType == GLOBAL.TYPE_SNAKE || (legType == GLOBAL.TYPE_GOOEY && hasLegFlag(GLOBAL.FLAG_PREHENSILE))) return "coil";
			if ((legType == GLOBAL.TYPE_GOOEY || legType == GLOBAL.TYPE_TENTACLE) && hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) return "mound";
			if (legCount == 1 && legType == GLOBAL.TYPE_SHARK) return "lower body";
			return "leg";
		}
		public function legsNoun():String
		{
			return plural(legNoun());
		}
		public function footAdjectives(forceType: Boolean = false, forceAdjective: Boolean = false):String
		{
			var output: String = "";
			var adjectives:Array = [];
			//Type! 1/5 times
			if (rand(5) == 0 || forceType)
			{
				if(output != "") output += ", ";
				switch(legType)
				{
					case GLOBAL.TYPE_EQUINE: adjectives = ["equine", "horse-like", "bestial"]; break;
					case GLOBAL.TYPE_BOVINE: adjectives = ["bovine", "cow-like", "bestial"]; break;
					case GLOBAL.TYPE_CANINE: 
					case GLOBAL.TYPE_KORGONNE: adjectives = ["canine", "dog-like"]; break;
					case GLOBAL.TYPE_FELINE: adjectives = ["feline", "cat-like"]; break;
					case GLOBAL.TYPE_VULPINE: adjectives = ["vulpine", "fox-like", "foxy"]; break;
					case GLOBAL.TYPE_LUPINE: adjectives = ["lupine", "wolf-like"]; break;
					case GLOBAL.TYPE_BEE: adjectives = ["chitinous", "armored", "insect-like", "carapace-covered"]; break;
					case GLOBAL.TYPE_ARACHNID: adjectives = ["chitinous", "armored", "insect-like", "carapace-covered"]; break;
					case GLOBAL.TYPE_DRIDER: adjectives = ["chitinous", "armored", "insect-like", "carapace-covered", "pointed"]; break;
					case GLOBAL.TYPE_LAPINE: adjectives = ["lapine", "rabbit-like", "bunny"]; break;
					case GLOBAL.TYPE_AVIAN: adjectives = ["avian", "bird-like", "taloned"]; break;
					case GLOBAL.TYPE_FROSTWYRM:
					case GLOBAL.TYPE_DRACONIC: adjectives = ["draconic", "clawed", "reptilian"]; break;
					case GLOBAL.TYPE_GRYVAIN: adjectives = ["draconic", "clawed"]; break;
					case GLOBAL.TYPE_LIZAN: 
						if(legCount < 6) adjectives = ["lizan", "clawed", "reptilian"];
						else adjectives = ["leithan", "clawed", "reptilian"];
						break;
					case GLOBAL.TYPE_DEMONIC: adjectives = ["corrupted-looking", "demonic", "clawed"]; break;
					case GLOBAL.TYPE_SUCCUBUS: adjectives = ["spike-supported", "sexy"]; break;
					case GLOBAL.TYPE_GOOEY: adjectives = ["gooey", "semi-solid", "gelatinous", "jiggly"]; break;
					case GLOBAL.TYPE_KANGAROO: adjectives = ["kangaroo-like", "powerful", "‘roo"]; break;
					case GLOBAL.TYPE_TANUKI: adjectives = ["tanuki-like", "dexterous", "nimble"]; break;
					case GLOBAL.TYPE_DEER: adjectives = ["deer-like", "nimble"]; break;
					case GLOBAL.TYPE_PANDA: adjectives = ["panda", "panda", "bear-like", "thick"]; break;
					case GLOBAL.TYPE_PANDA: adjectives = ["panda", "panda", "lesser panda-like", "cute"]; break;
					case GLOBAL.TYPE_MLP: adjectives = ["pony", "pony-like", "cartoony", "cute"]; break;
					case GLOBAL.TYPE_RASKVEL: adjectives = ["reptilian", "clawed"]; break;
					case GLOBAL.TYPE_OVIR: adjectives = ["human-like"]; break;
					case GLOBAL.TYPE_MYR: adjectives = ["chitinous", "armored", scaleColor + "-chitin"]; break;
					case GLOBAL.TYPE_NYREA: adjectives = ["chitinous", "armored", "insect-like", "carapace-covered"]; break;
					case GLOBAL.TYPE_SIREN:
					case GLOBAL.TYPE_SHARK: adjectives = ["shark-like","clawed","webbed"]; break;
					case GLOBAL.TYPE_SHEEP: adjectives = ["sheep", "sheep-like", "lamb-like", "bestial"]; break;
					case GLOBAL.TYPE_GOAT: adjectives = ["goat", "goat-like", "caprine", "bestial"]; break;
					case GLOBAL.TYPE_SIMII: adjectives = ["simian", "ape-like", "dexterous"]; break;
					case GLOBAL.TYPE_MOTHRINE: adjectives = ["chitinous", "armored", "insect-like", "carapace-covered"]; break;
					case GLOBAL.TYPE_XHELARFOG: adjectives = ["anisodactyl", "four toed", "alien"]; break;
					case GLOBAL.TYPE_DZAAN: adjectives = ["tiptoed", "stripper-heeled", "sexy"]; break;
				}
			}
			//ADJECTIVE!
			if (rand(3) == 0 || forceAdjective)
			{
				if (hasLegFlag(GLOBAL.FLAG_SCALED)) adjectives.push("scaled", "scaly");
				else if (hasLegFlag(GLOBAL.FLAG_FURRED)) adjectives.push("furry", "fuzzy", "fur-covered");
				else if (hasLegFlag(GLOBAL.FLAG_TENDRIL)) adjectives.push("wiggling");
				else if (hasLegFlag(GLOBAL.FLAG_CHITINOUS)) adjectives.push("chitinous", "armored", "carapace-covered");
			}
			//Random goes here!
			if (adjectives.length > 0) output += RandomInCollection(adjectives);
			return output;
		}
		public function height():String
		{
			var buffer:String = "";
			buffer += Math.floor(tallness / 12) + " feet";
			if(tallness % 12 != 0) buffer += " and " + tallness % 12 + " inches";
			return buffer;
		}
		
		public function shortHeight():String
		{
			var retStr:String = "";
			retStr += Math.floor(tallness / 12) + "\'";
			if (tallness % 12 > 0) retStr += " " + tallness % 12 + "\"";
			return retStr;
		}
		
		public function feet(forceType: Boolean = false, forceAdjective: Boolean = false): String {
			// Plural check:
			if(legCount == 1) return foot(forceType,forceAdjective);
			
			// Default:
			var output: String = "";
			output = footAdjectives(forceType, forceAdjective);
		
			//Noun
			if (output != "") output += " ";
			if (isNaga())
			{
				if (tallness >= 84) output += "underbelly";
				else if (tallness >= 48) output += "tails";
				else output += "tail-tips";
			}
			else if (hasLegFlag(GLOBAL.FLAG_HOOVES)) output += "hooves";
			else if (hasLegFlag(GLOBAL.FLAG_PAWS) && legType != GLOBAL.TYPE_AVIAN && rand(10) < 8) output += "paws";
			else if (hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && legType == GLOBAL.TYPE_GOOEY) output += "cilia";
			else if (hasLegFlag(GLOBAL.FLAG_HEELS) && rand(2) == 0) output += "high-heels";
			else if (legType == GLOBAL.TYPE_LIZAN) output += "footclaws";
			else if (legType == GLOBAL.TYPE_FROG && rand(2) == 0) output += "webbed feet";
			else if (InCollection(legType, [GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SIREN]) && rand(2) == 0) output += RandomInCollection(["footclaws", "webbed feet"]);
			else if (legType == GLOBAL.TYPE_TENTACLE && rand(2) == 0) output += "tentacle feet";
			else output += "feet";
			return output;
		}
		public function foot(forceType: Boolean = false, forceAdjective: Boolean = false): String {
			var output: String = "";
			output = footAdjectives(forceType, forceAdjective);
			//Noun
			if (output != "") output += " ";
			if (isNaga())
			{
				if (tallness >= 84) output += "underbelly";
				else if (tallness >= 48) output += "tail";
				else output += "tail-tip";
			}
			else if (hasLegFlag(GLOBAL.FLAG_HOOVES)) output += "hoof";
			else if (hasLegFlag(GLOBAL.FLAG_PAWS) && legType != GLOBAL.TYPE_AVIAN && rand(10) < 8) output += "paw";
			else if (hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && legType == GLOBAL.TYPE_GOOEY) output += "undercarriage";
			else if (hasLegFlag(GLOBAL.FLAG_HEELS) && rand(2) == 0) output += "high-heel";
			else if (legType == GLOBAL.TYPE_LIZAN) output += "footclaw";
			else if (legType == GLOBAL.TYPE_FROG && rand(2) == 0) output += "webbed foot";
			else if (InCollection(legType, [GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SIREN]) && rand(2) == 0) output += RandomInCollection(["footclaw","webbed foot"]);
			else if (legType == GLOBAL.TYPE_TENTACLE && hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) output += "writhing lower body";
			else if (legType == GLOBAL.TYPE_TENTACLE && rand(2) == 0) output += "tentacle foot";
			else output += "foot";
			return output;
		}
		public function toe(): String {
			var output: String = "";
			//Noun
			if (isNaga()) output += "tail-tip";
			else if (hasLegFlag(GLOBAL.FLAG_HOOVES)) output += "hoof-tip";
			else if (hasLegFlag(GLOBAL.FLAG_PAWS) && legType != GLOBAL.TYPE_AVIAN && rand(2) == 0) output += "paw-toe";
			else if (hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && legType == GLOBAL.TYPE_GOOEY) output += "cilia";
			else if (hasLegFlag(GLOBAL.FLAG_HEELS) && rand(2) == 0) output += "pointed toe";
			else if (legType == GLOBAL.TYPE_LIZAN) output += "claw";
			else if (legType == GLOBAL.TYPE_FROG && rand(2) == 0) output += "webbed toe";
			else if (InCollection(legType, [GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SIREN]) && rand(2) == 0) output += RandomInCollection(["claw","webbed toe"]);
			else output += "toe";
			return output;
		}
		public function toes(): String {
			var output: String = "";
			//Noun
			if (hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && legType == GLOBAL.TYPE_GOOEY) output += "cilia";
			else output += plural(toe());
			return output;
		}
		public function hasKnees():Boolean
		{
			return (hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) || hasLegFlag(GLOBAL.FLAG_PLANTIGRADE));
		}
		public function hasFeet():Boolean
		{
			return (hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) || hasLegFlag(GLOBAL.FLAG_PLANTIGRADE));
		}
		public function hasToes():Boolean
		{
			if(isNaga() || hasLegFlag(GLOBAL.FLAG_AMORPHOUS) || hasLegFlag(GLOBAL.FLAG_HOOVES)) return false;
			return true;
		}
		public function hasHooves():Boolean
		{
			if (hasLegFlag(GLOBAL.FLAG_HOOVES)) return true;
			return false;
		}
		public function hasToeClaws():Boolean
		{
			if(hasToes() && InCollection(legType, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_RASKVEL, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_PANDA, GLOBAL.TYPE_REDPANDA, GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_KORGONNE, GLOBAL.TYPE_FROSTWYRM, GLOBAL.TYPE_SAURMORIAN, GLOBAL.TYPE_HYENA)) return true;
			return false;
		}
		public function kneesDescript(): String 
		{
			if (hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && legType == GLOBAL.TYPE_GOOEY) return "cilia";
			else if (legCount == 1) return kneeDescript();
			return plural(kneeDescript());
		}
		public function kneeDescript(): String {
			var output: String = "";
			//Noun
			if (hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && legType == GLOBAL.TYPE_GOOEY) output += "cilium";
			else if (isNaga()) output += "trunk";
			else output += "knee";
			return output;
		}
		// Placeholder shit, sue me. Calling the ill excuse etc.
		public function bellyDescript(bForceSize:Boolean = false): String {
			var sBuilder:String = "";

			var belly:Number = bellyRating();
			//Wide fat PCs got da belly
			var toneMod:Number = thickness - tone;
			//Prevent negatives for the uberfit:
			if(toneMod < 0) toneMod = 0;
			//Worst = 100. Scale down by factor of 5
			toneMod /= 5;
			//Add to our working belly amount for funtimes:
			belly += toneMod;

			var sizeDescripts:Array = new Array();
			var pregDescripts:Array = new Array();

			//engorged, swollen, stuffed
			//cumflated only: cum-bloated (could even be wildcarded for honeycum or other things, depending on your tracking), cum-inflated, sloshing,
			if(isPregnant())
			{
				if(belly < 10) {}
				else if(belly < 20)
				{
					pregDescripts[pregDescripts.length] = "fruitful";
					pregDescripts[pregDescripts.length] = "fecund";
				}
				else
				{
					pregDescripts[pregDescripts.length] = "expectant";
					pregDescripts[pregDescripts.length] = "pregnant";
				}
				if(belly >= 50)
				{
					pregDescripts[pregDescripts.length] = "gravid";
				}
			}
			if (belly <= 5)
			{
				if(tone >= 75)
				{
					sizeDescripts[sizeDescripts.length] = "ripped";
					sizeDescripts[sizeDescripts.length] = "chiseled";
					sizeDescripts[sizeDescripts.length] = "rock-hard";
					sizeDescripts[sizeDescripts.length] = "washboard";
					sizeDescripts[sizeDescripts.length] = "ab-lined";
					sizeDescripts[sizeDescripts.length] = "well-toned";
				}
				if(tone >= 50)
				{
					sizeDescripts[sizeDescripts.length] = "toned";
					sizeDescripts[sizeDescripts.length] = "sculpted";
				}
				else if(tone >= 30)
				{
					sizeDescripts[sizeDescripts.length] = "lightly-toned";
					sizeDescripts[sizeDescripts.length] = "tight";
				}
				if(tone < 50)
				{
					sizeDescripts[sizeDescripts.length] = "flat";
					sizeDescripts[sizeDescripts.length] = "slim";
				}
			}
			else if (belly <= 10)
			{
				sizeDescripts[sizeDescripts.length] = "soft";
				sizeDescripts[sizeDescripts.length] = "cushy";
			}
			else if (belly <= 15)
			{
				sizeDescripts[sizeDescripts.length] = "paunched";
				sizeDescripts[sizeDescripts.length] = "pudgy";
			}
			else if (belly <= 20)
			{
				sizeDescripts[sizeDescripts.length] = "large";
				sizeDescripts[sizeDescripts.length] = "hefty";
			}
			else if (belly <= 30)
			{
				sizeDescripts[sizeDescripts.length] = "considerable";
				sizeDescripts[sizeDescripts.length] = "generous";
				if(!isPregnant()) sizeDescripts[sizeDescripts.length] = "pregnant-looking";
			}
			else if (belly <= 40)
			{
				sizeDescripts[sizeDescripts.length] = "full";
				sizeDescripts[sizeDescripts.length] = "round";
				sizeDescripts[sizeDescripts.length] = "bulky";
				
			}
			else if (belly <= 50)
			{
				sizeDescripts[sizeDescripts.length] = "spacious";
				sizeDescripts[sizeDescripts.length] = "extensive";
				sizeDescripts[sizeDescripts.length] = "expansive";
			}
			else if (belly <= 60)
			{
				sizeDescripts[sizeDescripts.length] = "inflated";
				sizeDescripts[sizeDescripts.length] = "excessive";
				sizeDescripts[sizeDescripts.length] = "whopping";
				
			}
			else if (belly <= 70)
			{
				sizeDescripts[sizeDescripts.length] = "distended";
				sizeDescripts[sizeDescripts.length] = "immense";
				sizeDescripts[sizeDescripts.length] = "bloated";
			}
			else if (belly <= 80)
			{
				sizeDescripts[sizeDescripts.length] = "over-inflated";
				sizeDescripts[sizeDescripts.length] = "jumbo-sized";
			}
			else if (belly <= 90)
			{
				sizeDescripts[sizeDescripts.length] = "very distended";
				sizeDescripts[sizeDescripts.length] = "monumental";
				sizeDescripts[sizeDescripts.length] = "massive";
			}
			else
			{
				sizeDescripts[sizeDescripts.length] = "ginormous";
				sizeDescripts[sizeDescripts.length] = "over-inflated";
				sizeDescripts[sizeDescripts.length] = "blimp-like";
			}
			//Bonus pregsizes
			if(isPregnant() && belly > 50)
			{
				sizeDescripts[sizeDescripts.length] = "stuffed";
				sizeDescripts[sizeDescripts.length] = "swollen";
			}
			//Size: 50%
			if(rand(2) == 0 || bForceSize)
			{
				if(sizeDescripts.length > 0) sBuilder += sizeDescripts[rand(sizeDescripts.length)];
				//Pregnant stuff & Size: 50% or 25% overall odds.
				if(isPregnant() && pregDescripts.length > 0 && rand(2) == 0)
				{
					sBuilder += ", ";
					sBuilder += pregDescripts[rand(pregDescripts.length)] + " ";
				}
				else sBuilder += " ";
			}
			//Pregnant Stuff - 25% chance (note there's a 25% chance of occurring with belly size for 50% total)
			else if(isPregnant() && pregDescripts.length > 0 && (rand(2) == 0 || bForceSize))
			{
				sBuilder += pregDescripts[rand(pregDescripts.length)] + " ";
			}
			// Cumflation adjectives for non-flat bellies - 50%
			else if(!bForceSize && !isPregnant() && belly >= 10 && rand(2) == 0)
			{
				var cumFluid:Number = cumFlationAmount();
				// At least 500 mLs
				if(cumFluid >= 500)
				{
					var cumDescripts:Array = ["cum-filled", "cum-bloated", "cum-inflated", "cum-packed", "jizz-jammed", "semen-stuffed"];
					if(cumDescripts.length > 0) sBuilder += cumDescripts[rand(cumDescripts.length)] + " ";
				}
			}
			
			//Noun selection:
			if(belly < 10 && tone >= 40 && rand(5) == 0) sBuilder += "six pack";
			else if(belly < 10 && rand(4) == 0) sBuilder += "midriff";
			else if(belly < 20 && rand(3) == 0) sBuilder += "middle";
			else sBuilder += "belly";
			
			return sBuilder;
		}

		//Create a perk
		public function createPerk(keyName: String, value1: Number = 0, value2: Number = 0, value3: Number = 0, value4: Number = 0, desc: String = ""): void 
		{
			if (hasPerk(keyName)) {
				trace("Perk '" + keyName + "' already present on " + short);
				return;
			}
			
			var newPerk:StorageClass = new StorageClass();
			newPerk.storageName = keyName;
			newPerk.value1 = value1;
			newPerk.value2 = value2;
			newPerk.value3 = value3;
			newPerk.value4 = value4;
			newPerk.tooltip = desc;
			
			perks.push(newPerk);
		}
		public function sortPerks(): void 
		{
			if(perks.length <= 0) return;
			
			for(var i:int = 0; i < perks.length; i++)
			{
				if(perks[i].tooltip == "< REMOVE >") { perks.splice(i, 1); i--; }
			}
			
			perks.sortOn("storageName", Array.CASEINSENSITIVE);
		}
		//Create a status
		public function createStatusEffect(statusName: String, value1: Number = 0, value2: Number = 0, value3: Number = 0, value4: Number = 0, hidden: Boolean = true, iconName: String = "", tooltip: String = "", combatOnly: Boolean = false, minutesLeft: Number = 0, iconShade:uint = 0xFFFFFF): void {
			
			if (hasStatusEffect(statusName)) {
				trace("Status '" + statusName + "' already present on " + short);
				return;
			}

			var newStatusEffect:StorageClass = new StorageClass();
			newStatusEffect.storageName = statusName;
			newStatusEffect.value1 = value1;
			newStatusEffect.value2 = value2;
			newStatusEffect.value3 = value3;
			newStatusEffect.value4 = value4;
			newStatusEffect.hidden = hidden;
			newStatusEffect.iconName = iconName;
			newStatusEffect.tooltip = tooltip;
			newStatusEffect.combatOnly = combatOnly;
			newStatusEffect.minutesLeft = minutesLeft;
			newStatusEffect.iconShade = iconShade;
			
			statusEffects.push(newStatusEffect);

			trace("New status applied to " + short + ": " + statusName);
		}
		public function sortStatusEffects(): void 
		{
			if(statusEffects.length <= 0) return;
			
			for(var i:int = 0; i < statusEffects.length; i++)
			{
				if(statusEffects[i].tooltip == "< REMOVE >") { statusEffects.splice(i, 1); i--; }
			}
			
			statusEffects.sortOn("storageName", Array.CASEINSENSITIVE);
		}
		//Create a keyItem
		public function createKeyItem(keyName: String, value1:Number = 0, value2:Number = 0, value3:Number = 0, value4:Number = 0, description: String = ""): void {
			var newKeyItem:StorageClass = new StorageClass();
			newKeyItem.storageName = keyName;
			newKeyItem.value1 = value1;
			newKeyItem.value2 = value2;
			newKeyItem.value3 = value3;
			newKeyItem.value4 = value4;
			newKeyItem.tooltip = description;
			
			keyItems.push(newKeyItem);
			
			trace("New key item applied to " + short + ": " + keyName);
		}
		public function sortKeyItems(): void 
		{
			if(keyItems.length <= 0) return;
			
			for(var i:int = 0; i < keyItems.length; i++)
			{
				if(keyItems[i].tooltip == "< REMOVE >") { keyItems.splice(i, 1); i--; }
			}
			
			keyItems.sortOn("storageName", Array.CASEINSENSITIVE);
		}
		//REMOVING THINGS!
		//status
		public function removeStatusEffect(statusName: String, forQueue: Boolean = false): Boolean {
			return removeStorageSlot(statusEffects, statusName, forQueue);
		}
		//statuses
		public function removeStatuses(): void {
			removeStorage(statusEffects);
		}
		public function clearCombatStatuses(): void {
			if(this is ShittyShip)
			{
				(this as ShittyShip).resetEquipment();
				if(this.hasPerk("PCs"))
				{
					this.shields(this.shieldsMax());
					if(this.HP() < 1) this.HPRaw = 1;
					this.energy(this.energyMax());
				}
			}
			//trace("Removing combat statuses.");
			for (var x: int = statusEffects.length-1; x >= 0; x--) {
				if (statusEffects[x].combatOnly)
				{
					switch(statusEffects[x].storageName)
					{
						case "Sensor Link":
							aimMod -= 5;
							break;
						case "Gassed":
							aimMod += 5;
							reflexesMod += 5;
							break;
						case "Reduced Goo":
							armor.defense += statusEffects[x].value1;
							break;
						case "IQ B-Gone":
							intelligenceMod += statusEffects[x].value1;
							break;
						case "Brainmelt Lamps":
							willpowerMod += statusEffects[x].value1;
							break;
						case "Mindwashed":
							aimMod += statusEffects[x].value1;
							break;
						case "Latex Sprayed":
							reflexesMod += statusEffects[x].value1;
							break;
						case "Bimboleum":
							physiqueMod += statusEffects[x].value1;
							break;
						case "Psychic Miasma":
							aimMod += 5;
							reflexesMod += 5;
							break;
						case "Toxic Trickery":
							physiqueMod += 4;
							aimMod += 4;
							break;
						case "Injected":
							if (statusEffects[x].value3 == 0) {
								physiqueMod += 5;
								reflexesMod += 5;
							}
							else if (statusEffects[x].value3 == 1) {
								intelligenceMod += 5;
								willpowerMod += 5;
							}
							break;
						case "Coolant Soaked":
							reflexesMod += 10;
							break;
						case "Density Shift":
							reflexesMod += 10;
							aimMod += 10;
							break;
					}
					//trace("Removed: " + statusEffects[x].storageName + " at position " + x + ".");
					statusEffects.splice(x,1);
				}
				//else trace("Not a combat status: " + statusEffects[x].storageName + " at position " + x + ".");
			}
			
			droneTarget = null;
			concentratedFireTarget = null;
		}
		//perk
		public function removePerk(perkName: String): Boolean {
			return removeStorageSlot(perks, perkName);
		}
		//perks
		public function removePerks(): void {
			removeStorage(perks);
		}
		//key item
		public function removeKeyItem(itemName: String): Boolean {
			return removeStorageSlot(keyItems, itemName);
		}
		//key items
		public function removeKeyItems(): void {
			removeStorage(keyItems);
		}
		//remove all of a stored array
		public function removeStorage(array:Array): void {
			var counter: Number = array.length;
			while (counter > 0) {
				counter--;
				array.splice(counter, 1);
			}
		}
		//General function used by all
		public function removeStorageSlot(array:Array, storageName:String, forQueue:Boolean = false): Boolean {
			trace("Removing storage slot", storageName);
			//Various Errors preventing action
			if (array.length <= 0) {
				trace("Attempted to remove storage slot " + storageName + " on " + short + " but chosen array has no members.");
				return false;
			}
			var counter: Number = array.length;
			while (counter > 0) {
				counter--;
				if (array[counter].storageName == storageName) {
					if(forQueue)
					{
						array[counter].hidden = true;
						array[counter].tooltip = "< REMOVE >";
						trace("Queued \"" + storageName + "\" for removal on " + short + ".");
					}
					else
					{
						array.splice(counter, 1);
						trace("Removed \"" + storageName + "\" from a storage array on " + short + ".");
					}
					//counter = 0;
					return true;
				}
			}
			return false;
		}
		public function clearPaintedPenisEffect():void
		{
			libidoMod -= statusEffectv4("Painted Penis");
			removeStatusEffect("Painted Penis");
		}
		public function clearPaintedTitsEffect():void
		{
			libidoMod -= statusEffectv4("Painted Tits");
			removeStatusEffect("Painted Tits");
		}
		//CHECKING IF HAS A SPECIFIC STORAGE ITEM
		//Status
		public function hasStatusEffect(statusName: String, ignoreHidden:Boolean = false): Boolean {
			return hasStorageName(statusEffects, statusName, ignoreHidden);
		}
		public function hasStatusEffectCount(statusName:String):Number
		{
			var counter: Number = statusEffects.length;
			var amount:int = 0;
			if (statusEffects.length <= 0) return 0;
			while (counter > 0) {
				counter--;
				if (statusEffects[counter].storageName == statusName) amount++;
			}
			return amount;
		}
		//Perk
		public function hasPerk(perkName: String, ignoreHidden:Boolean = false): Boolean {
			return hasStorageName(perks, perkName, ignoreHidden);
		}
		public function hasKeyItem(keyName: String, ignoreHidden:Boolean = false): Boolean {
			return hasStorageName(keyItems, keyName, ignoreHidden);
		}
		public function getKeyItem(keyName:String):StorageClass
		{
			for (var i:int = 0; i < keyItems.length; i++)
			{
				if (keyItems[i].storageName == keyName) return keyItems[i];
			}
			
			return null;
		}
		//General function.
		public function hasStorageName(array:Array, storageName: String, ignoreHidden:Boolean = false): Boolean {
			var counter: Number = array.length;
			if (array.length <= 0) return false;
			while (counter > 0) {
				counter--;
				if (array[counter].storageName == storageName && (!ignoreHidden || array[counter].tooltip != "< REMOVE >")) return true;
			}
			return false;
		}

		//MODIFYING STORAGE VARIABLES WITH SET OR ADD.
		public function setStatusValue(storageName: String, storageValueNum: int, newValue:*):void {
			setStorageValue(statusEffects, storageName, storageValueNum, newValue);
		}
		public function getStatusMinutes(storageName: String):Number
		{
			var counter: Number = statusEffects.length;
			//Various Errors preventing action
			if (statusEffects.length <= 0) return -1;
			while (counter > 0) {
				counter--;
				//Find it, report it.
				if (statusEffects[counter].storageName == storageName) {
					return statusEffects[counter].minutesLeft;
				}
			}
			return -1;
		}
		public function hasCombatStatusEffect(storageName: String):Boolean {
			var array:Array = statusEffects;
			var counter: Number = array.length;
			if (array.length <= 0) return false;
			while (counter > 0) {
				counter--;
				if (array[counter].storageName == storageName && array[counter].combatOnly) return true;
			}
			return false;
		}
		public function setStatusMinutes(storageName: String, newMinutes:int):void
		{
			var counter: Number = statusEffects.length;
			//Various Errors preventing action
			if (statusEffects.length <= 0) return;
			while (counter > 0) {
				counter--;
				//Find it, change it, quit out
				if (statusEffects[counter].storageName == storageName) {
					if (newMinutes < 0) {
						trace("ERROR: Change storage value with invalid value for given slot or invalid slot.");
						return;
					}
					statusEffects[counter].minutesLeft = newMinutes;
					return;
				}
			}
			trace("ERROR: Looking for status '" + storageName + "' to change minutes, and " + short + " does not have the status affect.");
			return;
		}
		public function setStatusTooltip(storageName: String, newTooltip:String):void
		{
			var counter: Number = statusEffects.length;
			//Various Errors preventing action
			if (statusEffects.length <= 0) return;
			while (counter > 0) {
				counter--;
				//Find it, change it, quit out
				if (statusEffects[counter].storageName == storageName) {
					statusEffects[counter].tooltip = newTooltip;
					return;
				}
			}
			trace("ERROR: Looking for status '" + storageName + "' to change tooltip but couldn’t find it.");
			return;
		}
		public function getStatusTooltip(storageName: String):String
		{
			if (statusEffects.length <= 0) return "";
			for(var i:int = 0; i < statusEffects.length; i++)
			{
				if (statusEffects[i].storageName == storageName)
				{
					return statusEffects[i].tooltip;
				}
			}
			trace("ERROR: Unable to find '" + storageName + "' to update icon shade.");
			return "<b>ERROR: Unable to find '" + storageName + "' to display its tooltip.</b>";
		}
		
		public function setStatusIconShade(storageName:String, iconShade:uint):void
		{
			for (var i:int = 0; i < statusEffects.length; i++)
			{
				if (statusEffects[i].storageName == storageName)
				{
					statusEffects[i].iconShade = iconShade;
					return;
				}
			}
			trace("ERROR: Unable to find '" + storageName +"' to update icon shade.");
		}
		
		public function addStatusMinutes(storageName: String, newMinutes:int):void
		{
			var counter: Number = statusEffects.length;
			//Various Errors preventing action
			if (statusEffects.length <= 0) return;
			while (counter > 0) {
				counter--;
				//Find it, change it, quit out
				if (statusEffects[counter].storageName == storageName) 
				{
					statusEffects[counter].minutesLeft += newMinutes;
					if (statusEffects[counter].minutesLeft < 0) {
						statusEffects[counter].minutesLeft = 0;
					}
					return;
				}
			}
			trace("ERROR: Looking for status '" + storageName + "' to add minutes, and " + short + " does not have the status affect.");
			return;
		}
		public function setKeyItemValue(storageName:String, storageValueNum:int, newValue:*):void {
			setStorageValue(keyItems, storageName, storageValueNum, newValue);
		}
		public function setPerkValue(perkName: String, perkValueNum: Number = 1, newNum: Number = 0):void {
			setStorageValue(perks, perkName, perkValueNum, newNum);
		}
		public function setPerkTooltip(perkName: String, perkTooltip: String):void
		{
			var counter: Number = perks.length;
			//Various Errors preventing action
			if (perks.length <= 0) return;
			while (counter > 0) {
				counter--;
				//Find it, change it, quit out
				if (perks[counter].storageName == perkName) {
					perks[counter].tooltip = perkTooltip;
					return;
				}
			}
			trace("ERROR: Looking for status '" + perkName + "' to change value " + perkTooltip + ", and " + short + " does not have the status affect.");
			return;
		}
		public function setStorageValue(array: Array, storageName: String, storageValueNum: int, newValue:*):void {
			var counter: Number = array.length;
			//Various Errors preventing action
			if (array.length <= 0) return;
			while (counter > 0) {
				counter--;
				//Find it, change it, quit out
				if (array[counter].storageName == storageName) {
					if (storageValueNum < 1 || storageValueNum > 5 || (storageValueNum == 5 && !newValue is String) || (storageValueNum > 0 && storageValueNum < 5 && !newValue is Number)) {
						trace("ERROR: Change storage value with invalid value for given slot or invalid slot.");
						return;
					}
					if (storageValueNum == 1) array[counter].value1 = newValue;
					else if (storageValueNum == 2) array[counter].value2 = newValue;
					else if (storageValueNum == 3) array[counter].value3 = newValue;
					else if (storageValueNum == 4) array[counter].value4 = newValue;
					else if (storageValueNum == 5) array[counter].tooltip = newValue;
					else throw new Error("setStorageValue called with an invalid index.");
					return;
				}
			}
			trace("ERROR: Looking for status '" + storageName + "' to change value " + storageValueNum + ", and " + short + " does not have the status affect.");
			return;
		}
		public function addStatusValue(statusName: String, statusValueNum:Number, newNum:Number):void {
			addStorageValue(statusEffects, statusName, statusValueNum, newNum);
		}
		public function addPerkValue(perkName: String, perkValueNum:Number, newNum:Number):void {
			addStorageValue(perks, perkName, perkValueNum, newNum);
		}
		public function addKeyValue(statusName: String, statusValueNum:Number, newNum:Number):void {
			addStorageValue(keyItems, statusName, statusValueNum, newNum);
		}
		public function addStorageValue(array:Array, storageName: String, storageValueNum:Number, newNum:Number):void {
			var counter: Number = array.length;
			//Various Errors preventing action
			if (array.length <= 0) {
				return;
				//trace("ERROR: Looking for storage '" + storageName + "' to add value " + storageValueNum + ", and " + short + " has no storage in array.");
			}
			while (counter > 0) {
				counter--;
				//Find it, change it, quit out
				if (array[counter].storageName == storageName) {
					if (storageValueNum < 1 || storageValueNum > 4) {
						trace("ERROR: AddStorageValue called with invalid status value number.");
						return;
					}
					if (storageValueNum == 1) array[counter].value1 += newNum;
					if (storageValueNum == 2) array[counter].value2 += newNum;
					if (storageValueNum == 3) array[counter].value3 += newNum;
					if (storageValueNum == 4) array[counter].value4 += newNum;
					return;
				}
			}
			trace("ERROR: Looking for status '" + storageName + "' to add value " + storageValueNum + ", and " + short + " does not have the status affect.");
			return;
		}

		private function storageValue(array:Array, storageName:String, targetValue:*): Number {
			//trace("Finding storage value.");
			if (array.length == 0) return 0;
			if (!hasStorageName(array, storageName)) return 0;
			for (var counter: int = 0; counter < array.length; counter++) {
				//trace("Loop through once");
				if (array[counter].storageName == storageName) break;
			}
			//trace("Finished Loop");
			if (targetValue == 1) return array[counter].value1;
			else if (targetValue == 2) return array[counter].value2;
			else if (targetValue == 3) return array[counter].value3;
			else if (targetValue == 4) return array[counter].value4;
			return 0;
		}
		public function statusEffectv1(statusName: String): Number {
			return storageValue(statusEffects, statusName, 1);
		}
		public function statusEffectv2(statusName: String): Number {
			return storageValue(statusEffects, statusName, 2);
		}
		public function statusEffectv3(statusName: String): Number {
			return storageValue(statusEffects, statusName, 3);
		}
		public function statusEffectv4(statusName: String): Number {
			return storageValue(statusEffects, statusName, 4);
		}
		public function perkv1(statusName: String): Number {
			return storageValue(perks, statusName, 1);
		}
		public function perkv2(statusName: String): Number {
			return storageValue(perks, statusName, 2);
		}
		public function perkv3(statusName: String): Number {
			return storageValue(perks, statusName, 3);
		}
		public function perkv4(statusName: String): Number {
			return storageValue(perks, statusName, 4);
		}
		public function keyItemv1(statusName: String): Number {
			return storageValue(keyItems, statusName, 1);
		}
		public function keyItemv2(statusName: String): Number {
			return storageValue(keyItems, statusName, 2);
		}
		public function keyItemv3(statusName: String): Number {
			return storageValue(keyItems, statusName, 3);
		}
		public function keyItemv4(statusName: String): Number {
			return storageValue(keyItems, statusName, 4);
		}

		public function getStatusEffect(statusName:String):StorageClass
		{
			for (var i:int = 0; i < statusEffects.length; i++)
			{
				if (statusEffects[i].storageName == statusName) return statusEffects[i];
			}
			
			return null;
		}
		
		public function removeStatusByRef(ref:StorageClass):void
		{
			var idx:int = statusEffects.indexOf(ref);
			if (idx >= 0)
			{
				statusEffects.splice(idx, 1);
			}
		}

		public function getPerkEffect(perkName:String):StorageClass
		{
			for (var i:int = 0; i < perks.length; i++)
			{
				if (perks[i].storageName == perkName) return perks[i];
			}
			return null;
		}
		
		//Grow
		public function increaseCock(increase: Number, cockNum: Number): Number {
			if (hasPerk("Big Cock") >= 0) increase *= perks[hasPerk("Big Cock")].value1;
			if (hasPerk("Phallic Potential") >= 0) increase *= 1.5;
			if (hasPerk("Phallic Restraint") >= 0) increase *= .25;
			return cocks[cockNum].growCock(increase);
		}
		//BreastCup
		public function breastCup(rowNum: Number = 0, ratingCheck: int = -1): String {
			//Error catching.
			if (ratingCheck == -1 && rowNum + 1 > breastRows.length) return "ERROR-cup";
			//Set the breastRating to be checked or the artifical ratingCheck if not -1.
			var check:int = 0;
			if (ratingCheck >= 0) check = ratingCheck;
			else check = breastRows[rowNum].breastRating();
			//Get a cup size.
			if (check < 1) return "0-cup";
			else if (check < 2) return "A-cup";
			else if (check < 3) return "B-cup";
			else if (check < 4) return "C-cup";
			else if (check < 5) return "D-cup";
			else if (check < 6) return "DD-cup";
			else if (check < 7) return "big DD-cup";
			else if (check < 8) return "E-cup";
			else if (check < 9) return "big E-cup";
			else if (check < 10) return "EE-cup";
			else if (check < 11) return "big EE-cup";
			else if (check < 12) return "F-cup";
			else if (check < 13) return "big F-cup";
			else if (check < 14) return "FF-cup";
			else if (check < 15) return "big FF-cup";
			else if (check < 16) return "G-cup";
			else if (check < 17) return "big G-cup";
			else if (check < 18) return "GG-cup";
			else if (check < 19) return "big GG-cup";
			else if (check < 20) return "H-cup";
			else if (check < 21) return "big H-cup";
			else if (check < 22) return "HH-cup";
			else if (check < 23) return "big HH-cup";
			else if (check < 24) return "HHH-cup";
			else if (check < 25) return "I-cup";
			else if (check < 26) return "big I-cup";
			else if (check < 27) return "II-cup";
			else if (check < 28) return "big II-cup";
			else if (check < 29) return "J-cup";
			else if (check < 30) return "big J-cup";
			else if (check < 31) return "JJ-cup";
			else if (check < 32) return "big JJ-cup";
			else if (check < 33) return "K-cup";
			else if (check < 34) return "big K-cup";
			else if (check < 35) return "KK-cup";
			else if (check < 36) return "big KK-cup";
			else if (check < 37) return "L-cup";
			else if (check < 38) return "big L-cup";
			else if (check < 39) return "LL-cup";
			else if (check < 40) return "big LL-cup";
			else if (check < 41) return "M-cup";
			else if (check < 42) return "big M-cup";
			else if (check < 43) return "MM-cup";
			else if (check < 44) return "big MM-cup";
			else if (check < 45) return "MMM-cup";
			else if (check < 46) return "large MMM-cup";
			else if (check < 47) return "N-cup";
			else if (check < 48) return "large N-cup";
			else if (check < 49) return "NN-cup";
			else if (check < 50) return "large NN-cup";
			else if (check < 51) return "O-cup";
			else if (check < 52) return "large O-cup";
			else if (check < 53) return "OO-cup";
			else if (check < 54) return "large OO-cup";
			else if (check < 55) return "P-cup";
			else if (check < 56) return "large P-cup";
			else if (check < 57) return "PP-cup";
			else if (check < 58) return "large PP-cup";
			else if (check < 59) return "Q-cup";
			else if (check < 60) return "large Q-cup";
			else if (check < 61) return "QQ-cup";
			else if (check < 62) return "large QQ-cup";
			else if (check < 63) return "R-cup";
			else if (check < 64) return "large R-cup";
			else if (check < 65) return "RR-cup";
			else if (check < 66) return "large RR-cup";
			else if (check < 67) return "S-cup";
			else if (check < 68) return "large S-cup";
			else if (check < 69) return "SS-cup";
			else if (check < 70) return "large SS-cup";
			else if (check < 71) return "T-cup";
			else if (check < 72) return "large T-cup";
			else if (check < 73) return "TT-cup";
			else if (check < 74) return "large TT-cup";
			else if (check < 75) return "U-cup";
			else if (check < 76) return "large U-cup";
			else if (check < 77) return "UU-cup";
			else if (check < 78) return "large UU-cup";
			else if (check < 79) return "V-cup";
			else if (check < 80) return "large V-cup";
			else if (check < 81) return "VV-cup";
			else if (check < 82) return "large VV-cup";
			else if (check < 83) return "W-cup";
			else if (check < 84) return "large W-cup";
			else if (check < 85) return "WW-cup";
			else if (check < 86) return "large WW-cup";
			else if (check < 87) return "X-cup";
			else if (check < 88) return "large X-cup";
			else if (check < 89) return "XX-cup";
			else if (check < 90) return "large XX-cup";
			else if (check < 91) return "Y-cup";
			else if (check < 92) return "large Y-cup";
			else if (check < 93) return "YY-cup";
			else if (check < 94) return "large YY-cup";
			else if (check < 95) return "Z-cup";
			else if (check < 96) return "large Z-cup";
			else if (check < 97) return "ZZ-cup";
			else if (check < 98) return "large ZZ-cup";
			else if (check < 99) return "ZZZ-cup";
			else if (check < 100) return "large ZZZ-cup";
			else if (check < 101) return "hyper A-cup";
			else if (check < 102) return "hyper B-cup";
			else if (check < 103) return "hyper C-cup";
			else if (check < 104) return "hyper D-cup";
			else if (check < 105) return "hyper DD-cup";
			else if (check < 106) return "hyper big DD-cup";
			else if (check < 107) return "hyper E-cup";
			else if (check < 108) return "hyper big E-cup";
			else if (check < 109) return "hyper EE-cup";
			else if (check < 110) return "hyper big EE-cup";
			else if (check < 111) return "hyper F-cup";
			else if (check < 112) return "hyper big F-cup";
			else if (check < 113) return "hyper FF-cup";
			else if (check < 114) return "hyper big FF-cup";
			else if (check < 115) return "hyper G-cup";
			else if (check < 116) return "hyper big G-cup";
			else if (check < 117) return "hyper GG-cup";
			else if (check < 118) return "hyper big GG-cup";
			else if (check < 119) return "hyper H-cup";
			else if (check < 120) return "hyper big H-cup";
			else if (check < 121) return "hyper HH-cup";
			else if (check < 122) return "hyper big HH-cup";
			else if (check < 123) return "hyper HHH-cup";
			else if (check < 124) return "hyper I-cup";
			else if (check < 125) return "hyper big I-cup";
			else if (check < 126) return "hyper II-cup";
			else if (check < 127) return "hyper big II-cup";
			else if (check < 128) return "hyper J-cup";
			else if (check < 129) return "hyper big J-cup";
			else if (check < 130) return "hyper JJ-cup";
			else if (check < 131) return "hyper big JJ-cup";
			else if (check < 132) return "hyper K-cup";
			else if (check < 133) return "hyper big K-cup";
			else if (check < 134) return "hyper KK-cup";
			else if (check < 135) return "hyper big KK-cup";
			else if (check < 136) return "hyper L-cup";
			else if (check < 137) return "hyper big L-cup";
			else if (check < 138) return "hyper LL-cup";
			else if (check < 139) return "hyper big LL-cup";
			else if (check < 140) return "hyper M-cup";
			else if (check < 141) return "hyper big M-cup";
			else if (check < 142) return "hyper MM-cup";
			else if (check < 143) return "hyper big MM-cup";
			else if (check < 144) return "hyper MMM-cup";
			else if (check < 145) return "hyper large MMM-cup";
			else if (check < 146) return "hyper N-cup";
			else if (check < 147) return "hyper large N-cup";
			else if (check < 148) return "hyper NN-cup";
			else if (check < 149) return "hyper large NN-cup";
			else if (check < 150) return "hyper O-cup";
			else if (check < 151) return "hyper large O-cup";
			else if (check < 152) return "hyper OO-cup";
			else if (check < 153) return "hyper large OO-cup";
			else if (check < 154) return "hyper P-cup";
			else if (check < 155) return "hyper large P-cup";
			else if (check < 156) return "hyper PP-cup";
			else if (check < 157) return "hyper large PP-cup";
			else if (check < 158) return "hyper Q-cup";
			else if (check < 159) return "hyper large Q-cup";
			else if (check < 160) return "hyper QQ-cup";
			else if (check < 161) return "hyper large QQ-cup";
			else if (check < 162) return "hyper R-cup";
			else if (check < 163) return "hyper large R-cup";
			else if (check < 164) return "hyper RR-cup";
			else if (check < 165) return "hyper large RR-cup";
			else if (check < 166) return "hyper S-cup";
			else if (check < 167) return "hyper large S-cup";
			else if (check < 168) return "hyper SS-cup";
			else if (check < 169) return "hyper large SS-cup";
			else if (check < 170) return "hyper T-cup";
			else if (check < 171) return "hyper large T-cup";
			else if (check < 172) return "hyper TT-cup";
			else if (check < 173) return "hyper large TT-cup";
			else if (check < 174) return "hyper U-cup";
			else if (check < 175) return "hyper large U-cup";
			else if (check < 176) return "hyper UU-cup";
			else if (check < 177) return "hyper large UU-cup";
			else if (check < 178) return "hyper V-cup";
			else if (check < 179) return "hyper large V-cup";
			else if (check < 180) return "hyper VV-cup";
			else if (check < 181) return "hyper large VV-cup";
			else if (check < 182) return "hyper W-cup";
			else if (check < 183) return "hyper large W-cup";
			else if (check < 184) return "hyper WW-cup";
			else if (check < 185) return "hyper large WW-cup";
			else if (check < 186) return "hyper X-cup";
			else if (check < 187) return "hyper large X-cup";
			else if (check < 188) return "hyper XX-cup";
			else if (check < 189) return "hyper large XX-cup";
			else if (check < 190) return "hyper Y-cup";
			else if (check < 191) return "hyper large Y-cup";
			else if (check < 192) return "hyper YY-cup";
			else if (check < 193) return "hyper large YY-cup";
			else if (check < 194) return "hyper Z-cup";
			else if (check < 195) return "hyper large Z-cup";
			else if (check < 196) return "hyper ZZ-cup";
			else if (check < 197) return "hyper large ZZ-cup";
			else if (check < 198) return "hyper ZZZ-cup";
			else if (check < 199) return "hyper large ZZZ-cup";
			else if (check >= 199) return "Jacques00-cup";
			return "Error-Cup (breastSize Error Number: " + check + ")";
			//watermelon-sized
			//tent sized
			//truck sized
			//parachute sized
			//pool-sized
			//hanger-sized
			//town-sized
			//city-sized
			//state-sized
			//continent-sized
			//planet-sized
			//WTFISTHISWHYISNTITGAMEOVER?
		}
		public function bRows(): Number {
			return breastRows.length;
		}
		public function totalBreasts(): Number {
			var counter: Number = breastRows.length;
			var total: Number = 0;
			while (counter > 0) {
				counter--;
				total += breastRows[counter].breasts;
			}
			return total;
		}
		public function bRating(arg: int): Number {
			if (arg >= bRows()) return 0;
			return breastRows[arg].breastRating();
		}
		public function bRatingRaw(arg:int):Number {
			if (arg >= bRows()) return 0;
			return breastRows[arg].breastRatingRaw;
		}
		public function breastRatingRawMin(arg:int):Number
		{
			if(arg >= bRows()) return 0;
			
			var rating:Number = 0;
			return rating;
		}
		public function breastRatingModMin(arg:int):Number
		{
			if(arg >= bRows()) return 0;
			
			var rating:Number = 0;
			if(arg == 0) rating += statusEffectv3("Mimbrane Boobs");
			rating += statusEffectv2("Bimboleum");
			return rating;
		}
		public function totalNipples(): Number {
			var counter: Number = breastRows.length;
			var total: Number = 0;
			while (counter > 0) {
				counter--;
				total += nipplesPerBreast * breastRows[counter].breasts;
			}
			return total;
		}
		public function totalNippleCocks():int
		{
			var count:int = 0;
			for (var i:int = 0; i < breastRows.length; i++)
			{
				if (breastRows[i].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
				{
					count += nipplesPerBreast * breastRows[i].breasts;
				}
			}
			return count;
		}
		public function totalFuckableNipples(): int
		{
			return fuckableNippleCount();
		}
		
		public function biggestTitSize(raw:Boolean = false): Number {
			if (breastRows.length == 0) return -1;
			var counter: Number = breastRows.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (raw)
				{
					if (breastRows[index].breastRatingRaw < breastRows[counter].breastRatingRaw) index = counter;
				}
				else
				{
					if (breastRows[index].breastRating() < breastRows[counter].breastRating()) index = counter;
				}
			}
			if (raw) return breastRows[index].breastRatingRaw;
			return breastRows[index].breastRating();
		}
		public function smallestTitSize(): Number {
			if (breastRows.length == 0) return -1;
			var counter: Number = breastRows.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (breastRows[index].breastRating() > breastRows[counter].breastRating()) index = counter;
			}
			return breastRows[index].breastRating();
		}
		public function smallestTitRow(): Number {
			if (breastRows.length == 0) return -1;
			var counter: Number = breastRows.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (breastRows[index].breastRating() > breastRows[counter].breastRating()) index = counter;
			}
			return index;
		}
		public function biggestTitRow(): Number {
			var counter: Number = breastRows.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (breastRows[index].breastRating() < breastRows[counter].breastRating()) index = counter;
			}
			return index;
		}
		public function canTitFuck(big: Boolean = false): Boolean {
			var threshhold: int = 3;
			if (big) threshhold = 7;
			for (var x: int = 0; x < bRows(); x++) {
				if (breastRows[x].breastRating() >= threshhold && breastRows[x].breasts > 1) return true;
			}
			return false;
		}
		public function canTriboobTitFuck(big: Boolean = false): Boolean {
			var threshhold: int = 3;
			if (big) threshhold = 7;
			for (var x: int = 0; x < bRows(); x++) {
				if (breastRows[x].breastRating() >= threshhold && breastRows[x].breasts > 2) return true;
			}
			return false;
		}
		//Arg is "how many rows minimum". "big" is if target dick requires big ol jubblies.
		public function canMultiRowTitFuck(arg: Number = 2, big: Boolean = false): Boolean {
			var threshhold: int = 3;
			if (big) threshhold = 7;
			var eligibleRows: int = 0;
			for (var x: int = 0; x < bRows(); x++) {
				if (breastRows[x].breastRating() >= threshhold && breastRows[x].breasts > 1) eligibleRows++;
			}
			return (eligibleRows >= arg);
		}
		public function mostBreastsPerRow(): Number {
			var counter: Number = breastRows.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (breastRows[index].breasts < breastRows[counter].breasts) index = counter;
			}
			return breastRows[index].breasts;
		}
		//No arg = average, otherwise ask by row.
		public function breastsPerRow(arg: int = -1): Number {
			if (arg >= 0 && arg < bRows()) {
				return breastRows[arg].breasts;
			}
			//Average!
			var av: Number = 0;
			for (var x: int = 0; x < bRows(); x++) {
				av += breastRows[x].breasts;
			}
			return Math.round((av /= bRows()) * 10) / 10;
		}
		public function averageNipplesPerBreast(): Number {
			var counter: Number = breastRows.length;
			var breasts: Number = 0;
			var nipples: Number = 0;
			while (counter > 0) {
				counter--;
				breasts += breastRows[counter].breasts;
				nipples += nipplesPerBreast * breastRows[counter].breasts;
			}
			if (breasts == 0) return 0;
			return Math.floor(nipples / breasts);
		}
		public function isErect():Boolean
		{
			return (lust() >= 66 || hasStatusEffect("Priapism"));
		}
		//Might get used later if other things give perma-boner
		public function hasPriapism():Boolean
		{
			return (hasStatusEffect("Priapism"));
		}
		public function hasASheath(): Boolean {
			for (var x: int = 0; x < cocks.length; x++) {
				if (cocks[x].hasFlag(GLOBAL.FLAG_SHEATHED)) return true;
			}
			return false;
		}
		public function hasFullSheaths():Boolean {
			for (var x: int = 0; x < cocks.length; x++) {
				if (!cocks[x].hasFlag(GLOBAL.FLAG_SHEATHED)) return false;
			}
			return true;
		}
		public function totalSheaths():Number
		{
			if (cocks.length <= 0) return 0;
			var total:int = 0;
			for(var x:int = 0; x < cocks.length; x++)
			{
				if(hasSheath(x)) total++;
			}
			return total;
		}
		public function hasSheath(arg: int = 0): Boolean {
			if (arg >= cocks.length) return false;
			if (cocks[arg].hasFlag(GLOBAL.FLAG_SHEATHED)) return true;
			return false;
		}
		public function hasSheaths(arg: int = 2): Boolean {
			if (cocks.length <= 0) return false;
			var total:int = totalSheaths();
			return (total >= arg);
		}
		public function hasKnot(arg: int = 0): Boolean {
			if (arg >= cocks.length || arg < 0) 
			{
				trace("ERROR: tried to check for a knot on a penis (#" + arg + ") that doesn’t exist.");
				return false;
			}
			return (cocks[arg].hasFlag(GLOBAL.FLAG_KNOTTED));
		}
		public function hasAKnot(): Boolean {
			for (var x: int = 0; x < cocks.length; x++) {
				if (cocks[x].hasFlag(GLOBAL.FLAG_KNOTTED)) return true;
			}
			return false;
		}
		public function hasKnots():Boolean
		{
			return (totalKnots() > 1);
		}
		public function totalKnots():Number
		{
			if (cocks.length <= 0) return 0;
			var total:int = 0;
			for(var x:int = 0; x < cocks.length; x++)
			{
				if(hasKnot(x)) total++;
			}
			return total;
		}
		public function knotThickness(arg:int = 0):Number
		{
			if(arg < 0 || arg >= cocks.length) return 0;
			return (cocks[arg].thickness() * cocks[arg].knotMultiplier);
		}
		public function knotGirth(arg:int = 0):Number
		{
			if(arg < 0 || arg >= cocks.length) return 0;
			return (cocks[arg].girth() * cocks[arg].knotMultiplier);
		}
		public function hasCockFlag(arg: int = 0, cockNum: int = 0): Boolean {
			if (cockNum >= cocks.length || cockNum < 0) return false;
			return (cocks[cockNum].hasFlag(arg));
		}
		public function hasACockFlag(arg:int = 0): Boolean {
			for (var x: int = 0; x < cocks.length; x++) {
				if (cocks[x].hasFlag(arg)) return true;
			}
			return false;
		}
		public function cockVolume(cockNum: Number, effective: Boolean = true): Number {
			if (cockNum >= cocks.length || cockNum < 0) return 0;
			if (effective) return (cocks[cockNum].effectiveVolume());
			return (cocks[cockNum].volume());
		}
		public function cockTailVolume(effective: Boolean = true): Number {
			return tailCockVolume(effective);
		}
		public function tailCockVolume(effective: Boolean = true): Number {
			var tailCock:CockClass = new CockClass();
			tailCock.cLengthRaw = 9;

			if (tailGenitalArg == GLOBAL.TYPE_EQUINE || hasTailFlag(GLOBAL.FLAG_BLUNT))
				tailCock.addFlag(GLOBAL.FLAG_BLUNT);

			if (tailGenitalArg == GLOBAL.TYPE_EQUINE || hasTailFlag(GLOBAL.FLAG_FLARED))
				tailCock.addFlag(GLOBAL.FLAG_FLARED);

			if (tailGenitalArg == GLOBAL.TYPE_CANINE || hasTailFlag(GLOBAL.FLAG_TAPERED))
				tailCock.addFlag(GLOBAL.FLAG_TAPERED);

			if (tailGenitalArg == GLOBAL.TYPE_GABILANI || hasTailFlag(GLOBAL.FLAG_DOUBLE_HEADED))
				tailCock.addFlag(GLOBAL.FLAG_DOUBLE_HEADED);

			if (effective) {
				//return tailCock.effectiveVolume();
			}
			return tailCock.volume();
		}
		public function nippleCockVolume(effective: Boolean = true): Number {
			return dickNippleVolume(effective);
		}
		public function dickNippleVolume(effective: Boolean = true): Number {
			//Get length and width.
			var l: Number = nippleLength(0) * dickNippleMultiplier;
			var w: Number;
			if (l <= 10) w = l / 6;
			else if (l <= 30) w = (l - 10) / 10 + 10 / 6;
			else w = (l - 30) / 20 + 20 / 10 + 10 / 6;
			
			var dickNipple:CockClass = new CockClass();
			dickNipple.cLengthRaw = l;
			dickNipple.cThicknessRatioRaw = w / (l / 6);

			if (dickNippleType == GLOBAL.TYPE_EQUINE) {
				dickNipple.addFlag(GLOBAL.FLAG_BLUNT);
				dickNipple.addFlag(GLOBAL.FLAG_FLARED);
			}

			if (dickNippleType == GLOBAL.TYPE_CANINE)
				dickNipple.addFlag(GLOBAL.FLAG_TAPERED);

			if (dickNippleType == GLOBAL.TYPE_GABILANI)
				dickNipple.addFlag(GLOBAL.FLAG_DOUBLE_HEADED);

			if (effective) {
				//return dickNipple.effectiveVolume();
			}
			return dickNipple.volume();
		}

		public function biggestCockLength(): Number {
			if (cocks.length <= 0) return 0;
			return cocks[biggestCockIndex()].cLength();
		}
		public function biggestCockThickness(): Number {
			if (cocks.length <= 0) return 0;
			return cocks[biggestCockIndex()].thickness();
		}
		public function biggestCockVolume(effective: Boolean = true): Number {
			if (cocks.length <= 0) return 0;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cockVolume(index, effective) < cockVolume(counter, effective)) index = counter;
			}
			return cockVolume(index, effective);
		}
		//Find the second biggest dick and it's area.
		public function biggestCockVolume2(effective: Boolean = true): Number {
			if (cocks.length <= 1) return 0;
			var counter: Number = cocks.length;
			var index: Number = 0;
			var index2: Number = -1;
			//Find the biggest
			while (counter > 0) {
				counter--;
				if (cockVolume(index, effective) < cockVolume(counter, effective)) index = counter;
			}
			//Reset counter and find the next biggest
			counter = cocks.length;
			while (counter > 0) {
				counter--;
				//Is this spot claimed by the biggest?
				if (counter != index) {
					//Not set yet?
					if (index2 == -1) index2 = counter;
					//Is the stored value less than the current one?
					if (cockVolume(index2, effective) < cockVolume(counter, effective)) {
						index2 = counter;
					}
				}
			}
			//If it couldn't find a second biggest...
			if (index == index2) return 0;
			return cockVolume(index2, effective);
		}
		public function longestCockIndex(): Number {
			if (cocks.length <= 0) return -1;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cocks[index].cLength() < cocks[counter].cLength()) index = counter;
			}
			return index;
		}
		public function longestCockLength(raw:Boolean = false): Number {
			if (cocks.length <= 0) return 0;
			var counter: Number = cocks.length;
			var index: Number = 0;
			
			if (!raw)
			{
				while (counter > 0) 
				{
					counter--;
					if (cocks[index].cLength() < cocks[counter].cLength()) index = counter;
				}
				return cocks[index].cLength();
			}
			else
			{
				while (counter > 0) 
				{
					counter--;
					if (cocks[index].cLengthRaw < cocks[counter].cLengthRaw) index = counter;
				}
				return cocks[index].cLengthRaw;
			}
		}
		public function longestHorsecockLength(): Number {
			if (cocks.length <= 0) return 0;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if ((cocks[index].cType != GLOBAL.TYPE_EQUINE && cocks[counter].cType == GLOBAL.TYPE_EQUINE) || (cocks[index].cLength() < cocks[counter].cLength() && cocks[counter].cType == GLOBAL.TYPE_EQUINE)) index = counter;
			}
			return cocks[index].cLength();
		}
		public function totalcThickness(): Number {
			var thick: Number = 0;
			var counter: Number = cocks.length;
			while (counter > 0) {
				counter--;
				thick += cocks[counter].thickness();
			}
			return thick;
		}
		public function cThickness(arg:int = 0):Number
		{
			if(arg >= cocks.length) return -1;
			if(arg < 0) return -1;
			return cocks[arg].thickness();
		}
		public function cGirth(arg:int = 0):Number
		{
			if(arg >= cocks.length) return -1;
			if(arg < 0) return -1;
			return cocks[arg].girth();
		}
		public function cLength(arg:int = 0, dynamicLength:Boolean = false):Number
		{
			if(arg >= cocks.length) return -1;
			if(arg < 0) return -1;
			if (dynamicLength) return cLengthFlaccid(arg, true);
			return cocks[arg].cLength();
		}
		public function cLengthFlaccid(arg:int = 0, dynamicLength:Boolean = false): Number
		{
			if(arg >= cocks.length) return -1;
			if(arg < 0) return -1;
			if (dynamicLength)
			{
				var lustRatio: Number = (lust()/100);
				if (hasStatusEffect("Priapism")) lustRatio = 1;
				if (lustRatio > 1) lustRatio = 1; // To avoid over erect length
				return (cocks[arg].cLengthFlaccid() + ((cocks[arg].cLength() - cocks[arg].cLengthFlaccid()) * lustRatio));
			}
			return cocks[arg].cLengthFlaccid();
		}
		public function thickestCock():int {
			if (cocks.length <= 0) return -1;
			if (cocks.length == 1) return 0;
			var counter: int = cocks.length;
			var index: int = 0;
			while (counter > 0) {
				counter--;
				if (cocks[index].thickness() < cocks[counter].thickness()) index = counter;
			}
			return index;
		}
		public function thinnestCock():int {
			if (cocks.length <= 0) return -1;
			if (cocks.length == 1) return 0;
			var foundCock:int = 0;
			for (var i:int = 0; i < cocks.length; i++)
			{
				if (cocks[i].thickness() < cocks[foundCock].thickness())
				{
					foundCock = i;
				}
			}
			return foundCock;
		}
		public function thinnestCockThickness():Number {
			if (cocks.length <= 0) return 0;
			var foundCock:int = thinnestCock();
			return cocks[foundCock].thickness();
		}
		public function totalGirth(): Number {
			if (cocks.length <= 0) return 0;
			var counter: Number = 0;
			for (var x: int = 0; x < cocks.length; x++) {
				counter += cocks[x].cLength();
			}
			return counter;
		}
		public function thickestCockThickness(): Number {
			if (cocks.length <= 0) return 0;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cocks[index].thickness() < cocks[counter].thickness()) index = counter;
			}
			return cocks[index].thickness();
		}
		public function thinnestCockIndex(): Number {
			if (cocks.length <= 0) return -1;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cocks[index].thickness() > cocks[counter].thickness()) index = counter;
			}
			return index;
		}
		public function thinnestCockRatioIndex(): Number {
			if (cocks.length <= 0) return -1;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cocks[index].cThicknessRatio() > cocks[counter].cThicknessRatio()) index = counter;
			}
			return index;
		}
		public function smallestCockVolume(effective: Boolean = true): Number {
			if (cocks.length <= 0) return 0;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cockVolume(index, effective) > cockVolume(counter, effective)) index = counter;
			}
			return cockVolume(index, effective);
		}
		public function smallestCockIndex(effective: Boolean = true): Number {
			if (cocks.length <= 0) return -1;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cockVolume(index, effective) > cockVolume(counter, effective)) {
					index = counter;
				}
			}
			return index;
		}
		public function smallestCockLength(): Number {
			if (cocks.length <= 0) return 0;
			return cocks[smallestCockIndex()].cLength();
		}
		public function shortestCockIndex(): Number {
			if (cocks.length <= 0) return -1;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cocks[index].cLength() > cocks[counter].cLength()) index = counter;
			}
			return index;
		}
		public function shortestCockLength(): Number {
			if (cocks.length <= 0) return 0;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cocks[index].cLength() > cocks[counter].cLength()) index = counter;
			}
			return cocks[index].cLength();
		}
		//Find the biggest cock that fits inside a given value
		public function cockThatFits(fits: Number = 0, type: String = "volume",excludedIndexes: Array = null): Number {
			trace("Fits value: " + fits);
			if (cocks.length <= 0) return -1;
			var counter: Number = cocks.length;
			//Current largest fitter
			var index: Number = -1;
			while (counter > 0) {
				counter--;
				//Check if this index location is excluded
				if(excludedIndexes != null && excludedIndexes.indexOf(counter) != -1)
				{
					trace("Excluded index from \"cockThatFits\" check: " + counter);
				}
				else if (type == "volume") {
					if (cockVolume(counter, true) <= fits) {
						//If one already fits
						if (index >= 0) {
							//See if the newcomer beats the saved small guy
							if (cockVolume(counter, true) > cockVolume(index, true))
								index = counter;
						}
						//Store the index of fitting dick
						else index = counter;
					}
				} else if (type == "length") {
					if (cocks[counter].cLength() <= fits) {
						//If one already fits
						if (index >= 0) {
							//See if the newcomer beats the saved small guy
							if (cockVolume(counter, true) > cockVolume(index, true)) {
								index = counter;
							}
						}
						//Store the index of fitting dick
						else index = counter;
					}
				} else if (type == "thickness") {
					if (cocks[counter].thickness() <= fits) {
						if (index >= 0) {
							if (cockVolume(counter, true) > cockVolume(index, true)) {
								index = counter;
							}
						}
						else index = counter;
					}
				}
				
			}
			return index;
		}
		//Find the 2nd biggest cock that fits inside a given value
		public function cockThatFits2(fits: Number = 0): Number {
			if (cocks.length <= 1) return -1;
			var counter: Number = cocks.length;
			//Current largest fitter
			var index: Number = -1;
			var index2: Number = -1;
			while (counter > 0) {
				counter--;
				//Does this one fit?
				if (cockVolume(counter, true) <= fits) {
					//If one already fits
					if (index >= 0) {
						//See if the newcomer beats the saved small guy
						if (cockVolume(counter, true) > cockVolume(index, true)) {
							//Save old wang
							if (index != -1) index2 = index;
							index = counter;
						}
						//If this one fits and is smaller than the other great
						else {
							if ((cockVolume(index2, true) < cockVolume(counter, true)) && counter != index) {
								index2 = counter;
							}
						}
						if (index >= 0 && index == index2) trace("FUCK ERROR COCKTHATFITS2 SHIT IS BROKED!");
					}
					//Store the index of fitting dick
					else index = counter;
				}
			}
			return index2;
		}
		public function smallestCockArea(effective: Boolean = true): Number {
			if (cocks.length <= 0) return 0;
			return cockVolume(smallestCockIndex(), effective);
		}
		public function biggestCockIndex(effective: Boolean = true): Number {
			if (cocks.length <= 0) return -1;
			var counter: Number = cocks.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (cockVolume(index, effective) < cockVolume(counter, effective)) index = counter;
			}
			return index;
		}
		//Find the second biggest dick's index.
		public function biggestCockIndex2(effective: Boolean = true): Number {
			if (cocks.length <= 1) return -1;
			var counter: Number = cocks.length;
			var index: Number = 0;
			var index2: Number = 0;
			//Find the biggest
			while (counter > 0) {
				counter--;
				if (cockVolume(index, effective) < cockVolume(counter, effective)) index = counter;
			}
			//Reset counter and find the next biggest
			counter = cocks.length;
			while (counter > 0) {
				counter--;
				//Make sure index2 doesn't get stuck
				//at the same value as index1 if the
				//initial location is biggest.
				if (index == index2 && counter != index) index2 = counter;
				//Is the stored value less than the current one?
				if (cockVolume(index2, effective) < cockVolume(counter, effective)) {
					//Make sure we don't set index2 to be the same
					//as the biggest dick.
					if (counter != index) index2 = counter;
				}
			}
			//If it couldn't find a second biggest...
			if (index == index2) return 0;
			return index2;
		}
		public function smallestCockIndex2(effective: Boolean = true): Number {
			if (cocks.length <= 1) return -1;
			var counter: Number = cocks.length;
			var index: Number = 0;
			var index2: Number = 0;
			//Find the smallest
			while (counter > 0) {
				counter--;
				if (cockVolume(index, effective) > cockVolume(counter, effective)) index = counter;
			}
			//Reset counter and find the next smallest
			counter = cocks.length;
			while (counter > 0) {
				counter--;
				//Make sure index2 doesn't get stuck
				//at the same value as index1 if the
				//initial location is smallest.
				if (index == index2 && counter != index) index2 = counter;
				//Is the stored value less than the current one?
				if (cockVolume(index2, effective) > cockVolume(counter, effective)) {
					//Make sure we don't set index2 to be the same
					//as the smallest dick.
					if (counter != index) index2 = counter;
				}
			}
			//If it couldn't find a second smallest...
			if (index == index2) return 0;
			return index2;
		}
		//Find the third biggest dick index.
		public function biggestCockIndex3(effective: Boolean = true): Number {
			if (cocks.length <= 2) return -1;
			var counter: Number = cocks.length;
			var index: Number = 0;
			var index2: Number = -1;
			var index3: Number = -1;
			//Find the biggest
			while (counter > 0) {
				counter--;
				if (cockVolume(index, effective) < cockVolume(counter, effective)) index = counter;
			}
			//Reset counter and find the next biggest
			counter = cocks.length;
			while (counter > 0) {
				counter--;
				//If this index isn't used already
				if (counter != index) {
					//Has index been set to anything yet?
					if (index2 == -1) index2 = counter;
					//Is the stored value less than the current one?
					else if (cockVolume(index2, effective) < cockVolume(counter, effective)) {
						index2 = counter;
					}
				}
			}
			//If it couldn't find a second biggest...
			if (index == index2 || index2 == -1) index2 = 0;
			//Reset counter and find the next biggest
			counter = cocks.length;
			while (counter > 0) {
				counter--;
				//If this index isn't used already
				if (counter != index && counter != index2) {
					//Has index been set to anything yet?
					if (index3 == -1) index3 = counter;
					//Is the stored value less than the current one?
					else if (cockVolume(index3, effective) < cockVolume(counter, effective)) {
						index3 = counter;
					}
				}
			}
			//If it fails for some reason.
			if (index3 == -1) index3 = 0;
			return index3;
		}
		protected function rand(max: Number): Number {
			return int(Math.random() * max);
		}
		public function hasVaginaFlag(arg: int = 0, vagNum: int = 0): Boolean {
			if (vagNum >= vaginas.length || vagNum < 0) return false;
			return (vaginas[vagNum].hasFlag(arg));
		}
		public function hasAVaginaFlag(arg:int = 0): Boolean {
			for (var x: int = 0; x < vaginas.length; x++) {
				if (vaginas[x].hasFlag(arg)) return true;
			}
			return false;
		}
		public function wetness(arg: int = 0): Number {
			//If the player has no vaginas
			if (vaginas.length <= 0 || arg >= vaginas.length) return 0;
			if (arg < 0) return ass.wetness();
			return vaginas[arg].wetness();
		}
		public function looseness(arg: int = 0): Number {
			//If the player has no vaginas
			if (vaginas.length <= 0 || arg >= vaginas.length) return 0;
			return vaginas[arg].looseness();
		}
		public function lowestWetness(index:Boolean = false): Number {
			//If the player has no vaginas
			if (vaginas.length <= 0) return 0;
			var wet:int = -1;
			for(var x:int = 0; x < vaginas.length; x++)
			{
				if(wet == -1) wet = x;
				if(vaginas[x].wetness < vaginas[wet].wetness) wet = x;
			}
			if(index) return wet;
			return vaginas[wet].wetness;
		}
		public function lowestWetnessIndex():Number
		{
			return lowestWetness(true);
		}
		public function highestWetness(index:Boolean = false): Number {
			//If the player has no vaginas
			if (vaginas.length <= 0) return 0;
			var wet:int = -1;
			for(var x:int = 0; x < vaginas.length; x++)
			{
				if(wet == -1) wet = x;
				if(vaginas[x].wetness > vaginas[wet].wetness) wet = x;
			}
			if(index) return wet;
			return vaginas[wet].wetness;
		}
		public function highestWetnessIndex():Number
		{
			return highestWetness(true);
		}
		public function vaginalCapacity(arg: int = 0): Number {
			//If the player has no vaginas
			if (vaginas.length <= 0) return 0;

			var capacity:Number = 20;
			//Factor in looseness! - 2/24/15 - buffed looseness a bunch
			capacity *= (vaginas[arg].looseness() * 5 + 1)/3;
			//Add bonuses!
			capacity += vaginas[arg].bonusCapacity;
			if(hasStatusEffect("Soak")) capacity += 150;
			//CoC-tier wetness 5 will double capacity.
			capacity *= (vaginas[arg].wetness()+4)/5;
			//elasticity bonuses!
			capacity *= elasticity;
			if(isTaur()) capacity += 400;
			return capacity;
		}
		public function smallestVaginalCapacity(): Number {
			return vaginalCapacity(smallestVaginaIndex());
		}
		public function biggestVaginalCapacity(): Number {
			return vaginalCapacity(biggestVaginaIndex());
		}
		public function gapestVaginaLooseness(): Number {
			if (vaginas.length <= 0) return 0;
			return vaginas[gapestVaginaIndex()].looseness();
		}
		public function gapestVaginaIndex():int {
			var idx:int = -1;
			for (var i:int = 0; i < vaginas.length; i++)
			{
				if (idx == -1) idx = i;
				else
				{
					if (vaginas[i].looseness() > vaginas[idx].looseness())
					{
						idx = i;
					}
				}
			}
			return idx;
		}
		public function tightestVaginalLooseness():Number {
			if (vaginas.length <= 0) return -1;
			return vaginas[tightestVaginaIndex()].looseness();
		}
		public function tightestVaginaIndex():int {
			var idx:int = -1;
			for (var i:int = 0; i < vaginas.length; i++)
			{
				if (idx == -1) idx = i;
				else
				{
					if (vaginas[i].looseness() < vaginas[idx].looseness())
					{
						idx = i;
					}
				}
			}
			return idx;
		}
		public function wettestVaginalWetness(raw:Boolean = false): Number {
			if(vaginas.length <= 0) return 0;
			var counter: Number = vaginas.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if ((raw ? vaginas[index].wetnessRaw : vaginas[index].wetness()) < (raw ? vaginas[counter].wetnessRaw : vaginas[counter].wetness())) index = counter;
			}
			return (raw ? vaginas[index].wetnessRaw : vaginas[index].wetness());
		}
		public function wettestVaginaIndex(raw:Boolean = false): int {
			if (vaginas.length <= 0) return -1;
			var counter: Number = vaginas.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if ((raw ? vaginas[index].wetnessRaw : vaginas[index].wetness()) < (raw ? vaginas[counter].wetnessRaw : vaginas[counter].wetness())) index = counter;
			}
			return index;
		}
		public function driestVaginalWetness(raw:Boolean = false): Number {
			if (vaginas.length <= 0) return 0;
			var idx:int = 0;
			if (vaginas.length > 1)
			{
				for (var i:int = 1; i < vaginas.length; i++)
				{
					var cw:Number = raw ? vaginas[idx].wetnessRaw : vaginas[idx].wetness();
					var nw:Number = raw ? vaginas[i].wetnessRaw : vaginas[i].wetness();
					if (nw < cw) idx = i;
				}
			}
			return (raw ? vaginas[idx].wetnessRaw : vaginas[idx].wetness());
		}
		public function driestVaginaIndex(raw:Boolean = false): int {
			if (vaginas.length <= 0) return -1;
			var counter: Number = vaginas.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if ((raw ? vaginas[index].wetnessRaw : vaginas[index].wetness()) > (raw ? vaginas[counter].wetnessRaw : vaginas[counter].wetness())) index = counter;
			}
			return index;
		}
		public function biggestVaginaIndex(): int {
			if (vaginas.length <= 0) return -1;
			var counter: Number = vaginas.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (vaginalCapacity(index) < vaginalCapacity(counter)) index = counter;
			}
			return index;
		}
		public function smallestVaginaIndex(): int {
			if (vaginas.length <= 0) return -1;
			var counter: Number = vaginas.length;
			var index: Number = 0;
			while (counter > 0) {
				counter--;
				if (vaginalCapacity(index) > vaginalCapacity(counter)) index = counter;
			}
			return index;
		}
		public function inflateVagina(arg: int = 0): void
		{
			if(vaginas.length <= 0 || arg >= vaginas.length) return;
			if(vaginas[arg].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) return;
			if(vaginas[arg].hasFlag(GLOBAL.FLAG_PUMPED) && !vaginas[arg].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
			{
				vaginas[arg].delFlag(GLOBAL.FLAG_PUMPED);
				vaginas[arg].addFlag(GLOBAL.FLAG_HYPER_PUMPED);
			}
			else if(vaginas[arg].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !vaginas[arg].hasFlag(GLOBAL.FLAG_PUMPED))
			{
				vaginas[arg].delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
				vaginas[arg].addFlag(GLOBAL.FLAG_PUMPED);
			}
			else if(!vaginas[arg].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED))
			{
				vaginas[arg].addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			}
		}
		public function deflateVagina(arg: int = 0): void
		{
			if(vaginas.length <= 0 || arg >= vaginas.length) return;
			if(vaginas[arg].hasFlag(GLOBAL.FLAG_HYPER_PUMPED) && !vaginas[arg].hasFlag(GLOBAL.FLAG_PUMPED))
			{
				vaginas[arg].delFlag(GLOBAL.FLAG_HYPER_PUMPED);
				vaginas[arg].addFlag(GLOBAL.FLAG_PUMPED);
			}
			else if(vaginas[arg].hasFlag(GLOBAL.FLAG_PUMPED) && !vaginas[arg].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED))
			{
				vaginas[arg].delFlag(GLOBAL.FLAG_PUMPED);
				vaginas[arg].addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			}
			else if(vaginas[arg].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED))
			{
				vaginas[arg].delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			}
		}
		public function vaginalPuffiness(arg: int = 0, flagOnly:Boolean = false): Number {
			if(vaginas.length <= 0) return 0;
			var puffScore:Number = 0;
			if(!flagOnly)
			{
				if(this is PlayerCharacter && arg == 0 && hasStatusEffect("Mimbrane Pussy"))
				{
					puffScore += (this as PlayerCharacter).mimbranePuffiness("Mimbrane Pussy");
				}
				if(vaginas[arg].type == GLOBAL.TYPE_EQUINE) puffScore += 1;
				if(vaginas[arg].type == GLOBAL.TYPE_MOUTHGINA) puffScore += 1;
			}
			if(vaginas[arg].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) puffScore += 3;
			if(vaginas[arg].hasFlag(GLOBAL.FLAG_PUMPED)) puffScore += 2;
			if(vaginas[arg].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) puffScore += 1;
			if(!flagOnly)
			{
				//Soak bumps up 1 level to 2 at max.
				if(hasStatusEffect("Soak") && puffScore < 1) puffScore = 1;
				else if(hasStatusEffect("Soak") && puffScore < 2) puffScore = 2;
				//OD is the hypers!
				if(hasStatusEffect("Soak Overdose") && puffScore < 3) puffScore = 3;
			}
			
			return puffScore;
		}
		public function puffiestVaginaIndex(flagOnly:Boolean = false): int {
			if (vaginas.length < 1) return -1;
			var index: Number = 0;
			for(var i:int = 0; i < vaginas.length; i++)
			{
				if (vaginalPuffiness(index, flagOnly) < vaginalPuffiness(i, flagOnly)) index = i;
			}
			return index;
		}
		public function flattestVaginaIndex(flagOnly:Boolean = false): int {
			if (vaginas.length < 1) return -1;
			var index: Number = 0;
			for(var i:int = 0; i < vaginas.length; i++)
			{
				if (vaginalPuffiness(index, flagOnly) > vaginalPuffiness(i, flagOnly)) index = i;
			}
			return index;
		}
		public function puffiestVaginalPuffiness(flagOnly:Boolean = false): Number {
			if(vaginas.length <= 0) return 0;
			var puffScore:Number = vaginalPuffiness(0, flagOnly);
			for(var i:int = 0; i < vaginas.length; i++)
			{
				if (puffScore < vaginalPuffiness(i, flagOnly)) puffScore = vaginalPuffiness(i, flagOnly);
			}
			return puffScore;
		}
		public function flattestVaginalPuffiness(flagOnly:Boolean = false): Number {
			if(vaginas.length <= 0) return 0;
			var puffScore:Number = vaginalPuffiness(0, flagOnly);
			for(var i:int = 0; i < vaginas.length; i++)
			{
				if (puffScore > vaginalPuffiness(i, flagOnly)) puffScore = vaginalPuffiness(i, flagOnly);
			}
			return puffScore;
		}
		//Find the best-fitting cunt that fits inside a given dick
		public function cuntThatFits(fits: Number = 0): Number {
			if (vaginas.length <= 0) return -1;
			var counter: Number = vaginas.length;
			//Current largest fitter
			var index: Number = -1;
			while (counter > 0) {
				counter--;

				if (vaginalCapacity(counter) >= fits) {
					//If one already fits
					if (index >= 0) {
						//See if the newcomer beats the saved small guy
						if (vaginalCapacity(counter) < vaginalCapacity(index)) {
							index = counter;
						}
					}
					//Store the index of fitting dick
					else index = counter;
				}
			}
			return index;
		}
		public function inAnalHeat():Boolean
		{
			return (hasStatusEffect("Strangely Warm") || hasStatusEffect("Flushed") || hasStatusEffect("Fuck Fever"));
		}
		public function removeAnalHeat(eventLog:Boolean = true):void
		{
			clearAnalHeat(eventLog);
		}
		public function clearAnalHeat(eventLog:Boolean = true):void
		{
			if(!inAnalHeat()) return;
			removeStatusEffect("Fuck Fever");
			removeStatusEffect("Flushed");
			removeStatusEffect("Strangely Warm");
			if(this is PlayerCharacter && eventLog) AddLogEvent("You feel calmer and more clear-headed. Has the heat already faded?","passive");
		}
		public function analHeatMinutes():Number
		{
			var minutes:Number = 0;
			if(getStatusMinutes("Strangely Warm") > 0) minutes = getStatusMinutes("Strangely Warm");
			if(getStatusMinutes("Flushed") > minutes) minutes = getStatusMinutes("Flushed");
			if(getStatusMinutes("Fuck Fever") > minutes) minutes = getStatusMinutes("Fuck Fever");
			return minutes;
		}
		public function extendAnalHeat(arg:Number):void
		{
			if(hasStatusEffect("Strangely Warm")) addStatusMinutes("Strangely Warm",arg);
			if(hasStatusEffect("Flushed")) addStatusMinutes("Flushed",arg);
			if(hasStatusEffect("Fuck Fever")) addStatusMinutes("Fuck Fever",arg);
		}
		public function canHeat():Boolean
		{
			return (hasVagina() && fertility() > 0);
		}
		public function inHeat():Boolean
		{
			return hasStatusEffect("Heat");
		}
		public function inDeepHeat():Boolean
		{
			if(hasStatusEffect("Heat"))
			{
				if(statusEffectv1("Heat") >= 10) return true;
			}
			return false;
		}
		public function canRut():Boolean
		{
			return (hasCock() && virility() > 0);
		}
		public function inRut():Boolean
		{
			return (hasStatusEffect("Rut") || hasStatusEffect("Lagonic Rut"));
		}
		public function removeHeat(eventLog:Boolean = true):void
		{
			clearHeat(eventLog);
		}
		public function clearHeat(eventLog:Boolean = true):void
		{
			if(!inHeat()) return;
			removeStatusEffect("Heat");
			if(this is PlayerCharacter && eventLog) AddLogEvent("You shiver momentarily, feeling cooler and more relaxed than you have in many days. When you manage to go more than a few minutes without fantasizing about being pumped full of cum you realize that <b>your heat has ended.</b>","passive");
		}
		public function removeRut(eventLog:Boolean = true):void
		{
			clearRut(eventLog);
		}
		public function clearRut(eventLog:Boolean = true):void
		{
			if(!inRut()) return;
			removeStatusEffect("Rut");
			removeStatusEffect("Lagonic Rut");
			if(this is PlayerCharacter && eventLog) AddLogEvent("You sigh deeply, suddenly feeling calmer and less aggressive than you have in many days. When you manage to go more than a few minutes without getting angry at the thought of someone other than you pumping cum into a fertile pussy you realize that <b>your rut has ended.</b>");
		}
		public function heatMinutes():Number
		{
			var minutes:Number = 0;
			if(getStatusMinutes("Heat") > 0) minutes = getStatusMinutes("Heat");
			return minutes;
		}
		public function rutMinutes():Number
		{
			var minutes:Number = 0;
			if(getStatusMinutes("Rut") > 0) minutes = getStatusMinutes("Rut");
			if(getStatusMinutes("Lagonic Rut") > minutes) minutes = getStatusMinutes("Lagonic Rut");
			return minutes;
		}
		public function extendHeat(arg:Number):void
		{
			if(hasStatusEffect("Heat")) addStatusMinutes("Heat",arg);
		}
		public function extendRut(arg:Number):void
		{
			if(hasStatusEffect("Rut")) addStatusMinutes("Rut",arg);
			if(hasStatusEffect("Lagonic Rut")) addStatusMinutes("Lagonic Rut",arg);
		}
		public function analCapacity(): Number {
			var capacity:Number = 20;
			//Factor in looseness! - 2/24/15 - buffed looseness a bunch
			capacity *= (ass.looseness() * 5 + 1)/3;
			//Add bonuses!
			capacity += ass.bonusCapacity;
			//CoC-tier wetness 5 will double capacity.
			capacity *= (ass.wetness()+4)/5;
			//elasticity bonuses!
			capacity *= elasticity;
			if(isTaur()) capacity += 100;
			return capacity;
		}
		public function inflateAsshole(): void
		{
			if(ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) return;
			if(ass.hasFlag(GLOBAL.FLAG_PUMPED) && !ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
			{
				ass.delFlag(GLOBAL.FLAG_PUMPED);
				ass.addFlag(GLOBAL.FLAG_HYPER_PUMPED);
			}
			else if(ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !ass.hasFlag(GLOBAL.FLAG_PUMPED))
			{
				ass.delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
				ass.addFlag(GLOBAL.FLAG_PUMPED);
			}
			else if(!ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED))
			{
				ass.addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			}
		}
		public function deflateAsshole(): void
		{
			if(ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) && !ass.hasFlag(GLOBAL.FLAG_PUMPED))
			{
				ass.delFlag(GLOBAL.FLAG_HYPER_PUMPED);
				ass.addFlag(GLOBAL.FLAG_PUMPED);
			}
			else if(ass.hasFlag(GLOBAL.FLAG_PUMPED) && !ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED))
			{
				ass.delFlag(GLOBAL.FLAG_PUMPED);
				ass.addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			}
			else if(ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED))
			{
				ass.delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			}
		}
		public function analPuffiness(flagOnly:Boolean = false): Number {
			var puffScore:Number = 0;
			if(!flagOnly)
			{
				if(this is PlayerCharacter && hasStatusEffect("Mimbrane Ass"))
				{
					puffScore += (this as PlayerCharacter).mimbranePuffiness("Mimbrane Ass");
				}
			}
			if(ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) puffScore += 3;
			if(ass.hasFlag(GLOBAL.FLAG_PUMPED)) puffScore += 2;
			if(ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) puffScore += 1;
			
			return puffScore;
		}
		//Goddamnit Savin
		public function cockCapacity(x:int = -1): Number
		{
			if(cocks.length <= 0) return 0;
			if (x >= cocks.length || x < 0) return 0;
			return (cocks[x].volume() / 6 * elasticity);

		}
		// Nipple type checks
		public function hasNipplesofType(arg:int = -1, rowNum:int = -1): Boolean
		{
			if (rowNum >= 0) return (breastRows[rowNum].nippleType == arg);
			
			var counter: Number = breastRows.length;
			var index: Number = 0;
			while (counter > 0)
			{
				counter--;
				if (breastRows[counter].nippleType == arg) return true;
			}
			return false;
		}
		public function hasNormalNipples(rowNum:int = -1):Boolean {
			return hasNipplesofType(GLOBAL.NIPPLE_TYPE_NORMAL, rowNum);
		}
		public function hasTentacleNipples(rowNum:int = -1):Boolean {
			return hasNipplesofType(GLOBAL.NIPPLE_TYPE_TENTACLED, rowNum);
		}
		public function hasNippleCunts(rowNum:int = -1): Boolean { return hasCuntNipples(rowNum); }
		public function hasCuntNipples(rowNum:int = -1): Boolean {
			return hasNipplesofType(GLOBAL.NIPPLE_TYPE_FUCKABLE, rowNum);
		}
		public function hasLipples(rowNum:int = -1): Boolean {
			return hasNipplesofType(GLOBAL.NIPPLE_TYPE_LIPPLES, rowNum);
		}
		public function hasDickNipples(rowNum:int = -1): Boolean {
			return hasNippleCocks(rowNum);
		}
		public function hasNippleCocks(rowNum:int = -1): Boolean {
			return hasNipplesofType(GLOBAL.NIPPLE_TYPE_DICK, rowNum);
		}
		public function hasInvertedNipples(rowNum:int = -1): Boolean
		{
			return hasNipplesofType(GLOBAL.NIPPLE_TYPE_INVERTED, rowNum);
		}
		public function hasFlatNipples(rowNum:int = -1): Boolean {
			return hasNipplesofType(GLOBAL.NIPPLE_TYPE_FLAT, rowNum);
		}
		public function hasFuckableNipples(rowNum:int = -1): Boolean
		{
			if (rowNum >= 0)
			{
				if (breastRows[rowNum].fuckable()) return true;
				return false;
			}
			
			var counter: Number = breastRows.length;
			while (counter > 0) {
				counter--;
				if (breastRows[counter].fuckable()) return true;
			}
			return false;
		}
		public function fuckableNippleCount(): Number
		{
			var nipCount:Number = 0;
			var x: Number = breastRows.length;
			while (x > 0) {
				x--;
				if (breastRows[x].fuckable()) nipCount += breastRows[x].breasts * nipplesPerBreast;
			}
			return nipCount;
		}
		public function nipplesMatch(): Boolean
		{
			for(var x:int = 1; x < breastRows.length; x++)
			{
					if(breastRows[x].nippleType != breastRows[x-1].nippleType) return false;
				}
			return true;
		}
		public function hasErectNipples(rowNum:int = -1, lustBased:Boolean = false):Boolean
		{
			// Can nips get hard?
			var erectNips:Boolean = (hasNormalNipples(rowNum) || hasNippleCocks(rowNum) || hasInvertedNipples(rowNum) || hasTentacleNipples(rowNum));
			
			// Arousal check
			if(lustBased)
			{
				if(lust() < 33) erectNips = false;
			}
			
			return erectNips;
		}
		// Nipple hardening verbs
		public function nipplesErect(rowNum:int = 0, present:Boolean = false):String
		{
			var desc:String = "";
			var actions:Array = [];
			
			if(hasNormalNipples(rowNum) || hasNippleCocks(rowNum)) {
				if(present) {
					actions.push("erecting", "hardening", "swelling", "stiffening");
				}
				else {
					actions.push("erect", "harden", "swell", "stiffen");
				}
			}
			if(hasInvertedNipples(rowNum) || hasTentacleNipples(rowNum)) {
				if(present) {
					actions.push("exposing", "emerging", "hardening", "uncovering");
				}
				else {
					actions.push("expose", "emerge", "harden", "uncover");
				}
			}
			if(hasCuntNipples(rowNum)) {
				if(present) {
					actions.push("dampening", "moistening", "wettening");
				}
				else {
					actions.push("dampen", "moisten", "wetten");
				}
			}
			if(hasLipples(rowNum)) {
				if(present) {
					actions.push("puckering", "puffing", "swelling");
				}
				else {
					actions.push("pucker", "puff", "swell");
				}
			}
			if(hasFlatNipples(rowNum) || hasInvertedNipples(rowNum)) {
				if(present) {
					actions.push("expanding", "puffing", "swelling");
				}
				else {
					actions.push("expand", "puff", "swell");
				}
			}
			
			if(actions.length <= 0) return "ERROR: NO VALID NIPPLE TYPE ACTION";
			
			desc += RandomInCollection(actions);
			return desc;
		}
		//Lazyfen:
		public function hasTits():Boolean { return hasBreasts(); }
		public function hasTiTS():Boolean { return hasBreasts(); }
		public function hasBreasts(): Boolean {
			if (breastRows.length > 0) {
				if (biggestTitSize() >= 1) return true;
			}
			return false;
		}
		public function hasNipples(): Boolean {
			if(nipplesPerBreast > 0) return true;
			return false;
		}
		public function canLactate():Boolean
		{
			if(!hasNipples()) return false;
			//PC has reached lactation threshold!
			if(milkMultiplier > 50 || milkFullness >= 50 || hasPerk("Mega Milk") || hasPerk("Milk Fountain") || hasPerk("Ever-Milk")) return true;
			return false;
		}
		public function isLactating(): Boolean {
			//PC can't be lactating unless they canLactate!
			if(canLactate())
			{
				//Is there enough milk in yer tits for lactation?
				if(milkFullness >= 10 || milkQ() >= 1000 || hasPerk("Mega Milk") || hasPerk("Milk Fountain") || hasPerk("Ever-Milk"))
				{
					//yes? true!
					return true;
				}
			}
			//Didn't proc any trues? Not lactating.
			return false;
		}
		public function canMilkSquirt():Boolean
		{
			if(milkFullness >= 80 || hasPerk("Mega Milk") || hasPerk("Milk Fountain")) return true;
			if(InCollection(milkType, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK) && isLactating()) return true;
			return false;
		}
		public function hasMilkPerk():Boolean
		{
			if(hasPerk("Milky") || hasPerk("Mega Milk") || hasPerk("Treated Milk") || hasPerk("Honeypot") || hasPerk("Milk Fountain")) return true;
			return false;
		}
		public function isMilkTank():Boolean
		{
			//Check for infinite lactation perks!
			if(hasPerk("Honeypot")) return true;
			if(hasPerk("Milk Fountain")) return true;
			if(hasPerk("Milky") && hasPerk("Treated Milk")) return true;
			return false;
		}
		public function milkProduced(minutes: Number, doOut:Boolean = true): Number {
			if(!canLactate()) return 0;
			//How many mLs produced?
			var mLsGained:Number = 1.73 * milkRate/10 * minutes;
			//Factor in current milkMultiplier
			mLsGained *= (milkMultiplier)/100;
			//Great. Now figure out how much fullness that adds.
			var fullnessDelta:Number = mLsGained / milkCapacity() * 100;
			
			milkFullnessAdd(fullnessDelta);
			
			//trace("Breast milk produced: " + mLsGained + ", Fullness: " + milkFullness + " Total mLs Held: " + milkQ(99) + ", Max mLs: " + milkCapacity() + " Delta: " + fullnessDelta);
			return mLsGained;
		}
		public function milkFullnessAdd(fullnessDelta:Number = 0, bNote:Boolean = true): Number
		{
			// No change
			if(fullnessDelta == 0) return milkFullness;
			// Negative delta means milked!
			if(fullnessDelta < 0) return milked(Math.abs(fullnessDelta), false);
			
			if(bNote && this is PlayerCharacter)
			{
				//75% fullness notification
				if(milkFullness < 75 && (milkFullness + fullnessDelta >= 75)) createStatusEffect("Pending Gain Milk Note: 75");
				//100% notification!
				if(milkFullness < 100 && (milkFullness + fullnessDelta >= 100)) createStatusEffect("Pending Gain Milk Note: 100");
			}

			//If we're going above 100.
			if(fullnessDelta + milkFullness > 100)
			{
				//If we start below 100, do that normally first
				if(milkFullness < 100)
				{
					var subHundredFullness:Number = 100 - milkFullness;
					milkFullness = 100;
					fullnessDelta -= subHundredFullness;
				}
				if(bNote && this is PlayerCharacter)
				{
					//150%
					if(milkFullness < 150 && (milkFullness + (fullnessDelta/2) >= 150)) createStatusEffect("Pending Gain Milk Note: 150");
					//200%
					if(milkFullness < 200 && (milkFullness + (fullnessDelta/2) >= 200)) createStatusEffect("Pending Gain Milk Note: 200");
				}
				//Grow at half rate since we're over 100
				milkFullness += (fullnessDelta/2);
			}
			//Not going above 100? Just add it
			else milkFullness += fullnessDelta;

			//Just check to make sure there's a cap for top end and bottom end
			if(milkFullness > milkFullnessMax()) milkFullness = milkFullnessMax();
			else if(milkFullness < milkFullnessMin()) {
				//trace("ERROR: Flash sucks dicks at math and somehow got a negative milk fullness.");
				milkFullness = milkFullnessMin();
			}
			
			return milkFullness;
		}
		public function milkFillToCapacity(fullnessDelta:Number = 0, fullnessMax:Number = 100, bNote:Boolean = true): Number
		{
			// fullnessDelta is the fullness percentage to be added.
			// fullnessMax is the maximum capacity to fill to if addition is under.
			// If wrong parameters.
			if(fullnessMax <= 0) return milkFullnessAdd(fullnessMax, bNote);
			if(fullnessDelta <= 0 || fullnessDelta >= fullnessMax) return milkFullnessAdd(fullnessMax, bNote);
			
			// Set minimum first.
			if(milkFullness < milkFullnessMin()) milkFullness = milkFullnessMin();
			
			if((milkFullness + fullnessDelta) <= fullnessMax) fullnessDelta = (fullnessMax - milkFullness);
			
			return milkFullnessAdd(fullnessDelta, bNote);
		}
		public function milkCapacity(arg:int = -1):Number
		{
			//400mLs + breastRating/2*100
			var capacity:Number = 0;
			//if arg == -1, mLs produced by biggest row.
			if(arg == -1)
			{
				capacity = (400 + (breastRows[biggestTitRow()].breastRatingRaw + breastRows[biggestTitRow()].breastRatingHoneypotMod) / 2 * 100) * milkStorageMultiplier;
			}
			//if arg == 99, total mLs produced by all rows
			else if(arg == 99)
			{
				//Total it up!
				for(var x:int = 0; x < breastRows.length; x++)
				{
					capacity += (400 + (breastRows[x].breastRatingRaw + breastRows[x].breastRatingHoneypotMod)/ 2 * 100);
				}
				capacity *= milkStorageMultiplier;
			}
			//otherwise, mLs produced by arg # row.
			else
			{
				if(arg < 0 || arg >= breastRows.length) return 0;
				else capacity = (400 + (breastRows[arg].breastRatingRaw + breastRows[arg].breastRatingHoneypotMod)/ 2 * 100) * milkStorageMultiplier;
			}
			return capacity;
		}
		public function milkQ(arg:int = -1):Number {
			return lactationQ(arg);
		}
		public function lactationQ(arg:int = -1): Number {
			if (hasPerk("Fixed MilkQ")) return perkv1("Fixed MilkQ");
			var total:Number = 0;
			//So much easier now - just a quick lookup.
			var fullness:Number = milkFullness;
			//Arg -1 = amount from biggest tits.
			if(arg == -1) total += fullness/100 * milkCapacity();
			//Arg 99 = amount from all tits
			else if(arg == 99)
			{
				//Total it up!
				for(var x:int = 0; x < breastRows.length; x++)
				{
					//trace("Row " + x + " mLs: " + (fullness * milkCapacity(x)));
					total += fullness/100 * milkCapacity(x);
				}
				//trace("MilkQ total: " + total);
			}
			//Specific row
			else if(arg >= 0 && arg < breastRows.length)
			{
				total += fullness/100 * milkCapacity(arg);
			}
			if (hasPerk("Ever-Milk") && total < perkv1("Ever-Milk")) total = perkv1("Ever-Milk");
			//Failsafe:
			return total;
		}
		public function boostCum(amount:Number = 1):void
		{
			var total:* = amount;
			var potent:Boolean = hasPerk("Potent");
			//Loop through one at a time!
			while(total > 0)
			{
				total--;
				amount = 1;
			
				if(cumMultiplierRaw > 10 && !potent) amount /= 2;
				if(cumMultiplierRaw > 50 && !potent) amount /= 2;
				if(cumMultiplierRaw > 75 && !potent) amount /= 2;
				if(cumMultiplierRaw > 100) amount /= 2;

				//Efficiency is always 3x Multiplier
				ballEfficiency += amount * 3;
				cumMultiplierRaw += amount;
				//Boost efficiency more if behind
				if(cumMultiplierRaw* 3 > ballEfficiency)
				{
					ballEfficiency += amount * 2;
					if(cumMultiplierRaw* 3 > ballEfficiency) ballEfficiency += amount * 2;
				}
				//Boost multiplier if way too low.
				else if(cumMultiplierRaw * 4 < ballEfficiency)
				{
					cumMultiplierRaw += amount;
					if(cumMultiplierRaw * 4 < ballEfficiency) cumMultiplierRaw += amount;
				}
			}
		}
		public function boostLactation(amount:Number = 1, bNote:Boolean = true):void
		{
			//Record this for tracking change
			var originalMultiplier:Number = milkMultiplier;
			//If below 100...
			if(milkMultiplier < 100) {
				//If we cross 100 threshold, set to 100 & go for slow grow.
				if(milkMultiplier + amount > 100) 
				{
					amount = 100 - milkMultiplier;
					milkMultiplier = 100;
				}
				//Otherwise add it up and zero out amount.
				else {
					milkMultiplier += amount;
					amount = 0;
				}
			}
			//Milk multiplier is over 100... slow gro.
			if(amount > 0)
			{
				if(milkMultiplier < 110) milkMultiplier += (amount/2);
				else if(milkMultiplier < 125) milkMultiplier += (amount/5);
				else milkMultiplier += (amount/10);
			}
			//Queue threshold notes!
			if(bNote && this is PlayerCharacter)
			{
				if(originalMultiplier < 30 && milkMultiplier >= 30) createStatusEffect("Pending Gain MilkMultiplier Note: 30");
				if(originalMultiplier < 40 && milkMultiplier >= 40) createStatusEffect("Pending Gain MilkMultiplier Note: 40");
				if(originalMultiplier < 50 && milkMultiplier >= 50) createStatusEffect("Pending Gain MilkMultiplier Note: 50");
				if(originalMultiplier < 60 && milkMultiplier >= 60) createStatusEffect("Pending Gain MilkMultiplier Note: 60");
				if(originalMultiplier < 70 && milkMultiplier >= 70) createStatusEffect("Pending Gain MilkMultiplier Note: 70");
				if(originalMultiplier < 80 && milkMultiplier >= 80) createStatusEffect("Pending Gain MilkMultiplier Note: 80");
				if(originalMultiplier < 90 && milkMultiplier >= 90) createStatusEffect("Pending Gain MilkMultiplier Note: 90");
				if(originalMultiplier < 100 && milkMultiplier >= 100) createStatusEffect("Pending Gain MilkMultiplier Note: 100");
				if(originalMultiplier < 110 && milkMultiplier >= 110) createStatusEffect("Pending Gain MilkMultiplier Note: 110");
				if(originalMultiplier < 125 && milkMultiplier >= 125) createStatusEffect("Pending Gain MilkMultiplier Note: 125");
			}
		}
		//PC has been milked for "amount" fullness.
		public function milked(amount:Number = 50, mLs:Boolean = false):Number
		{
			// if mLs to approx % conversion
			if(mLs)
			{
				var fluidVolume:Number = milkQ();
				var fluidAmount:Number = amount;
				amount = ((fluidAmount / fluidVolume) * 100);
			}
			
			if(hasPerk("Milky")) amount *= 1.5;
			//Boost lactation by a relevant amount
			if(milkMultiplier < 125) boostLactation(1 + Math.round(amount/50));

			//Actually reduce held milk
			milkFullness -= amount;
			//Set boob swelling to new appropriate tier
			//trace("Milk fullness: " + milkFullness);
			if(milkFullness < milkFullnessMin()) milkFullness = milkFullnessMin();
			//Honeypot reduction!
			for(var bb:int = 0; bb < bRows(); bb++)
			{
				breastRows[bb].breastRatingHoneypotMod = breastRows[bb].breastRatingHoneypotMod - (Math.round(breastRows[bb].breastRatingHoneypotMod * (amount / 100)));
				if(breastRows[bb].breastRatingHoneypotMod < 0) breastRows[bb].breastRatingHoneypotMod = 0;
			}
			setBoobSwelling();
			return milkFullness;
		}
		public function milkFullnessMin(): Number
		{
			var bonus:int = 0;
			if(hasPerk("Mega Milk")) bonus += Math.max(perkv1("Mega Milk"), 40);
			return bonus;
		}
		public function milkFullnessMax(): Number
		{
			var bonus:int = 0;
			// Vanae milk just caps at 100.
			if(InCollection(milkType, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK)) return 100 + bonus;
			return 200 + bonus;
		}
		public function setBoobSwelling():void
		{
			var x:int;
			//No swelling!
			if(milkFullness < 75) 
			{
				//Reset swelling
				for(x = 0; x < bRows(); x++)
				{
					breastRows[x].breastRatingLactationMod = 0;
				}
			}
			//75 - 99
			else if(milkFullness < 100)
			{
				for(x = 0; x < bRows(); x++)
				{
					if(breastRows[x].breastRatingRaw >= 5) breastRows[x].breastRatingLactationMod = 1.5;
					else breastRows[x].breastRatingLactationMod = 1;
				}
			}
			//100 - 149
			else if(milkFullness < 150)
			{
				for(x = 0; x < bRows(); x++)
				{
					if(breastRows[x].breastRatingRaw >= 5) breastRows[x].breastRatingLactationMod = 2.5;
					else breastRows[x].breastRatingLactationMod = 1.5;
				}
			}
			else if(milkFullness < 200)
			{
				for(x = 0; x < bRows(); x++)
				{
					if(breastRows[x].breastRatingRaw >= 5) breastRows[x].breastRatingLactationMod = 3.5;
					else breastRows[x].breastRatingLactationMod = 2;
				}
			}
			else
			{
				for(x = 0; x < bRows(); x++)
				{
					if(breastRows[x].breastRatingRaw >= 5) breastRows[x].breastRatingLactationMod = 4.5;
					else breastRows[x].breastRatingLactationMod = 3;
				}
			}
		}
		//Body Type
		public function bodyType(): String {
			var desc: String = "";
			//SUPAH THIN
			if (thickness < 10) {
				//SUPAH BUFF
				if (tone > 90) desc += "a lithe body covered in highly visible muscles";
				else if (tone > 75) desc += "an incredibly thin, well-muscled frame";
				else if (tone > 50) desc += "a very thin body that has a good bit of muscle definition";
				else if (tone > 25) desc += "a lithe body and only a little bit of muscle definition";
				else desc += "a waif-thin body, and soft, forgiving flesh";
			}
			//Pretty thin
			else if (thickness < 25) {
				if (tone > 90) desc += "a thin body and incredible muscle definition";
				else if (tone > 75) desc += "a narrow frame that shows off your muscles";
				else if (tone > 50) desc += "a somewhat lithe body and a fair amount of definition";
				else if (tone > 25) desc += "a narrow, soft body that still manages to show off a few muscles";
				else desc += "a thin, soft body";
			}
			//Somewhat thin
			else if (thickness < 40) {
				if (tone > 90) desc += "a fit, somewhat thin body and rippling muscles all over";
				else if (tone > 75) desc += "a thinner-than-average frame and great muscle definition";
				else if (tone > 50) desc += "a somewhat narrow body and a decent amount of visible muscle";
				else if (tone > 25) desc += "a moderately thin body, soft curves, and only a little bit of muscle";
				else desc += "a fairly thin form and soft, cuddle-able flesh";
			}
			//average
			else if (thickness < 60) {
				if (tone > 90) desc += "average thickness and a bevy of perfectly defined muscles";
				else if (tone > 75) desc += "an average-sized frame and great musculature";
				else if (tone > 50) desc += "a normal waistline and decently visible muscles";
				else if (tone > 25) desc += "an average body and soft, unremarkable flesh";
				else desc += "an average frame and soft, untoned flesh with a tendency for jiggle";
			} else if (thickness < 75) {
				if (tone > 90) desc += "a somewhat thick body that’s covered in slabs of muscle";
				else if (tone > 75) desc += "a body that’s a little bit wide and has some highly-visible muscles";
				else if (tone > 50) desc += "a solid build that displays a decent amount of muscle";
				else if (tone > 25) desc += "a slightly wide frame that displays your curves and has hints of muscle underneath";
				else desc += "a soft, plush body with plenty of jiggle";
			} else if (thickness < 90) {
				if (tone > 90) desc += "a thickset frame that gives you the appearance of a wall of muscle";
				else if (tone > 75) desc += "a burly form and plenty of muscle definition";
				else if (tone > 50) desc += "a solid, thick frame and a decent amount of muscles";
				else if (tone > 25) desc += "a wide-set body, some soft, forgiving flesh, and a hint of muscle underneath it";
				else {
					desc += "a wide, cushiony body";
					if (hasVagina() || biggestTitSize() > 3 || hipRating() > 7 || buttRating() > 7) desc += " and plenty of jiggle on your curves";
				}
			}
			//Chunky monkey
			else {
				if (tone > 90) desc += "an extremely thickset frame and so much muscle others would find you harder to move than a huge boulder";
				else if (tone > 75) desc += "a very wide body and enough muscle to make you look like a tank";
				else if (tone > 50) desc += "an extremely substantial frame packing a decent amount of muscle";
				else if (tone > 25) {
					desc += "a very wide body";
					if (hasVagina() || biggestTitSize() > 4 || hipRating() > 10 || buttRating() > 10) desc += ", lots of curvy jiggles,";
					desc += " and hints of muscle underneath";
				} else {
					desc += "a thick";
					if (hasVagina() || biggestTitSize() > 4 || hipRating() > 10 || buttRating() > 10) desc += ", voluptuous";
					desc += " body and plush, ";
					if (hasVagina() || biggestTitSize() > 4 || hipRating() > 10 || buttRating() > 10) desc += " jiggly curves";
					else desc += " soft flesh";
				}
			}
			return desc;
		}
		
		public var cumMultiplierRaw:Number = 1;
		public var cumMultiplierMod:Number = 0;
		public function cumMultiplier():Number
		{
			var multi:Number = cumMultiplierRaw + cumMultiplierMod;
			var bonus:Number = 0;
			bonus += perkv1("Potent");
			bonus += statusEffectv2("Priapin");
			multi += bonus;
			if (multi < 0) return 0;
			return multi;
		}
		
		public var girlCumMultiplierRaw:Number = 1;
		public var girlCumMultiplierMod:Number = 0;
		public function girlCumMultiplier(arg:Number = 0):Number
		{
			if(arg != 0) girlCumMultiplierRaw += arg;
			var multi:Number = girlCumMultiplierRaw + girlCumMultiplierMod;
			var bonus:Number = 0;
			multi += bonus;
			if (multi < 0) return 0;
			return multi;
		}

		//Calculate cum return
		public function cumQ(): Number {
			if (hasPerk("Fixed CumQ")) return perkv1("Fixed CumQ");
			if (cocks.length <= 0) return 0;
			var quantity: Number = 0;
			//lust - 50% = normal output. 0 = 75%. 100 = +125% output.
			var lustCoefficient: Number = ((lust() / 2) + 75) / 100;
			quantity = cumMultiplier() * lustCoefficient * maxCum() / ballEfficiency;
			//Rut means bigger, ball-draining orgasms.
			if (inRut()) quantity *= 1.5;
			if (quantity > currentCum()) quantity = currentCum();
			//Round dat shit.
			quantity = Math.round(quantity / 10) * 10;
			if (quantity < 2) quantity = 2;
			//Super high refractory raises minimum.
			if (refractoryRate >= 3 && quantity < 5) quantity = 15;
			else if (refractoryRate >= 5 && quantity < 8) quantity = 30;
			else if (refractoryRate >= 8 && quantity < 10) quantity = 50;
			else if (refractoryRate >= 10 && quantity < 15) quantity = 100;
			else if (refractoryRate >= 15 && quantity < 20) quantity = 251;
			else if (refractoryRate >= 20 && quantity < 30) quantity = 1000;
			else if (refractoryRate >= 30 && quantity < 1500) quantity = 1500;
			if (hasPerk("Treated Readiness") && quantity < 200) quantity = 200;
			if (hasPerk("Amazonian Virility") && quantity < 300) quantity = 300;
			if (statusEffectv3("Rut") > quantity) quantity = statusEffectv3("Rut");
			if (statusEffectv3("Lagonic Rut") > quantity) quantity = statusEffectv3("Lagonic Rut");
			//OPAL RING BOOOST
			if(hasOpalRingCock()) 
			{
				quantity *= 1.5;
				quantity += 1000;
			}

			//You can't cum more than you can possibly have!
			if(quantity > maxCum()) quantity = maxCum();
			//Overloaded nuki' nuts will fully drain
			if(hasPerk("'Nuki Nuts") && balls > 0 && perkv1("'Nuki Nuts") > 0 && quantity < currentCum()) quantity = currentCum();
			//BIOMASS ADDED LAST!
			if(statusEffectv1("Goo Vent") == 1) quantity += biomassQ(true);
			if(quantity < perkv1("MinCumQ")) quantity = perkv1("MinCumQ");
			trace("Total produced: " + quantity);
			return quantity;
		}
		//Can hold about three average shots worth, since this is fantasy.
		public function maxCum(raw:Boolean = false): Number {
			if (cocks.length <= 0) return 0;
			var quantity: Number = 0;
			//Base value is ballsize*ballQ*cumefficiency by a factor of 2.
			//Other things that affect it: 
			//lust - 50% = normal output. 0 = 75%. 100 = +125% output.
			var lustCoefficient: Number = (lust() / 2 + 75) / 100;

			//Figure on 3x a cumshot value?
			if (balls == 0) quantity = Math.round(ballSize() * 2 * 2 * ballEfficiency);
			else quantity = Math.round(ballSize() * ballSize() * balls * 2 * ballEfficiency);

			//Overriiiide for stuff
			if(!raw)
			{
				if(statusEffectv3("Rut") > quantity) quantity = statusEffectv3("Rut");
				if(statusEffectv3("Lagonic Rut") > quantity) quantity = statusEffectv3("Lagonic Rut");
				if(hasOpalRingCock()) 
				{
					quantity *= 2;
					quantity += 3000;
				}
			}
			return quantity;
		}
		public function currentCum(): Number {
			if(isNaN(ballFullness)) 
			{
				trace("ERROR: ballFullness is not a number. This has been rectified.");
				ballFullness = 0;
			}
			return Math.round(maxCum() * ballFullness/100);
		}

		public function cumProduced(minutes: Number, doOut:Boolean = true):void {
			var cumDelta:Number = 0;
			var subDelta:Number = 0;
			var cumCascade:Boolean = (balls > 0 && hasPerk("'Nuki Nuts") && hasStatusEffect("Cum Cascade"));
			//trace("MINUTES OF CUM CHARGING: " + minutes + " FULLNESS: " + ballFullness);
			if(isNaN(ballFullness)) 
			{
				trace("ERROR: ballFullness is not a number. This has been rectified.");
				ballFullness = 0;
			}
			
			// Why is this a loop? Just mul the final thing by total minutes. If we were firing events off that needed to be queued, or if the calculation depended on a value the algo actually changes (ie ballFullness was a part of the calc) then yeah, cycle minutes would be the /simple/ way to do it.
			cumDelta = refractoryRate / 60 * 2; // No balls == replace with 2 for purposes of the calc
			if(hasPerk("Breed Hungry")) cumDelta *= 2;
			
			//After 60% fullness, cut gains in half.
			if(ballFullness >= 60)
			{
				cumDelta /= 2;
			}
			//Crossing into 60% fullness? Hit 60, then cut in half.
			if(ballFullness < 60 && (ballFullness + (cumDelta * minutes)) >= 60)
			{
				//Find amount of change needed to hit 60.
				subDelta = 60 - ballFullness;
				//Set fullness to 60 and remove a portion of minutes equivalent to the change
				ballFullness = 60;
				minutes -= subDelta/cumDelta;
				//Half cumDelta for the remaining minutes
				cumDelta /= 2;
			}
			
			var ballFullnessBonus:Number = 0;
			
			if(cumCascade)
			{
				ballFullnessBonus += (statusEffectv2("Cum Cascade") / maxCum() * 500);
				cumDelta *= 5;
			}
			
			//Just hit full balls!
			if(balls > 0 && (ballFullness + ballFullnessBonus + (cumDelta * minutes)) >= 100 && ballFullness < 100 && this is PlayerCharacter)
			{
				trace("BLUE BALLS FOR: " + short);
				//Hit max cum - standard message
				var m:String = ParseText("You’re feeling a little... excitable, a little randy even. It won’t take much to excite you so long as your [pc.balls] " + (balls == 1? "is" : "are") + " this full.");
				if(hasPerk("'Nuki Nuts"))
				{
					if(balls == 1)
					{
						if(cumCascade) m = ParseText("Your [pc.ballsNoun] has filled so much from your cum cascade that it’s started to swell. It won’t take much to excite you so long as your [pc.balls] is this full.");
						else m += " Of course, your kui-tan physiology will let your sack swell with additional seed. It’s already started to swell. Just make sure to empty it before it gets too big!";
					}
					else
					{
						if(cumCascade) m = ParseText("Your [pc.ballsNoun] have filled so much from your cum cascade that they’ve started to swell. It won’t take much to excite you so long as your [pc.balls] are this full.");
						else m += " Of course, your kui-tan physiology will let your balls balloon with additional seed. They’ve already started to swell. Just make sure to empty them before they get too big!";
					}
				}
				AddLogEvent(m, "words", minutes);
				applyBlueBalls(true);
			}
			
			ballFullness += ballFullnessBonus + (cumDelta * minutes);
			
			//trace("AFTER FULLNESS: " + ballFullness);
			if (ballFullness >= 100) 
			{
				if(hasPerk("'Nuki Nuts") && balls > 0 && (this is PlayerCharacter || this is Ardia))
				{
					//Figure out a % of normal size to add based on %s.
					var nutChange:Number = (ballFullness/100) - 1;
					//Get the actual bonus number to add. Keep it to 2 decimals.
					var nutBonus:Number = Math.round(ballSizeRaw * nutChange * 100)/100;
					//FEN NOTE: I cut this from reductPro, but leaving the comment in case we change our mind about it.
					//if (hasStatusEffect("Slow Grow")) nutBonus = Math.round(nutBonus * statusEffectv1("Slow Grow") * 100) / 100;
					if (hasStatusEffect("No Grow")) nutBonus *= 0;
					trace("NUT BONUS: " + nutBonus);
					//Apply nutbonus and track in v1 of the perk
					ballSizeMod += nutBonus;
					addPerkValue("'Nuki Nuts",1,nutBonus);
				}
				ballFullness = 100;
			}
			//if(this is PlayerCharacter) trace("Post Fullness: " + ballFullness)
		}
		public function isSquirter(arg: int = -1): Boolean {
			if (vaginas.length <= 0) return false;
			if (arg > (vaginas.length - 1)) return false;
			if (hasStatusEffect("Soak")) return true;
			if (arg < 0)
			{
				if(wettestVaginalWetness() >= 4 || hasOpalRingVagina()) return true;
				return false;
			}
			if (vaginas[arg].wetness() >= 4 || hasOpalRingVagina()) return true;
			return false;
		}
		//Placeholder
		public function girlCumQ(arg: int = -1):Number
		{
			if (hasPerk("Fixed GirlCumQ")) return perkv1("Fixed GirlCumQ");
			if (vaginas.length <= 0) return 0;
			var quantity: Number = 0;
			// lust - 50% = normal output. 0 = 75%. 100 = +125% output.
			var lustCoefficient: Number = ((lust() / 2) + 75) / 100;
			var tempGirlCumMultiplier: Number = girlCumMultiplier();
			var girlCumAmount: Number = 0;
			var squirterBonus: Number = 0;
			// For targetting a specific vagina, otherwise it's all inclusive.
			if (arg < 0)
			{
				for (arg = 0; arg < vaginas.length; arg++)
				{
					tempGirlCumMultiplier += vaginas[arg].wetness();
					if (isSquirter(arg)) squirterBonus += vaginas[arg].wetness();
					girlCumAmount++;
				}
			}
			else
			{
				tempGirlCumMultiplier += vaginas[arg].wetness();
				if (isSquirter(arg)) squirterBonus += vaginas[arg].wetness();
				girlCumAmount++;
			}
			// Scale values.
			girlCumAmount *= 5; // 5 ml produced per vagina
			squirterBonus *= 10; // extra 10 mL produced per extra squirter bonus
			// Estimate initial quantity.
			quantity = tempGirlCumMultiplier * lustCoefficient * (girlCumAmount + squirterBonus);
			// Heat means wetter orgasms.
			if(inHeat()) quantity *= 1.5;
			//Soak is double multiplier!
			if(hasStatusEffect("Soak")) quantity *= 2;
			if(hasPerk("Treated Readiness")) quantity *= 2;
			if(hasOpalRingVagina()) 
			{
				quantity *= 2;
				quantity += 1000;
			}
			//GOO VENT BONUS!
			if(statusEffectv1("Goo Vent") == 1) quantity += biomassQ(true);
			// Round values.
			quantity = Math.round(quantity / 10) * 10;
			trace("Girl-cum produced: " + quantity);
			// Default minimum of 1mL
			if (quantity < 1) quantity = 1;
			return quantity;
		}
		public function hasOpalRingCock():Boolean
		{
			for(var i:int = 0; i < cocks.length; i++)
			{
				if(cocks[i].piercing is OpalRingPiercing) return true;
			}
			return false;
		}
		public function hasOpalRingVagina():Boolean
		{
			for(var i:int = 0; i < vaginas.length; i++)
			{
				if(vaginas[i].piercing is OpalRingPiercing) return true;
				if(vaginas[i].clitPiercing is OpalRingPiercing) return true;
			}
			return false;
		}
		public function boostGirlCum(arg:Number):void
		{
			while(arg > 0)
			{
				if(girlCumMultiplier() < 100) girlCumMultiplier(4);
				else if(girlCumMultiplier() < 500) girlCumMultiplier(3);
				else if(girlCumMultiplier() < 1000) girlCumMultiplier(2);
				else if(girlCumMultiplier() < 5000) girlCumMultiplier(1);
				else girlCumMultiplier(0.5);
				arg -= 2;
			}
		}
		public function biomassQ(perGenital:Boolean = false): Number
		{
			if(this is PlayerCharacter && flags["GOO_BIOMASS"] == undefined) flags["GOO_BIOMASS"] = 0;
			
			var gooBiomass:Number = (this is PlayerCharacter ? flags["GOO_BIOMASS"] : 0);
			
			var numGenital:int = 0;
			if(hasCock()) numGenital++;
			if(hasVagina()) numGenital++;
			
			if(perGenital)
			{
				if(numGenital != 0) return Math.round(gooBiomass / numGenital);
				return 0;
			}
			return gooBiomass;
		}
		public function totalClits(): Number {
			if (vaginas.length <= 0) return 0;
			if (clitLength <= 0) return 0;
			var count: int = 0;
			
			for (var x:int = 0; x < vaginas.length; x++)
			{
				count += vaginas[x].clits;
			}
			
			return count;
		}
		public function hasClit():Boolean
		{
			return totalClits() > 0;
		}
		public function findFirstOfcType(type: Number = 0): Number {
			var index: Number = -1;
			while (++index < cocks.length) {
				if (cocks[index].cType == type) return index;
			}
			trace("creature.findFirstOfcType ERROR - searched for cType: " + type + " and could not find it.");
			return -1;
		}
		//How many cocks?
		//Expanded to use an argument and replace horseCocks(), dogCocks(), etc.
		public function cockTotal(type: int = -1): Number {
			if (type == -1) return (cocks.length);
			var counter: int = 0;
			for (var x: int = 0; x < cocks.length; x++) {
				if (cocks[x].cType == type) counter++;
			}
			return counter;
		}
		//Alternate
		public function totalCocks(type: int = -1): Number {
			return cockTotal(type);
		}
		public function vaginaTotal(type: int = -1): Number {
			if (type == -1) return (vaginas.length);
			var counter: int = 0;
			for (var x: int = 0; x < vaginas.length; x++) {
				if (vaginas[x].type == type) counter++;
			}
			return counter;
		}
		public function totalVaginas(type: int = -1): Number {
			return vaginaTotal(type);
		}
		//BOolean alternate
		public function hasCock(type:int = -1):Boolean {
			if (type == -1 && cocks.length > 0) return true;
		
			for (var i:int = 0; i < cocks.length; i++)
			{
				if ((cocks[i] as CockClass).cType == type) return true;
			}
			
			return false;
		}
		
		public function hasCocks(): Boolean {
			if (cocks.length > 1) return true;
			return false;
		}
		
		public function hasVaginas():Boolean
		{
			return vaginas.length > 1;
		}

		public function hasGenitals():Boolean
		{
			return (hasCock() || hasVagina());
		}
		public function isHerm():Boolean
		{
			return (hasCock() && hasVagina());
		}
		public function totalGenitals():Number
		{
			return (cocks.length + vaginas.length);
		}
		public function genitalCount():Number
		{
			return totalGenitals();
		}
		public function hasTail(tType:Number = 0): Boolean
		{
			if (tailCount > 0 && tailType != GLOBAL.TYPE_HUMAN)
			{
				// Specific type
				if (tType > 0 && tType == tailType) return true;
				// Any type
				if (tType == 0) return true;
			}
			return false;
		}
		public function hasTails(tType:Number = 0): Boolean
		{
			if (tailCount > 1 && tailType != GLOBAL.TYPE_HUMAN)
			{
				// Specific type
				if (tType > 0 && tType == tailType) return true;
				// Any type
				if (tType == 0) return true;
			}
			return false;
		}
		public function removeTails():void
		{
			tailType = GLOBAL.TYPE_HUMAN;
			tailCount = 0;
			clearTailFlags();
			removeTailGenitals();
			return;
		}
		public function removeTailGenitals():void
		{
			tailGenital = GLOBAL.TAIL_GENITAL_NONE;
			tailGenitalArg = 0;
			tailGenitalColor = "";
			if(this is PlayerCharacter)
			{
				if(flags["CUNT_TAIL_PREGNANT_TIMER"] != undefined) flags["CUNT_TAIL_PREGNANT_TIMER"] = undefined;
				if(flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined) flags["DAYS_SINCE_FED_CUNT_TAIL"] = undefined;
				if(flags["TIMES_FED_CUNT_SNAKE"] != undefined) flags["TIMES_FED_CUNT_SNAKE"] = undefined;
			}
			return;
		}
		public function hasParasiteTail(typeOnly:Boolean = false): Boolean {
			if(tailCount > 0)
			{
				if(InCollection(tailType, GLOBAL.TYPE_CUNTSNAKE, GLOBAL.TYPE_COCKVINE)) return true;
				if(!typeOnly && hasTailFlag(GLOBAL.FLAG_TAILCUNT) && tailGenital == GLOBAL.TAIL_GENITAL_NONE) return true;
				if(!typeOnly && hasTailFlag(GLOBAL.FLAG_TAILCOCK) && tailGenital == GLOBAL.TAIL_GENITAL_NONE) return true;
			}
			return false;
		}
		public function hasTailGenital(gType:int = 0): Boolean {
			return (hasTailCock(gType) || hasTailCunt(gType));
		}
		public function hasTailCock(gType:int = 0): Boolean {
			if(tailCount > 0)
			{
				if(tailType == GLOBAL.TYPE_COCKVINE || hasTailFlag(GLOBAL.FLAG_TAILCOCK))
				{
					if(gType == 0) return true;
					else if(gType == tailGenitalArg) return true;
				}
			}
			return false;
		}
		public function hasCockTail(gType:int = 0): Boolean {
			return hasTailCock(gType);
		}
		public function hasTailgina(gType:int = 0): Boolean {
			return hasTailCunt(gType);
		}
		public function hasCuntTail(gType:int = 0): Boolean {
			return hasTailCunt(gType);
		}
		public function hasTailCunt(gType:int = 0): Boolean {
			if(tailCount > 0)
			{
				if(tailType == GLOBAL.TYPE_CUNTSNAKE || hasTailFlag(GLOBAL.FLAG_TAILCUNT))
				{
					if(gType == 0) return true;
					else if(gType == tailGenitalArg) return true;
				}
			}
			return false;
		}
		//In case there's ever different types of cuntTails available, we'll need different methods.
		public function hasCuntSnake(): Boolean {
			return (hasParasiteTail() && hasTailCunt()); // I hope there would not be any other parasitic tailcunts...
		}
		public function hasParasiteTailCock(): Boolean {
			return (hasParasiteTail() && hasTailCock());
		}
		public function tailVaginaCapacity(): Number {
			return tailCuntCapacity();
		}
		public function tailCuntCapacity(): Number {
			if (!hasTailCunt()) return 0;
			if (biggestVaginalCapacity() > 300) return biggestVaginalCapacity();
			return 100;
		}
		public function tentacleCockCount(addWings:Boolean=false,excludedIndexes: Array = null):Number
		{
			var tentacleDicks:Number = 0;
			var counter: Number = cocks.length;
			//add back genitals to the count
			if (addWings && hasBackGenitals()) tentacleDicks += wingCount;
				
			while (counter > 0) {
				counter--;
				//Check if this index location is excluded
				if(excludedIndexes != null && excludedIndexes.indexOf(counter) != -1)
				{
					//skip
				}
				else if (cocks[counter].cType == GLOBAL.TYPE_TENTACLE) tentacleDicks++;
			}	
			return tentacleDicks;
		}
		public function cockCanSting(idx:int = -1): Boolean
		{
			if(idx < 0)
			{
				if(hasACockFlag(GLOBAL.FLAG_STINGER_BASED)) return true;
				if(hasACockFlag(GLOBAL.FLAG_STINGER_TIPPED)) return true;
				if(hasCock(GLOBAL.TYPE_SIREN)) return true;
				if(hasCock(GLOBAL.TYPE_ANEMONE)) return true;
			}
			if(idx >= 0 && idx < cocks.length)
			{
				if(hasCockFlag(GLOBAL.FLAG_STINGER_BASED, idx)) return true;
				if(hasCockFlag(GLOBAL.FLAG_STINGER_TIPPED, idx)) return true;
				if(InCollection(cocks[idx].cType, [GLOBAL.TYPE_SIREN, GLOBAL.TYPE_ANEMONE])) return true;
			}
			return false;
		}
		public function vaginaCanSting(idx:int = -1): Boolean
		{
			if(idx < 0)
			{
				if(hasAVaginaFlag(GLOBAL.FLAG_STINGER_BASED)) return true;
				if(hasAVaginaFlag(GLOBAL.FLAG_STINGER_TIPPED)) return true;
				if(hasVaginaType(GLOBAL.TYPE_SIREN)) return true;
				if(hasVaginaType(GLOBAL.TYPE_ANEMONE)) return true;
			}
			if(idx >= 0 && idx < vaginas.length)
			{
				if(hasVaginaFlag(GLOBAL.FLAG_STINGER_BASED, idx)) return true;
				if(hasVaginaFlag(GLOBAL.FLAG_STINGER_TIPPED, idx)) return true;
				if(InCollection(vaginas[idx].type, [GLOBAL.TYPE_SIREN, GLOBAL.TYPE_ANEMONE])) return true;
			}
			return false;
		}
		public function vaginaCanSuck(idx:int = -1): Boolean
		{
			if(isTreated() && hasVagina()) return true;
			if(idx < 0)
			{
				if(hasVaginaType(GLOBAL.TYPE_GABILANI)) return true;
				if(hasVaginaType(GLOBAL.TYPE_MOUTHGINA)) return true;
			}
			if(idx >= 0 && idx < vaginas.length)
			{
				if(InCollection(vaginas[idx].type, [GLOBAL.TYPE_GABILANI, GLOBAL.TYPE_MOUTHGINA])) return true;
			}
			return false;
		}
		public function vaginaHasFeelers(idx:int = -1): Boolean
		{
			if(idx < 0)
			{
				if(hasAVaginaFlag(GLOBAL.FLAG_NUBBY)) return true;
				if(hasAVaginaFlag(GLOBAL.FLAG_STINGER_BASED)) return true;
				if(hasVaginaType(GLOBAL.TYPE_VANAE)) return true;
				if(hasVaginaType(GLOBAL.TYPE_SHARK)) return true;
				if(hasVaginaType(GLOBAL.TYPE_SIREN)) return true;
			}
			if(idx >= 0 && idx < vaginas.length)
			{
				if(hasVaginaFlag(GLOBAL.FLAG_NUBBY, idx)) return true;
				if(hasVaginaFlag(GLOBAL.FLAG_STINGER_BASED, idx)) return true;
				if(InCollection(vaginas[idx].type, [GLOBAL.TYPE_VANAE, GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SIREN])) return true;
			}
			return false;
		}
		public function isBald(): Boolean {
			return (hairLength <= 0);
		}
		public function hasHair(): Boolean {
			return (hairLength > 0);
		}
		public function hasLivingHair(): Boolean {
			if (hasHair())
			{
				if (InCollection(hairType, GLOBAL.HAIR_TYPE_TENTACLES, GLOBAL.HAIR_TYPE_GOO, GLOBAL.HAIR_TYPE_PLANT)) return true;
			}
			return false;
		}
		public function hasLivingBeard(): Boolean {
			if (hasBeard())
			{
				if (InCollection(beardType, GLOBAL.HAIR_TYPE_TENTACLES, GLOBAL.HAIR_TYPE_GOO, GLOBAL.HAIR_TYPE_PLANT)) return true;
			}
			return false;
		}
		public function hasSockRoom(): Boolean {
			var index: int = cocks.length;
			while (index > 0) {
				index--;
				if (cocks[index].sock == "") return true;
			}
			return false
		}
		public function hasSock(arg: String = ""): Boolean {
			var index: int = cocks.length;
			while (index > 0) {
				index--;
				if (cocks[index].sock != "") {
					if (arg == "" || cocks[index].sock == arg) return true;
				}
			}
			return false
		}
		//Arg -1 for check for any penis.
		
		public function canAutoFellate(arg: int = 0, lengthOnly:Boolean = false): Boolean {
			if (cocks.length <= 0) return false;
			if (arg >= 0) {
				if (arg >= cocks.length) return false;
				if (!lengthOnly && isFlexible()) return true;
				return (cocks[arg].cLength() >= 1 / 6 * tallness && (hasCockFlag(GLOBAL.FLAG_PREHENSILE, arg) || cocks[arg].cLength() >= tallness * 1 / 3) && genitalLocation() <= 1);
			}
			//Negative is code for see if any can.
			if (!lengthOnly && isFlexible()) return true;
			for (var x: int = 0; x < cocks.length; x++) {
				if (cocks[x].cLength() >= tallness / 6 && (hasCockFlag(GLOBAL.FLAG_PREHENSILE, x) || cocks[x].cLength() >= tallness / 3) && genitalLocation() <= 1)
					return true;
			}
			return false;
		}
		public function canSelfSuck(arg: int = 0, lengthOnly:Boolean = false): Boolean {
			return canAutoFellate(arg, lengthOnly);
		}
		public function aCockToSuck(lengthOnly:Boolean = false): int {
			if (cocks.length <= 0) return -1;
			if (!lengthOnly && isFlexible()) return rand(cocks.length);
			var choices: Array = new Array();
			for (var x: int = 0; x < cocks.length; x++) {
				if (cocks[x].cLength() >= 1 / 6 * tallness && (hasCockFlag(GLOBAL.FLAG_PREHENSILE, x) || cocks[x].cLength() >= tallness * 1 / 3) && genitalLocation() <= 1)
					choices.push(x);
			}
			if (choices.length == 0) return 0;
			return choices[rand(choices.length)];
		}
		public function isFlexible(): Boolean {
			return (hasPerk("Flexibility") || hasStatusEffect("Gel Body"));
		}
		//Change cunt type!
		public function shiftVagina(slot:int = 0, type:int = 0): void {
			if (slot + 1 > vaginas.length) return;
			else if (slot < 0) return;

			//Set type
			vaginas[slot].type = type;

			//Clear flags
			vaginas[slot].clearFlags();

			//Add bonus flags and shit.
			switch (type)
			{
				case GLOBAL.TYPE_HUMAN:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "pink";
					break;
				case GLOBAL.TYPE_EQUINE:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "black";
					vaginas[slot].minLooseness = 2;
					break;
				case GLOBAL.TYPE_BEE:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "black and gold";
					break;
				case GLOBAL.TYPE_NAGA:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "purple";
					break;
				case GLOBAL.TYPE_LIZAN:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = (hasScales() ? scaleColor : "purple");
					if (vaginas[slot].bonusCapacity < 100) vaginas[slot].bonusCapacity = 100;
					break;
				case GLOBAL.TYPE_LEITHAN:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "black";
					break;
				case GLOBAL.TYPE_VANAE:
					vaginas[slot].clits = 2;
					vaginas[slot].vaginaColor = "luminous violet";
					if(vaginas[slot].wetnessRaw < 4) vaginas[slot].wetnessRaw = 4;
					break;
				case GLOBAL.TYPE_KUITAN:
					vaginas[slot].vaginaColor = "black";
					break;
				case GLOBAL.TYPE_SYNTHETIC:
					vaginas[slot].vaginaColor = RandomInCollection(["silver", "gray", "black"]);
					break;
				case GLOBAL.TYPE_LAPINARA:
					vaginas[slot].vaginaColor = RandomInCollection(["pink", "pink", "purple"]);
					break;
				case GLOBAL.TYPE_CANINE:
				case GLOBAL.TYPE_KORGONNE:
					vaginas[slot].clits = 1;
					if(type == GLOBAL.TYPE_KORGONNE) vaginas[slot].vaginaColor = "pale blue";
					else vaginas[slot].vaginaColor = "pink";
					vaginas[slot].wetnessRaw = 3;
					vaginas[slot].minLooseness = 3;
					break;
				case GLOBAL.TYPE_VULPINE:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "black";
					vaginas[slot].wetnessRaw = 2;
					vaginas[slot].minLooseness = 2;
					break;
				case GLOBAL.TYPE_FELINE:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "pink";
					vaginas[slot].wetnessRaw = 1;
					vaginas[slot].minLooseness = 1;
					break;
				case GLOBAL.TYPE_ANEMONE:
				case GLOBAL.TYPE_SIREN:
					vaginas[slot].vaginaColor = RandomInCollection(["blue", "aquamarine"]);
					vaginas[slot].addFlag(GLOBAL.FLAG_STINGER_BASED);
					vaginas[slot].addFlag(GLOBAL.FLAG_STINGER_TIPPED);
					vaginas[slot].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
					break;
				case GLOBAL.TYPE_GABILANI:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = RandomInCollection(["pink", "pink", "aquamarine", "purple"]);
					vaginas[slot].minLooseness = 1;
					vaginas[slot].addFlag(GLOBAL.FLAG_LUBRICATED);
					break;
				case GLOBAL.TYPE_NYREA:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "pink";
					vaginas[slot].wetnessRaw = 2;
					vaginas[slot].addFlag(GLOBAL.FLAG_LUBRICATED);
					break;
				case GLOBAL.TYPE_GRYVAIN:
					vaginas[slot].clits = 6;
					vaginas[slot].vaginaColor = scaleColor;
					vaginas[slot].wetnessRaw = 2;
					vaginas[slot].addFlag(GLOBAL.FLAG_NUBBY);
					break;
				case GLOBAL.TYPE_FROSTWYRM:
				case GLOBAL.TYPE_DRACONIC:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "bluish-pink";
					break;
				case GLOBAL.TYPE_FLOWER:
					vaginas[slot].vaginaColor = RandomInCollection(["red", "yellow", "blue", "purple", "pink", "white"]);
					vaginas[slot].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
					break;
				case GLOBAL.TYPE_DEER:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "black";
					vaginas[slot].minLooseness = 1;
					break;
				case GLOBAL.TYPE_AVIAN:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "pink";
					vaginas[slot].wetnessRaw = 1;
					vaginas[slot].minLooseness = 1;
					break;
				case GLOBAL.TYPE_SHARK:
					vaginas[slot].clits = 2;
					vaginas[slot].vaginaColor = "gray";
					vaginas[slot].wetnessRaw = 1;
					vaginas[slot].minLooseness = 1;
					vaginas[slot].addFlag(GLOBAL.FLAG_LUBRICATED);
					vaginas[slot].addFlag(GLOBAL.FLAG_STINGER_BASED);
					vaginas[slot].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
					break;
				case GLOBAL.TYPE_MOUTHGINA:
					vaginas[slot].clits = 2;
					vaginas[slot].vaginaColor = lipColor;
					vaginas[slot].addFlag(GLOBAL.FLAG_TONGUE);
					break;
				case GLOBAL.TYPE_SWINE:
					vaginas[slot].clits = 1;
					vaginas[slot].vaginaColor = "pink";
					vaginas[slot].addFlag(GLOBAL.FLAG_CORKSCREWED);
					break;
				case GLOBAL.TYPE_BOTHRIOC:
					vaginas[slot].wetnessRaw = 2;
					vaginas[slot].loosenessRaw = 3;
					break;
				case GLOBAL.TYPE_SAURMORIAN:
					inflateVagina(slot);
					vaginas[slot].addFlag(GLOBAL.FLAG_RIBBED);
					break;
			}
		}
		//Change cock type
		public function shiftCock(slot: int = 0, type: int = -1): void {
			if (type == -1) // check if type was not passed, and if so, override with EQUINE
				type = GLOBAL.TYPE_EQUINE;
			if (slot + 1 > cocks.length) return;
			else if (slot < 0) return;

			//Set type
			cocks[slot].cType = type;

			//Clear flags
			cocks[slot].clearFlags();

			//Add bonus flags and shit.
			switch (type)
			{
				case GLOBAL.TYPE_HUMAN:
				case GLOBAL.TYPE_INHUMAN:
				case GLOBAL.TYPE_DZAAN:
					cocks[slot].knotMultiplier = 1;
					if(InCollection(skinTone, "dark", "ebony", "chocolate")) cocks[slot].cockColor = "ebony";
					else cocks[slot].cockColor = "pink";
					break;
				case GLOBAL.TYPE_CANINE:
				case GLOBAL.TYPE_VULPINE:
				case GLOBAL.TYPE_KORGONNE:
					cocks[slot].knotMultiplier = 1.25;
					cocks[slot].cockColor = "bright red";
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					cocks[slot].addFlag(GLOBAL.FLAG_KNOTTED);
					cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
					if(type == GLOBAL.TYPE_KORGONNE) {
						cocks[slot].cType = GLOBAL.TYPE_CANINE;
						cocks[slot].cockColor = "pale blue";
					}
					break;
				case GLOBAL.TYPE_FELINE:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cockColor = "pink";
					cocks[slot].addFlag(GLOBAL.FLAG_NUBBY);
					cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					break;
				case GLOBAL.TYPE_EQUINE:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cockColor = RandomInCollection(["pink", "black", "mottled pink and black"]);
					cocks[slot].addFlag(GLOBAL.FLAG_BLUNT);
					cocks[slot].addFlag(GLOBAL.FLAG_FLARED);
					cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
					break;
				case GLOBAL.TYPE_BEE:
					cocks[slot].cockColor = RandomInCollection(["amber", "black"]);
					cocks[slot].knotMultiplier = 1;
					cocks[slot].addFlag(GLOBAL.FLAG_SMOOTH);
					cocks[slot].addFlag(GLOBAL.FLAG_FORESKINNED);
					break;
				case GLOBAL.TYPE_LIZAN:
				case GLOBAL.TYPE_SNAKE:
				case GLOBAL.TYPE_NAGA:
					cocks[slot].cockColor = "purple";
					cocks[slot].knotMultiplier = 1;
					cocks[slot].addFlag(GLOBAL.FLAG_SMOOTH);
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					break;
				case GLOBAL.TYPE_KUITAN:
					cocks[slot].cockColor = "red";
					cocks[slot].knotMultiplier = 1.3;
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					cocks[slot].addFlag(GLOBAL.FLAG_KNOTTED);
					cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
					break;
				case GLOBAL.TYPE_RASKVEL:
					cocks[slot].cockColor = "purple";
					cocks[slot].addFlag(GLOBAL.FLAG_SMOOTH);
					break;
				case GLOBAL.TYPE_DEMONIC:
					cocks[slot].cockColor = RandomInCollection(["red", "dark purple"]);
					cocks[slot].knotMultiplier = 1.4;
					cocks[slot].addFlag(GLOBAL.FLAG_KNOTTED);
					cocks[slot].addFlag(GLOBAL.FLAG_NUBBY);
					break;
				case GLOBAL.TYPE_TENTACLE:
					cocks[slot].cockColor = RandomInCollection(["green", "purple"]);
					cocks[slot].addFlag(GLOBAL.FLAG_PREHENSILE);
					cocks[slot].addFlag(GLOBAL.FLAG_FLARED);
					cocks[slot].addFlag(GLOBAL.FLAG_LUBRICATED);
					break;
				case GLOBAL.TYPE_ANEMONE:
				case GLOBAL.TYPE_SIREN:
					cocks[slot].cockColor = RandomInCollection(["blue", "aquamarine"]);
					cocks[slot].addFlag(GLOBAL.FLAG_STINGER_BASED);
					cocks[slot].addFlag(GLOBAL.FLAG_STINGER_TIPPED);
					cocks[slot].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
					break;
				case GLOBAL.TYPE_KANGAROO:
					cocks[slot].cockColor = RandomInCollection(["red", "pink"]);
					cocks[slot].addFlag(GLOBAL.FLAG_PREHENSILE);
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					break;
				case GLOBAL.TYPE_DRACONIC:
					cocks[slot].cockColor = "blue";
					cocks[slot].knotMultiplier = RandomInCollection([1.25, 1.3]);
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					cocks[slot].addFlag(GLOBAL.FLAG_KNOTTED);
					//cocks[slot].addFlag(GLOBAL.FLAG_RIBBED);
					break;
				case GLOBAL.TYPE_GRYVAIN:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cockColor = scaleColor;
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					cocks[slot].addFlag(GLOBAL.FLAG_KNOTTED);
					cocks[slot].addFlag(GLOBAL.FLAG_RIBBED);
					cocks[slot].addFlag(GLOBAL.FLAG_SCALED);
					break;
				case GLOBAL.TYPE_FROSTWYRM:
					cocks[slot].cockColor = "pink";
					cocks[slot].knotMultiplier = 1;
					cocks[slot].addFlag(GLOBAL.FLAG_BLUNT);
					cocks[slot].addFlag(GLOBAL.FLAG_NUBBY);
					break;
				/* Spiderman.gif.
				According to B, the first is more accurate.
				case GLOBAL.TYPE_FROSTWYRM:
					cocks[slot].cockColor = "blue";
					cocks[slot].knotMultiplier = 1.4;
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					cocks[slot].addFlag(GLOBAL.FLAG_KNOTTED);
					cocks[slot].addFlag(GLOBAL.FLAG_RIBBED);
					break;*/
				case GLOBAL.TYPE_SIMII:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cockColor = "pink";
					break;
				case GLOBAL.TYPE_SAURIAN:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cockColor = "pink";
					if(cocks[slot].cLengthRaw < 20) cocks[slot].cLengthRaw = 20;
					if(cocks[slot].cThicknessRatioRaw < 1.5) cocks[slot].cThicknessRatioRaw = 1.5;
					cocks[slot].addFlag(GLOBAL.FLAG_BLUNT);
					cocks[slot].addFlag(GLOBAL.FLAG_RIBBED);
					cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
					break;
				case GLOBAL.TYPE_SYNTHETIC:
					cocks[slot].cockColor = RandomInCollection(["silver", "gray", "black"]);
					break;
				case GLOBAL.TYPE_VENUSPITCHER:
					cocks[slot].cockColor = RandomInCollection(["green", "purple", "olive green"]);
					cocks[slot].addFlag(GLOBAL.FLAG_PREHENSILE);
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					break;
				case GLOBAL.TYPE_NYREA:
					cocks[slot].cockColor = "pink";
					cocks[slot].knotMultiplier = 1.66;
					cocks[slot].addFlag(GLOBAL.FLAG_FLARED);
					cocks[slot].addFlag(GLOBAL.FLAG_KNOTTED);
					cocks[slot].addFlag(GLOBAL.FLAG_OVIPOSITOR);
					break;
				case GLOBAL.TYPE_DAYNAR:
					cocks[slot].cockColor = "purple";
					cocks[slot].knotMultiplier = 1;
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					break;
				case GLOBAL.TYPE_SYDIAN:
					cocks[slot].cockColor = RandomInCollection(["orange", "bright orange", "red orange"]);
					cocks[slot].knotMultiplier = 1;
					break;
				case GLOBAL.TYPE_COCKVINE:
					cocks[slot].cockColor = RandomInCollection(["green", "purple"]);
					cocks[slot].knotMultiplier = 1;
					cocks[slot].addFlag(GLOBAL.FLAG_PREHENSILE);
					break;
				case GLOBAL.TYPE_GABILANI:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cockColor = RandomInCollection(["pink", "pink", "olive", "purple"]);
					cocks[slot].addFlag(GLOBAL.FLAG_DOUBLE_HEADED);
					break;
				case GLOBAL.TYPE_VANAE:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cockColor = "luminous violet";
					cocks[slot].addFlag(GLOBAL.FLAG_SMOOTH);
					cocks[slot].addFlag(GLOBAL.FLAG_LUBRICATED);
					break;
				case GLOBAL.TYPE_HRAD:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cockColor = RandomInCollection(["purple", "angry purple", "reddish-purple"]);
					cocks[slot].addFlag(GLOBAL.FLAG_FORESKINNED);
					cocks[slot].addFlag(GLOBAL.FLAG_FLARED);
					break;
				case GLOBAL.TYPE_AVIAN:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cThicknessRatioRaw = 0.5;
					cocks[slot].cockColor = "red";
					cocks[slot].addFlag(GLOBAL.FLAG_SMOOTH);
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					break;
				case GLOBAL.TYPE_SHARK:
					cocks[slot].cThicknessRatioRaw = 1;
					cocks[slot].cockColor = skinTone;
					cocks[slot].addFlag(GLOBAL.FLAG_SMOOTH);
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					cocks[slot].addFlag(GLOBAL.FLAG_PREHENSILE);
					cocks[slot].addFlag(GLOBAL.FLAG_LUBRICATED);
					break;
				case GLOBAL.TYPE_BOTHRIOC:
					cocks[slot].cThicknessRatioRaw = 1.75;
					cocks[slot].addFlag(GLOBAL.FLAG_LUBRICATED);
					cocks[slot].addFlag(GLOBAL.FLAG_OVIPOSITOR);
					cocks[slot].addFlag(GLOBAL.FLAG_RIBBED);
					cocks[slot].cockColor = "purple";
					break;
				case GLOBAL.TYPE_SWINE:
					cocks[slot].addFlag(GLOBAL.FLAG_CORKSCREWED);
					cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
					cocks[slot].cockColor = "pink";
					break;
				case GLOBAL.TYPE_GOAT:
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cThicknessRatioRaw = 0.75;
					cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
					cocks[slot].cockColor = RandomInCollection(["red", "pink", "cherry red"]);
					break;
				case GLOBAL.TYPE_MOTHRINE:
					cocks[slot].cockColor = "black";
					cocks[slot].knotMultiplier = 1;
					cocks[slot].cThicknessRatioRaw = 1;
					cocks[slot].addFlag(GLOBAL.FLAG_SMOOTH);
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					cocks[slot].addFlag(GLOBAL.FLAG_PREHENSILE);
					cocks[slot].addFlag(GLOBAL.FLAG_OVIPOSITOR);
					break;
				case GLOBAL.TYPE_JANERIA:
					cocks[slot].cockColor = "luminous " + skinTone.split(" ").pop();
					cocks[slot].addFlag(GLOBAL.FLAG_SMOOTH);
					cocks[slot].addFlag(GLOBAL.FLAG_LUBRICATED);
					cocks[slot].addFlag(GLOBAL.FLAG_PREHENSILE);
					break;
				case GLOBAL.TYPE_SAURMORIAN:
					cocks[slot].cockColor = (findFirstOfcType(GLOBAL.TYPE_SAURMORIAN) < 0 ? RandomInCollection("black", "dark blue", "dark red", "purple") : cocks[findFirstOfcType(GLOBAL.TYPE_SAURMORIAN)].cockColor);
					if(cocks[slot].cLengthRaw < 5) cocks[slot].cLengthRaw = (hasPerk("Hung") ? 10 : (hasPerk("Mini") ? 6 : 8));
					if(cocks[slot].cThicknessRatioRaw < 0.833) cocks[slot].cThicknessRatioRaw = 1.125;
					cocks[slot].addFlag(GLOBAL.FLAG_BLUNT);
					cocks[slot].addFlag(GLOBAL.FLAG_RIBBED);
					cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
					break;
				case GLOBAL.TYPE_DEER:
					cocks[slot].cockColor = "pink";
					cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
					cocks[slot].addFlag(GLOBAL.FLAG_TAPERED);
					break;
			}
		}
		//PC can fly?
		public function canFly(): Boolean {
			//web also makes false!
			if (hasStatusEffect("Web")) return false;
			if (hasStatusEffect("Flying")) return true;
			if (hasJetpack()) return true;
			if (InCollection(wingType, [GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_BEE, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_DRAGONFLY, GLOBAL.TYPE_SYLVAN, GLOBAL.TYPE_DARK_SYLVAN, GLOBAL.TYPE_MOTHRINE, GLOBAL.TYPE_DOVE, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_FROSTWYRM])) return true;
			if (InCollection(wingType, [GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_BEE, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_DRAGONFLY, GLOBAL.TYPE_SYLVAN, GLOBAL.TYPE_DARK_SYLVAN, GLOBAL.TYPE_MOTHRINE, GLOBAL.TYPE_DOVE, GLOBAL.TYPE_GRYVAIN])) return true;
			return false;
		}
		public function hasFlightEffects(): Boolean
		{
			if (hasStatusEffect("Flying")) return true;
			return false;
		}
		public function clearFlightEffects(): void
		{
			removeStatusEffect("Flying");
		}
		public function hasJetpack():Boolean {
			if(accessory is LightJetpack) return true;
			return false;
		}
		//PC can swim?
		public function canSwim(): Boolean {
			//Oh god, why Spiderman, why?!!!
			if (hasStatusEffect("Web")) return false;
			if (wingType == GLOBAL.TYPE_SHARK || InCollection(legType, [GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SIREN])) return true;
			return true;
		}
		public function hasWings(wType:Number = 0): Boolean {
			if(InCollection(wingType, [GLOBAL.TYPE_SHARK, GLOBAL.TYPE_COCKVINE, GLOBAL.TYPE_TENTACLE, GLOBAL.TYPE_JANERIA])) return false;
			if (wingType != 0)
			{
				// Specific type
				if (wType > 0 && wType == wingType) return true;
				// Any type
				if (wType == 0) return true;
			}
			return false;
		}
		// Large, jointed/malleable wings
		public function hasJointedWings(): Boolean
		{
			if(!hasWings()) return false;
			return InCollection(wingType, [GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_DOVE, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_FROSTWYRM]);
		}
		// Wing types that double as back genitals (tentacle-like)
		public function hasBackGenitals(): Boolean {
			if(InCollection(wingType, [GLOBAL.TYPE_COCKVINE, GLOBAL.TYPE_TENTACLE, GLOBAL.TYPE_JANERIA])) return true;
			return false;
		}
		public function removeWings():void
		{
			wingType = 0;
			wingCount = 0;
			removeStatusEffect("Wing Position");
			removeStatusEffect("Wing Style");
		}
		public function shiftWings(wingShape:Number = 0, wingNum:Number = 0):void
		{
			if(wingShape != wingType) removeStatusEffect("Wing Style");
			wingType = wingShape;
			wingCount = wingNum;
			if(!hasJointedWings()) removeStatusEffect("Wing Position");
		}
		public function wingTexture(): int
		{
			if(hasStatusEffect("Wing Style")) return statusEffectv1("Wing Style");
			
			if(InCollection(wingType, [GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_DOVE])) return GLOBAL.FLAG_FEATHERED;
			if(InCollection(wingType, [GLOBAL.TYPE_SMALLDEMONIC, GLOBAL.TYPE_FROSTWYRM, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SMALLDRACONIC, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_GRYVAIN])) return GLOBAL.FLAG_SCALED;
			if(InCollection(wingType, [GLOBAL.TYPE_MOTHRINE])) return GLOBAL.FLAG_CHITINOUS;
			return 0;
		}
		public function wingColor(): String
		{
			if(hasStatusEffect("Wing Style") && getStatusTooltip("Wing Style") != "") return getStatusTooltip("Wing Style");
			
			var sColor:String = "";
			var iFlag:int = wingTexture();
			switch(iFlag)
			{
				case GLOBAL.FLAG_FURRED:
				case GLOBAL.FLAG_FEATHERED: sColor = furColor; break;
				case GLOBAL.FLAG_SCALED:
				case GLOBAL.FLAG_CHITINOUS: sColor = scaleColor; break;
				default:
					switch(wingType)
					{
						case GLOBAL.TYPE_DRAGONFLY: sColor = "iridescent"; break;
						case GLOBAL.TYPE_SMALLBEE:
						case GLOBAL.TYPE_BEE:
						case GLOBAL.TYPE_MYR: sColor = "transparent"; break;
						case GLOBAL.TYPE_SYLVAN: sColor = "blue"; break;
						case GLOBAL.TYPE_DARK_SYLVAN: sColor = "glittering black"; break;
					}
					break;
			}
			return sColor;
		}
		//check for vagoo
		public function hasVagina(hole: int = 0): Boolean {
			if (vaginas.length > hole) return true;
			return false;
		}
		public function hasVaginaType(type: Number = 0): Boolean {
			if (vaginas.length <= 0) return false;
			for (var x: int = 0; x < vaginas.length; x++) {
				if (vaginas[x].type == type) return true;
			}
			return false;
		}
		public function hymenTotal():int {
			if(vaginas.length <= 0) return 0;
			var cnt:int = 0
			for(var v:int = 0; v < vaginas.length; v++)
			{
				if(vaginas[v].hymen) cnt++;
			}
			return cnt;
		}
		public function hasHymen(v:int = -1):Boolean {
			if(vaginas.length <= 0 || v >= vaginas.length) return false;
			if(v < 0) return (hymenTotal() > 0);
			return (vaginas[v].hymen);
		}
		public function hasVirginVagina(): Boolean {
			return (vaginas.length > 0 && vaginalVirgin);
		}
		public function hasVirginCock(): Boolean {
			return (cocks.length > 0 && cockVirgin);
		}
		public function genderWeight(): Number {
			
			//1/2 facial
			var weighting: Number = femininity;
			//Tits count up to their rating for femininity
			if (biggestTitSize() >= 1) {
				//trace("boobs confirmed");
				if (biggestTitSize() * 3 > 50) weighting += 50;
				else weighting += biggestTitSize() * 3;
			}
			//Flat chest + 20 masculine
			else if (biggestTitSize() == 0) {
				//trace("no boobs confirmed");
				weighting -= 10;
			}
			//Hips give small boost
			if (hipRating() >= 6) weighting += hipRating() * 1.5;
			else weighting -= (6 - hipRating()) * 3;
			if (hairLength > 8) weighting += (hairLength - 7) * 1.5;
			else weighting -= (8 - hairLength) * 1.5;
			if (tone > 70) weighting -= 10;
			if (tone < 30) weighting += 10;
			if (lipRating() > 1) weighting += lipRating() * 3;
			if (hasBeard() && !(beardStyle == 11 && hasMuzzle())) weighting -= 100; // lynx sideburns are not exactly a beard and have no m/f weight
			//trace("Femininity Rating = " + weighting);
			
			return weighting;
		}
		public function mfn(male: String, female: String, neuter: String, ignorePref:Boolean = false): String {
			
			if (!ignorePref && hasStatusEffect("Force Fem Gender")) return female;
			if (!ignorePref && hasStatusEffect("Force Male Gender")) return male;
			
			var weighting: Number = genderWeight();
			
			//Neuters first!
			if (neuter != "") {
				if (weighting >= 45 && weighting <= 55 || (!ignorePref && hasStatusEffect("Force It Gender"))) return neuter;
				else if (weighting < 45) return male;
				return female;
			}
			if (weighting <= 49) return male;
			return female;
		}
		public function mf(male: String, female: String, ignorePref:Boolean = false): String {
			return mfn(male, female, "", ignorePref);
		}
		public function rawmfn(male: String, female: String, neuter: String): String {
			
			//if (hasStatusEffect("Force Fem Gender")) return female;
			//if (hasStatusEffect("Force Male Gender")) return male;
			
			if (!hasCock() && !hasVagina()) return neuter;
			return rawmf(male, female);
		}
		public function rawmf(male: String, female: String): String {
			if (!hasVagina()) return male;
			return female;
		}
		public function cockAndVagina(cockString:String, vaginaString:String, connector:String = " and"):String
		{
			var finalString:String = "";
			if (hasCock()) 					finalString += cockString;
			if (hasVagina() && hasCock()) 	finalString += connector;
			if (hasVagina()) 				finalString += vaginaString;
			return finalString;
		}
		public function vaginaAndCock(vaginaString:String, cockString:String, connector:String = " and"):String
		{
			var finalString:String = "";
			if (hasVagina()) 				finalString += vaginaString;
			if (hasVagina() && hasCock()) 	finalString += connector;
			if (hasCock()) 					finalString += cockString;
			return finalString;
		}
		public function cockXorVagina(cockString:String, vaginaString:String):String
		{
			if (hasCock()) return cockString;
			if (hasVagina()) return vaginaString;
			return "";
		}
		public function vaginaXorCock(vaginaString:String, cockString:String):String
		{
			if (hasVagina()) return vaginaString;
			if (hasCock()) return cockString;
			return "";
		}
		//Create a cock
		public function createCock(clength: Number = 5.5, cthickness: Number = 1): Boolean {
			if (cocks.length >= 10) return false;
			var newCock:CockClass = new CockClass();
			newCock.cThicknessRatioRaw = cthickness;
			newCock.cLengthRaw = clength;
			
			if(hasStatusEffect("Condensol-A")) newCock.cLengthRaw /= 2;
			else if(hasStatusEffect("Condensol-B")) newCock.cLengthRaw /= 4;
			
			cocks.push(newCock);
			return true;
		}
		public function createCockUnlocked(numCocks:int = 1):Boolean
		{
			if (numCocks > 10) return false;
			return true;
		}
		public function createCockLockedMessage():String
		{
			return "Your crotch warms, but nothing happens.";
		}
		public function copyCock(target:int, donor:int):void
		{
			if(target < 0 || donor < 0) return;
			if(target >= cocks.length || donor >= cocks.length) return;
			
			trace("Copying " + simpleCockNoun(donor) + " to target " + simpleCockNoun(target) + " donor index: " + donor + " target index: " + target + " donor type: " + cocks[donor].cType + " target type: " + cocks[target].cType);
			
			cocks[target].cType = cocks[donor].cType;
			cocks[target].cLengthRaw = cocks[donor].cLengthRaw;
			cocks[target].cLengthMod = cocks[donor].cLengthMod;
			cocks[target].cThicknessRatioRaw = cocks[donor].cThicknessRatioRaw;
			cocks[target].cThicknessRatioMod = cocks[donor].cThicknessRatioMod;
			cocks[target].cockColor = cocks[donor].cockColor;
			cocks[target].knotMultiplier = cocks[donor].knotMultiplier;
			cocks[target].flaccidMultiplier = cocks[donor].flaccidMultiplier;
			cocks[target].virgin = cocks[donor].virgin; // to make it work in a similar fashion as copyVagina
			cocks[target].clearFlags();
			for(var y:int = 0; y < cocks[donor].cockFlags.length; y++)
			{
				cocks[target].cockFlags[y] = cocks[donor].cockFlags[y];
			}
			return;
		}
		//General utility function for setting appropriate dick type with new-grown weiners.
		public function setNewCockValues(arg:int = 0):void
		{
			// Reset cock length.
			cocks[arg].cLengthRaw = 5.5;
			if(hasPerk("Mini")) cocks[arg].cLengthRaw -= 1+rand(2);
			if(hasPerk("Hung")) cocks[arg].cLengthRaw += 2+rand(4);
			
			var race:String = race();
			var raceSimple:String = stripRace(race);
			
			// Type changes
			if(InCollection(raceSimple, ["ausar", "huskar", "canine", "lupine", "hyena"]))
			{
				shiftCock(arg,GLOBAL.TYPE_CANINE);
				if(InCollection(raceSimple, ["ausar", "huskar"])) cocks[arg].delFlag(GLOBAL.FLAG_SHEATHED); // 'cause ausar have not enough inner beast to have sheath
			}
			else if (race.indexOf("dragonne") == -1 && InCollection(raceSimple, ["kaithrit", "feline"]))
			{
				shiftCock(arg, GLOBAL.TYPE_FELINE);
				if (raceSimple == "kaithrit") // 'cause kaithrits are not cool enough to have real kitty peckers
				{
					cocks[arg].delFlag(GLOBAL.FLAG_SHEATHED);
					cocks[arg].delFlag(GLOBAL.FLAG_TAPERED);
				}
			}
			else if(raceSimple == "leithan") shiftCock(arg,GLOBAL.TYPE_SNAKE);
			else if(raceSimple == "kui-tan") shiftCock(arg, GLOBAL.TYPE_KUITAN);
			else if(raceSimple == "gryvain") shiftCock(arg, GLOBAL.TYPE_GRYVAIN);
			else if(raceSimple == "korgonne") shiftCock(arg, GLOBAL.TYPE_KORGONNE);
			else if(InCollection(raceSimple, ["equine", "pony", "laquine", "ovir", "minotaur", "centaur", "hippogriff"])) shiftCock(arg, GLOBAL.TYPE_EQUINE);
			else if(InCollection(raceSimple, ["vulpine", "kitsune", "vulpogryph"])) shiftCock(arg,GLOBAL.TYPE_VULPINE);
			else if (InCollection(raceSimple, ["griffin", "phoenix", "sirin", "harpy", "avian"]))
			{
				shiftCock(arg, GLOBAL.TYPE_AVIAN);
				switch(raceSimple)
				{
					case "griffin":
						cocks[arg].cThicknessRatioRaw = 1.3;
						cocks[arg].knotMultiplier = 1.5;
						cocks[arg].addFlag(GLOBAL.FLAG_KNOTTED);
						cocks[arg].addFlag(GLOBAL.FLAG_NUBBY);
						cocks[arg].addFlag(GLOBAL.FLAG_SHEATHED);
						cocks[arg].cockColor = "black";
						break;
				}
			}
			else if(raceSimple == "zil") shiftCock(arg,GLOBAL.TYPE_BEE);
			else if(InCollection(raceSimple, ["naleen", "naga", "quetzalcoatl", "slyveren"])) shiftCock(arg,GLOBAL.TYPE_NAGA);
			else if(raceSimple == "raskvel") shiftCock(arg, GLOBAL.TYPE_RASKVEL);
			else if(race.indexOf("dragonne") != -1 || InCollection(raceSimple, ["fanfir", "dragon"])) shiftCock(arg, GLOBAL.TYPE_DRACONIC);
			else if(raceSimple == "demon") shiftCock(arg, GLOBAL.TYPE_DEMONIC);
			else if(raceSimple == "kangaroo") shiftCock(arg, GLOBAL.TYPE_KANGAROO);
			else if(raceSimple == "simii") shiftCock(arg, GLOBAL.TYPE_SIMII);
			else if(raceSimple == "saurian") shiftCock(arg, GLOBAL.TYPE_SAURIAN);
			else if(raceSimple == "venus pitcher") shiftCock(arg, GLOBAL.TYPE_VENUSPITCHER);
			else if(raceSimple == "sydian") shiftCock(arg, GLOBAL.TYPE_SYDIAN);
			else if(raceSimple == "daynar") shiftCock(arg, GLOBAL.TYPE_DAYNAR);
			else if(raceSimple == "gabilani") shiftCock(arg, GLOBAL.TYPE_GABILANI);
			else if(race == "cockvine") shiftCock(arg, GLOBAL.TYPE_COCKVINE);
			else if(InCollection(raceSimple, ["tentacle beast", "cockvine", "plant"])) shiftCock(arg, GLOBAL.TYPE_TENTACLE);
			else if(raceSimple == "suula") shiftCock(arg, GLOBAL.TYPE_SIREN);
			else if(raceSimple == "anemone") shiftCock(arg, GLOBAL.TYPE_ANEMONE);
			else if(raceSimple == "pig") shiftCock(arg, GLOBAL.TYPE_SWINE);
			else if(InCollection(raceSimple, ["goat", "adremmalex"])) shiftCock(arg, GLOBAL.TYPE_GOAT);
			else if(raceSimple == "mothrine") shiftCock(arg, GLOBAL.TYPE_MOTHRINE);
			else if(raceSimple == "janeria") shiftCock(arg, GLOBAL.TYPE_JANERIA);
			else if(raceSimple == "frostwyrm") shiftCock(arg, GLOBAL.TYPE_FROSTWYRM);
			else if(raceSimple == "saurmorian") shiftCock(arg, GLOBAL.TYPE_SAURMORIAN);
			else if(raceSimple == "reptile") shiftCock(arg, GLOBAL.TYPE_NAGA);
			else if(InCollection(raceSimple, ["sionach", "siel"]))
			{
				shiftCock(arg, GLOBAL.TYPE_INHUMAN);
				switch(raceSimple)
				{
					case "sionach":
						cocks[arg].knotMultiplier = 1.15;
						cocks[arg].addFlag(GLOBAL.FLAG_KNOTTED);
						cocks[arg].addFlag(GLOBAL.FLAG_SHEATHED);
						cocks[arg].addFlag(GLOBAL.FLAG_TAPERED);
						cocks[arg].addFlag(GLOBAL.FLAG_NUBBY);
						break;
					case "siel":
						cocks[arg].cockColor = "pink";
						break;
				}
			}
			//else if(InCollection(race, ["synthetic", "robot", "companion droid"])) shiftCock(arg, GLOBAL.TYPE_SYNTHETIC);
			else if(skinType == GLOBAL.SKIN_TYPE_GOO)
			{
				shiftCock(arg, GLOBAL.TYPE_HUMAN);
				cocks[arg].addFlag(GLOBAL.FLAG_GOOEY);
				cocks[arg].cockColor = skinTone;
			}
			
			// Modify final length since it was reset above.
			if(hasStatusEffect("Condensol-A")) cocks[arg].cLengthRaw /= 2;
			else if(hasStatusEffect("Condensol-B")) cocks[arg].cLengthRaw /= 4;
		}
		//General utility function for setting appropriate dick type with new-grown vaginas.
		public function setNewVaginaValues(arg:int = 0):void
		{
			var race:String = race();
			var raceSimple:String = stripRace(race);
			
			// Type changes
			if(InCollection(raceSimple, ["equine", "pony", "laquine", "centaur"])) shiftVagina(arg, GLOBAL.TYPE_EQUINE);
			else if(InCollection(raceSimple, ["naleen", "naga", "quetzalcoatl", "slyveren"])) shiftVagina(arg, GLOBAL.TYPE_NAGA);
			else if(InCollection(raceSimple, "canine", "hyena")) shiftVagina(arg, GLOBAL.TYPE_CANINE);
			else if(raceSimple == "zil") shiftVagina(arg, GLOBAL.TYPE_BEE);
			else if(raceSimple == "leithan") shiftVagina(arg, GLOBAL.TYPE_LEITHAN);
			else if(raceSimple == "vanae") shiftVagina(arg, GLOBAL.TYPE_VANAE);
			else if(raceSimple == "kui-tan") shiftVagina(arg, GLOBAL.TYPE_KUITAN);
			else if(raceSimple == "gryvain") shiftVagina(arg, GLOBAL.TYPE_GRYVAIN);
			else if(raceSimple == "lapinara") shiftVagina(arg, GLOBAL.TYPE_LAPINARA);
			else if(raceSimple == "korgonne") shiftVagina(arg, GLOBAL.TYPE_KORGONNE);
			else if(raceSimple == "frostwyrm") shiftVagina(arg, GLOBAL.TYPE_FROSTWYRM);
			else if(raceSimple == "saurmorian") shiftVagina(arg, GLOBAL.TYPE_SAURMORIAN);
			else if(raceSimple == "reptile") shiftVagina(arg, GLOBAL.TYPE_LIZAN);
			//Janeria don't use their own vagina type
			else if(raceSimple == "janeria")
			{
				shiftVagina(arg, GLOBAL.TYPE_SNAKE);
				vaginas[arg].vaginaColor = "luminous " + skinTone.split(" ").pop();
			}
			else if(InCollection(raceSimple, ["vulpine", "vulpogryph"]) || (raceSimple == "kitsune" && hasFur()))
			{
				shiftVagina(arg, GLOBAL.TYPE_VULPINE);
			}
			else if(race.indexOf("dragonne") == -1 && InCollection(raceSimple, ["kaithrit", "feline"])) shiftVagina(arg, GLOBAL.TYPE_FELINE);
			else if(raceSimple == "gabilani") shiftVagina(arg, GLOBAL.TYPE_GABILANI);
			else if(raceSimple == "plant") shiftVagina(arg, GLOBAL.TYPE_FLOWER);
			else if(InCollection(raceSimple, ["anemone"])) shiftVagina(arg, GLOBAL.TYPE_ANEMONE);
			else if(InCollection(raceSimple, ["suula"])) shiftVagina(arg, GLOBAL.TYPE_SIREN);
			//else if(InCollection(race, ["synthetic", "robot", "companion droid"])) shiftVagina(arg, GLOBAL.TYPE_SYNTHETIC);
			else if(skinType == GLOBAL.SKIN_TYPE_GOO)
			{
				shiftVagina(arg, GLOBAL.TYPE_HUMAN);
				vaginas[arg].addFlag(GLOBAL.FLAG_GOOEY);
				vaginas[arg].vaginaColor = skinTone;
			}
		}
		
		//create vagoo
		public function createVagina(): Boolean {
			if (vaginas.length >= 3) return false;
			var newVagina:VaginaClass = new VaginaClass();
			
			if (hasStatusEffect("Soak")) newVagina.wetnessMod += 5;
			
			vaginas.push(newVagina);
			return true;
		}
		public function copyVagina(target:int, donor:int):void
		{
			if(target < 0 || donor < 0) return;
			if(target >= vaginas.length || donor >= vaginas.length) return;
			
			trace("Copying " + vaginaNounDescript(donor) + " to target " + vaginaNounDescript(target) + " donor index: " + donor + " target index: " + target + " donor type: " + vaginas[donor].type + " target type: " + vaginas[target].type);
			
			vaginas[target].type = vaginas[donor].type;
			vaginas[target].wetnessRaw = vaginas[donor].wetnessRaw;
			vaginas[target].loosenessRaw = vaginas[donor].loosenessRaw;
			vaginas[target].clits = vaginas[donor].clits;
			vaginas[target].vaginaColor = vaginas[donor].vaginaColor;
			vaginas[target].bonusCapacity = vaginas[donor].bonusCapacity;
			vaginas[target].minLooseness = vaginas[donor].minLooseness;
			vaginas[target].hymen = vaginas[donor].hymen;
			vaginas[target].clearFlags();
			for(var y:int = 0; y < vaginas[donor].vagooFlags.length; y++)
			{
				vaginas[target].vagooFlags[y] = vaginas[donor].vagooFlags[y];
			}
			return;
		}
		public function createVaginaUnlocked(numVag:int = 1):Boolean
		{
			if (numVag > 3) return false;
			return true;
		}
		public function createVaginaLockedMessage():String
		{
			return "Your crotch warms, but nothing happens.";
		}
		
		//create a row of breasts
		public function createBreastRow(): Boolean {
			if (breastRows.length >= 10) return false;
			var newBreastRow:BreastRowClass = new BreastRowClass();
			
			breastRows.push(newBreastRow);
			
			// Newly grown row
			var bIdx:int = (breastRows.length - 1);
			// For dynamic mod values, auto-add here to prevent mismatch.
			var modBonus:Number = 0;
			
			if(statusEffectv3("Mimbrane Boobs") != 0 && bIdx == 0) modBonus += statusEffectv3("Mimbrane Boobs");
			if(statusEffectv2("Bimboleum") != 0) modBonus += statusEffectv2("Bimboleum");
			// Auto-insert silicone
			if(statusEffectv3("Nym-Foe Injections") != 0) {
				if(this is PlayerCharacter) kGAMECLASS.autoFillNymFoeBoobjection(bIdx);
				else modBonus += statusEffectv3("Nym-Foe Injections");
			}
			
			if(modBonus != 0) breastRows[bIdx].breastRatingMod += modBonus;
			
			return true;
		}
		public function createBreastRowUnlocked(numRows:int = 1):Boolean
		{
			if (hasStatusEffect("Gel Body")) return false;
			return true;
		}
		public function createBreastRowsLockedMessage():String
		{
			return "Your chest warms, but nothing happens.";
		}
		
		public function removeJunk(array:Array, arraySpot:int, totalRemoved:int): void {
			//Various Errors preventing action
			if (arraySpot < 0 || totalRemoved <= 0) {
				return;
			}
			if (array.length == 0) {
				//trace("ERROR: removeJunk called but cocks do not exist.");
				return;
			}
			if (arraySpot > array.length - 1) {
				//trace("ERROR: removeJunk failed - array location is beyond the bounds of the array.");
				throw new Error("removeJunk call failed. Target location to remove is out of array bounds.");
			}
			else {
				var idx:int = arraySpot;
				var idxEnd:int = Math.min((arraySpot + totalRemoved), array.length);
				var piercings:Array = [];
				if(array == cocks)
				{
					for(idx = arraySpot; idx < idxEnd; idx++)
					{
						if(hasStatusEffect("Mimbrane Cock") && idx == 0) removeStatusEffect("Mimbrane Cock");
						if(hasStatusEffect("Painted Penis") && idx == statusEffectv1("Painted Penis")) clearPaintedPenisEffect();
						if(!(cocks[idx].piercing is EmptySlot))
						{
							cocks[idx].piercing.onRemove(this);
							piercings.push(cocks[idx].piercing);
							cocks[idx].piercing = new EmptySlot();
						}
						if(!(cocks[idx].cocksock is EmptySlot))
						{
							cocks[idx].cocksock.onRemove(this);
							piercings.push(cocks[idx].cocksock);
							cocks[idx].cocksock = new EmptySlot();
						}
					}
					// shift effect position
					if(hasStatusEffect("Painted Penis") && statusEffectv1("Painted Penis") >= idxEnd) setStatusValue("Painted Penis", 1, (idxEnd - 1));
					
					trace("Attempted to remove " + totalRemoved + " spots from cocks.");
				}
				if(array == vaginas)
				{
					for(var w:int = arraySpot; w < idxEnd; w++)
					{
						// Pregnancy check!
						for(var wIdx:int = w; wIdx < vaginas.length; wIdx++)
						{
							if(wIdx >= 3) break; // non-vag
							var pregSlot:int = (wIdx + 1); // next womb
							if(pregSlot >= 3) break; // non-vag
							var pData:PregnancyData = (pregnancyData[pregSlot] as PregnancyData);
							if(pData.pregnancyType != "") {
								// shift pregnancy down one
								pregnancyData[wIdx] = pData.makeCopy();
								pregnancyData[pregSlot].reset();
							}
							if(hasStatusEffect("Ovalasting Big Egg " + pregSlot))
							{
								createStatusEffect("Ovalasting Big Egg " + wIdx);
								removeStatusEffect("Ovalasting Big Egg " + pregSlot);
							}
						}
					}
					for(idx = arraySpot; idx < idxEnd; idx++)
					{
						if(hasStatusEffect("Mimbrane Pussy") && idx == 0) removeStatusEffect("Mimbrane Pussy");
						if(!(vaginas[idx].piercing is EmptySlot))
						{
							vaginas[idx].piercing.onRemove(this);
							piercings.push(vaginas[idx].piercing);
							vaginas[idx].piercing = new EmptySlot();
						}
						if(!(vaginas[idx].clitPiercing is EmptySlot))
						{
							vaginas[idx].clitPiercing.onRemove(this);
							piercings.push(vaginas[idx].clitPiercing);
							vaginas[idx].clitPiercing = new EmptySlot();
						}
					}
					
					trace("Attempted to remove " + totalRemoved + " spots from vaginas.");
				}
				if(array == breastRows)
				{
					for(idx = arraySpot; idx < idxEnd; idx++)
					{
						if(hasStatusEffect("Mimbrane Boobs") && idx == 0) removeStatusEffect("Mimbrane Boobs");
						if(hasStatusEffect("Boobswell Pads") && statusEffectv1("Boobswell Pads") == idx)
						{
							if(this is PlayerCharacter) AddLogEvent("The Boobswell pads you had been wearing on your " + num2Ordinal(idx + 1) + " row of breast" + (breastRows[idx].breasts != 1 ? "s" : "") + " disintegrate as the row was removed. <b>You’re no longer under the effects of the Boobswell Pads!</b>");
							removeStatusEffect("Boobswell Pads");
						}
						if(hasStatusEffect("Painted Tits") && idx == statusEffectv1("Painted Tits")) clearPaintedTitsEffect();
						if(!(breastRows[idx].piercing is EmptySlot))
						{
							breastRows[idx].piercing.onRemove(this);
							piercings.push(breastRows[idx].piercing);
							breastRows[idx].piercing = new EmptySlot();
						}
					}
					// shift effect position
					if(hasStatusEffect("Boobswell Pads") && statusEffectv1("Boobswell Pads") >= idxEnd) setStatusValue("Boobswell Pads", 1, (idxEnd - 1));
					if(hasStatusEffect("Painted Tits") && statusEffectv1("Painted Tits") >= idxEnd) setStatusValue("Painted Tits", 1, (idxEnd - 1));
					
					trace("Attempted to remove " + totalRemoved + " spots from breastRows.");
				}
				array.splice(arraySpot, totalRemoved);
				
				if(piercings.length > 0)
				{
					if(this is PlayerCharacter) kGAMECLASS.eventQueue.push(function():void { kGAMECLASS.itemCollectMainMenu(piercings, true); });
					else inventory.concat(piercings);
				}
			}
		}
		//Remove cocks
		public function removeCocks(): void {
			/*while (hasCock()) {
				removeCock(0, 1);
			}*/
			if(hasCock()) removeCock(0, cocks.length);
		}
		public function removeCocksUnlocked():Boolean 
		{
			if (hasStatusEffect("Mimbrane Cock")) return false;
			if((isCumCow() || isFauxCow()) && cocks.length == 1) return false;
			return true;
		}
		public function removeCocksLockedMessage():String 
		{
			if (hasStatusEffect("Mimbrane Cock")) return "The Mimbrane surrounding your " + cockDescript(0) + " suddenly bursts to life and squeezes your dick for all it’s worth. Seems the parasite’s efforts are keeping you from losing your cock entirely.";
			if(isCumCow() && cocks.length == 1) return "Your body absolutely resists any attempt to deprive it of the penis it adores so dearly.";
			return "Your body practically glows with groin-focused effort, keeping you from losing your genitalia entirely.";
		}
		
		//Remove cock
		public function removeCock(arraySpot:int, totalRemoved:int = 1): void {
			removeJunk(cocks, arraySpot, totalRemoved);
		}
		public function removeCockUnlocked(arraySpot:int = 0, totalRemoved:int = 1):Boolean
		{
			if (arraySpot == 0 && totalRemoved >= 1 && hasStatusEffect("Mimbrane Cock")) return false;
			if((isCumCow() || isFauxCow()) && cocks.length == 1) return false;
			return true;
		}
		public function removeCockLockedMessage():String
		{
			if (cocks.length == 1 && hasStatusEffect("Mimbrane Cock")) return "The Mimbrane surrounding your " + cockDescript(0) + " suddenly bursts to life and squeezes your dick for all it’s worth. Seems the parasite’s efforts are keeping you from losing your cock entirely.";
			else if(isCumCow() && cocks.length == 1) return "Your body absolutely resists any attempt to deprive it of the penis it adores so dearly.";
			return "Your body practically glows with groin-focused effort, keeping you from losing your genitalia entirely.";
		}
		
		//Remove vaginas
		public function removeVaginas(): void {
			/*while (hasVagina()) {
				removeVagina(0, 1);
			}*/
			if(hasVagina()) removeVagina(0, vaginas.length);
		}
		public function removeVaginasUnlocked():Boolean
		{
			if (hasStatusEffect("Mimbrane Pussy")) return false;
			//Amazon Treatment prevents cunt-loss during.
			if (hasStatusEffect("Treated Amazon") && vaginas.length <= 1 && hasStatusEffect("The Treatment")) return false;
			if (hasStatusEffect("Ovalasting")) return false;
			if (hasStatusEffect("Soak")) return false;
			if (isPregnant(0) || isPregnant(1) || isPregnant(2)) return false;
			return true;
		}
		public function removeVaginasLockedMessage():String
		{
			if (hasStatusEffect("Mimbrane Pussy")) return "A powerful stretching overtakes your " + vaginaDescript(0) + ", your Mimbrane is doing everything in its power to keep the feminine canyon from vanishing. Seems you won’t be able to get rid of your pussy so long as the parasite is in control of it.";
			if (hasStatusEffect("Treated Amazon") && vaginas.length <= 1 && hasStatusEffect("The Treatment")) return "Your body practically glows with groin-focused effort, keeping you from losing your genitalia entirely. <b>It must be the Treatment, keeping you from losing your vagina until it has finished its job...</b>";
			if (isPregnant(0) || isPregnant(1) || isPregnant(2)) return "A powerful sensation can be felt in your womb. Your body actively fights the change, keeping you from losing your pregnant vagina entirely.";
			return "Your body practically glows with groin-focused effort, keeping you from losing your genitalia entirely.";
		}

		//Remove vaginas
		public function removeVagina(arraySpot: int = 0, totalRemoved: int = 1): void {
			removeJunk(vaginas, arraySpot, totalRemoved);
		}
		public function removeVaginaUnlocked(arraySpot:int = 0, totalRemoved:int = 1):Boolean
		{
			if (vaginas.length == 1 && hasStatusEffect("Mimbrane Pussy")) return false;
			if (hasStatusEffect("Treated Amazon") && vaginas.length <= 1 && hasStatusEffect("The Treatment")) return false;
			if (hasStatusEffect("Ovalasting")) return false;
			if (hasStatusEffect("Soak")) return false;
			if (isPregnant(arraySpot)) return false;
			return true;
		}
		public function removeVaginaLockedMessage():String
		{
			if (vaginas.length == 1 && hasStatusEffect("Mimbrane Pussy")) return "A powerful stretching overtakes your " + vaginaDescript(0) + ", your Mimbrane is doing everything in its power to keep the feminine canyon from vanishing. Seems you won’t be able to get rid of your pussy so long as the parasite is in control of it.";
			if (hasStatusEffect("Treated Amazon") && vaginas.length <= 1 && hasStatusEffect("The Treatment")) return "Your body practically glows with groin-focused effort, keeping you from losing your genitalia entirely. <b>It must be the Treatment, keeping you from losing your vagina until it has finished its job...</b>";
			if (isPregnant()) return "A powerful sensation can be felt in your womb. Your body actively fights the change, keeping you from losing your pregnant vagina entirely.";
			return "Your body practically glows with groin-focused effort, keeping you from losing your genitalia entirely.";
		}

		//Remove a breast row
		public function removeBreastRow(arraySpot:int, totalRemoved:int = 1): void {
			removeJunk(breastRows, arraySpot, totalRemoved);
		}
		public function removeBreastRowUnlocked(arraySpot:int = 0, totalRemoved:int = 1):Boolean
		{
			if (breastRows.length == 1 && hasStatusEffect("Mimbrane Boobs")) return false;
			if (hasStatusEffect("Gel Body")) return false;
			return true;
		}
		public function removeBreastRowLockedMessage():String
		{
			if (breastRows.length == 1 && hasStatusEffect("Mimbrane Boobs")) return "Your " + allChestDesc() + " pulls from your body with a tremendous force, resisting the attempt to flatten your girlish curves. The Mimbrane mounds refuse to be deflated, it seems.";
			return "Your body practically glows with chest-focused effort, keeping you from losing your [pc.chest].";
		}

		public function race(): String {
			//Temp vars
			var temp: Number = 0;
			var rando: Number = 0;
			var race:String = "human";
			//Determine race type
			
			/* 
			 * Had an idea that might work better-
			 * Rather than basically taking whatever lands first, execute ALL of these and get the scores of the player regardless.
			 * Then, SCALE them all based on how many points the largest can give- ie, if 20 points is the highest of any, and you get 5 points from one with a 10 max, then scale it up such that 10 => 20 ie 5 => 10.
			 * Pick the HIGHEST score.
			 * In the event of a tie, pick the score with the highest NATURAL max.
			 * Combine in other potentially interesting race combinations (or boring ones- if human score is high enough, always pre-pend 'half-' etc)
			 * ie if your generic taur score is high enough, append "taur", so the game would do shit like ausartaur or w/e (taursaur?)
			 * */
			
			// Gryvin numbers might be too tight- you can walk away with like 7 to 9 score from creation. EVERYTHING just right will get you 12-ish.
			 
			if (horseScore() >= 3) race = equineRace(); // Horse-morphs
			if (vulpineScore() >= 4) race = "vulpine-morph";
			if (kitsuneScore() >= 4 && (race.indexOf("vulpine") == -1 || tailCount > 1)) race = kitsuneRace();
			if (avianScore() >= 4) race = avianRace();
			if (ovirScore() >= 3 && race == "human") race = "half-ovir";
			if (ausarScore() >= 2 && race == "human")
			{
				if (huskarScore() < 3) race = "half-ausar"; // Fucking Ausar forever overriding other shit. EXTERMINATUS.
				else race = "half-huskar";
			}
			if (kaithritScore() >= 3 && race == "human") race = "half-kaithrit";
			if (leithanScore() >= 3 && race == "human") race = "half-leithan";
			if (nukiScore() >= 2 && race == "human") race = "half kui-tan"
			if (gryvainScore() >= 4 && race == "human") race = "half-gryvain";
			if (suulaScore() >= 6 && race == "human") race = "half-suula";
			if (raskvelScore() >= 2) race = "rask-morph";
			if (bovineScore() >= 3) race = bovineRace(); // Cow-morphs
			if (deerScore() >= 5) race = "deer-morph";
			if (raskvelScore() >= 4) race = "raskvel-morph";
			if (pandaScore() >= 4) race = "panda-morph";
			if (redPandaScore() >= 4) race = redPandaRace();
			if (pigScore() >= 4) race = "pig-morph";
			if (bunnyScore() >= 4) race = "bunny-morph";
			if (simiiScore() >= 4) race = "simii";
			if (ausarScore() >= 4)
			{
				if (huskarScore() < 3) race = "ausar";
				else race = "huskar";
			}
			if (hyenaScore() >= 5) race = "hyena-morph";
			if (goatScore() >= 4) race = goatRace();
			if (spiderScore() >= 4) race = "spider-morph";
			if (demonScore() >= 5) race = "demon-morph";
			if (dragonScore() >= 5) race = "dragon-morph";
			if (frostyScore() >= 5) race = "frostwyrm";
			if (janeriaScore() >= 5) race = "janeria";
			if (gabilaniScore() >= 5) race = "gabilani";
			if (frogScore() >= 5) race = "kerokoras";
			if (rodentScore() >= 4) race = "mouse-morph";
			if (kaithritScore() >= 6) race = "kaithrit";
			if (felineScore() >= 5 && race != "kaithrit") race = felineRace();
			if (canineScore() + lupineScore() >= 5 && !InCollection(race, ["ausar", "huskar"])) race = canineRace();
			if (korgonneScore() >= 6) race = "korgonne";
			if (leithanScore() >= 6) race = "leithan";
			if (nukiScore() >= 6) race = "kui-tan";
			if (dzaanScore() >= 6) race = "dzaan";
			if (vanaeScore() >= 6) race = "vanae-morph";
			if (raskvelScore() >= 6) race = "raskvel";
			if (zilScore() >= 6) race = "zil";
			if (suulaScore() >= 8) race = "suula";
			if (badgerScore() >= 4) race = "badger";
			if (ovirScore() >= 5) race = "ovir";
			if (myrScore() >= 4) race = "myr";
			if (gryvainScore() >= 9) race = "gryvain";
			if (race == "myr" && goldMyrScore() >= 8) race = "gold myr";
			if (race == "myr" && redMyrScore() >= 8) race = "red myr";
			if (orangeMyrScore() >= 9) race = "orange myr";
			if (nyreaScore() >= 5) race = "nyrea";
			if (mothrineScore() >= 5) race = "mothrine";
			if (sharkScore() >= 5) race = sharkRace();
			if (sheepScore() >= 5) race = sheepRace();
			if (plantScore() >= 5) race = plantRace();
			if (laquineScore() >= 5) race = "laquine";
			if (lizanScore() >= 7) race = "reptile-morph";
			if (saurmorianScore() >= 6) race = "saurmorian";
			// Human-morphs
			if (race == "human" && cowScore() >= 4) race = mfn("cow-boy", "cow-girl", "hucow");
			if (race == "human" && hradScore() >= 4) race = "hrad";
			if (race == "human" && amazonScore() >= 4) race = "amazoness";
			// Centaur-morphs
			if (horseScore() >= 3 && isCentaur()) race = taurRace(equineRace());
			else if (bovineScore() >= 3 && isTaur()) race = rawmfn("bull", "cow", "bovine") + "-taur";
			else if (race == "amazoness" && isCentaur()) race = "amazonian centaur";
			else if (race == "human" && isCentaur()) race = "centaur";
			else if (isTaur()) race = taurRace(race); // Other taurs
			// Naga-morphs
			if (isNaga()) race = nagaRace();
			// Drider-morphs
			if (isDrider()) race = driderRace();
			// Slime-morphs
			if (xhelScore() >= 6) race = "xhelarfog";
			if (gooScore() >= 6) race = "goo-morph";
			if (gooScore() >= 8) race = "galotian";
			// MLP-morphs
			if (legType == GLOBAL.TYPE_MLP) race = mlpRace();
			// Amalgamations
			if (tentacleScore() >= 15) race = tentacleRace();
			if (race == "human" && humanScore() < 4) race = "alien hybrid";
			
			return race;
		}
		public function raceShort(strict:Boolean = false): String
		{
			return stripRace(race(), (strict && this is PlayerCharacter));
		}
		public function raceCute(simple:Boolean = false, boyGirl:Boolean = false): String
		{
			var sRace:String = race();
			var sRaceShort:String = raceShort();
			if(sRace.indexOf("boy") != -1 || sRace.indexOf("boi") != -1 || sRace.indexOf("girl") != -1) return sRace;
			if(sRace.indexOf("kui-tan") != -1 && sRace.indexOf("taur") != -1) sRaceShort = "kui-taur";
			if(sRace.indexOf("korgonne") != -1 && sRace.indexOf("taur") != -1) sRaceShort = "korg-taur";
		
			var isCute:Boolean = (isBimbo() || tallness < 60);
			// Cute conversions for complex short-race names.
			if(simple)
			{
				switch(sRaceShort)
				{
					case "anthro":
					case "alien":
						if(hasFur() || hasFeathers()) sRaceShort = "furry";
						else if(hasScales()) sRaceShort = "scaly";
						else if(hasGooSkin()) sRaceShort = "goo";
						else if(skinType == GLOBAL.SKIN_TYPE_LATEX) sRaceShort = "sexdoll";
						break;
					case "bovine":
						sRaceShort = mf("bull", "cow");
						break;
					case "canine":
						if(isCute && rand(2) == 0) sRaceShort = "puppy";
						else if(isBimbo() || femininity >= 75 && biggestTitSize() >= 7 && hasVagina()) sRaceShort = "bitch";
						else sRaceShort = "dog";
						break;
					case "vulpine":
					case "kitsune":
						sRaceShort = mf("fox", "vixen");
						break;
					case "lapine":
					case "laquine":
						if (kGAMECLASS.silly) sRaceShort = "bun";
						else sRaceShort = mf("rabbit", "bunny");
						break;
					case "lupine":
						sRaceShort = "wolf";
						break;
					case "feline":
						if(isCute && rand(2) == 0) sRaceShort = "kitty";
						else if(isBimbo() || femininity >= 75 && biggestTitSize() >= 7 && hasVagina()) sRaceShort = "pussy";
						else sRaceShort = "cat";
						break;
					case "avian":
						sRaceShort = "bird";
						break;
					case "ovine":
						if(isCute && rand(2) == 0) sRaceShort = "lamb";
						else if(hasHorns()) sRaceShort = "ram";
						else sRaceShort = "sheep";
						break;
					case "plant":
						if(isCute && rand(2) == 0) sRaceShort = "daisy";
						else sRaceShort = mf("plant", "flower");
						break;
					case "lesser panda":
						sRaceShort = "panda";
						break;
					case "gabilani":
						sRaceShort = "goblin";
						break;
					case "mothrine":
						sRaceShort = "moth";
						break;
					case "reptile":
						sRaceShort = "lizard";
						break;
					case "saurmorian":
						if (rand(10) == 0 && kGAMECLASS.silly) sRaceShort = "space heater";
						else if (rand(2) == 0) sRaceShort = "dino";
						else sRaceShort = "lizard";
						break;
				}
			}
			
			if(boyGirl) sRaceShort += mf(" boy", " girl");
			
			return sRaceShort;
		}
		public function isPuppyorKitten():Boolean
		{
			var sRaceShort:String = raceShort();
			if(InCollection(sRaceShort, ["ausar", "kaithrit", "naleen", "huskar", "milodan", "korgonne", "canine", "feline", "vulpine", "lupine"])) return true;
			return false;
		}
		public function isAusar(original:Boolean = false, strict:Boolean = false):Boolean
		{
			if(original)
			{
				var ogRaceShort:String = stripRace(originalRace, (strict && this is PlayerCharacter));
				if(InCollection(ogRaceShort, ["ausar", "huskar"])) return true;
				if(strict) return false;
			}
			
			var sRaceShort:String = raceShort(strict);
			if(InCollection(sRaceShort, ["ausar", "huskar"])) return true;
			return false;
		}
		
		public function equineRace():String
		{
			if (horseScore() >= 5)
			{
				if (hasHorns() && hasWings()) return "alicorn-morph";
				if (hasHorns() && horns == 1) return "unicorn-morph";
				if (hasWings()) return "pegasus-morph";
				return "horse-morph";
			}
			if (isCentaur()) return "horse-taur";
			return "part horse-morph";
		}
		public function bovineRace():String
		{
			if (bovineScore() >= 6 && femininity <= 60 && femininity >= 40) return "bovine-morph";
			if (hasLegFlag(GLOBAL.FLAG_HOOVES))
			{
				if (isHerm()) return "futaurus";
				if (femininity < 40 && faceType == GLOBAL.TYPE_BOVINE) return "minotaur";
				if (femininity > 60) return "holstaurus";
				if (femininity > 30) return "minitaur";
			}
			if (femininity > 60)
			{
				if (isMale() && hasBreasts()) return "cow-boi";
				if (isMale()) return "bull-girl";
				if (isSexless()) return "cow-morph";
				return "cow-girl";
			}
			if (femininity < 40)
			{
				if (isHerm()) return "bull-futa";
				if (isMale() && !hasBeard() && tallness < 63) return "bull-boy";
				if (isFemale()) return "cow-boy";
				if (isMale()) return "bull-man";
				return "bull-morph";
			}
			return "part bovine-morph";
		}
		public function canineRace():String
		{
			if(faceType == GLOBAL.TYPE_WORG) return "worg-morph";
			if (demonScore() >= 3) return "hellhound-morph";
			if(lupineScore() >= 3)
			{
				if(!hasMuzzle())
				{
					if(isMale() && hasBreasts()) return "wolf-boi";
					if(isMale() && !hasBeard() && tallness < 63) return "wolf-boy";
					if(isMale()) return "wolf-man";
					if(isFemale() || femininity > 60) return "wolf-girl";
				}
				return "lupine-morph";
			}
			if(huskarScore() >= 3) return "husky-morph";
			if(isBimbo() || (femininity >= 75 && biggestTitSize() >= 7 && hasVagina() && libido() >= 75)) return "bitch-morph";
			if(kGAMECLASS.silly) return "doge-morph";
			return "canine-morph";
		}
		public function felineRace():String
		{
			if (dragonScore() >= 4 && hasScales()) return "dragonne";
			else if (isTaur() && isHerm()) return "chakat";
			else if (hasTail(GLOBAL.TYPE_FELINE) && tailCount > 1) return "nekomata";
			return "feline-morph";
		}
		public function kitsuneRace():String
		{
			if (hasPerk("Enlightened Nine-tails") || hasPerk("Nine-tails") || hasPerk("Corrupted Nine-tails")) return "kitsune";
			return "kitsune-morph";
		}
		public function avianRace():String
		{
			if (legType == GLOBAL.TYPE_FELINE && hasBeak()) return "griffin";
			if (legType == GLOBAL.TYPE_EQUINE && hasBeak()) return "hippogriff";
			if (hasFeathers() && (furColor == Foxfire.fireColorNormal || furColor == Foxfire.fireColorArctic)) return "phoenix-morph";
			if (legType == GLOBAL.TYPE_VULPINE && hasBeak()) return "vulpogryph";
			if (InCollection(faceType, GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_HUMANMASKED, GLOBAL.TYPE_NALEEN_FACE, GLOBAL.TYPE_LAPINE))
			{
				if (hasFeathers() && armType == GLOBAL.TYPE_AVIAN && legType == GLOBAL.TYPE_AVIAN && hasWings() && InCollection(wingType, [GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_DOVE])) return "sirin";
				return "harpy";
			}
			return "avian-morph";
		}
		public function driderRace():String
		{
			return "drider";
		}
		public function goatRace():String
		{
			if(hasHorns() && horns >= 2 && hornType == GLOBAL.TYPE_GOAT && legType == GLOBAL.TYPE_GOAT)
			{
				if(getStatusTooltip("Horn Style") == "black" && eyeType == GLOBAL.TYPE_ADREMMALEX && hasPerk("Primorditatts")) return "adremmalex";
				if(!hasMuzzle() && !hasFur()) return "satyr-morph";
			}
			return "goat-morph";
		}
		public function nagaRace():String
		{
			if (avianScore() >= 4 && hasFeathers()) return "quetzalcoatl";
			if (legType == GLOBAL.TYPE_SHARK) return "leviathan naga";
			if (naleenScore() >= 5) return "naleen";
			return "naga";
		}
		public function plantRace():String
		{
			if (wingType == GLOBAL.TYPE_COCKVINE && wingCount > 0 && hasTail(GLOBAL.TYPE_COCKVINE) && cockTotal(GLOBAL.TYPE_TENTACLE) == cockTotal()) return "cockvine-morph";
			if (skinType == GLOBAL.SKIN_TYPE_BARK && hasHorns(GLOBAL.TYPE_DRYAD)) return "treant";
			if (skinType == GLOBAL.SKIN_TYPE_PLANT && (hasHorns(GLOBAL.TYPE_DRYAD) || hasStatusEffect("Hair Flower"))) return "dryad";
			return "plant-morph";
		}
		public function redPandaRace():String
		{
			if(furColor.indexOf("red") != -1 || furColor.indexOf("auburn") != -1 || furColor.indexOf("brown") != -1) return "red panda-morph";
			return "lesser panda-morph";
		}
		public function sharkRace():String
		{
			if(accentMarkings() == 1) return "tiger shark-morph";
			if(accentMarkings() == 2) return "leopard shark-morph";
			if(gabilaniScore() >= 2) return "goblin shark-morph";
			if(bovineScore () >= 2) return "bull shark-morph"
			if(wingCount > 1 && (wingType == GLOBAL.TYPE_AVIAN || wingType == GLOBAL.TYPE_DOVE)) return "angel-shark";
			if(tallness >= 108) return "megalodon-morph";
			if(tallness < 60) return "pygmy shark-morph";
			return "shark-morph";
		}
		public function sheepRace():String
		{
			if(femininity > 60)
			{
				if (isMale() && hasBreasts()) return "sheep-boi";
				if (isMale()) return "ram-girl";
				if (isSexless()) return "sheep-morph";
				return "sheep-girl";
			}
			if(femininity < 40)
			{
				if (isMale() && !hasBeard() && tallness < 63) return "ram-boy";
				if (isFemale()) return "sheep-boy";
				if (isMale()) return "ram-man";
				return "ram-morph";
			}
			if(thickness < 33 || tallness <= 60) return "lamb-morph";
			return "ovine-morph";
		}
		public function tentacleRace():String
		{
			if (tentacleScore() >= 25 || (armType == GLOBAL.TYPE_TENTACLE && legType == GLOBAL.TYPE_TENTACLE)) return "tentacle monster";
			else return "tentacle-morph";
		}
		public function taurRace(sRace:String = ""):String
		{
			if (isDrider() || sRace.indexOf("spider") != -1) return driderRace();
			if (sRace.indexOf("leithan") != -1 || sRace.indexOf("chakat") != -1 || sRace.indexOf("taur") != -1) return sRace;
			if (sRace.indexOf("-morph") != -1) sRace = sRace.replace("-morph", "");
			if (sRace.indexOf(" morph") != -1) sRace = sRace.replace(" morph", "");
			return (sRace + (sRace.indexOf("-") != -1 ? " " : "-") + "taur");
		}
		public function mlpRace():String
		{
			if (hasHorns() && hasWings()) return "alicorn pony";
			if (hasHorns() && horns == 1) return "unicorn pony";
			if (hasWings()) return "pegasus pony";
			return "terran pony";
		}
		
		public function isHuman():Boolean
		{
			//return race() == "human";
			return (!isHalfHuman() && humanScore() >= 4);
		}
		
		public function isHalfHuman():Boolean
		{
			var sRace:String = race();
			if (sRace.indexOf("half-") != -1) return true;
			if (sRace.indexOf("half ") != -1) return true;
			return false;
		}
		public function humanScore(): int {
			var counter: int = 0;
			if (skinType == GLOBAL.SKIN_TYPE_SKIN) counter++;
			if (armType == GLOBAL.TYPE_HUMAN && !hasArmFlag(GLOBAL.FLAG_GOOEY)) counter++;
			if (legType == GLOBAL.TYPE_HUMAN && legCount == 2 && hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) counter++;
			if (faceType == GLOBAL.TYPE_HUMAN) counter++;
			if (earType == GLOBAL.TYPE_HUMAN) counter++;
			if (eyeType == GLOBAL.TYPE_HUMAN) counter++;
			if (hasHair() && hairType != GLOBAL.HAIR_TYPE_REGULAR) counter--;
			if (hasTail()) counter--;
			if (wingType != 0) counter--;
			if (isGoo() || isTaur() || isNaga() || isDrider()) counter -= 2;
			return counter;
		}
		public function ausarScore(): int {
			var counter: int = 0;
			if (InCollection(earType, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_DOGGIE)) counter++;
			if (hasTail(GLOBAL.TYPE_CANINE) && hasTailFlag(GLOBAL.FLAG_LONG) && hasTailFlag(GLOBAL.FLAG_FLUFFY) && hasTailFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (armType == GLOBAL.TYPE_CANINE) counter++;
			if (legType == GLOBAL.TYPE_CANINE && legCount == 2 && hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) counter++;
			if (counter > 0 && faceType == GLOBAL.TYPE_HUMAN) counter++;
			if (hasMuzzle()) counter -= 2;
			if (hasFur()) counter -= 2;
			return counter;
		}
		public function huskarScore():int
		{
			var s:int = 0;
			if (hasArmFlag(GLOBAL.FLAG_FLUFFY)) s++;
			if (hasLegFlag(GLOBAL.FLAG_FLUFFY)) s++;
			if (hasSkinFlag(GLOBAL.FLAG_FLUFFY)) s++; // This is what I'm using for the chestfluff
			if (hasSkinFlag(GLOBAL.FLAG_FLUFFY) && perkv1("Regal Mane") == GLOBAL.FLAG_FURRED) s++;
			if (thickness >= 75) s++;
			return s;
		}
		public function kaithritScore(): int {
			var counter: int = 0;
			if (earType == GLOBAL.TYPE_FELINE) counter++;
			if (tailType == GLOBAL.TYPE_FELINE && tailCount == 1) counter++;
			if (tailType == GLOBAL.TYPE_FELINE && tailCount == 2) counter += 2;
			if (counter > 0 && faceType == GLOBAL.TYPE_HUMAN) counter++;
			if (counter > 1 && armType == GLOBAL.TYPE_FELINE && !hasArmFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (counter > 2 && legType == GLOBAL.TYPE_HUMAN && legCount == 2 && hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) counter++;
			if (counter > 3 && eyeType == GLOBAL.TYPE_FELINE && faceType == GLOBAL.TYPE_HUMAN) counter += 2;
			if (counter > 5 && hasCock(GLOBAL.TYPE_FELINE)) counter++;
			if (femininity < 75) counter--;
			if (femininity < 50 && !hasBreasts()) counter--;
			if (hasMuzzle()) counter -= 2;
			if (hasFur()) counter -= 2;
			return counter;
		}
		public function leithanScore():int {
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_LEITHAN) counter++;
			if (legType == GLOBAL.TYPE_LIZAN && legCount == 6) counter += 2;
			if (armType == GLOBAL.TYPE_LEITHAN && hasArmFlag(GLOBAL.FLAG_CHITINOUS)) counter++;
			if (tongueType == GLOBAL.TYPE_LEITHAN) counter++;
			if (hasTail(GLOBAL.TYPE_LIZAN)) counter++;
			if (counter > 0 && skinType == GLOBAL.SKIN_TYPE_SCALES && scaleColor == "black") counter++;
			if (counter > 3 && eyeType == GLOBAL.TYPE_LEITHAN && faceType == GLOBAL.TYPE_HUMAN) counter += 2;
			if (eyeType != GLOBAL.TYPE_LEITHAN) counter--;
			return counter;
		}
		public function nukiScore(): int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_KUITAN) counter++;
			if (hasTail(GLOBAL.TYPE_KUITAN) && hasTailFlag(GLOBAL.FLAG_LONG)) counter++;
			if (faceType == GLOBAL.TYPE_KUITAN) counter++;
			if (armType == GLOBAL.TYPE_KUITAN) counter++;
			if (legType == GLOBAL.TYPE_KUITAN) counter++;
			if (hasCock(GLOBAL.TYPE_KUITAN)) counter++;
			if (counter > 1 && hasCock() && balls >= 2) counter++;
			return counter;
		}
		public function gooScore():int
		{
			var counter:int = 0;
			if (legType == GLOBAL.TYPE_GOOEY)
			{
				counter += 2;
				if (hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) counter += 2;
			}
			if (hairType == GLOBAL.HAIR_TYPE_GOO) counter++;
			if (hasStatusEffect("Goo Vent")) counter++;
			if (hasStatusEffect("Goo Crotch")) counter++;
			if (hasStatusEffect("Gel Body")) counter++;
			if (counter > 1 && skinType == GLOBAL.SKIN_TYPE_GOO) counter++;
			//if (counter > 2 && tongueType == GLOBAL.TYPE_GOOEY) counter++;
			return counter;
		}
		public function cowScore():int
		{
			var counter:int = 0;
			if (bovineScore() >= 2)
			{
				counter += bovineScore();
				if (isLactating()) counter++;
				if (hipRating() >= 20) counter++;
				if (nippleLengthRatio >= 2) counter++;
				if (nipplesPerBreast == 4) counter++;
				if (totalBreasts() >= 4) counter++;
				if (isMilkTank()) counter++;
			}
			return counter;
		}
		public function bovineScore():int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_BOVINE) counter++;
			if (hasHorns(GLOBAL.TYPE_BOVINE)) counter++;
			if (hasTail(GLOBAL.TYPE_BOVINE) && hasTailFlag(GLOBAL.FLAG_LONG) && hasTailFlag(GLOBAL.FLAG_FLUFFY)) counter++;
			if (legType == GLOBAL.TYPE_BOVINE) counter++;
			//if (tongueType == GLOBAL.TYPE_BOVINE && hasTongueFlag(GLOBAL.FLAG_LONG)) counter++;
			if (faceType == GLOBAL.TYPE_BOVINE) counter += 2;
			if (hasScales()) counter--;
			return counter;
		}
		public function amazonScore(): int
		{
			var counter: int = 0;
			// Must have vagina!
			if(hasVagina())
			{
				if(tallness >= 84) counter++;
				if(tone >= 75) counter++;
				if(thickness >= 25) counter++;
				if(hasPerk("Snu-Snu Queen") || hasPerk("Energizing Libido") || hasPerk("Amazonian Endurance")) counter += 2;
				if(tone < 75) counter -= 2;
			}
			return counter;
		}
		public function avianScore():int
		{
			var counter: int = 0;
			if (earType == GLOBAL.TYPE_AVIAN) counter++;
			if (faceType == GLOBAL.TYPE_AVIAN)
			{
				counter++;
				if (hasBeak()) counter++;
			}
			if (armType == GLOBAL.TYPE_AVIAN) counter++;
			if (legType == GLOBAL.TYPE_AVIAN) counter++;
			if (hasWings(GLOBAL.TYPE_AVIAN) || hasWings(GLOBAL.TYPE_DOVE)) counter++;
			if (hasTail(GLOBAL.TYPE_AVIAN)) counter++;
			if (skinType == GLOBAL.SKIN_TYPE_FEATHERS) counter++;
			if (counter > 0 && eyeType == GLOBAL.TYPE_AVIAN) counter++;
			if (counter > 0 && hasHair() && hairType == GLOBAL.HAIR_TYPE_FEATHERS) counter++;
			if (counter > 2 && legType == GLOBAL.TYPE_FELINE) // griffin
			{
				counter++;
				if (hasTail(GLOBAL.TYPE_FELINE)) counter++;
				if (eyeType == GLOBAL.TYPE_FELINE) counter++;
				if (earType == GLOBAL.TYPE_FELINE) counter++;
			}
			if (counter > 2 && legType == GLOBAL.TYPE_EQUINE) // hippogriff
			{
				counter++;
				if (hasTail(GLOBAL.TYPE_EQUINE)) counter++;
				if (earType == GLOBAL.TYPE_EQUINE) counter++;
			}
			if (counter > 2 && isNaga()) counter++; // quetzalcoatl
			return counter;
		}
		public function badgerScore():int
		{
			var counter:int = 0;
			if (hasTail(GLOBAL.TYPE_BADGER)) counter++;
			if (armType == GLOBAL.TYPE_BADGER) counter++;
			if (faceType == GLOBAL.TYPE_BADGER) counter++;
			if (earType == GLOBAL.TYPE_BADGER) counter++;
			if (counter > 0 && skinType == GLOBAL.SKIN_TYPE_FUR) counter++;
			return counter;
		}
		public function bunnyScore():int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_LAPINE) counter++;
			if (legType == GLOBAL.TYPE_LAPINE) counter++;
			if (faceType == GLOBAL.TYPE_LAPINE) counter++;
			if (tailType == GLOBAL.TYPE_LAPINE) counter++;
			if (armType == GLOBAL.TYPE_LAPINE) counter++;
			if (counter > 0 && !hasFur()) counter--;
			return counter;
		}
		public function korgonneScore(): int {
			var counter: int = 0;
			if (earType == GLOBAL.TYPE_KORGONNE) counter++;
			if (hasTail(GLOBAL.TYPE_KORGONNE) && hasTailFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (armType == GLOBAL.TYPE_KORGONNE && hasArmFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (legType == GLOBAL.TYPE_KORGONNE && hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) counter++;
			if (faceType == GLOBAL.TYPE_KORGONNE) counter++;
			if (counter > 1 && hasCock() && cockTotal(GLOBAL.TYPE_CANINE) == cockTotal() && totalKnots() == cockTotal()) counter++;
			if (counter > 1 && hasVagina() && vaginaTotal(GLOBAL.TYPE_KORGONNE) == vaginaTotal()) counter++;
			if (nippleColor == "blue") counter++;
			if (hasMuzzle() && counter > 0) counter += 1;
			if (counter > 0 && !hasFur()) counter--;
			return counter;
		}
		public function canineScore(): int {
			var counter: int = 0;
			if (InCollection(earType, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_DOGGIE)) counter++;
			if (hasTail(GLOBAL.TYPE_CANINE) && hasTailFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (armType == GLOBAL.TYPE_CANINE && hasArmFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (legType == GLOBAL.TYPE_CANINE && hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) counter++;
			if (faceType == GLOBAL.TYPE_CANINE) counter++;
			if (hasMuzzle()) counter += 2;
			if (counter > 1 && hasCock() && cockTotal(GLOBAL.TYPE_CANINE) == cockTotal() && totalKnots() == cockTotal()) counter++;
			if (counter > 1 && hasVagina() && vaginaTotal(GLOBAL.TYPE_CANINE) == vaginaTotal()) counter++;
			if (counter > 0 && !hasFur()) counter--;
			return counter;
		}
		public function deerScore(): int
		{
			var counter:int = 0;
			if (hasHorns(GLOBAL.TYPE_DEER)) counter++;
			if (earType == GLOBAL.TYPE_DEER) counter++;
			if (hasTail(GLOBAL.TYPE_DEER)) counter++;
			if (legType == GLOBAL.TYPE_DEER) counter++;
			if (eyeType == GLOBAL.TYPE_DEER) counter++;
			if (faceType == GLOBAL.TYPE_DEER) counter++;
			if (counter > 1)
			{
				if (vaginaTotal(GLOBAL.TYPE_DEER) > 0) counter++;
				if (cockTotal(GLOBAL.TYPE_DEER) > 0) counter++;
				else if (cockTotal(GLOBAL.TYPE_EQUINE) > 0) counter++;
			}
			return counter;
		}
		public function demonScore(): int
		{
			var counter: int = 0;
			if (hasHorns(GLOBAL.TYPE_DEMONIC)) counter++;
			if (earType == GLOBAL.TYPE_DEMONIC) counter++;
			if (armType == GLOBAL.TYPE_DEMONIC) counter++;
			if (hasTail(GLOBAL.TYPE_DEMONIC) || hasTailCock(GLOBAL.TYPE_DEMONIC)) counter++;
			if (InCollection(wingType, [GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_SMALLDEMONIC, GLOBAL.TYPE_TENTACLE])) counter++;
			if (counter > 1 && (legType == GLOBAL.TYPE_DEMONIC || legType == GLOBAL.TYPE_SUCCUBUS || hasLegFlag(GLOBAL.FLAG_HOOVES))) counter++;
			if (counter > 2 && eyeType == GLOBAL.TYPE_DEMONIC && faceType == GLOBAL.TYPE_HUMAN) counter++;
			if (counter > 3 && hasCock(GLOBAL.TYPE_DEMONIC)) counter++;
			return counter;
		}
		public function dragonScore():int
		{
			var counter:int = 0;
			if (faceType == GLOBAL.TYPE_DRACONIC) counter++;
			if (earType == GLOBAL.TYPE_DRACONIC) counter++;
			if (hasTail(GLOBAL.TYPE_DRACONIC) || hasTail(GLOBAL.TYPE_GRYVAIN)) counter++;
			if (tongueType == GLOBAL.TYPE_DRACONIC) counter++;
			if (cockTotal(GLOBAL.TYPE_DRACONIC) > 0) counter++;
			if (hasWings() && InCollection(wingType, [GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_SMALLDRACONIC, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_FROSTWYRM])) counter++;
			if (legType == GLOBAL.TYPE_DRACONIC) counter++;
			if (hasHorns(GLOBAL.TYPE_DRACONIC) || hasHorns(GLOBAL.TYPE_LIZAN) || hasHorns(GLOBAL.TYPE_GRYVAIN) || hasHorns(GLOBAL.TYPE_FROSTWYRM)) counter++;
			if (counter > 0 && skinType == GLOBAL.SKIN_TYPE_SCALES) counter++;
			if (hasPerk("Dragonfire")) counter++;
			return counter;
		}
		public function dzaanScore():int
		{
			var counter:int = 0;
			if (hasVagina())
			{
				if (faceType == GLOBAL.TYPE_DZAAN) counter++;
				if (earType == GLOBAL.TYPE_DZAAN) counter++;
				if (armType == GLOBAL.TYPE_DZAAN) counter++;
				if (legType == GLOBAL.TYPE_DZAAN) counter++;
				if (hasHorns(GLOBAL.TYPE_DZAAN)) counter++;
				if (counter > 0 && !hasTail()) counter++;
				if (counter > 0 && tallness >= 6*12) counter++;
				if (counter > 2 && hasCock(GLOBAL.TYPE_DZAAN)) counter++;
				if (hasFur() || hasFeathers()) counter--;
				if (wingType != 0) counter--;
				if (isGoo() || isTaur() || isNaga() || isDrider()) counter -= 2;
			}
			return counter;
		}
		public function felineScore(): int {
			var counter: int = 0;
			if (earType == GLOBAL.TYPE_FELINE) counter++;
			if (hasTail(GLOBAL.TYPE_FELINE)) counter++;
			if (faceType == GLOBAL.TYPE_FELINE || faceType == GLOBAL.TYPE_NALEEN_FACE) counter++;
			if (armType == GLOBAL.TYPE_FELINE && hasArmFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (legType == GLOBAL.TYPE_FELINE && hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) counter++;
			if (eyeType == GLOBAL.TYPE_FELINE && faceType == GLOBAL.TYPE_FELINE) counter++;
			if (counter > 1 && cockTotal(GLOBAL.TYPE_FELINE) == cockTotal()) counter++;
			if (counter > 0 && !hasFur()) counter--;
			return counter;
		}
		public function frogScore(): int
		{
			var counter: int = 0;
			if (skinType == GLOBAL.SKIN_TYPE_SKIN && hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) counter++;
			if (legType == GLOBAL.TYPE_FROG) counter++;
			if (armType == GLOBAL.TYPE_FROG) counter++;
			if (hasTail(GLOBAL.TYPE_FROG)) counter++;
			if (faceType == GLOBAL.TYPE_FROG) counter++;
			if (faceType == GLOBAL.TYPE_FROG || faceType == GLOBAL.TYPE_HUMAN)
			{
				if (eyeType == GLOBAL.TYPE_FROG) counter++;
				if (earType == GLOBAL.TYPE_FROG) counter++;
				if (tongueType == GLOBAL.TYPE_FROG) counter++;
			}
			if (hasFur() || hasFeathers()) counter--;
			if (!hasFlatNipples() && !hasInvertedNipples()) counter--;
			return counter;
		}
		public function frostyScore():int
		{
			var counter:int = 0;
			if (hasScales()) counter++;
			else if (hasFur()) counter--;
			if (tallness > 7*12) counter++;
			else if (tallness < 6*12) counter--;
			if (legType == GLOBAL.TYPE_FROSTWYRM) counter++;
			if (armType == GLOBAL.TYPE_FROSTWYRM) counter++;
			if (faceType == GLOBAL.TYPE_FROSTWYRM) counter++;
			if (eyeType == GLOBAL.TYPE_FROSTWYRM) counter++;
			if (eyeColor.indexOf("red") >= 0) counter++;
			if (hasCock(GLOBAL.TYPE_FROSTWYRM) && hasStatusEffect("Genital Slit")) counter++;
			if (hasVaginaType(GLOBAL.TYPE_FROSTWYRM)) counter++;
			if (hasWings(GLOBAL.TYPE_FROSTWYRM)) counter++;
			if (hasTail(GLOBAL.TYPE_FROSTWYRM)) counter++;
			return counter;
		}
		public function gabilaniScore():int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_GABILANI) counter++;
			if (faceType == GLOBAL.TYPE_GABILANI && !hasMuzzle())
			{
				counter++;
				if (eyeType == GLOBAL.TYPE_GABILANI) counter++;
				if (counter > 2 && isCyborg()) counter += cyborgScore();
			}
			if (counter > 0 && skinType == GLOBAL.SKIN_TYPE_SKIN && InCollection(skinTone, "green", "lime", "emerald", "aqua", "pale blue", "turquoise", "yellow", "amber", "topaz")) counter++;
			if (counter > 0 && tallness >= 24 && tallness <= 48) counter++;
			if (counter > 3 && hasCock(GLOBAL.TYPE_GABILANI)) counter++;
			if (counter > 3 && hasVaginaType(GLOBAL.TYPE_GABILANI)) counter++;
			if (counter > 0 && (!isBiped() || !hasLegFlag(GLOBAL.FLAG_PLANTIGRADE))) counter--;
			if (tallness >= 72) counter--;
			if (tallness >= 84) counter--;
			if (tallness >= 96) counter--;
			return counter;
		}
		public function goatScore(): int
		{
			var counter:int = 0;
			if (legType == GLOBAL.TYPE_GOAT) counter++;
			if (hasHorns(GLOBAL.TYPE_GOAT)) counter++;
			if (eyeType == GLOBAL.TYPE_GOAT || eyeType == GLOBAL.TYPE_ADREMMALEX) counter++;
			if (earType == GLOBAL.TYPE_GOAT) counter++;
			if (faceType == GLOBAL.TYPE_GOAT) counter++;
			if (counter > 2 && hasFur()) counter++;
			if (counter > 3 && cockTotal(GLOBAL.TYPE_GOAT) > 0) counter++;
			return counter;
		}
		public function gryvainScore():int
		{
			var s:int = 0;
			// 5 >> 8
			
			if (faceType != GLOBAL.TYPE_HUMAN || hasMuzzle()) s--;
			if (armType != GLOBAL.TYPE_HUMAN || hasArmFlag(GLOBAL.FLAG_SCALED) || hasArmFlag(GLOBAL.FLAG_FURRED)) s--;
			if (skinType == GLOBAL.SKIN_TYPE_SKIN /*&& InCollection(skinTone, "pale", "tanned", "pink", "dark red", "dark green")*/) s++;
			if (legType == GLOBAL.TYPE_GRYVAIN && hasLegFlag(GLOBAL.FLAG_PLANTIGRADE) && hasLegFlag(GLOBAL.FLAG_SCALED)) s++;
			if (tailType == GLOBAL.TYPE_GRYVAIN && hasTailFlag(GLOBAL.FLAG_SCALED)) s++;
			if (eyeType == GLOBAL.TYPE_GRYVAIN /*&& eyeColor == "dark yellow"*/) s++;
			if (earType == GLOBAL.TYPE_GRYVAIN && earLength >= 3) s++;
			if (wingType == GLOBAL.TYPE_GRYVAIN)
			{
				s++;
				if (wingCount == 4) s++;
			}
			
			var i:int = 0;
			var gv:Boolean = false;
			var gp:Boolean = false;
			
			// All gryvain have vaginas afaik
			if (!hasVagina()) s--;
			else
			{
				for (i = 0; i < vaginas.length; i++)
				{
					if (vaginas[i].type == GLOBAL.TYPE_GRYVAIN && vaginas[i].hasFlag(GLOBAL.FLAG_NUBBY)) gv = true;
				}
				if (gv) s++;
			}
			
			if (hasCock())
			{
				for (i = 0; i < cocks.length; i++)
				{
					if (cocks[i].cType == GLOBAL.TYPE_GRYVAIN && cocks[i].hasFlag(GLOBAL.FLAG_KNOTTED)) gp = true;
				}
				if (gp) s++;
				else s--;
			}
			
			// color uniformity:-
			var mc:String = scaleColor;
			var ch:Boolean = mc == hairColor;
			var cn:Boolean = !hasNipples() || nippleColor == mc;
			var ck:Boolean = true;
			var cv:Boolean = true;
			
			for (i = 0; i < cocks.length; i++)
			{
				if ((cocks[i] as CockClass).cockColor != mc) ck = false;
			}
			for (i = 0; i < vaginas.length; i++)
			{
				if ((vaginas[i] as VaginaClass).vaginaColor != mc) cv = false;
			}
			
			if (ch && cn && ck && cv) s++;
			
			if (horns >= 2 && hornType == GLOBAL.TYPE_GRYVAIN /*&& hornLength >= 3 && hornLength <= 6*/) s++;
			else s--;
			
			return s;
		}
		public function equineScore(): int { return horseScore(); }
		public function horseScore(): int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_EQUINE) counter++;
			if (hasTail(GLOBAL.TYPE_EQUINE) && hasTailFlag(GLOBAL.FLAG_LONG)) counter++;
			if (faceType == GLOBAL.TYPE_EQUINE) counter++;
			if (armType == GLOBAL.TYPE_EQUINE) counter++;
			if (legType == GLOBAL.TYPE_EQUINE) counter++;
			if (counter > 2 && cockTotal(GLOBAL.TYPE_EQUINE) > 0) counter++;
			if (counter > 2 && vaginaTotal(GLOBAL.TYPE_EQUINE) > 0) counter++;
			if (counter > 3 && hairType == GLOBAL.HAIR_TYPE_REGULAR && hasPerk("Mane")) counter++;
			return counter;
		}
		public function hyenaScore():int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_HYENA) counter++;
			if (legType == GLOBAL.TYPE_HYENA) counter++;
			if (armType == GLOBAL.TYPE_HYENA) counter++;
			if (faceType == GLOBAL.TYPE_HYENA) counter++;
			if (hasTail(GLOBAL.TYPE_HYENA)) counter++;
			if (counter > 0 && tongueType == GLOBAL.TYPE_CANINE) counter++;
			if (counter > 0 && hasFur()) counter++;
			if (counter > 1 && cockTotal(GLOBAL.TYPE_CANINE) > 0) counter++;
			if (counter > 1 && vaginaTotal(GLOBAL.TYPE_CANINE) > 0 && clitLength >= 4) counter++;
			if (hasStatusEffect("Hyena Fur")) counter++;
			if (hasScales()) counter--;
			if (hasWings()) counter--;
			if (hasHorns()) counter--;
			if (legCount%2 == 1) counter--;
			return counter;
		}
		public function hradScore():int
		{
			var counter:int = 0;
			if (hasAntennae(GLOBAL.TYPE_HRAD))
			{
				counter++;
				if (skinType == GLOBAL.SKIN_TYPE_SKIN && InCollection(skinTone, "emerald", "green", "viridescent")) counter++;
				if (hairType == GLOBAL.HAIR_TYPE_REGULAR && hairColor == "vibrant purple") counter++;
				if (InCollection(nippleColor, "bright purple", "pink", "purple","violet")) counter++;
			}
			if (counter > 0 && hasCock(GLOBAL.TYPE_HRAD) && balls >= 2) counter++;
			if (counter > 1 && canLactate() && milkType == GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT) counter++;
			if (counter > 1 && hasCock() && cumType == GLOBAL.FLUID_TYPE_HRAD_CUM) counter++;
			if (counter > 1 && hasVagina() && girlCumType == GLOBAL.FLUID_TYPE_HRAD_CUM) counter++;
			if (!isBiped() || !hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) counter--;
			return counter;
		}
		public function janeriaScore():int
		{
			var counter:int = 0;
			if (eyeType == GLOBAL.TYPE_JANERIA) counter++;
			if (legType == GLOBAL.TYPE_JANERIA) counter++;
			if (wingType == GLOBAL.TYPE_JANERIA)
			{
				if (wingCount > 0) counter++;
				if (wingCount == 4) counter++;
			}
			if (hasCock(GLOBAL.TYPE_JANERIA))
			{
				counter++;
				if (hasStatusEffect("Genital Slit")) counter++;
			}
			if (counter > 0 && tongueType == GLOBAL.TYPE_FROSTWYRM) counter++;
			if (counter > 0 && hasVaginaType(GLOBAL.TYPE_SNAKE)) counter++;
			if (skinType != GLOBAL.SKIN_TYPE_SKIN) counter--;
			else if(counter > 0)
			{
				if (hasSkinFlag(GLOBAL.FLAG_SMOOTH)) counter++;
				if (skinTone.indexOf("blue") != -1 || skinTone.indexOf("green") != -1) counter++;
			}
			return counter;
		}
		public function kitsuneScore():int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_VULPINE) counter++;
			if (hasTail(GLOBAL.TYPE_VULPINE)) counter++;
			if (hasTail(GLOBAL.TYPE_VULPINE) && tailCount >= 2) counter += 2;
			if (hasTail(GLOBAL.TYPE_VULPINE) && tailCount == 9) counter += 1;
			//If the character has tattooed skin, +1
			//9999
			if (biggestVaginalCapacity() >= 8000) counter++;
			if (counter > 0 && (faceType == GLOBAL.TYPE_HUMAN || faceType == GLOBAL.TYPE_VULPINE)) counter++;
			// commented, requires Lucid Dreams mod parts to work
			//if (counter > 0 && (InCollection(furColor, kGAMECLASS.basicKitsuneHair, kGAMECLASS.elderKitsuneColors, kGAMECLASS.corruptKitsuneColors))) counter++;
			if (counter > 0 && femininity >= 40) counter++;
			//If the character has fur of non-foxy color
			// commented, requires Lucid Dreams mod parts to work
			//if (skinType == GLOBAL.SKIN_TYPE_FUR && !InCollection(furColor, kGAMECLASS.basicKitsuneFur, kGAMECLASS.elderKitsuneColors, kGAMECLASS.corruptKitsuneColors)) counter--;
			if (skinType > GLOBAL.SKIN_TYPE_FUR) counter -= 2; // Not skin or fur
			if (!InCollection(legType, GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_VULPINE)) counter--;
			if (!InCollection(faceType, GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_VULPINE)) counter--;
			if (earType != GLOBAL.TYPE_VULPINE) counter--;
			if (!hasTail(GLOBAL.TYPE_VULPINE)) counter--;
			return counter;
		}
		public function laquineScore():int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_LAPINE || earType == GLOBAL.TYPE_QUAD_LAPINE) counter++;
			if (legType == GLOBAL.TYPE_LAPINE) counter++;
			if (faceType == GLOBAL.TYPE_LAPINE && hasMuzzle()) counter++;
			if (tailType == GLOBAL.TYPE_LAPINE) counter++;
			if (armType == GLOBAL.TYPE_LAPINE) counter++;
			//if (!hasCock(GLOBAL.TYPE_EQUINE) && !hasVaginaType(GLOBAL.TYPE_EQUINE) && counter > 0) counter = 0;
			if (counter > 1 && hasCock()) {
				if(hasCock(GLOBAL.TYPE_EQUINE)) counter++;
				else counter--;
			}
			if (counter > 1 && hasVagina()) {
				if(hasVaginaType(GLOBAL.TYPE_EQUINE)) counter++;
				else counter--;
			}
			//if (counter > 0 && hasFur()) counter++;
			if (counter > 0 && !hasFur()) counter--;
			if (!hasGenitals()) counter = 0;
			return counter;
		}
		public function lizanScore():int
		{
			var counter:int = 0;
			if (hasFlatEars()) counter++;
			if (earType == GLOBAL.TYPE_LIZAN) counter++;
			if (faceType == GLOBAL.TYPE_LIZAN) counter++;
			else if (tongueType == GLOBAL.TYPE_OVIR || hasMuzzle()) counter++;
			if (skinType == GLOBAL.SKIN_TYPE_SCALES) counter++;
			else counter -= 2;
			if (hasArmFlag(GLOBAL.FLAG_SCALED)) counter++;
			if (armType == GLOBAL.TYPE_LIZAN) counter++;
			if (hasLegFlag(GLOBAL.FLAG_SCALED)) counter++;
			if (legType == GLOBAL.TYPE_LIZAN) counter++;
			if (eyeType == GLOBAL.TYPE_LIZAN) counter++;
			if (hasTail() && tailType == GLOBAL.TYPE_LIZAN) counter++;
			if (counter >= 6 && hasCock(GLOBAL.TYPE_NAGA)) counter++;
			if (counter >= 6 && hasVaginaType(GLOBAL.TYPE_LIZAN)) counter++;
			if (hasPerk("Oviposition")) counter++;
			if (biggestTitSize() > 2) counter--;
			if (hasHair() || hasBeard()) counter--;
			if (legCount != 2 && !isNaga()) counter -= 2;
			if (!hasTail()) counter -= 2;
			return counter;
		}
		public function lupineScore(): int {
			var counter: int = 0;
			if (earType == GLOBAL.TYPE_LUPINE) counter++;
			if (hasTail(GLOBAL.TYPE_LUPINE) && hasTailFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (armType == GLOBAL.TYPE_LUPINE && hasArmFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (legType == GLOBAL.TYPE_LUPINE && hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) counter++;
			if (faceType == GLOBAL.TYPE_LUPINE) counter++;
			if (counter > 0 && !hasFur()) counter--;
			return counter;
		}
		public function mothrineScore(): int
		{
			var counter:int = 0;
			if (hasAntennae(GLOBAL.TYPE_MOTHRINE)) counter++
			if (faceType == GLOBAL.TYPE_MOTHRINE)
			{
				counter++;
				if (tongueType == GLOBAL.TYPE_MOTHRINE) counter++;
				if (hasHair() && hairType == GLOBAL.HAIR_TYPE_REGULAR) counter++;
			}
			if (eyeType == GLOBAL.TYPE_MOTHRINE) counter++;
			if (earType == GLOBAL.TYPE_MOTHRINE) counter++;
			if (armType == GLOBAL.TYPE_MOTHRINE) counter++;
			if (legType == GLOBAL.TYPE_MOTHRINE) counter++;
			if (hasWings(GLOBAL.TYPE_MOTHRINE)) counter++;
			if (counter > 2 && hasCock(GLOBAL.TYPE_MOTHRINE)) counter++;
			if (!hasChitin() && !hasFur()) counter--;
			return counter;
		}
		public function myrScore(): int
		{
			var counter:int = 0;
			if (eyeType == GLOBAL.TYPE_MYR) counter++;
			if (armType == GLOBAL.TYPE_MYR) counter++;
			if (legType == GLOBAL.TYPE_MYR) counter++;
			if (hasAntennae(GLOBAL.TYPE_MYR)) counter++;
			if (counter > 0 && earType == GLOBAL.TYPE_SYLVAN) counter++;
			if (counter > 0 && canLactate() && milkType == GLOBAL.FLUID_TYPE_HONEY) counter++;
			if (hasFur() || hasScales()) counter--;
			return counter;
		}
		public function redMyrScore():int
		{
			var counter:int = myrScore();
			if (hasPerk("Myr Venom")) counter += 4;
			if (scaleColor == "red" && (armType == GLOBAL.TYPE_MYR || legType == GLOBAL.TYPE_MYR)) counter += 2;
			return counter;
		}
		public function goldMyrScore(): int
		{
			var counter:int = myrScore();
			if (hasPerk("Honeypot")) counter += 4;
			if (tailType == GLOBAL.TYPE_MYR && tailCount == 1) counter += 3;
			if (scaleColor == "gold" && (armType == GLOBAL.TYPE_MYR || legType == GLOBAL.TYPE_MYR)) counter += 2;
			return counter;
		}
		public function orangeMyrScore():int
		{
			var counter:int = myrScore();
			if (flags["MCALLISTER_MYR_HYBRIDITY"] >= 3)
			{
				if (hasPerk("Honeypot") && hasPerk("Myr Venom")) counter += 4;
				if (tailType == GLOBAL.TYPE_MYR && tailCount == 1) counter++;
				if (scaleColor == "orange" && (armType == GLOBAL.TYPE_MYR || legType == GLOBAL.TYPE_MYR)) counter += 5;
			}
			return counter;
		}
		public function naleenScore(): int
		{
			var counter: int = 0;
			if (isNaga()) counter += 2;
			if (faceType == GLOBAL.TYPE_NALEEN_FACE)
			{
				counter++;
				if (eyeType == GLOBAL.TYPE_NAGA) counter++;
				if (earType == GLOBAL.TYPE_FELINE) counter++;
			}
			if (hasGenitals() && hasStatusEffect("Genital Slit"))
			{
				if (counter > 0) counter++;
				if (hasCock(GLOBAL.TYPE_NAGA)) counter++;
				if (hasVaginaType(GLOBAL.TYPE_NAGA)) counter++;
			}
			if (counter > 0 && skinType == GLOBAL.SKIN_TYPE_FUR) counter++;
			if (counter > 0 && armType == GLOBAL.TYPE_FELINE && hasArmFlag(GLOBAL.FLAG_FURRED)) counter++;
			return counter;
		}
		public function nyreaScore(): int
		{
			var counter:int = 0;
			if (eyeType == GLOBAL.TYPE_NYREA) counter++;
			if (armType == GLOBAL.TYPE_NYREA) counter++;
			if (legType == GLOBAL.TYPE_NYREA) counter++;
			if (faceType == GLOBAL.TYPE_HUMAN)
			{
				if (hasHair() && hairType == GLOBAL.HAIR_TYPE_QUILLS) counter++;
				if (counter > 0 && earType == GLOBAL.TYPE_SYLVAN) counter++;
			}
			if (counter > 2 && hasCock(GLOBAL.TYPE_NYREA) && cumType == GLOBAL.FLUID_TYPE_NYREA_CUM) counter++;
			if (counter > 2 && hasVaginaType(GLOBAL.TYPE_NYREA) && girlCumType == GLOBAL.FLUID_TYPE_NYREA_GIRLCUM) counter++;
			if (hasFur() || hasScales()) counter--;
			return counter;
		}
		public function ovirScore():int
		{
			var score:int = 0;
			if (skinType == GLOBAL.SKIN_TYPE_SCALES && InCollection(scaleColor, "green", "purple", "red", "yellow", "brown", "tan", "olive green")) score++;
			if (hasTail(GLOBAL.TYPE_OVIR)) score++;
			if (eyeType == GLOBAL.TYPE_SNAKE && InCollection(eyeColor, "green", "blue", "yellow", "red", "gray")) score++;
			if (tongueType == GLOBAL.TYPE_OVIR) score++;
			if (legType == GLOBAL.TYPE_OVIR) score++;
			if (armType == GLOBAL.TYPE_OVIR && legType == GLOBAL.TYPE_OVIR) score++;
			if (score > 0 && hasCock(GLOBAL.TYPE_EQUINE) && (balls == 0 || hasStatusEffect("Uniball"))) score++;
			if (score > 0 && (hasCock(GLOBAL.TYPE_EQUINE) || hasVagina()) && hasStatusEffect("Genital Slit")) score++;
			if (score > 0 && (faceType == GLOBAL.TYPE_HUMAN && !hasMuzzle())) score++;
			return score;
		}
		public function pandaScore(): int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_PANDA) counter++;
			if (hasTail(GLOBAL.TYPE_PANDA)) counter++;
			if (faceType == GLOBAL.TYPE_PANDA) counter++;
			if (armType == GLOBAL.TYPE_PANDA) counter++;
			if (legType == GLOBAL.TYPE_PANDA) counter++;
			if (counter > 0 && thickness >= 65) counter++;
			//if (cockTotal(GLOBAL.TYPE_PANDA) > 0) counter++;
			//if (vaginaTotal(GLOBAL.TYPE_PANDA) > 0) counter++;
			return counter;
		}
		public function pigScore():int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_SWINE) counter++;
			if (faceType == GLOBAL.TYPE_SWINE) counter++;
			if (legType == GLOBAL.TYPE_SWINE) counter++;
			if (cockTotal(GLOBAL.TYPE_SWINE) > 0) counter++;
			if (vaginaTotal(GLOBAL.TYPE_SWINE) > 0) counter++;
			if (tailType == GLOBAL.TYPE_SWINE) counter++;
			if (counter > 0 && thickness >= 80) counter++;
			if (counter > 0 && skinType == GLOBAL.SKIN_TYPE_SKIN && InCollection(skinTone, "pink", "brown-pink", "red-pink", "white", "black", "gray", "brown")) counter++;
			if (counter > 0 && hasCock() && hasSheath(0)) counter++;
			
			return counter;
		}
		public function plantScore(): int
		{
			var counter: int = 0;
			if (InCollection(skinType, GLOBAL.SKIN_TYPE_PLANT, GLOBAL.SKIN_TYPE_BARK)) counter++;
			if (hasHair() && InCollection(hairType, GLOBAL.HAIR_TYPE_TENTACLES, GLOBAL.HAIR_TYPE_PLANT)) counter++;
			if (hasBeard() && InCollection(beardType, GLOBAL.HAIR_TYPE_TENTACLES, GLOBAL.HAIR_TYPE_PLANT)) counter++;
			if (hasHorns(GLOBAL.TYPE_DRYAD) || hasStatusEffect("Hair Flower")) counter++;
			if (armType == GLOBAL.TYPE_FLOWER) counter++;
			if (counter > 0 && wingType == GLOBAL.TYPE_COCKVINE && wingCount > 0) counter++;
			if (counter > 0 && vaginaTotal(GLOBAL.TYPE_FLOWER) == vaginaTotal()) counter++;
			if (counter > 1 && hasCock() && cumType == GLOBAL.FLUID_TYPE_FRUIT_CUM) counter++;
			if (counter > 1 && hasVagina() && girlCumType == GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM) counter++;
			if (counter > 3 && skinType == GLOBAL.SKIN_TYPE_LATEX) counter++;
			return counter;
		}
		public function raskvelScore(): int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_RASKVEL) counter++;
			if (hasTail(GLOBAL.TYPE_RASKVEL) && hasTailFlag(GLOBAL.FLAG_SCALED)) counter++;
			if (legType == GLOBAL.TYPE_RASKVEL) counter++;
			if (counter > 0 && skinType == GLOBAL.SKIN_TYPE_SCALES) counter++;
			if (counter > 1 && hasCock(GLOBAL.TYPE_RASKVEL)) counter++;
			if (counter > 1 && hasVagina() && totalClits()/vaginaTotal() == 2) counter++;
			if (counter > 2 && hairType == GLOBAL.HAIR_TYPE_FEATHERS) counter++;
			if (counter > 4 && hasTongueFlag(GLOBAL.FLAG_LONG) && hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) counter++;
			return counter;
		}
		public function redPandaScore(): int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_REDPANDA) counter++;
			if (faceType == GLOBAL.TYPE_REDPANDA) counter++;
			if (armType == GLOBAL.TYPE_REDPANDA)
			{
				counter++;
				if(hasArmFlag(GLOBAL.FLAG_FLUFFY)) counter++;
			}
			if (legType == GLOBAL.TYPE_REDPANDA)
			{
				counter++;
				if(hasLegFlag(GLOBAL.FLAG_FLUFFY)) counter++;
			}
			if (hasTail(GLOBAL.TYPE_REDPANDA))
			{
				counter++;
				if(hasTailFlag(GLOBAL.FLAG_FLUFFY)) counter++;
			}
			if (counter > 0 && !hasFur()) counter--;
			return counter;
		}
		public function rodentScore(): int
		{
			var counter:int = 0;
			if(earType == GLOBAL.TYPE_MOUSE) counter+=2;
			if(faceType == GLOBAL.TYPE_MOUSE) counter++;
			if(armType == GLOBAL.TYPE_MOUSE) counter++;
			if(legType == GLOBAL.TYPE_MOUSE) counter++;
			if(tailType == GLOBAL.TYPE_MOUSE && tailCount > 0) counter++;
			if (counter > 0 && hasFur()) counter++;
			return counter;
		}
		public function saurmorianScore():Number
		{
			var score:Number = 0;
			if(hasScales() && (hasSkinFlag(GLOBAL.FLAG_SMOOTH) || hasSkinFlag(GLOBAL.FLAG_THICK)) && scaleColor == "silver") score += 2;
			if(InCollection(armType, GLOBAL.TYPE_LEITHAN, GLOBAL.TYPE_SAURMORIAN) && hasPartScales("arm")) 
			{
				if(legCount > 1 && InCollection(legType, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_SAURMORIAN) && hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) score++;
			}
			if(InCollection(earType, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_SAURMORIAN)) score++;
			if(faceType == GLOBAL.TYPE_SAURMORIAN && hasMuzzle())
			{
				if(tailType == GLOBAL.TYPE_SAURMORIAN && hasTailFlag(GLOBAL.FLAG_SCALED)) score += 2;
			}
			if(faceType == GLOBAL.TYPE_LIZAN && hasMuzzle())
			{
				if(tailType == GLOBAL.TYPE_LIZAN && hasTailFlag(GLOBAL.FLAG_LONG) && hasTailFlag(GLOBAL.FLAG_SCALED)) score++;
			}
			if(InCollection(eyeType, GLOBAL.TYPE_NAGA, GLOBAL.TYPE_SAURMORIAN)) score++;
			if(/*hasTongueFlag(GLOBAL.FLAG_LONG) && */hasTongueFlag(GLOBAL.FLAG_SQUISHY) && tongueType == GLOBAL.TYPE_CANINE) score++;
			if(score >= 6 && cockTotal() == 1)
			{
				if(InCollection(cocks[0].cType, GLOBAL.TYPE_SAURIAN, GLOBAL.TYPE_SAURMORIAN) && hasSheath(0) && hasCockFlag(GLOBAL.FLAG_RIBBED, 0)) score++;
			}
			if(score >= 6 && vaginaTotal() == 1)
			{
				if(vaginas[0].hasFlag(GLOBAL.FLAG_RIBBED) && hasPlumpPussy(0) && vaginas[0].type == GLOBAL.TYPE_SAURMORIAN) score++;
			}
			if (!InCollection(faceType, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_SAURMORIAN)) score -= 2;
			if(hasHair()) score--;
			if(antennae > 0) score -= 2;
			if(hasFur()) score-= 2;
			if(hasAKnot()) score--;
			return score;
		}
		public function sharkScore(): int
		{
			var counter:int = 0;
			if (faceType == GLOBAL.TYPE_SHARK) counter++;
			if (eyeType == GLOBAL.TYPE_SHARK) counter++;
			if (earType == GLOBAL.TYPE_SHARK) counter++;
			if (armType == GLOBAL.TYPE_SHARK) counter++;
			if (legType == GLOBAL.TYPE_SHARK) counter++;
			if (hasTail(GLOBAL.TYPE_SHARK)) counter++;
			if (wingType == GLOBAL.TYPE_SHARK) counter++;
			if (hasStatusEffect("Shark Markings")) counter++;
			if (counter > 0 && hasScales() && hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) counter++;
			if (counter > 1 && gills) counter++;
			if (counter > 2 && cockTotal(GLOBAL.TYPE_SHARK) > 0) counter++;
			if (counter > 2 && vaginaTotal(GLOBAL.TYPE_SHARK) > 0) counter++;
			if (balls > 0 && counter > 0) counter--;
			if (biggestTitSize() > 2 && counter > 0) counter--;
			return counter;
		}
		public function sheepScore():int
		{
			var counter:int = 0;
			if (hasHorns(GLOBAL.TYPE_SHEEP)) counter++;
			if (hasHair() && hairType == GLOBAL.HAIR_TYPE_REGULAR && hasStatusEffect("frizzy hair")) counter++;
			if (earType == GLOBAL.TYPE_SHEEP) counter++;
			if (eyeType == GLOBAL.TYPE_SHEEP) counter++;
			if (faceType == GLOBAL.TYPE_SHEEP && hasMuzzle()) counter++;
			if (legType == GLOBAL.TYPE_SHEEP) counter++;
			if (hasTail(GLOBAL.TYPE_SHEEP) && hasTailFlag(GLOBAL.FLAG_FLUFFY)) counter++;
			if (hasPerk("Wooly")) counter++;
			if (hasFur() && perkv1("Wooly") >= 1) counter++;
			if (counter > 0 && !hasFur()) counter--;
			return counter;
		}
		public function simiiScore(): int {
			var counter: int = 0;
			if (faceType == GLOBAL.TYPE_SIMII) counter++;
			if (earType == GLOBAL.TYPE_SIMII) counter++;
			if (hasTail(GLOBAL.TYPE_SIMII)) counter++;
			if (armType == GLOBAL.TYPE_SIMII) counter++;
			if (legType == GLOBAL.TYPE_SIMII && legCount == 2 && hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) counter++;
			return counter;
		}
		public function spiderScore(): int {
			var counter: int = 0;
			if (eyeType == GLOBAL.TYPE_ARACHNID) counter++;
			if (armType == GLOBAL.TYPE_ARACHNID) counter++;
			if (legType == GLOBAL.TYPE_ARACHNID) counter++;
			if (hasTail(GLOBAL.TYPE_ARACHNID)) counter++;
			if (counter > 2 && hasCock(GLOBAL.TYPE_ARACHNID)) counter++;
			if (counter > 2 && hasVaginaType(GLOBAL.TYPE_ARACHNID)) counter++;
			if (!hasChitin() && !hasFur()) counter--;
			return counter;
		}
		public function suulaScore(): int
		{
			var counter: int = 0;
			if (faceType == GLOBAL.TYPE_SIREN || faceType == GLOBAL.TYPE_SHARK) counter++;
			if (earType == GLOBAL.TYPE_SIREN) counter++;
			if (eyeType == GLOBAL.TYPE_SIREN) counter++;
			if (armType == GLOBAL.TYPE_SIREN) counter++;
			if (legType == GLOBAL.TYPE_SIREN && legCount == 2 && hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) counter++;
			if (hasTail(GLOBAL.TYPE_SIREN)) counter++;
			if (counter > 0 && hasHair() && hairType == GLOBAL.HAIR_TYPE_FEATHERS) counter++;
			if (counter > 0 && hasWings() && InCollection(wingType, [GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_DOVE])) counter++;
			if (counter > 1 && gills) counter++;
			if (counter > 4 && hasCock(GLOBAL.TYPE_SIREN)) counter++;
			if (counter > 4 && hasVaginaType(GLOBAL.TYPE_SIREN)) counter++;
			if (skinType != GLOBAL.SKIN_TYPE_SCALES) counter--;
			return counter;
		}
		public function tentacleScore():int
		{
			// partially a counter for number of tentacles (doesn't fully count number of tentacles that would theoretically be in hair, arms, and legs)
			var counter:int = 0;
			var i:int = 0;
			
			if (hairType == GLOBAL.HAIR_TYPE_TENTACLES) counter += 2;
			if (tongueType == GLOBAL.TYPE_TENTACLE) counter++;
			if (hasTentacleNipples())
			{
				for (i = 0; i < breastRows.length; i++)
				{
					if (breastRows[i].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED) counter += breastRows[i].breasts * nipplesPerBreast;
				}
			}
			if (hasCock(GLOBAL.TYPE_TENTACLE))
			{
				for (i = 0; i < cocks.length; i++)
				{
					if (cocks[i].cType == GLOBAL.TYPE_TENTACLE) counter++;
				}
			}
			if (tailType == GLOBAL.TYPE_TENTACLE) counter += tailCount;
			if (wingType == GLOBAL.TYPE_TENTACLE) counter += wingCount;
			if (armType == GLOBAL.TYPE_TENTACLE) counter += 4;
			if (legType == GLOBAL.TYPE_TENTACLE) counter += 4;
			
			return counter; // current max just using Tentacool should be 86 I think, but it could be higher using other items or save editing
		}
		public function vanaeScore(): int
		{
			var counter:int = 0;
			if (earType == GLOBAL.TYPE_VANAE) counter++;
			if (hasTail(GLOBAL.TYPE_VANAE) && hasTailFlag(GLOBAL.FLAG_LONG)) counter++;
			if (hasVaginaType(GLOBAL.TYPE_VANAE)) counter++;
			if (hasVagina() && vaginaTotal(GLOBAL.TYPE_VANAE) == vaginaTotal()) counter++;
			if (hasCock() && cockTotal(GLOBAL.TYPE_VANAE) == cockTotal()) counter++;
			if (balls > 0 && statusEffectv4("Vanae Markings") >= 1) counter++;
			if (InCollection(milkType, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK)) counter++;
			if (cumType == GLOBAL.FLUID_TYPE_VANAE_CUM) counter++;
			if (hasStatusEffect("Vanae Markings")) counter++;
			if (counter > 0 && hairType == GLOBAL.HAIR_TYPE_TENTACLES) counter++;
			return counter;
		}
		public function vulpineScore():int
		{
			var counter: int = 0;
			if (earType == GLOBAL.TYPE_VULPINE) counter++;
			if (hasTail(GLOBAL.TYPE_VULPINE) && hasTailFlag(GLOBAL.FLAG_FURRED)) counter++;
			if (faceType == GLOBAL.TYPE_VULPINE) counter++;
			if ((armType == GLOBAL.TYPE_VULPINE || (armType == GLOBAL.TYPE_CANINE && counter > 0)) && hasArmFlag(GLOBAL.FLAG_FURRED)) counter++;
			if ((legType == GLOBAL.TYPE_VULPINE || (legType == GLOBAL.TYPE_CANINE && counter > 0)) && hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) counter++;
			if (counter > 0 && hasCock() && cockTotal(GLOBAL.TYPE_CANINE) + cockTotal(GLOBAL.TYPE_VULPINE) == cockTotal() && totalKnots() == cockTotal()) counter++;
			if (counter > 0 && hasVagina() && vaginaTotal(GLOBAL.TYPE_CANINE) + vaginaTotal(GLOBAL.TYPE_VULPINE) == vaginaTotal()) counter++;
			if (breastRows.length > 1 && counter > 0) counter++;
			if (hasFur() && counter > 0) counter++;
			return counter;
		}
		public function xhelScore(): int
		{
			var counter: int = 0;
			if (eyeType == GLOBAL.TYPE_XHELARFOG) counter++;
			if (eyeCount() == 3) counter++;
			else counter--;
			if (tailType == GLOBAL.TYPE_XHELARFOG) counter++;
			if (hornType == GLOBAL.TYPE_XHELARFOG) counter++;
			if (hasHorns()) counter++;
			if (legType == GLOBAL.TYPE_XHELARFOG) counter++;
			if (faceType == GLOBAL.TYPE_XHELARFOG) counter++;
			if (skinType == GLOBAL.SKIN_TYPE_GEL) counter++;
			if (earType == GLOBAL.TYPE_SYLVAN && counter > 4) counter++;
			else counter -= 2;
			if (hasBreasts()) counter--;
			if (hasHair()) counter--;
			if (tallness > 5*12+5) counter--;
			return counter;
		}
		public function zilScore(): int
		{
			var counter: int = 0;
			if (armType == GLOBAL.TYPE_BEE) counter++;
			if (legType == GLOBAL.TYPE_BEE && legCount == 2) counter++;
			if (hasAntennae(GLOBAL.TYPE_BEE)) counter++;
			if (wingType == GLOBAL.TYPE_SMALLBEE || wingType == GLOBAL.TYPE_BEE) counter++;
			if (hasTail(GLOBAL.TYPE_BEE)) counter++;
			if (counter > 0 && faceType == GLOBAL.TYPE_HUMAN)
			{
				counter++;
				if (eyeType == GLOBAL.TYPE_BEE) counter++;
				if (tongueType == GLOBAL.TYPE_BEE) counter++;
			}
			if (counter > 0 && hasCock(GLOBAL.TYPE_BEE)) counter++;
			if (counter > 0 && hasVaginaType(GLOBAL.TYPE_BEE)) counter++;
			return counter;
		}
		public function isRahn(): Boolean {
			var sRace:String = race();
			if(InCollection(sRace, ["rahn", "fuu'rahn", "zel'rahn", "loo'rahn", "doh'rahn", "go'rahn"])) return true;
			else if (sRace.indexOf("rahn") != -1) return true;
			return false;
		}
		public function cyborgScore():int
		{
			var counter:int = 0;
			// List of valid synth/cyborg parts here!
			//if (skinType == 9999) counter++;
			//if (hairType == 9999) counter++;
			//if (faceType == 9999) counter++;
			//if (tongueType == 9999) counter++;
			if (eyeType == GLOBAL.TYPE_SYNTHETIC) counter++;
			//if (earType == 9999) counter++;
			//if (armType == 9999) counter++;
			//if (legType == 9999) counter++;
			//if (wingType == 9999) counter++;
			//if (tailType == 9999) counter++;
			if (cockTotal(GLOBAL.TYPE_SYNTHETIC) > 0) counter++;
			if (vaginaTotal(GLOBAL.TYPE_SYNTHETIC) > 0) counter++;
			//if (milkType == 9999) counter++;
			if (cumType == GLOBAL.FLUID_TYPE_OIL) counter++;
			//if (girlCumType == 9999) counter++;
			return counter;
		}
		public function isCyborg(numParts:int = 1):Boolean
		{
			if(cyborgScore() >= numParts) return true;
			return false;
		}
		public function isRobot():Boolean
		{
			return (InCollection(originalRace, ["automaton", "conglomerate", "junker", "machine", "robot"]));
		}
		
		public function sackDescript(forceAdjectives:Boolean = false, adjectives:Boolean = true, ignoreTexture:Boolean = false): String {
			if (balls <= 0) return "prostate";
			var desc: String = "";
			//texture adjectives
			if (!ignoreTexture && adjectives && rand(3) == 0)
			{
				var ballsackType:int = scrotumType();
				switch(ballsackType)
				{
					case GLOBAL.FLAG_FURRED: desc += RandomInCollection(["fluffy","fuzzy","furry","fur-covered"]); break;
					case GLOBAL.FLAG_SCALED: desc += RandomInCollection(["scaly","scale-covered","scaled","scale-plated","armored"]); break;
					case GLOBAL.FLAG_GOOEY: desc += RandomInCollection(["gooey", "slimy", "semi-solid"]); break;
				}
			}
			//capacity adjectives
			if (forceAdjectives || (adjectives && rand(3) == 0)) {
				//No comma for the range where no text is displayed~!
				if(desc != "" && !(ballFullness > 10 && ballFullness < 80)) desc += ", ";
				if (ballFullness <= 10) desc += RandomInCollection(["recently emptied","well-drained","nearly empty"]);
				else if (ballFullness >= 80 && ballFullness < 100) desc += RandomInCollection(["mostly full","nearly full","seed-stocked","spunk-laden","sperm-stocked"]);
				else if (ballFullness >= 100) desc += RandomInCollection(["painfully full","sloshing","semen-stuffed","cum-bloated","fully engorged","spunk-heavy","tender","seed-weighted"]);
			}
			if(desc != "") desc += " " + RandomInCollection(["scrotum","sack","pouch"]);
			else desc += RandomInCollection(["scrotum","sack"]);
			return desc;
		}
		public function sackTexture(skinAdjective:String = "doughy", furAdjective:String = "fuzzy", scalesAdjective:String = "scaly", gelAdjective:String = "semi-gelatinous"): String {
			switch (scrotumType())
			{
				case GLOBAL.FLAG_FURRED: return furAdjective;
				case GLOBAL.FLAG_SCALED: return scalesAdjective;
				default: return skinAdjective;
			}
		}
		public function cockClit(number: int = 0): String {
			if (hasCock() && number >= 0 && number < cocks.length) return cockDescript(number);
			return clitDescript();
		}
		public function sheathDescript(arg: Number = 0): String {
			if (hasSheath(arg)) return "sheath";
			return "base";
		}
		public function knotDescript(arg: Number = 0): String {
			if (hasKnot(arg)) return "knot";
			return "base";
		}
		public function knotOrSheath(arg: Number = 0): String
		{
			if (hasKnot(arg)) return knotDescript(arg);
			if (hasSheath(arg)) return sheathDescript(arg);
			return "base";
		}
		public function sheathOrKnot(arg: Number = 0): String
		{
			if (hasSheath(arg)) return sheathDescript(arg);
			if (hasKnot(arg)) return knotDescript(arg);
			return "base";
		}
		public function chestDesc(): String {
			if (biggestTitSize() < 1 && rand(2) == 0)
			{
				var adjective:String = "";
				if (tone >= 100)
				{
					if (rand(4) == 0) adjective += mf("extremely pronounced","very pronounced", true);
					else if (thickness > 70) adjective += "immense";
					else if (thickness >= 30) adjective += "robust";
					else adjective += "chiseled";
				}
				else if (tone > 70)
				{
					if (rand(4) == 0) adjective += mf("well-defined","well-toned", true);
					else if (thickness > 70) adjective += "broad";
					else if (thickness >= 30) adjective += "healthy";
					else adjective += "fit";
				}
				else if (tone >= 30)
				{
					if (rand(4) == 0) adjective += mf("toned","lightly-toned", true);
					else if (thickness > 70) adjective += "thick";
					else if (thickness >= 30) adjective += "average";
					else adjective += "soft";
				}
				else
				{
					if (rand(4) == 0) adjective += "unremarkable";
					else if (thickness > 70) adjective += "wide";
					else if (thickness >= 30) adjective += "passable";
					else adjective += "flat";
				}
				if (rand(4) > 0 && adjective.length > 0) return (adjective + " chest");
				
				return "chest";
			}
			else if (biggestTitSize() < 1)
			{
				// Feminine/Andro, Low/Medium Tone
				if((mfn("m","f","n", true) != "m") && tone < 60) {
					return RandomInCollection(["soft, flat chest", "flat, girly chest", "smooth, featureless chest"]);
				}
				// Masculine, High Tone, High Thickness
				else if((mf("m","f", true) == "m") && tone >= 60 && thickness >= 60) {
					return RandomInCollection(["manly, rippling chest", "big, muscular chest", "beefcake chest"]);
				}
				// Masculine, Low Tone, High Thickness
				else if((mf("m","f", true) == "m") && tone <= 30 && thickness >= 60) {
					return RandomInCollection(["broad, cuddly chest", "bear-like chest", "fleshy, manly chest"]);
				}
				// Masculine/Feminine/Andro, High Tone, Low Thickness
				else if(tone >= 60 && thickness <= 30) {
					return RandomInCollection([mf("tight, firm pecs","firm, flat chest", true), mf("hard, sleek chest","athletic chest", true), mf("fine, flat pecs","sleek, firm chest", true)]);
				}
				// Default
				else {
					return RandomInCollection(["plain chest", "flat chest", "chest"]);
				}
			}
			return biggestBreastDescript();
		}
		public function allChestDesc(): String {
			if (biggestTitSize() < 1) return chestDesc();
			return allBreastsDescript();
		}
		public function eachCock(dynamicLength:Boolean = false): String {
			var desc: String = "";
			if (cocks.length > 1) desc += "each of ";
			desc += "your " + cocksDescript(dynamicLength);
			return desc;
		}
		public function oneCock(dynamicLength:Boolean = false): String {
			var desc: String = "";
			if (cocks.length > 1) desc += "one of ";
			desc += "your " + cocksDescript(dynamicLength);
			return desc;
		}
		public function ballsDescript(forceCount: Boolean = false, forceSize: Boolean = false, forceSingular: Boolean = false, appearance: Boolean = false): String {
			if (balls == 0) return "prostate";
			var descripted: int = 0;
			var rando: Number = 0;
			var desc: String = "";
			//Changed up the formatting here since this is only for appearance screens
			if (forceCount && !forceSingular) {
				if (balls == 1) {
					desc += RandomInCollection(["a single ", "a solitary ", "a lone ", "an individual "]);
				}
				else if (balls == 2) {
					desc += RandomInCollection(["a pair of ", "two ", "two "]);
				}
				else if (balls == 3) {
					desc += RandomInCollection(["three ", "three ", "a trio of "]);
				}
				else if (balls == 4) {
					desc += RandomInCollection(["a quartet of ", "four ", "four "]);
				}
				else desc += num2Text(balls) + " ";
			}
			//Not in appearance screen? Okay
			else if (!hasStatusEffect("Uniball") && balls != 2 && rand(5) == 0 && !forceSingular) {
				if (balls == 1) {
					desc += RandomInCollection(["single ", "solitary ", "lone "]);
				}
				else if (balls == 2) { //This one is basically cut but leaving here unless I change my mind.
					desc += RandomInCollection(["pair of ", "two ", "two "]);
				}
				else if (balls == 3) {
					desc += RandomInCollection(["three ", "triple ", "trio of "]);
				}
				else if (balls == 4) {
					desc += RandomInCollection(["quartet of ", "four ", "four "]);
				}
				else desc += num2Text(balls) + " ";
			}
			//size!
			if (ballSize() > 1 && (rand(3) <= 1 || forceSize)) {
				if (descripted > 0) desc += ", ";
				var diameter:Number = ballDiameter();
				if (diameter <= 1) {}
				else if (diameter < 2) desc += "large";
				else if (diameter < 3) desc += "baseball-sized";
				else if (diameter < 4) desc += "apple-sized";
				else if (diameter < 5) desc += "grapefruit-sized";
				else if (diameter < 7) desc += "cantaloupe-sized";
				else if (diameter < 9) desc += "soccerball-sized";
				else if (diameter < 12) desc += "basketball-sized";
				else if (diameter < 15) desc += "watermelon-sized";
				else if (diameter < 25) desc += "beachball-sized";
				else if (diameter < 40) desc += "barrel-sized";
				else if (diameter < 60) desc += "person-sized";
				else desc += "hideously swollen and oversized";
				if (diameter > 1) descripted++;
			}
			//Uniball
			if (hasStatusEffect("Uniball") && rand(3) == 0) {
				if (descripted > 0) desc += ", ";
				desc += RandomInCollection(["tightly-compressed", "snug", "cute", "pleasantly squeezed", "compressed-together"]);
				descripted++;
			}
			//Descriptive
			if (ballFullness >= 100 && rand(3) == 0 && !forceSize) {
				if (descripted > 0) desc += ", ";
				desc += RandomInCollection(["overflowing", "swollen", "practically sloshing"]);
				descripted++;
			} else if (ballFullness >= 80 && rand(3) == 0 && !forceSize) {
				if (descripted > 0) desc += ", ";
				desc += RandomInCollection(["full", "heavy", "cum-engorged"]);
				descripted++;
			}
			//lusty
			else if (lust() > 90 && !descripted && rand(2) == 0 && !forceSize) {
				if (descripted > 0) desc += ", ";
				desc += RandomInCollection(["eager", "trembling", "needy", "desperate", "throbbing", "quaking", "heated"]);
				descripted++;
			}
			if (descripted) desc += " ";
			rando = rand(9);
			if (rando < 4) {
				if (!forceCount && balls == 4 && rand(2) == 0) desc += "quad ";
				desc += "ball";
			}
			if (rando >= 4 && rando < 6) desc += "testicle";
			if (rando == 6) desc += "teste";
			if (rando == 7) desc += "gonad";
			if (rando == 8) desc += "nut";
			if (balls != 1 && !forceSingular) desc += "s";
			return desc;
		}
		public function ballDescript(forceCount: Boolean = false, forcedSize: Boolean = false): String {
			return ballsDescript(forceCount, forcedSize, true);
		}
		public function ballNoun(asPlural:Boolean = true):String
		{
			if (balls == 0) return "prostate";
			var rando:int = 0;
			var desc:String = "";
			rando = rand(11);

			if (rando < 4) desc += "ball";
			else if (rando <= 6) 
			{
				if(!asPlural) desc += "testicle";
				else desc += "teste";
			}
			else if (rando <= 7) desc += "gonad";
			else desc += "nut";
			if (asPlural && balls > 1) desc = plural(desc);
			return desc;
		}
		public function ballsNounSimple(forceSingle:Boolean = false): String
		{
			if(balls < 1) return "prostate";
			if(forceSingle || balls == 1) return RandomInCollection(["ball","ball","ball","nut"]);
			else return RandomInCollection(["balls","balls","balls","nuts"]);
		}
		//[pc.knotBallsHilt] 4 Dubsan senpai
		public function knotBallsHilt(x:int = 0):String
		{
			if(hasCock() && hasKnot(x)) return "knot";
			else if(balls > 0) return ballsNounSimple();
			else return "hilt";
		}

		public function assholeDescript(simple:Boolean = false): String {
			var desc: String = "";
			var rando: Number = 0;
			var descripted: Number = 0;
			//25% tightness desc
			var looseness:Number = ass.looseness();
			if (((!simple || analVirgin) && rand(4) == 0) || ((!simple || analVirgin) && looseness <= 1 && rand(4) <= 2)) {
				if (descripted > 0) desc += ", ";
				if (analVirgin) {
					desc += RandomInCollection(["virgin", "unspoiled", "unclaimed"]);
				} else if (looseness <= 1) {
					desc += RandomInCollection(["tight", "narrow"]);
				} else if (looseness <= 2) {
					desc += RandomInCollection(["pliant", "supple"]);
				} else if (looseness <= 3) {
					desc += RandomInCollection(["loose", "welcoming"]);
				} else if (looseness <= 4) {
					desc += RandomInCollection(["stretched", "broad"]);
				} else if (looseness <= 5) {
					desc += RandomInCollection(["gaping", "wide-open", "expansive"]);
				}
				//Account for larger values of loosness!
				else if (looseness > 5) {
					desc += RandomInCollection(["elastically yawning", "completely cavernous", "excessively agape"]);
				}
				descripted++;
			}
			//66% wetness description
			var wetness:Number = ass.wetness();
			if (!simple && rand(3) <= 1 && wetness >= 2) {
				if (descripted > 0) desc += ", ";
				if (wetness <= 2) {
					desc += RandomInCollection(["moist", "lubricated"]);
				} else if (wetness <= 3) {
					desc += RandomInCollection(["slimy", "slick"]);
				} else if (wetness <= 4) {
					desc += RandomInCollection(["lube-drooling", "soaked"]);
				} else if (wetness <= 5) {
					desc += RandomInCollection(["slime-drooling", "immaculately lubricated"]);
				}
				//Account for larger values of wetness!
				else if (wetness > 5) {
					desc += RandomInCollection(["lube-flooding", "slime-spilling"]);
				}
				descripted++;
			}
			// Puffy butt - 50% addition of no other descs - doesn't stack well with loose/wet.
			var puffScore:Number = analPuffiness();
			if(!simple && descripted == 0 && (puffScore >= 1) && rand(2) == 0)
			{
				if (descripted > 0) desc += ", ";
				var donuts:Array = ["puffy", "plump", "fat", "crinkly", "soft", "spongy"];
				if (puffScore >= 2) donuts.push("huge", "bloated", "pillowy");
				if (puffScore >= 3) donuts.push("ample", "meaty", "generous");
				if (puffScore >= 4) donuts.push("imposing", "massive", "enormous", "tremendous");
				if (puffScore >= 5) donuts.push("monstrous", "freakish", "colossal", "hyper", "oversized");
				desc += RandomInCollection(donuts);
				descripted++;
			}
			if(!simple && descripted == 0 && hasPerk("Buttslut") && rand(2) == 0)
			{
				if (descripted > 0) desc += ", ";
				desc += RandomInCollection("slutty","fuck-hungry","cock-hungry","fuckable","puckered","eager","greedy","ravenous","insatiable");
				descripted++;
			}
			
			if (descripted > 0) desc += " ";
			//Butt descriptor
			rando = rand(18);
			if(!simple && hasPlumpAsshole() && rand(4) == 0) desc += "donut";
			else if (rando <= 2) desc += "ass";
			else if (rando <= 5) desc += "anus";
			else if (rando <= 7) desc += "pucker";
			else if (rando <= 10) desc += "asshole";
			else if (rando == 11) desc += "bum";
			else if (rando == 12) desc += "butthole";
			else if (rando == 13) desc += "sphincter";
			else if (rando <= 15) desc += "backdoor";
			else {
				if (tailType > 0) desc += "tailhole";
				else desc += "butthole";
			}
			return desc;
		}
		public function hipDescript(asPlural:Boolean = false):String 
		{
			var hips: Number = hipRating();
			var firm: Number = buttTone();
			var desc: String = "";
			var adjectives: Array = [];
			
			if (hips <= 1) {
				if (thickness > 70) {
					adjectives.push("slim");
					adjectives.push("narrow");
					if (firm < 30) adjectives.push("boyish");
				}
				//Normal
				else if (thickness >= 30) {
					if (firm < 30) adjectives.push("boyish");
					adjectives.push("slim");
				}
				//Uberthin
				else {
					adjectives.push("slim");
					adjectives.push("narrow");
					if (firm < 30) adjectives.push("boyish");
				}
			} else if (hips < 4) {
				if (thickness < 30) {
					adjectives.push("slightly-flared");
					adjectives.push("curved");
				}
				else {
					adjectives.push("slender");
					adjectives.push("narrow");
					adjectives.push("thin");
				}
			} else if (hips < 6) {
				if (thickness < 30) {
					adjectives.push("flared");
					adjectives.push("curvy");
				}
				else {
					adjectives.push("well-formed");
					adjectives.push("pleasant");
				}
			} else if (hips < 10) {
				if (thickness < 30) {
					adjectives.push("flared");
					adjectives.push("waspish");
				}
				else {
					adjectives.push("ample");
					adjectives.push("noticeable");
					adjectives.push("girly");
				}
			} else if (hips < 15) {
				if (thickness < 30) {
					adjectives.push("flared");
					adjectives.push("waspish");
				}
				else {
					adjectives.push("flared");
					adjectives.push("curvy");
					adjectives.push("wide");
				}
			} else if (hips < 20) {
				if (thickness < 40) {
					adjectives.push("flared, voluptuous");
					adjectives.push("waspish, voluptuous");
				}
				else {
					adjectives.push("voluptuous");
					adjectives.push("voluptuous");
				}
				if (femininity > 50 || hasVagina()) {
					if (thickness < 40) {
						adjectives.push("flared, fertile");
						adjectives.push("waspish, fertile");
						adjectives.push("flared, child-bearing");
						adjectives.push("waspish, child-bearing");
					}
					else {
						adjectives.push("fertile");
						adjectives.push("child-bearing");
					}
				}
			} else {
				if (thickness < 40) {
					adjectives.push("flaring, inhumanly-wide");
					adjectives.push("incredibly waspish, inhumanly-wide");
					adjectives.push("flaring, cow-like");
					adjectives.push("incredibly waspish, cow-like");
				}
				else {
					adjectives.push("inhumanly-wide");
					adjectives.push("cow-like");
				}
				if (femininity > 50 || hasVagina()) {
					if (thickness < 40) {
						adjectives.push("flaring, broodmother-sized");
						adjectives.push("incredibly waspish, broodmother-sized");
					}
					else {
						adjectives.push("broodmother-sized");
					}
				}
				if (hips >= 30) {
					adjectives.push("jutting");
					adjectives.push("broadly-sloped");
					adjectives.push("colossal");
					adjectives.push("immensely broad");
					adjectives.push("far-reaching");
					adjectives.push("gargantuanly splayed");
				}
			}
			if(firm >= 65) {
				if(mf("m","f", true) == "m") adjectives.push("masculine");
				if (tone >= 70) adjectives.push("muscular");
				else if (tone >= 30) adjectives.push("lean muscled");
				if (thickness >= 30) adjectives.push(hips < 4 ? "soft" : "broad");
				else adjectives.push((mf("m","f", true) == "m" ? "mannishly " : "") + "slender");
			}
			if(adjectives.length > 0) desc += adjectives[rand(adjectives.length)];
			// Silicone
			var silicone:Number = siliconeRating("hips");
			var siliconePref:int = statusEffectv1("Silicone Preference");
			if(silicone > 0 && siliconePref != -1 && rand(2) == 0) {
				adjectives.length = 0;
				if(silicone >= 5) adjectives.push("ridiculously perky");
				if(siliconePref != 1 && siliconePref != 2) adjectives.push("fake", "plastic");
				if(siliconePref != 2) adjectives.push("artificially-enhanced", "augmented", "silicone-filled");
				if(hips >= 6) adjectives.push("perfectly rounded");
				if(desc != "") desc += ", ";
				desc += adjectives[rand(adjectives.length)];
			}
			if(desc != "") desc += " ";
			//Taurs
			if (isTaur() && rand(3) == 0) {
				desc += RandomInCollection(["flank", "flank", "flank", "haunch"]);
			}
			//Non taurs or taurs who didn't roll flanks
			else {
				desc += "hip";
			}
			if (asPlural) desc = plural(desc);
			return desc;
		}
		public function thighDescript(forceAdjective:Boolean = false):String {
			var hips: Number = hipRating();
			var desc: String = "";
			var adjectives: Array = [];
			
			if(kGAMECLASS.silly)
			{
				if(hips >= 5 && thickness >= 25) adjectives.push("THICC");
				if(hips >= 10 && thickness >= 50) adjectives.push("extra-THICC");
				if(hips >= 20 && thickness >= 75) adjectives.push("massively-THICC");
			}
			else
			{
				if(hips >= 5 && thickness >= 25) adjectives.push("thick");
				if(hips >= 10 && thickness >= 50) adjectives.push("extra-thick");
				if(hips >= 20 && thickness >= 75) adjectives.push("massively-thick");
			}
			
			if(adjectives.length > 0 && (forceAdjective || rand(3) == 0)) desc += adjectives[rand(adjectives.length)] + " ";
			desc += "thigh";
			return desc;
		}
		public function thighsDescript(forceAdjective:Boolean = false):String {
			return plural(thighDescript(forceAdjective));
		}
		public function hipsDescript(): String {
			return hipDescript(true);
		}
		public function hasSoftButt(perkOnly:Boolean = false):Boolean
		{
			return ((hasPerk("Buttslut") && !hasPerk("Buns of Steel")) || hasPerk("Bubble Butt") || (!perkOnly && tone < 30));
		}
		public function hasFirmButt(perkOnly:Boolean = false):Boolean
		{
			return (hasPerk("Buns of Steel") || (!perkOnly && tone >= 65));
		}
		public function buttTone():Number
		{
			if(hasSoftButt(true)) return (tone > 20 ? 20 : tone);
			if(hasFirmButt(true)) return (tone < 80 ? 80 : tone);
			return tone;
		}
		public function buttDescript(asPlural:Boolean = false, onlyCheek:Boolean = false):String 
		{
			var butt: Number = buttRating();
			var firm: Number = buttTone();
			var desc: String = "";
			var adjectives: Array = [];
			var rando: Number = 0;
			
			if(hasPerk("Barcoded") && rand(7) == 0)
			{
				desc = RandomInCollection(["barcode-stamped","barcode-branded","barcoded","id-branded","barcode-tattooed","id-stamped","AccuPitch-claimed","barcode-stamped","barcode-bearing"]);
			}
			else if(rand(2) == 0)
			{
				if (butt <= 1) {
					if (firm >= 60) adjectives.push("incredibly tight, perky");
					else {
						//Soft PC's buns!
						if (firm <= 30 && rand(3) == 0) adjectives.push("tiny yet soft", "tiny yet soft", "very small yet soft", "dainty yet soft");
						else adjectives.push("tiny", "tiny", "very small", "dainty");
					}
				} else if (butt < 4) {
					if (firm >= 65) {
						adjectives.push("perky, muscular");
						adjectives.push("tight, toned");
						adjectives.push("firm");
						adjectives.push("compact, muscular");
						adjectives.push("tight");
						adjectives.push("muscular, toned");
					}
					//Nondescript
					else if (firm >= 30) {
						adjectives.push("tight");
						adjectives.push("firm");
						adjectives.push("compact");
						adjectives.push("petite");
					}
					//FLABBAH
					else {
						adjectives.push("small, heart-shaped");
						adjectives.push("soft, compact");
						adjectives.push("soft, heart-shaped");
						adjectives.push("small, cushy");
						adjectives.push("small");
						adjectives.push("petite");
						adjectives.push("snug");
					}
				} else if (butt < 6) {
					//TOIGHT LIKE A TIGER
					if (firm >= 65) {
						adjectives.push("nicely muscled");
						adjectives.push("nice, toned");
						adjectives.push("muscly");
						adjectives.push("nice toned");
						adjectives.push("toned");
						adjectives.push("fair");
					}
					//Nondescript
					else if (firm >= 30) {
						adjectives.push("nice");
						adjectives.push("fair");
					}
					//FLABBAH
					else {
						adjectives.push("nice, cushiony");
						adjectives.push("soft");
						adjectives.push("nicely-rounded, heart-shaped");
						adjectives.push("cushy");
						adjectives.push("soft, squeezable");
					}
				} else if (butt < 8) {
					//TOIGHT LIKE A TIGER
					if (firm >= 65) {
						if (rand(7) == 0) {
							if (asPlural) return "muscular, hand-filling ass cheeks";
							return "muscly handful of ass";
						}
						adjectives.push("full, toned");
						adjectives.push("shapely, toned");
						adjectives.push("muscular, hand-filling");
						adjectives.push("shapely, chiseled");
						adjectives.push("full");
						adjectives.push("chiseled");
					}
					//Nondescript
					else if (firm >= 30) {
						if (rand(4) == 0) {
							if (asPlural) return "hand-filling ass cheeks";
							return "handful of ass";
						}
						adjectives.push("full");
						adjectives.push("shapely");
						adjectives.push("hand-filling");
					}
					//FLABBAH
					else {
						if (rand(8) == 0) {
							if (asPlural) return "supple, hand-filling ass cheeks";
							return "supple, handful of ass";
						}
						adjectives.push("somewhat jiggly");
						adjectives.push("soft, hand-filling");
						adjectives.push("cushiony, full");
						adjectives.push("plush, shapely");
						adjectives.push("full");
						adjectives.push("soft, shapely");
						adjectives.push("rounded, spongy");
					}
				} else if (butt < 10) {
					//TOIGHT LIKE A TIGER
					if (firm >= 65) {
						adjectives.push("large, muscular");
						adjectives.push("substantial, toned");
						adjectives.push("big-but-tight");
						adjectives.push("squeezable, toned");
						adjectives.push("large, brawny");
						adjectives.push("big-but-fit");
						adjectives.push("powerful, squeezable");
						adjectives.push("large");
						adjectives.push("callipygian");
					}
					//Nondescript
					else if (firm >= 30) {
						adjectives.push("squeezable");
						adjectives.push("large");
						adjectives.push("substantial");
						adjectives.push("callipygian");
					}
					//FLABBAH
					else {
						adjectives.push("large, bouncy");
						adjectives.push("soft, eye-catching");
						adjectives.push("big, slappable");
						adjectives.push("soft, pinchable");
						adjectives.push("large, plush");
						adjectives.push("squeezable");
						adjectives.push("cushiony");
						adjectives.push("plush");
						adjectives.push("pleasantly plump");
						adjectives.push("callipygian");
					}
				} else if (butt < 13) {
					//TOIGHT LIKE A TIGER
					if (firm >= 65) {
						adjectives.push("thick, muscular");
						adjectives.push("big, burly");
						adjectives.push("heavy, powerful");
						adjectives.push("spacious, muscular");
						adjectives.push("toned, cloth-straining");
						adjectives.push("thick");
						adjectives.push("thick, strong");
					}
					//Nondescript
					else if (firm >= 30) {
						adjectives.push("jiggling");
						adjectives.push("spacious");
						adjectives.push("heavy");
						adjectives.push("cloth-straining");
					}
					//FLABBAH
					else {
						adjectives.push("super-soft, jiggling");
						adjectives.push("spacious, cushy");
						adjectives.push("plush, cloth-straining");
						adjectives.push("squeezable, over-sized");
						adjectives.push("spacious");
						adjectives.push("heavy, cushiony");
						adjectives.push("slappable, thick");
						adjectives.push("jiggling");
						adjectives.push("spacious");
						adjectives.push("soft, plump");
					}
				} else if (butt < 16) {
					//TOIGHT LIKE A TIGER
					if (firm >= 65) {
						adjectives.push("expansive, muscled");
						adjectives.push("voluminous, rippling");
						adjectives.push("generous, powerful");
						adjectives.push("big, burly");
						adjectives.push("well-built, voluminous");
						adjectives.push("powerful");
						adjectives.push("muscular");
						adjectives.push("powerful, expansive");
					}
					//Nondescript
					else if (firm >= 30) {
						adjectives.push("expansive");
						adjectives.push("generous");
						adjectives.push("voluminous");
						adjectives.push("wide");
					}
					//FLABBAH
					else {
						adjectives.push("pillow-like");
						adjectives.push("generous, cushiony");
						adjectives.push("wide, plush");
						adjectives.push("soft, generous");
						adjectives.push("expansive, squeezable");
						adjectives.push("slappable");
						adjectives.push("thickly-padded");
						adjectives.push("wide, jiggling");
						adjectives.push("wide");
						adjectives.push("voluminous");
						adjectives.push("soft, padded");
					}
				} else if (butt < 20) {
					if (firm >= 65) {
						adjectives.push("huge, toned");
						adjectives.push("vast, muscular");
						adjectives.push("vast, well-built");
						adjectives.push("huge, muscular");
						adjectives.push("strong, immense");
						adjectives.push("muscle-bound");
					}
					//Nondescript
					else if (firm >= 30) {
						if (rand(5) <= 1) {
							if (asPlural) return RandomInCollection(["expansive, jiggling ass cheeks", "copious, fleshy ass cheeks"]);
							return RandomInCollection(["jiggling expanse of ass", "copious ass-flesh"]);
						}
						adjectives.push("huge");
						adjectives.push("vast");
						adjectives.push("giant");
					}
					//FLABBAH
					else {
						adjectives.push("vast, cushiony");
						adjectives.push("huge, plump");
						adjectives.push("expansive, jiggling");
						adjectives.push("huge, cushiony");
						adjectives.push("huge, slappable");
						adjectives.push("seam-bursting");
						adjectives.push("plush, vast");
						adjectives.push("giant, slappable");
						adjectives.push("giant");
						adjectives.push("huge");
						adjectives.push("swollen, pillow-like");
					}
				} else {
					if (firm >= 65) {
						if (rand(7) == 0) {
							if (asPlural) return "colossal, muscly ass cheeks";
							return "colossal, muscly ass";
						}
						adjectives.push("ginormous, muscle-bound");
						adjectives.push("colossal yet toned");
						adjectives.push("strong, tremdously large");
						adjectives.push("tremendous, muscled");
						adjectives.push("ginormous, toned");
						adjectives.push("colossal, well-defined");
					}
					//Nondescript
					else if (firm >= 30) {
						adjectives.push("ginormous");
						adjectives.push("colossal");
						adjectives.push("tremendous");
						adjectives.push("gigantic");
					}
					//FLABBAH
					else 
					{
						adjectives.push("ginormous, jiggly");
						adjectives.push("plush, ginormous");
						adjectives.push("seam-destroying");
						adjectives.push("tremendous, rounded");
						adjectives.push("bouncy, colossal");
						adjectives.push("thong-devouring");
						adjectives.push("tremendous, thickly padded");
						adjectives.push("ginormous, slappable");
						adjectives.push("gigantic, rippling");
						adjectives.push("gigantic");
						adjectives.push("ginormous");
						adjectives.push("colossal");
						adjectives.push("tremendous");
					}
				}
				if(firm >= 65) {
					adjectives.push("chiseled");
					adjectives.push("statuesque");
					adjectives.push("shapely");
					adjectives.push("sculpted");
					if(mf("m","f") == "m") adjectives.push("manly");
				}
				if(desc != "") desc += ", ";
				if(adjectives.length > 0) desc += adjectives[rand(adjectives.length)];
			}
			// Silicone
			var silicone:Number = siliconeRating("butt");
			var siliconePref:int = statusEffectv1("Silicone Preference");
			if(silicone > 0 && siliconePref != -1 && rand(2) == 0) {
				adjectives.length = 0;
				if(silicone >= 2) adjectives.push("gravity defying");
				if(silicone >= 5) adjectives.push("ridiculously perky");
				if(siliconePref != 1 && siliconePref != 2) adjectives.push("fake", "plastic");
				if(siliconePref != 2) adjectives.push("artificially-enhanced", "augmented", "silicone-filled");
				if(butt >= 6) adjectives.push("perfectly rounded", "globular");
				if(desc != "") desc += ", ";
				desc += adjectives[rand(adjectives.length)];
			}
			if(desc != "") desc += " ";
			if(!asPlural)
			{
				rando = rand(21);
				if(onlyCheek) desc += RandomInCollection(["butt", "ass"]) + "cheek";
				else if(silicone > 0 && rand(4) == 0) desc += "bubble butt";
				else if (rando <= 4) desc += "butt";
				else if (rando <= 9) desc += "ass";
				else if (rando <= 11) desc += "backside";
				else if (rando == 12) {
					if (butt >= 10) desc += "booty";
					else desc += "derriere";
				}
				else desc += RandomInCollection(["rump", "bottom", mf("butt", "tush", true), "rear end"]);
			}
			else
			{
				if(silicone > 0 && rand(4) == 0) desc += "bubbles";
				else
				{
					if(rand(4) == 0) desc += RandomInCollection(["butt", "ass"]);
					desc += "cheeks";
				}
			}
			return desc;
		}
		public function nipplesDescript(rowNum:int = 0, forceLactation:Boolean = false): String {
			if(totalNipples() == 1) return nippleDescript(rowNum, false, forceLactation);
			return nippleDescript(rowNum, true, forceLactation);
		}
		public function nippleDescript(rowNum:Number = 0, asPlural:Boolean = false, forceLactation:Boolean = false):String 
		{
			//DEBUG SHIT!
			if (rowNum > (breastRows.length - 1)) return "<b>Error: Invalid breastRows (" + rowNum + ") passed to nippleDescript()</b>";
			if (rowNum < 0) return "<b>Error: Invalid breastRows (" + rowNum + ") passed to nippleDescript()</b>";
			var descripted: Number = 0;
			var description: String = "";
			//Size descriptors 25% chance
			if (rand(4) == 0 && !InCollection(breastRows[rowNum].nippleType, [GLOBAL.NIPPLE_TYPE_FUCKABLE, GLOBAL.NIPPLE_TYPE_FLAT, GLOBAL.NIPPLE_TYPE_INVERTED, GLOBAL.NIPPLE_TYPE_LIPPLES, GLOBAL.NIPPLE_TYPE_TENTACLED])) {
				//TINAHHHH
				if (nippleLength(rowNum) < .25) {
					description += RandomInCollection(["tiny", "itty-bitty", "teeny-tiny", "dainty"]);
				}
				//Prominant
				else if (nippleLength(rowNum) < 1) {
					description += RandomInCollection(["prominent", "pencil eraser-sized", "eye-catching", "pronounced", "striking"]);
				}
				//Big 'uns
				else if (nippleLength(rowNum) < 2) {
					description += RandomInCollection(["forwards-jutting", "over-sized", "fleshy", "large protruding"]);
				}
				//'Uge
				else if (nippleLength(rowNum) < 3.2) {
					description += RandomInCollection(["elongated", "massive", "awkward", "lavish", "hefty"]);
				}
				//Massive
				else {
					description += RandomInCollection(["bulky", "ponderous", "thumb-sized", "cock-sized", "cow-like"]);
				}
				descripted++;
			}
			//Milkiness/Arousal/Wetness Descriptors 33% of the time
			if ((rand(3) == 0 || forceLactation) && descripted < 2) {
				//Fuckable chance first!
				if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE) {
					if (descripted > 0) description += ", ";
					//Fuckable and lactating? 50%
					if (isLactating()) {
						if (rand(5) <= 3) description += "lactating";
						else description += "lactation-slicked";
					}
					//Just fuckable
					else {
						description += RandomInCollection(["wet", "mutated", "slimy", "damp", "moist", "slippery", "oozing", "sloppy", "dewy"]);
					}
					descripted++;
				}
				//Lipples
				else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES) {
					if (descripted > 0) description += ", ";
					if (isLactating() && rand(3) == 0) {
						if (rand(5) <= 3) description += "drooling";
						else description += "lactation-slicked";
					}
					//Just fuckable
					else {
						//Petite - 0.8 and below
						if (nippleWidth(rowNum) < 0.8) description += RandomInCollection(["slender","petite","small"]);
						//Nice/Supple
						else if (nippleWidth(rowNum) < 1.5) description += RandomInCollection(["full","shapely","pouty","kissable"])
						//Puffy 
						else if (nippleWidth(rowNum) < 2.5) description += RandomInCollection(["plump","puffy","bee-stung","perfectly pouty"]);
						//Juicy
						else if (nippleWidth(rowNum) < 5) description += RandomInCollection(["juicy","luscious","succulent","cushy-looking"]);
						//Obscene
						else if (nippleWidth(rowNum) < 12) description += RandomInCollection(["hypnotic","dazzling","plush","whorish","pornographic","salaciously swollen","obscene"]);
						else description += RandomInCollection(["scylla-tier","impossibly large","game-breaking","crotch-consuming","jacquesian","universe-shaming","ultraporn-banned"]);
					}
					descripted++;
				}
				//Dicknipples
				else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_DICK) {
					if (descripted > 0) description += ", ";
					description += RandomInCollection(["cock-concealing", "dick-hiding", "shaft-shrouding"]);
					descripted++;
				}
				//Flat
				else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_FLAT) {
					if (descripted > 0) description += ", ";
					description += RandomInCollection(["tipless", "flat", "puffy", "pebbly"]);
					descripted++;
				}
				//Inverted
				else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) {
					if (descripted > 0) description += ", ";
					description += "inverted";
					descripted++;
				}
				/* Fen note: disabled due to echoing.
				//Tentacled
				else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED) {
					if (descripted > 0) description += ", ";
					description += RandomInCollection(["tentacle-concealing", "tendril-hiding"]);
					descripted++;
				}*/
				//Just lactating!
				else if (isLactating() && milkFullness > 50) {
					if (descripted > 0) description += ", ";
					//Light lactation
					if (milkMultiplier < 65) {
						description += RandomInCollection(["moistened", "slightly lactating"]);
					}
					//Moderate lactation
					else if (milkMultiplier <= 85) {
						description += RandomInCollection(["lactating", "milky", "milk-seeping"]);
					}
					//Heavy lactation
					else {
						description += RandomInCollection(["dripping", "dribbling", "milk-leaking", "drooling"]);
					}
					descripted++;
				}
			}
			//Possible arousal descriptors
			else if (rand(3) == 0 && descripted < 2 && !InCollection(breastRows[rowNum].nippleType, GLOBAL.NIPPLE_TYPE_FLAT, GLOBAL.NIPPLE_TYPE_INVERTED, GLOBAL.NIPPLE_TYPE_FUCKABLE)) {
				if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES && lust() >= 75)
				{
					if (descripted > 0) description += ", ";
					description += RandomInCollection(["clenching","quivering","trembling","hyper-sensitive","tender","needy"]);
					descripted++;
				}
				else
				{
					if (lust() > 50 && lust() < 75) {
						if (descripted > 0) description += ", ";
						description += RandomInCollection(["erect", "perky", "erect", "firm", "tender"]);
						descripted++;
					}
					if (lust() >= 75) {
						if (descripted > 0) description += ", ";
						description += RandomInCollection(["throbbing", "trembling", "needy", "throbbing"]);
						descripted++;
					}
				}
			}
			if(hasStatusEffect("Rubber Wrapped") && descripted < 2 && rand(6) == 0)
			{
				if(descripted > 0) description += ", ";
				description += RandomInCollection(["rubber-wrapped","latex-encased","shrink-wrapped","ebony-coated","latex-lacquered","suit-encased","latex-enclosed","rubber-encased","latex-wrapped","rubber-painted"]);
				descripted++;
			}
			if (hasNipplePiercing(rowNum) && descripted < 2 && rand(2) == 0) {
				if (descripted > 0) description += ", ";
				if (rowNum >= 0 && breastRows[rowNum].piercing.hasFlag(GLOBAL.ITEM_FLAG_PIERCING_CHAINS)) description += "chained ";
				else description += "pierced ";
				descripted++;
			}
			if (skinType == GLOBAL.SKIN_TYPE_GOO && descripted < 2 && rand(3) == 0) {
				if (descripted > 0) description += ", ";
				description += RandomInCollection(["slime-slick ", "goopy ", "slippery "]);
			}
			
			/* 9999
			if (!descripted && InCollection(nippleColor, "black", "ebony", "obsidian", "onyx", "sable")) {
				if (descripted > 0) description += ", ";
				description += RandomInCollection(["black ", "ebony ", "sable ", nippleColor + " "]);
			}
			*/
			
			//Nounsssssssss*BOOM*
			if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE) {
				if (descripted > 0) description += ", ";
				description += RandomInCollection(["penetrable nipple", "fuckable nip", "fuckable nipple", "pliable nipple-cunt", "stretchy nipple-cunt"]);
			} else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES) {
				if(rand(5) > 2) {
					description += ", ";
					description += RandomInCollection(["lip-like nipple","kissable nipple","misplaced mouth","fuckable nipple"]);
				}
				else {
					description += " ";
					description += RandomInCollection(["lipple","lipple","titty-lip","boob-mouth","lip-nipple"]);
			}
			}
			else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED) {
				if (descripted > 0) description += ", ";
				description += RandomInCollection(["writhing tentacle", "tentacle nipple", "tendril teat", "wiggling tendril", "long, tentacle nipple"]);
			}
			//Normals
			else {
				if (descripted > 0) description += " ";
				if (isLactating() && nippleLength(rowNum) >= 1 && rand(5) <= 1) description += RandomInCollection(["nipple", "teat"]);
				else description += RandomInCollection(["nipple", "nipple", "nipple", "nipple", "bud"]);
				}
			if (asPlural) description = plural(description);
			return description;
		}
		public function nippleNoun(rowNum:int = 0, simple:Boolean = false):String
		{
			var nouns:Array = [];
			if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE)
			{
				if(simple) return "fuckable nipple";
				nouns.push("penetrable nipple", "fuckable nip", "fuckable nipple", "pliable nipple-cunt", "stretchy nipple-cunt");
			}
			else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES)
			{
				if(simple) return "lipple";
				nouns.push("lipple", "lip-nipple", "kissable nipple", "mouth-like nipple");
			}
			else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
			{
				if(simple) return "dick-nipple";
				nouns.push("dick-nipple", "cock-nipple", "nipple-cock");
			}
			else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED)
			{
				if(simple) return "inverted nipple";
				nouns.push("inverted nipple", "hidden nip");
			}
			else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_FLAT)
			{
				if(simple) return "flat nipple";
				nouns.push("tipless nipple", "flat nipple", "puffy nipple", "pebbly nipple");
				nouns.push("tipless nip", "flat nip", "puffy nip", "pebbly nip");
			}
			else if (breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED)
			{
				if(simple) return "tentacle nipple";
				nouns.push("writhing tentacle", "tentacle nipple", "tendril teat", "wiggling tendril", "long, tentacle nipple");
			}
			//Normals
			else
			{
				if(simple) return "nipple";
				nouns.push("nipple", "nipple");
				if (isLactating() && nippleLength(rowNum) >= 1) nouns.push("nipple", "nipple", "teat", "teat");
				nouns.push("bud");
			}
			return nouns[rand(nouns.length)];
		}
		public function nipplesNoun(rowNum:int = 0, simple:Boolean = false):String
		{
			return plural(nippleNoun(rowNum, simple));
		}
		public function areolaSizeDescript(rowNum:int = 0): String {
			//Define areola size description by nippleWidth
			var areolasize: String = "";
			var nipWidth: Number = nippleWidth(rowNum);
			
			if(nipWidth <= 0) areolasize = "non-existent";
			else if(nipWidth <= .375) areolasize = "fairly tiny";
			else if(nipWidth <= .75) areolasize = "average-sized";
			else if(nipWidth <= 1.5) areolasize = "coin-sized";
			else if(nipWidth <= 3) areolasize = "rather huge";
			else if(nipWidth <= 6) areolasize = "saucer-sized";
			else if(nipWidth <= 9) areolasize = "appetizer plate-sized";
			else if(nipWidth <= 12) areolasize = "dinner plate-sized";
			else if(nipWidth <= 18) areolasize = "quite massive";
			else if(nipWidth <= 24) areolasize = "extremely elephantine";
			else if(nipWidth <= 36) areolasize = "manhole cover-sized";
			else if(nipWidth <= 72) areolasize = "person-sized";
			else if(nipWidth <= 120) areolasize = "hallway-clearing";
			else if(nipWidth <= 240) areolasize = "room-filling";
			else if(nipWidth <= 480) areolasize = "truly tremendous";
			else if(nipWidth <= 960) areolasize = "generously gargantuan";
			else if(nipWidth <= 1920) areolasize = "completely colossal";
			else if(nipWidth <= 3840) areolasize = "positively hyper-sized";
			else if(nipWidth <= 7680) areolasize = "stadium-sized";
			else if(nipWidth <= 15360) areolasize = "sky-scraping";
			else if(nipWidth <= 30720) areolasize = "airplane-catching";
			else if(nipWidth <= 61440) areolasize = "cloud-licking";
			else if(nipWidth <= 122880) areolasize = "solar-eclipsing";
			else if(nipWidth <= 491520) areolasize = "planet-engulfing";
			else areolasize = "galaxy-swallowing";
			
			return areolasize;
		}
		
		public function hasSymbolAreola(rowNum:int = 0):Boolean
		{
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_HEART_SHAPED)) return true;
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_STAR_SHAPED)) return true;
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_FLOWER_SHAPED)) return true;
			return false;
		}
		public function areolaDescript(rowNum:int = 0, appearance:Boolean = false):String
		{
			var adjectives:Array = new Array();
			var nouns:Array = ["areola"];
			var description:String = "";
			//0-2 Adjectives used for description
			var adjectiveMin:int = 0;
			var adjectiveLimit:int = 2;
			var i:int = 0;
			var selection:int = 0;

			//Size description
			if(appearance || rand(3) == 0)
			{
				description += areolaSizeDescript(rowNum);
				if(!appearance) adjectiveLimit--;
			}

			//Flag descriptions
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_PUMPED)) adjectives.push("puffy");
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_HEART_SHAPED)) adjectives.push("heart-shaped");
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_STAR_SHAPED)) adjectives.push("star-shaped");
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_FLOWER_SHAPED)) adjectives.push("flower-shaped");

			//If a player has a flag, they probably want to see stuff
			if (breastRows[rowNum].areolaFlags.length > 0) adjectiveMin++;

			//Select a random number of adjectives within limits
			i = rand(adjectives.length + 1);
			if (i < adjectiveMin) i = adjectiveMin;
			if (i > adjectiveLimit) i = adjectiveLimit;
			if (i > adjectives.length) i = adjectives.length;

			//Pick adjective(s)
			for (i; i > 0; i--)
			{
				selection = rand(adjectives.length);
				if(description != "") description += ", ";
				description += adjectives[selection];
				adjectives.splice(selection, 1);
			}

			//Pick a noun.
			if(description != "") description += " ";
			description += nouns[rand(nouns.length)];

			return description;
		}
		public function areolaeDescript(rowNum:int = 0, appearance:Boolean = false):String
		{
			return (areolaDescript(rowNum, appearance) + "e");
		}
		public function areolaFlagDescript(rowNum:int = 0):String
		{
			var list:Array = new Array();
			var description:String = "";

			//Flag non-shape descriptions
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_PUMPED)) list.push("puffy");

			//Default areola shape
			if (!hasSymbolAreola(rowNum)) list.push("round");

			//Others
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_HEART_SHAPED)) list.push("heart-shaped");
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_STAR_SHAPED)) list.push("star-shaped");
			if (breastRows[rowNum].hasAreolaFlag(GLOBAL.FLAG_FLOWER_SHAPED)) list.push("flower-shaped");

			//Build list with punctuation
			while (list.length > 0)
			{
				description += list[0];
				if (list.length > 1) description += ", ";
				list.splice(0, 1);
			}
			return description;
		}
		
		public function canStyleHairType():Boolean {
			if(InCollection(hairType, [GLOBAL.HAIR_TYPE_TENTACLES, GLOBAL.HAIR_TYPE_FEATHERS, GLOBAL.HAIR_TYPE_PLANT])) return false;
			return true;
		}
		public function hairDescript(forceLength: Boolean = false, forceColor: Boolean = false): String {
			var descript: String = "";
			//Bald folks get one-off quick description
			if (hairLength <= 0) {
				if (hasFur()) {
					if (rand(2) == 0) descript += "furry ";
					else {
						if (forceColor || rand(2) == 0) descript += furColor;
						return descript + "head-fur";
					}
				}
				else if (hasFeathers()) {
					if (rand(2) == 0) descript += "feathery ";
					else {
						if (forceColor || rand(2) == 0) descript += furColor;
						return descript + "head-feathers";
					}
				}
				else if (hasScales()) {
					if (rand(2) == 0) descript += "scaly ";
				}
				else if (rand(2) == 0) descript += "shaved ";
				else descript += "bald ";
				descript += "head";
				return descript;
			}
			
			// Length
			if((forceLength || rand(4) == 0) && !InCollection(hairStyle, ["afro", "mohawk", "spikes"]))
			{
				var adjLength:String = hairLengthDescript();
				if (adjLength != "")
				{
					if(descript != "") descript += ", ";
					descript += adjLength;
				}
			}
			
			// Shape
			var adjShape:Array = [];
			if (rand(4) == 0)
			{
				if (hasStatusEffect("frizzy hair")) adjShape.push("frizzy");
			}
			if (adjShape.length > 0)
			{
				if(descript != "") descript += ", ";
				descript += RandomInCollection(adjShape);
			}
			
			// Color
			if (forceColor || rand(2) == 0)
			{
				if (descript != "") descript += ", ";
				if (hairType == GLOBAL.HAIR_TYPE_TRANSPARENT && hairColor.indexOf("transparent") == -1) descript += "transparent";
				descript += hairColor;
			}
			
			// Materials
			var adjMaterial:Array = [];
			var sMaterial:String = "";
			if (rand(2) == 0) {
				if (hasStatusEffect("Latex Hair")) adjMaterial.push("latex");
			}
			if (adjMaterial.length > 0) sMaterial = RandomInCollection(adjMaterial);
			
			// Nouns
			if (descript != "") descript += " ";
			// Mane special stuff.
			if (hasPerk("Mane") && hairLength > 3 && rand(2) == 0)
			{
				descript += "mane";
				if (hairType == GLOBAL.HAIR_TYPE_FEATHERS) descript += " of" + (sMaterial != "" ? (" " + sMaterial) : "") + " feathers";
				else if (hairType == GLOBAL.HAIR_TYPE_QUILLS) descript += " of" + (sMaterial != "" ? (" " + sMaterial) : "") + " quills";
				else if (hairType == GLOBAL.HAIR_TYPE_GOO)
				{
					descript += " of goo";
					if (sMaterial != "") descript += "ey " + sMaterial;
					if (hairStyle == "tentacle") descript += "-tentacles";
					else if (sMaterial != "") descript += " hair";
				}
				else if (hairType == GLOBAL.HAIR_TYPE_TENTACLES) descript += " of" + (sMaterial != "" ? (" " + sMaterial) : "") + " tentacles";
				else if (hairType == GLOBAL.HAIR_TYPE_PLANT) descript += " of" + (sMaterial != "" ? (" " + sMaterial) : "") + " leaves";
				else if (sMaterial != "") descript += " of " + sMaterial + " hair";
			}
			//Not manes
			else
			{
				var nouns:Array = [];
				if (hairType == GLOBAL.HAIR_TYPE_TENTACLES || hairStyle == "tentacle")
				{
					nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "tentacle-hair");
				}
				else if (hairType == GLOBAL.HAIR_TYPE_FEATHERS) 
				{
					nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "plumage");
					nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "feather-hair");
				}
				else if (hairType == GLOBAL.HAIR_TYPE_QUILLS && rand(2) == 0)
				{
					nouns.push("spiny-" + (sMaterial != "" ? (sMaterial + " ") : "") + "hair");
					nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "quill-hair");
				}
				else if (hairType == GLOBAL.HAIR_TYPE_PLANT)
				{
					nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "garden");
					nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "leaf-hair");
				}
				else 
				{
					if(hairStyle == "ponytail") nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "ponytail");
					else if(hairStyle.indexOf("pigtail") != -1) nouns.push("pigtailed" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle == "curls") nouns.push("curled" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle.indexOf("curls") != -1) nouns.push("curly" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle == "braided") nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "braid");
					else if(hairStyle.indexOf(" braid") != -1 || hairStyle.indexOf("plait") != -1) nouns.push("braided" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle == "afro") nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "afro");
					else if(hairStyle == "mohawk") nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "mohawk");
					else if(hairStyle == "spikes") nouns.push("spiked" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle.indexOf("slick") != -1 || hairStyle.indexOf("wave") != -1) nouns.push("smooth" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle.indexOf("layer") != -1) nouns.push("" + (sMaterial != "layered" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle == "side part") nouns.push("side-parted" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle.indexOf(" part") != -1) nouns.push("parted" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle.indexOf("chignon") != -1) nouns.push("pinned-up" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else if(hairStyle == "twintails") nouns.push("twintailed" + (sMaterial != "" ? (" " + sMaterial) : "") + " hair");
					else nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "hair");
				}
				descript += RandomInCollection(nouns);
			}
			return descript;
		}
		public function hairLengthDescript(): String {
			var descript: String = "";
			var adjLength:Array = [];
			
			if (hairLength < 1) adjLength.push("close-cropped", "trim");
			else if (hairLength < 3) adjLength.push("short");
			else if (hairLength < 6) {
				adjLength.push("medium-length");
				if(hairLength <= 4) adjLength.push("ear-length");
				if(!InCollection(hairType, GLOBAL.HAIR_TYPE_TENTACLES, GLOBAL.HAIR_TYPE_PLANT)) adjLength.push("shaggy");
			}
			else if (hairLength < 10) {
				adjLength.push("moderately long");
				if(hairLength < 8) adjLength.push("neck-length");
				else adjLength.push("shoulder-length");
			}
			else if (hairLength < 16) adjLength.push("long","lengthy");
			else if (hairLength < tallness / 2.5) adjLength.push("very long", "back-length");
			else if (hairLength < tallness / 1.6) {
				adjLength.push("cascading");
				if(hairLength < tallness / 1.7) adjLength.push("ass-length");
				else adjLength.push("thigh-length");
			}
			else if (hairLength < tallness / 1.3) {
				adjLength.push("delightfully long");
				if(hasKnees()) adjLength.push("knee-length");
			}
			else if(hairLength < tallness) {
				adjLength.push("exquisitely long");
				if(hasKnees())
				{
					if(hairLength < tallness - 1) adjLength.push("calf-length");
					else adjLength.push("ankle-length");
				}
			}
			else adjLength.push("floor-length", "obscenely long", "floor-dragging");
			
			if (adjLength.length > 0) descript += RandomInCollection(adjLength);
			return descript;
		}
		public function hairNoun():String
		{
			if (hairLength <= 0) {
				if (hasFur()) return "furry head";
				if (hasFeathers()) return "feathered head";
				return "head";
			}
			
			var descript:String = "";
			//Mane special stuff.
			if (hasPerk("Mane") && hairLength > 3 && rand(2) == 0) {
				descript += "mane";
				if (hairType == GLOBAL.HAIR_TYPE_FEATHERS) descript += " of feathers";
				if (hairType == GLOBAL.HAIR_TYPE_QUILLS) descript += " of quills";
				if (hairType == GLOBAL.HAIR_TYPE_GOO) descript += " of goo";
				if (hairType == GLOBAL.HAIR_TYPE_TENTACLES) descript += " of tentacles";
				if (hairType == GLOBAL.HAIR_TYPE_PLANT) descript += " of leaves";
			}
			//Not manes
			else {
				if ((hairType == GLOBAL.HAIR_TYPE_TENTACLES || hairStyle == "tentacle") && rand(2) == 0) descript += "tentacle-hair";
				else if (hairType == GLOBAL.HAIR_TYPE_FEATHERS) 
				{
					if(rand(2) == 0) descript += "plumage";
					else descript += "feather-hair";
				}
				else if (hairType == GLOBAL.HAIR_TYPE_QUILLS) descript += "quill-hair";
				else if (hairType == GLOBAL.HAIR_TYPE_PLANT) descript += "leaf-hair";
				else descript += "hair";
			}
			return descript;
		}
		public function hairsNoun():String
		{
			if (hairLength <= 0) {
				if (hasFur()) return "head fur";
				if (hasFeathers()) return "head feathers";
				return "head";
			}
			
			var descript:String = "";
			if (hairType == GLOBAL.HAIR_TYPE_TENTACLES || hairStyle == "tentacle") descript += "tentacles";
			else if (hairType == GLOBAL.HAIR_TYPE_FEATHERS) descript += "feathers";
			else if (hairType == GLOBAL.HAIR_TYPE_QUILLS) descript += "quills";
			else if (hairType == GLOBAL.HAIR_TYPE_GOO) descript += "locks of goo";
			else if (hairType == GLOBAL.HAIR_TYPE_PLANT) descript += "leaves";
			else descript += "locks";
			return descript;
		}
		public function hairsDescript(forceLength: Boolean = false, forceColor: Boolean = false): String {
			var descript: String = "";
			//Bald folks get one-off quick description
			if (hairLength <= 0) {
				if (hasFur()) {
					if (rand(2) == 0) descript += "furry ";
					else {
						if (forceColor || rand(2) == 0) descript += furColor;
						return descript + "head-fur";
					}
				}
				else if (hasFeathers()) {
					if (rand(2) == 0) descript += "feathery ";
					else {
						if (forceColor || rand(2) == 0) descript += furColor;
						return descript + "head-feathers";
					}
				}
				else if (hasScales()) {
					if (rand(2) == 0) descript += "scaly ";
				}
				else if (rand(2) == 0) descript += "shaved ";
				else descript += "bald ";
				descript += "head";
				return descript;
			}
			
			// Length
			if((forceLength || rand(4) == 0) && !InCollection(hairStyle, ["afro", "mohawk", "spikes"]))
			{
				var adjLength:String = hairLengthDescript();
				if (adjLength != "")
				{
					if(descript != "") descript += ", ";
					descript += adjLength;
				}
			}
			
			// Shape
			var adjShape:Array = [];
			if (rand(4) == 0)
			{
				if (hasStatusEffect("frizzy hair")) adjShape.push("frizzy");
			}
			if (adjShape.length > 0)
			{
				if(descript != "") descript += ", ";
				descript += RandomInCollection(adjShape);
			}
			
			// Color
			if (forceColor || rand(2) == 0)
			{
				if (descript != "") descript += ", ";
				if (hairType == GLOBAL.HAIR_TYPE_TRANSPARENT && hairColor.indexOf("transparent") == -1) descript += "transparent";
				descript += hairColor;
			}
			
			// Materials
			var adjMaterial:Array = [];
			var sMaterial:String = "";
			if (rand(2) == 0) {
				if (hasStatusEffect("Latex Hair")) adjMaterial.push("latex");
			}
			if (adjMaterial.length > 0) sMaterial = RandomInCollection(adjMaterial);
			
			// Nouns
			var nouns:Array = [];
			if (descript != "") descript += " ";
			if (hairType == GLOBAL.HAIR_TYPE_TENTACLES || hairStyle == "tentacle") nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "tentacles");
			else if (hairType == GLOBAL.HAIR_TYPE_PLANT) nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "leaves");
			else if (hairType == GLOBAL.HAIR_TYPE_FEATHERS) nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "feathers");
			else if (hairType == GLOBAL.HAIR_TYPE_QUILLS && rand(2) == 0) nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "quills");
			else 
			{
				if(hairStyle == "ponytail") nouns.push("ponytail-bound" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle.indexOf("pigtail") != -1) nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "pigtails");
				else if(hairStyle.indexOf("curls") != -1) nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "curls");
				else if(hairStyle == "braided" || hairStyle.indexOf(" braid") != -1 || hairStyle.indexOf("plait") != -1) nouns.push("braid-bound" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle == "afro") nouns.push("afro-puffed" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle == "mohawk") nouns.push("mohawk-shaped" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle == "spikes") nouns.push("spiky" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle.indexOf("slick") != -1 || hairStyle.indexOf("wave") != -1) nouns.push("smooth" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle.indexOf("layer") != -1) nouns.push("layered" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle == "side part") nouns.push("side-parted" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle.indexOf(" part") != -1) nouns.push("parted" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle.indexOf("chignon") != -1) nouns.push("pinned-up" + (sMaterial != "" ? (" " + sMaterial) : "") + " locks");
				else if(hairStyle == "twintails") nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "twintails");
				else descript += nouns.push((sMaterial != "" ? (sMaterial + " ") : "") + "locks");
			}
			descript += RandomInCollection(nouns);
			if (hairType == GLOBAL.HAIR_TYPE_GOO && rand(2) == 0) descript += " of goo";
			return descript;
		}
		public function eachClit(): String {
			if (totalClits() > 1) return "each of your " + plural(clitDescript());
			return "your " + clitDescript();
		}
		public function oneClitPerVagina(arg:int = 0):String
		{
			if(arg >= vaginas.length) return "ERROR - OUT OF BOUNDS CHECK FOR ONECLITPERVAGINA()";
			else if(arg < 0) return "ERROR - OUT OF BOUNDS CHECK FOR ONECLITPERVAGINA()";
			else if(vaginas[arg].clits == 1) return "your " + clitDescript(arg);
			else if(vaginas[arg].clits > 1) return "one of your " + plural(clitDescript(arg));
			return "ERROR";
		}
		public function oneClit(): String {
			if (totalClits() > 1) return "one of your " + plural(clitDescript());
			return "your " + clitDescript();
		}
		public function clitsDescript(pussy: Number = -1, nounOnly:Boolean = false): String {
			if (pussy >= 0)
			{
				if (vaginas[pussy].clits == 1) return clitDescript(pussy, nounOnly);
				return plural(clitDescript(pussy, nounOnly));
			}
			if (totalClits() != 1) return plural(clitDescript(pussy, nounOnly));
			return clitDescript(pussy, nounOnly);
		}
		public function clitDescript(pussy: Number = -1, nounOnly:Boolean = false): String {
			if (vaginas.length <= 0) return ("ERROR: CLITDESCRIPT WITH NO VAGINA");
			
			var descript: String = "";
			var descripted: Number = 0;
			//Length Adjective - 50% chance
			if (!nounOnly && rand(3) == 0) {
				var randt: Number = rand(10);
				//small clits!
				if (clitLength <= .4) {
					if (randt < 3) descript += "tiny";
					else if (randt < 6) descript += "little";
					else if (randt < 8) descript += "petite";
					else if (randt == 8) descript += "diminutive";
					else descript += "miniature";
					descripted++;
				}
				//"average".
				else if (clitLength < 1) {
					
				}
				//Biggies!
				else if (clitLength < 4) {
					if (randt < 4) descript += "large";
					else if (randt < 9) descript += "substantial";
					else descript += "considerable";
					descripted++;
				}
				//'Uge 
				else if (clitLength < 10) {
					if (randt < 2) descript += "dick-sized";
					else if (randt < 4) descript += "phallus-like";
					else if (randt < 6) descript += "cock-like";
					else if (randt < 8) descript += "banana-sized";
					else if (randt == 8) descript += "hulking";
					else descript += "bulky";
					descripted++;
				} else {
					if (randt < 3) descript += "monster";
					else if (randt < 6) descript += "tremendous";
					else if (randt < 8) descript += "colossal";
					else if (randt == 8) descript += "enormous";
					else descript += "oversized";
					descripted++;
				}
			}
			//Descriptive descriptions - 50% chance of being called
			if (!nounOnly && rand(3) == 0 && descripted < 2) {
				//Elizabeth descriptors
				if (skinType == GLOBAL.SKIN_TYPE_FUR && hasVaginaType(GLOBAL.TYPE_VULPINE) && rand(3) <= 1) {
					if (descripted > 0) descript += ", ";
					descript += "foxy ";
					descripted++;
				}
				//Horny descriptors - 75% chance
				else if (lust() > 70 && rand(4) < 3 && !descripted) {
					if (descripted > 0) descript += ", ";
					descript += RandomInCollection(["throbbing", "pulsating", "hard"]);
					descripted++;
				}
				//High libido - always use if no other descript
				else if (libido() > 50 && rand(3) < 2 && !descripted) {
					if (descripted > 0) descript += ", ";
					descript += RandomInCollection(["insatiable", "greedy", "demanding", "rapacious"]);
					descripted++;
				}
			}
			if (!nounOnly && pussy >= 0 && hasClitPiercing(pussy) && descripted < 2 && rand(3) < 2) {
				if (descripted > 0) descript += ", ";
				descript += "pierced";
				descripted++;
			}
			//Clit nouns
			if (descripted > 0) descript += " ";
			//HYPHENING SHIT ONTO DOSE NOUNS, YO!
			if (skinType == GLOBAL.SKIN_TYPE_FUR && hasVaginaType(GLOBAL.TYPE_CANINE) && rand(2) == 0) descript += "bitch-";
			//Horse descriptors - 50%
			else if (skinType == GLOBAL.SKIN_TYPE_FUR && hasVaginaType(GLOBAL.TYPE_EQUINE) && rand(3) <= 0) descript += "mare-";
			if (rand(10) == 0) 
			{
				if (kGAMECLASS.silly && clitLength >= 12 && rand(2) == 0) descript += "clitosaurus";
				else if (clitLength >= 5) descript += "girl-pole";
				else descript += "clit";
			}
			else descript += RandomInCollection(["clitty", "button", "pleasure-buzzer", "clit", "clitty", "button", "clit", "clit", "button"]);
			return descript;
		}
		public function vagOrAss(arg: int = 0): String {
			if (hasVagina() && arg >= 0 && !isBlocked(arg)) return vaginaDescript(arg);
			return assholeDescript();
		}
		public function vagOrAssNoun(arg:int = 0):String
		{
			if (hasVagina() && arg >= 0 && !isBlocked(arg)) return vaginaNounDescript(arg);
			return assholeDescript(true);
		}
		//Vaginas + Descript
		public function oneTailVaginaDescript():String
		{
			var buffer:String = "";
			if(tailCount > 1) buffer += "one of ";
			buffer += "your ";
			if(tailCount > 1) buffer += plural(tailVaginaDescript());
			else buffer += tailVaginaDescript();
			return buffer;
		}
		public function tailVaginasDescript(forceAdjectives: Boolean = false, adjectives: Boolean = true): String {
			if(tailCount > 1) return plural(tailVaginaDescript(forceAdjectives,adjectives));
			else if(tailCount == 1) return tailVaginaDescript(forceAdjectives,adjectives);
			return "ERROR: TAIL DESCRIPT CALLED WITH NO TAILS PRESENT.";
		}
		public function tailVaginaDescript(forceAdjectives: Boolean = false, adjectives: Boolean = true, appearance: Boolean = false): String {
			//Vars
			var vag: String = "";
			var descripted: int = 0;
			var temp: int = 0;
			var tailCuntHolder:VaginaClass = new VaginaClass();
			tailCuntHolder.type = tailGenitalArg;
			if (tailGenitalColor != "") tailCuntHolder.vaginaColor = tailGenitalColor;

			//low chance of size descriptor
			if ((adjectives && rand(100) <= 25) || forceAdjectives) {
				temp = rand(10);
				if (temp <= 3) vag += "tight";
				else if (temp <= 5) vag += "clingy";
				else if (temp <= 7) vag += "supple";
				else vag += "velvety-soft";
				descripted++;
			}
			//wetness descript - 30% display rate
			if (descripted < 2 && ((adjectives && rand(100) > 70) || forceAdjectives)) {
				if (descripted > 0) vag += ", ";
				temp = rand(17);
				if (temp <= 3) vag += "wet";
				else if (temp <= 5) vag += "sultry";
				else if (temp <= 8) vag += "sweltering";
				else if (temp <= 11) vag += "slippery";
				else if (temp <= 13) vag += "slick";
				else vag += "lube-leaking";
				descripted++;
			}
			//Elasticity references!
			if (descripted < 2 && elasticity >= 1.5 && ((adjectives && rand(3) == 0) || forceAdjectives)) {
				if (descripted > 0) vag += ", ";
				if (elasticity >= 5) {
					temp = rand(10);
					if (temp <= 3) vag += "stretchy";
					else if (temp <= 7) vag += "incredibly elastic";
					else vag += "powerfully pliable";
				} else {
					temp = rand(10);
					if (temp <= 1) vag += "stretchy";
					else if (temp <= 3) vag += "elastic";
					else if (temp <= 5) vag += "pliable";
					else if (temp <= 7) vag += "flexible";
					else vag += "pliant";
				}
				descripted++;
			}
			if (descripted < 2 && skinType == GLOBAL.SKIN_TYPE_GOO && ((adjectives && rand(3) == 0) || forceAdjectives)) {
				if (descripted > 0) vag += ", ";
				if (rand(2) == 0) vag += "gooey";
				else vag += "slimy";
				descripted++;
			}
			//10% of time, mention color.
			if (rand(10) == 0 && tailGenitalColor != "") {
				if (descripted > 0) vag += ", ";
				vag += tailGenitalColor;
				descripted++;
			}
			//50% of time, simple cunt.
			if (rand(2) == 0) {
				if (descripted > 0) vag += " ";
				vag += vaginaNoun2(tailCuntHolder, true, (appearance ? "appearance tail" : "tail"));
			}
			//50% of the time, complex cunt!
			else {
				if (descripted > 0) vag += ", ";
				vag += vaginaNoun2(tailCuntHolder, false, (appearance ? "appearance tail" : "tail"));
			}
			return vag;
		}
		public function vaginaNounDescript(vaginaNum: Number = 0):String
		{
			if(vaginaNum >= vaginas.length || vaginaNum < 0) return "ERROR, INVALID PUSSY";
			return vaginaNoun2(vaginas[vaginaNum], (rand(2) == 0));
		}
		public function vaginaNounComplex(vaginaNum: Number = 0):String
		{
			if(vaginaNum >= vaginas.length || vaginaNum < 0) return "ERROR, INVALID PUSSY";
			return vaginaNoun2(vaginas[vaginaNum], false);
		}
		public function vaginaNounSimple(vaginaNum: Number = 0):String
		{
			if(vaginaNum >= vaginas.length || vaginaNum < 0) return "ERROR, INVALID PUSSY";
			return vaginaNoun2(vaginas[vaginaNum], true);
		}
		public function simpleVaginasNoun():String {
			var output:String = "";
			
			if (vaginas.length < 1) return "<b>ERROR: NO PUSSIES DETECTED for simpleVaginasNoun()</b>";
			if (matchedVaginas()) output += vaginaNoun2(vaginas[0], true);
			else output += randomSimpleVaginaNoun();
			
			if (vaginas.length > 1) output = plural(output);
			
			return output;
		}
		public function randomSimpleVaginaNoun():String
		{
			return RandomInCollection("pussy","pussy","pussy","pussy","pussy","vagina","vagina","vagina","cunt","cunt","slit");
		}
		public function vaginaNoun2(vag:VaginaClass, simple:Boolean = false, special:String = ""):String
		{
			var desc: String = "";
			var type:int = vag.type;
			if(special == "appearance" || special == "appearance tail")
			{
				if (special != "appearance tail") desc += vag.vaginaColor + ", ";
				if (type == GLOBAL.TYPE_EQUINE) desc += "equine ";
				else if (type == GLOBAL.TYPE_CANINE) desc += "canine ";
				else if (type == GLOBAL.TYPE_VULPINE) desc += "vulpine ";
				else if (type == GLOBAL.TYPE_FELINE) desc += "feline ";
				else if (type == GLOBAL.TYPE_AVIAN) desc += "avian ";
				else if (type == GLOBAL.TYPE_ANEMONE) desc += "sea anemone-";
				else if (type == GLOBAL.TYPE_SIREN) desc += "suula ";
				else if (type == GLOBAL.TYPE_GRYVAIN || type == GLOBAL.TYPE_DRACONIC || type == GLOBAL.TYPE_FROSTWYRM) desc += "draconic ";
				else if (type == GLOBAL.TYPE_BEE) desc += "zil-styled ";
				else if (type == GLOBAL.TYPE_NAGA) desc += "snake-like ";
				else if (type == GLOBAL.TYPE_VANAE) desc += "vanae ";
				else if (type == GLOBAL.TYPE_LEITHAN) desc += "leithan mare-";
				else if (type == GLOBAL.TYPE_LIZAN) desc += "reptilian ";
				else if (type == GLOBAL.TYPE_SYNTHETIC) desc += "synthetic ";
				else if (type == GLOBAL.TYPE_GABILANI) desc += "gabilani ";
				else if (type == GLOBAL.TYPE_NYREA) desc += "nyrean ";
				else if (type == GLOBAL.TYPE_HUMAN) desc += "human ";
				else if (type == GLOBAL.TYPE_KUITAN) desc += "kui-tan ";
				else if (type == GLOBAL.TYPE_FLOWER) desc += "orchid ";
				else if (type == GLOBAL.TYPE_DEER) desc += "deer ";
				else if (type == GLOBAL.TYPE_SHARK) desc += "shark ";
				else if (type == GLOBAL.TYPE_SWINE) desc += "swine ";
				else if (type == GLOBAL.TYPE_MOUTHGINA) desc += "mouth-like ";
				else if (type == GLOBAL.TYPE_KORGONNE) desc += "korgonne ";
				else if (type == GLOBAL.TYPE_SAURMORIAN) desc += "saurmorian ";
				else desc += "alien ";
				var plainPussies:Array = ["vagina", "pussy"];
				if(isBimbo()) plainPussies.push("cunt");
				if(vag.looseness() <= 2) plainPussies.push("slit");
				else if(vag.looseness() == 5) plainPussies.push("gash");
				if(type == GLOBAL.TYPE_BEE || girlCumType == GLOBAL.FLUID_TYPE_HONEY) plainPussies.push("honeypot");
				desc += RandomInCollection(plainPussies);
			}
			else if(special != "default")
			{
				//If tail mounted, give tail specials.
				if(special == "tail" && rand(2) == 0)
				{
					if(!simple)
						desc += RandomInCollection(["tail-mounted pussy",(hasParasiteTail()?"parasite pussy":"tail-mounted vagina"),"tail-topping cunt","tail-mounted twat"]);
					else
						desc += RandomInCollection(["tail-vagina", "tail-pussy", "tail-pussy","tail-pussy","tail-pussy", "tail-cunt", "tail-cunt", "tail-slit", "tail-slit","tail-twat","tail-twat"]);
				}
				//Gooey override, Slimgina
				else if(rand(3) == 0 && vag.hasFlag(GLOBAL.FLAG_GOOEY))
				{
					if(!simple)
						desc += RandomInCollection(["sloppy slit", "gooey pussy", "slime cunt", "slime vagina", "semi-solid slit", "gooey quim", "goo vagina", "slime pussy", "gooey pussy", "slimy cunt", "syrupy quim", "juicy twat", "slime gash", "goo honeypot", "slimy snatch"]);
					else
						desc += RandomInCollection(["googina", "goo-pussy", "slime-gina", "goo-pussy", "slime-cunt", "fuck-hole", "goo-twat", "slime-gash", "honeypot", "slime-snatch","slime-pussy"]);
				}
				else if (type == GLOBAL.TYPE_EQUINE)
				{
					if (!simple)
						desc += RandomInCollection(["animalistic pussy","animalistic cunt","equine slit","equine pussy","equine vagina", "animalistic vagina", "equine cunny", "equine honeypot", "horse-like pussy", "equine pussy", "musky horse-pussy", "musky mare-cunt"]);
					else
						desc += RandomInCollection(["horse-pussy", "mare-pussy","animal-pussy","mare-pussy","mare-cunt", "horse-cunt","horse-gina","horse-twat", "mare-twat", "mare-pussy", "animal-pussy","cunt","gash"]);
				}
				//Maybe doge?
				else if (type == GLOBAL.TYPE_CANINE)
				{
					if (!simple)
						desc += RandomInCollection(["canine pussy","animal pussy","animalistic pussy","doggie cunt","animal cunt","canine cunt", "animalistic cunny", "canine honeypot", "canine slit", "animal pussy", "fragrant dog-cunt", "doggie slit"]);
					else
						desc += RandomInCollection(["dog-pussy","dog-pussy","bitch-pussy","animal-pussy","bitch-cunt","dog-cunt","dog-twat","bitch-slit", "animal-pussy", "dog-vagina", "dog-cunt","cunt","slit"]);
				}
				else if (type == GLOBAL.TYPE_KORGONNE)
				{
					if (!simple)
						desc += RandomInCollection(["canine pussy","alien pussy","doggie pussy","doggie cunt","alien cunt","korgonne cunt","canine cunt", "animalistic cunny", "canine honeypot", "canine slit", "alien pussy", "fragrant korg-cunt", "korg-style slit"]);
					else
						desc += RandomInCollection(["korgonne-pussy","korg-pussy","bitch-pussy","animal-pussy","korg-cunt","dog-cunt","dog-twat","pheromone-box", "animal-pussy", "dog-vagina", "dog-cunt","cunt","slit","pussy"]);
				}
				else if (type == GLOBAL.TYPE_VULPINE)
				{
					if (!simple)
						desc += RandomInCollection(["canine pussy","animal pussy","animalistic pussy","foxy cunt","animal cunt","canine cunt", "animalistic cunny", "canine honeypot", "canine slit", "animal pussy", "fragrant fox-cunt", "foxy slit"]);
					else
						desc += RandomInCollection(["fox-pussy","fox-pussy","bitch-pussy","animal-pussy","bitch-cunt","fox-cunt","fox-twat","bitch-slit", "animal-pussy", "fox-vagina", "fox-cunt","cunt","slit"]);
				}
				else if (type == GLOBAL.TYPE_FELINE)
				{
					if (!simple)
						desc += RandomInCollection(["feline pussy","animalistic pussy","feline pussy","feline vagina","animalistic vagina","feline honeypot","kitty cunny","feline cunt","feline slit","kitty cunt","kitty quim","animalistic slit"]);
					else
						desc += RandomInCollection(["cat-pussy", "cat-pussy", "animal-pussy", "cat-cunt", "cat-quim", "animal-twat", "cat-gina", "cat-vagina", "pussycat-pussy", "box"]);
				}
				else if (type == GLOBAL.TYPE_AVIAN)
				{
					if (!simple)
						desc += RandomInCollection(["avian pussy", "bird pussy", "bird vagina", "avian vagina", "avian honeypot", "birdy cunny", "avian cunt", "bird slit", "avian slit", "bird cunt", "birdy quim"]);
					else
						desc += RandomInCollection(["bird-pussy", "bird-pussy", "avian-pussy", "bird-cunt", "bird-quim", "avian-twat", "bird-gina", "bird-vagina", "box"]);
				}
				else if (type == GLOBAL.TYPE_ANEMONE)
				{
					if (!simple)
						desc += RandomInCollection(["wriggling gash", "stinger-ringed vagina", "cilia-filled cunny", "anemone-like honeypot", "aphrodisiac-laced pussy","wriggling pussy","wriggling vagina","cilia-filled pussy","tentacle-filled twat", "alien pussy", "wiggly cunt","cilia-filled slit","cilia-lined quim","venomous pussy","venomous cunt","venomous vagina"]);
					else
						desc += RandomInCollection(["anemone-pussy", "venom-pussy", "anemone-pussy", "anemone-slit", "venom-cunt", "pussy", "pussy", "tenta-gina","tenta-pussy","xeno-cunny","xeno-gina","anemone-twat","anemone-snatch","cunt"]);
				}
				else if (type == GLOBAL.TYPE_SIREN)
				{
					if (!simple)
						desc += RandomInCollection(["wriggling gash", "stinger-ringed vagina", "cilia-filled cunny", "suula-like honeypot", "aphrodisiac-laced pussy","wriggling pussy","wriggling vagina","cilia-filled pussy","tentacle-filled twat", "alien pussy", "wiggly cunt","cilia-filled slit","cilia-lined quim","venomous pussy","venomous cunt","venomous vagina"]);
					else
						desc += RandomInCollection(["suula-pussy", "venom-pussy", "suula-pussy", "suula-slit", "venom-cunt", "pussy", "pussy", "tenta-gina","tenta-pussy","xeno-cunny","xeno-gina","suula-twat","suula-snatch","cunt"]);
				}
				else if (type == GLOBAL.TYPE_GRYVAIN)
				{
					if (!simple)
						desc += RandomInCollection(["nub-ringed pussy", "scaly pussy","draconic pussy","gryvain pussy","dragon-like pussy","scaly cunt","gryvain cunt","draconic cunt","scaly quim","draconic slit","nubby pussy","draconic vagina","scaly vagina","draconic box","nub-ringed cunny","nubby snatch"]);
					else
						desc += RandomInCollection(["gryvain-pussy", "dragon-pussy", "wyrm-cunt", "reptile-pussy", "dragon-vagina","cunt", "dragon-cunt", "pussy"]);
				}
				else if (type == GLOBAL.TYPE_BEE)
				{
					if (!simple)
						desc += RandomInCollection(["zil pussy","fragrant pussy","pheromone-laden pussy","exotic pussy","alien pussy","zil honeypot","alien honeypot","fragrant honeypot","sweet cunt","zil cunt","alien cunt","exotic slit","inhuman slit","sweetened quim"]);
					else
						desc += RandomInCollection(["zil-pussy", "pussy", "zil-pussy", "xeno-cunt", "honey-cunt", "zil-cunt", "honey-box", "zil-twat", "pussy", "zil-gina", "xeno-slit", "slit", "sugar-slit"]);
				}
				else if (type == GLOBAL.TYPE_NAGA)
				{
					if (!simple)
						desc += RandomInCollection(["reptilian pussy", "semi-concealed pussy","reptilian pussy","snake-like pussy", "reptilian cunt","half-hidden cunny", "snake-like slit", "alien pussy", "half-hidden quim", "reptilian quim", "inconspicuous gash", "inconspicuous pussy","naleen-morphed pussy"]);
					else
						desc += RandomInCollection(["naleen-pussy","snake-pussy","pussy","pussy","snake-cunt","naleen-cunt","xeno-pussy","slit","slit","twat","reptile-cunt","reptile-pussy"]);
				}
				else if (type == GLOBAL.TYPE_VANAE)
				{
					if (!simple)
						desc += RandomInCollection(["tentacle-laden pussy","writhing pussy","feeler-lined pussy","licker-lined pussy","silken pussy","alien cunt", "licker-lined cunt", "feeler-filled slit", "squirming slit","squirmy quim","squirming pussy","tentacle-lined gash","tentacle twat"]);
					else
						desc += RandomInCollection(["vanae-pussy","tenta-pussy","xeno-pussy","pussy","xeno-cunt","vanae-cunt","pussy","tenta-twat","box","cunt","slit","wriggle-slit"])
				}
				else if (type == GLOBAL.TYPE_LEITHAN)
				{
					if (!simple)
						desc += RandomInCollection(["leithan pussy","pheromone-laden pussy","fragrant mare-pussy","prominent pussy","near-equine vagina","leithan vagina","inhuman honeypot","leithan cunt","fragrant honeypot","pheromonal cunt","thick-lipped cunt","thick-lipped pussy","horse-like mare-cunt","leithan mare-cunt","fragrant twat"]);
					else
						desc += RandomInCollection(["taur-pussy","mare-pussy","mare-pussy","pussy","mare-cunt","taur-cunt","centaur-slit","centaur-snatch","gash", "mare-twat","pussy","centaur-gina"]);
				}
				else if (type == GLOBAL.TYPE_LIZAN)
				{
					if (!simple)
						desc += RandomInCollection(["reptilian pussy", "semi-concealed pussy","reptilian pussy","lizan-like pussy", "reptilian cunt","half-hidden cunny", "lizan-like slit", "reptile pussy", "half-hidden quim", "reptilian quim", "inconspicuous gash", "inconspicuous pussy","lizard-morphed pussy"]);
					else
						desc += RandomInCollection(["lizard-pussy","lizan-pussy","pussy","pussy","lizan-cunt","lizard-cunt","reptile-pussy","slit","slit","twat","reptile-cunt","reptile-pussy"]);
				}
				else if (type == GLOBAL.TYPE_SYNTHETIC)
				{
					if (!simple)
						desc += RandomInCollection(["synthetic pussy","robotic pussy","artificial pussy","cybernetic pussy","simulated slit","synthetic slit","cybernetic cunt","synthetic cunt","robotic cunt","synthetic pussy","artificial quim","cybernetic cunny","robotic slit"]);
					else
						desc += RandomInCollection(["synth-pussy","robo-pussy","cyber-pussy","techno-pussy","synth-pussy","synth-cunt","robo-cunt","cyber-snatch","techno-twat","synth-slit","cyber-slit","pussy","robo-gina","techno-cunt","tech-gina","synth-gina"]);
				}
				else if (type == GLOBAL.TYPE_GABILANI)
				{
					if (!simple)
						desc += RandomInCollection(["goblin pussy","gabiliani pussy", "dexterous pussy","inhuman pussy","goblin cunny","goblin cunt","gabilani slit","gabilani gash","dexterous goblin-pussy","inhuman vagina"]);
					else
						desc += RandomInCollection(["goblin-pussy","pussy","xeno-pussy","goblin-pussy","goblin-cunt","xeno-cunt","goblin-snatch","cunt","pussy","slit"]);
				}
				else if (type == GLOBAL.TYPE_NYREA)
				{
					if (!simple)
						desc += RandomInCollection(["nyrean pussy","insectile pussy","nyrean cunt","boyish pussy","boyish cunt","cunt","nyrean cunny","insectile slit","alien slit","alien pussy","alien pussy","insectile quim","inhuman pussy"]);
					else
						desc += RandomInCollection(["pussy","nyrea-pussy","boy-pussy","xeno-pussy","nyrea-cunt","boy-cunt","slit","cunt","pussy","eye-pleasing pussy"]);
				}
				else if (type == GLOBAL.TYPE_KUITAN)
				{
					if (!simple)
						desc += RandomInCollection(["heart-shaped box","alien pussy","inhuman pussy","heart-shaped pussy","kui-tan pussy","tanuki twat","heart-shaped cunt","kui-tan cunt","heart-framed slit","kui-tan quim","heart-shaped snatch"]);
					else
						desc += RandomInCollection(["‘nuki-pussy","shapely-slit","pussy","‘nuki-pussy","pussy","‘nuki-cunt","cunt","slit","kui-cunt","shapely-snatch","twat","xeno-pussy"]);
				}
				else if (type == GLOBAL.TYPE_FLOWER)
				{
					if (!simple)
						desc += RandomInCollection(["flower-shaped box","orchid pussy","floral pussy","gaping orchid pussy","dewy-petaled flower cunt","blossoming pussy","brightly-colored petal twat","fronded flower hole"]);
					else
						desc += RandomInCollection(["orchid-pussy","petaled-slit","pussy","flower-pussy","pussy","dewy-cunt","cunt","slit","floral-cunt","flower-snatch","twat","floral-pussy"]);
				}
				else if (type == GLOBAL.TYPE_DEER)
				{
					if (!simple)
						desc += RandomInCollection(["animalistic pussy", "animalistic cunt", "deer slit", "deer pussy", "deer vagina", "animalistic vagina", "deer cunny", "deer-like pussy", "doe pussy", "musky deer-pussy", "musky deer-cunt", "musky doe-pussy", "musky doe-cunt"]);
					else
						desc += RandomInCollection(["deer-pussy", "doe-pussy", "animal-pussy", "deer-cunt", "doe-cunt", "animal-cunt", "deer-twat", "doe-twat", "deer-slit", "doe-slit", "cunt", "gash"]);
				}
				else if (type == GLOBAL.TYPE_SHARK)
				{
					if(!simple)
						desc += RandomInCollection(["wriggling pussy", "cilia-wringed vagina", "shark-like honeypot", "cilla-filled honeypot", "cilla-filled vagina", "shark-like vagina", "tentacle filled gash", "cilla-lined cunt", "tentacled vagina", "tentacled pussy", "tentacled twat", "cilia-filled gash", "tentacled quim", "piscine snatch", "piscine twat","aquatic twat","fishy pussy"]);
					else
						desc += RandomInCollection(["shark-cunt", "shark-twat", "shark-gash", "shark-pussy", "tentacle-pussy", "tentacle-gash", "shark-pussy","pussy","pussy"]);
				}
				else if (type == GLOBAL.TYPE_SWINE)
				{
					if (!simple)
						desc += RandomInCollection(["pig pussy", "swine slit", "animalistic pussy", "pig cunt", "sow pussy", "hog hole", "hog honeypot", "ridge-lined animal pussy", "corkscrewed pig vagina", "swine vagina"]);
					else
						desc += RandomInCollection(["pig-pussy","swine-pussy","sow-pussy","animal-pussy","swine-slit","sow-slit","pig-cunt"]);
				}
				else if (type == GLOBAL.TYPE_MOUTHGINA)
				{
					if (!simple)
					{
						var mouthAdj:Array = ["mouth-like", "soft", "kissy", "exotic"];
						if(kGAMECLASS.silly) mouthAdj.push("liptastic");
						desc += (RandomInCollection(mouthAdj) + " " + RandomInCollection(["pussy", "twat", "cunt", "honeypot", "muff"]));
					}
				else
						desc += RandomInCollection(["mouthgina","mouthgina","mouth-pussy","mouth-gina","mouth-muff", "maw"]);
				}
				else if (type == GLOBAL.TYPE_SAURMORIAN)
				{
					if (!simple) desc += RandomInCollection("glossy ", "bestial ", "savage ", "saurmorian ");
					desc += RandomInCollection(["vagina", "pussy", "pussy", "pussy", "pussy","pussy","pussy", "cunt", "cunt", "cunt", "cunt", "slit", "slit", "twat", "gash", "cunny", "honeypot", "snatch"]);
				}
				else
				{
					if (!simple)
					{
						if (type == GLOBAL.TYPE_HUMAN)
							desc += RandomInCollection(["human ", "human ", "terran ", "terran "]);
						else
							desc += RandomInCollection(["alien ", "alien ", "exotic ", "exotic ", "inhuman "]);
					}
					desc += RandomInCollection(["vagina", "pussy", "pussy", "pussy", "pussy","pussy","pussy", "cunt", "cunt", "cunt", "cunt", "slit", "slit", "twat", "gash", "cunny", "honeypot", "snatch"]);
				}
			}
			else
			{
				desc += RandomInCollection(["vagina", "pussy", "pussy", "pussy", "pussy","pussy","pussy", "cunt", "cunt", "cunt", "cunt", "slit", "slit", "twat", "gash", "cunny", "honeypot", "snatch"]);
			}
			return desc;
		}
		
		//Vaginas + Descript
		public function vaginaDescript(vaginaNum: Number = 0, forceAdjectives: Boolean = false, adjectives: Boolean = true, appearanceScreen: Boolean = false): String {
			//ERROR CHECKING:
			if (vaginaNum > (vaginas.length - 1)) return "<b>Error: Invalid vagina number (" + vaginaNum + ") passed to vaginaDescript()</b>";
			if (vaginaNum < 0) return "<b>Error: Invalid vaginaNum (" + vaginaNum + ") passed to vaginaDescript()</b>";
			if (vaginas.length < 0) return "VAGINA ERROR";

			//Appearance screen goes straight to a special subsection of vaginaNoun2
			if(appearanceScreen) {
				return vaginaNoun2(vaginas[vaginaNum], false, "appearance");
			}
			//Variables
			var adjectiveLimit:Number = 2;
			var adjectiveCount:Number = 0;
			var ultraSimple:Boolean = false;
			var simple:Boolean = false;
			var complex:Boolean = false;
			var vag:VaginaClass = vaginas[vaginaNum];
			var bonus:Number = 0;
			var loosenessDisplayed:Boolean = false;
			var wetnessDisplayed:Boolean = false;
			var desc:String = "";

			//Determine type of vaginal description. This varies based on type of vagina
			switch(vag.type)
			{
				//human cunts tend to get over-simplistic ones.
				case GLOBAL.TYPE_HUMAN:
					ultraSimple = true;
					break;
				//These all get 70% complex, 10% ultraSimple, 20% simple
				case GLOBAL.TYPE_EQUINE:
				case GLOBAL.TYPE_CANINE:
				case GLOBAL.TYPE_FELINE:
				case GLOBAL.TYPE_NAGA:
				case GLOBAL.TYPE_LEITHAN:
				case GLOBAL.TYPE_SYNTHETIC:
					if(rand(10) <= 6) 
					{
						complex = true;
						adjectiveLimit = 1;
					}
					else if(rand(3) == 0) ultraSimple = true;
					else simple = true;
					break;
				//Everything else gets 33% splits
				default:
					if(rand(3) == 0) 
					{
						complex = true;
						adjectiveLimit = 1;
					}
					else if(rand(2) == 0) ultraSimple = true;
					else simple = true;
					break;
			}

			//BUILD DESCRIPTIONS
			//TIGHTNESS/LOOSENESS FIRST
			//Figure out chance of tightness desc
			var currLooseness:Number = Math.round(vag.looseness());
			if(currLooseness != 2) bonus = 16;
			if(currLooseness >= 4) bonus = 10;
			if(currLooseness >= 5) bonus = 5;
			if(currLooseness == 1) bonus = 5;
			//Roll the dice on looseness descs
			if (forceAdjectives || (adjectives && rand(100) < bonus))
			{
				if (adjectiveCount > 0) desc+= ", ";
				//Bimbos get some 'special' tightness variants
				if (isBimbo() && rand(3) == 0 && currLooseness != 3 && currLooseness != 2)
				{
					if(currLooseness >= 5) desc += RandomInCollection(["awesomely gaped","gapey","loosey-goosey","size-queen-sized"]);
					else if(currLooseness >= 4) desc += RandomInCollection(["perfect","super loosey","totally awesome"]);
					else if(currLooseness <= 1) desc += RandomInCollection(["perky little","overly-tight","too-tight"]);
					loosenessDisplayed = true;
					adjectiveCount++;
				}
				if(!loosenessDisplayed)
				{
					if (currLooseness <= 2) desc += RandomInCollection(["tight","tight","tight","tight","narrow","narrow","pert little","pert","vice-like"]);
					else if (currLooseness <= 3) desc += RandomInCollection(["loose","loose","well-practiced","lightly stretched","slightly stretched"]);
					else if (currLooseness <= 4) desc += RandomInCollection(["well-loosened","slightly gaped","slightly gaped","well-used","widened"]);
					else desc += RandomInCollection(["gaped","gaped","gaped","wide","exceedingly well-used","ruined","over-used","stretched","dilated","spacious","gaped","fistable","vast"]);
					adjectiveCount++;
					loosenessDisplayed = true;
				}
			}
			//WETNESS NEXT!
			//Determine "wetness" value to be displayed based on wetness score and lust
			//Lust <= 33 == one rank lower.
			//Lust <= 66 == normal
			//Lust <= 100 == one rank higher
			//Lust > 100 == two ranks higher
			var currWetness:Number = vaginas[vaginaNum].wetness();
			if(lust() <= 33) currWetness--;
			if(lust() > 66) currWetness++;
			if(lust() > 100) currWetness++;
			if(currWetness < 0) currWetness = 0;
			//Figure out chances for display of wetness adjectives if appropriate
			bonus = 0;
			if(currWetness >= 1) bonus = 10;
			if(currWetness >= 2) bonus += currWetness * 5;
			if((forceAdjectives || (adjectives && rand(100) < bonus)) && adjectiveCount < adjectiveLimit)
			{
				if (adjectiveCount > 0) desc += ", ";
				if (currWetness <= 1) desc += RandomInCollection(["moist","dewy","damp","sticky"]);
				else if (currWetness <= 2) desc += RandomInCollection(["wet","sweltering","slippery","juicy","slick","slippery"]);
				else if (currWetness <= 3) desc += RandomInCollection(["sopping","soaked","drippy","dripping","succulent","oozy","soggy","drenched"]);
				else if (currWetness <= 4) desc += RandomInCollection(["drooling","lube-leaking","crotch-soaking","leaky","panty-drenchingly wet","obscenely moist","fluid-oozing","slickness-leaking"]);
				else desc += RandomInCollection(["slavering","slobbering","puddling","juice-drooling","thigh-soaking","panty-flooding","leg-soaking","slobbering","fluid-drooling"]);
				adjectiveCount++;
				wetnessDisplayed = true;
			}
			// Mouthginas Override
			if(rand(2) == 0 && vaginas[vaginaNum].type == GLOBAL.TYPE_MOUTHGINA && adjectiveCount == 0)
			{
				var mouthAdj:Array = [];
				var mouthPuff:Number = vaginalPuffiness(vaginaNum);
				if(mouthPuff <= 1) mouthAdj.push("nice", "petite", "supple");
				else if(mouthPuff <= 2) mouthAdj.push("pouty", "puffy", "cushiony", "plump", "succulent", "juicy", "luscious", "voluptuous", "bee-stung", "swollen");
				else if(mouthPuff <= 3) mouthAdj.push("hypnotic", "dazzling", "fat", "exquisitely large", "hyper-engorged", "constantly pursed", "bloated", "pillowy", "whorish", "‘O’-shaped", "permanently puckered");
				else mouthAdj.push("jacquesian", "scylla-tier", "impossibly large", "universe-distorting");
				if(mouthAdj.length > 0)
				{
					desc += RandomInCollection(mouthAdj);
					adjectiveCount++;
				}
			}
			// Mimbrane plumpness for primary vagina
			if(this is PlayerCharacter && rand(2) == 0 && vaginaNum == 0 && hasStatusEffect("Mimbrane Pussy") && adjectiveCount == 0)
			{
				var puffScore:Number = (this as PlayerCharacter).mimbranePuffiness("Mimbrane Pussy");
				var pumpScore:int = 0;
				if(vaginas[vaginaNum].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) pumpScore = 1;
				if(vaginas[vaginaNum].hasFlag(GLOBAL.FLAG_PUMPED)) pumpScore = 2;
				if(vaginas[vaginaNum].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) pumpScore = 3;
				if((this as PlayerCharacter).hasStatusEffect("Soak")) pumpScore += 1;
				if((this as PlayerCharacter).hasStatusEffect("Soak Overdose")) pumpScore += 2;
				var mimAdjectives:Array = [];
				
				if(puffScore <= 0) {}
				else if(puffScore <= 1)
				{
					if(pumpScore >= 3) mimAdjectives.push("extremely swollen", "greatly padded", "extra fat", "bloated", "lewdly bloated");
					else if(pumpScore >= 2) mimAdjectives.push("very swollen", "well-padded", "fat", "bulging", "lewdly bulging");
					else if(pumpScore >= 1) mimAdjectives.push("swollen", "plush", "plump", "pudgy", "chubby");
					else mimAdjectives.push("slightly swollen", "lightly swollen", "slightly chubby", "puffy", "cushy");
				}
				else if(puffScore <= 2)
				{
					if(pumpScore >= 3) mimAdjectives.push("extremely bulgy", "enormously full", "gargantuan", "hyper-sized", "greatly engorged");
					else if(pumpScore >= 2) mimAdjectives.push("very bulgy", "enormous", "wobbly", "prodigious", "obscenely swollen");
					else if(pumpScore >= 1) mimAdjectives.push("bulgy", "large", "fat", "bulging", "lewdly bulging");
					else mimAdjectives.push("slightly bulgy", "swollen", "plump", "pudgy", "chubby");
				}
				else
				{
					if(pumpScore >= 3) mimAdjectives.push("colossal", "monstrous", "ultra hyper-sized", "mega-sized", "monumentally plump", "overly engorged", "impossibly voluminous", "excessively padded", "overflowingly massive", "preposterously fat");
					else if(pumpScore >= 2) mimAdjectives.push("gargantuan", "elephantine", "hyper-sized", "mammoth-sized", "titanically plump", "greatly engorged", "extremely voluminous", "generously padded", "enormously full", "ridiculously fat");
					else if(pumpScore >= 1) mimAdjectives.push("massive", "huge", "immensely swollen", "extremely thick", "enormous", "wobbly", "prodigious", "obscenely swollen");
					else mimAdjectives.push("undeniably bulgy", "very swollen", "well-padded", "large", "fat", "bulging", "lewdly bulging");
				}
				
				if(puffScore > 0) mimAdjectives.push("mimbrane-enhanced", "mimbrane-padded", "mimbrane-swollen");
				
				if(mimAdjectives.length > 0)
				{
					if (adjectiveCount > 0) desc += ", ";
					desc += RandomInCollection(mimAdjectives);
					adjectiveCount++;
				}
			}
			//Pussy pump - 50% addition of no other descs - doesn't stack well with loose/wet.
			else if(rand(2) == 0 && hasPlumpPussy(vaginaNum) && adjectiveCount == 0)
			{
				var pumpAdj:Array = [];
				if (adjectiveCount > 0) desc += ", ";
				if (vaginas[vaginaNum].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
				{
					pumpAdj.push("bulgy", "swollen", "plump", "pudgy", "jiggly", "wobbly", "prodigious", "obscenely swollen", "lewdly bulging", "bulging");
					if(hasStatusEffect("Pussy Pumped")) pumpAdj.push("permanently pumped", "pump-enhanced", "pump-fattened");
					else pumpAdj.push("permanently plump", "bloated", "fat");
				}
				else if (vaginas[vaginaNum].hasFlag(GLOBAL.FLAG_PUMPED))
				{
					pumpAdj.push("bulgy", "swollen", "plump", "pudgy", "jiggly", "wobbly", "prodigious", "obscenely swollen", "lewdly bulging", "bulging");
					if(hasStatusEffect("Pussy Pumped")) pumpAdj.push("permanently pumped", "pump-enhanced", "pump-fattened");
					else pumpAdj.push("permanently plump", "bloated", "fat");
				}
				else
				{
					pumpAdj.push("cushy", "cushy", "cushy", "chubby", "lightly swollen", "puffy");
					if(hasStatusEffect("Pussy Pumped")) pumpAdj.push("slightly pumped");
					else pumpAdj.push("slightly plump");
				}
				desc += RandomInCollection(pumpAdj);
				adjectiveCount++;
			}
			//BIMBO SPECIALS NEXT
			//More common the more aroused the PC is.
			//Note that I explicitly mean the PC - this way if the PC sees a part description for say, a customizable Anno's pussy, she'll add fun bimbo speak to the desc.
			bonus = 4 + kGAMECLASS.pc.lust()/5;
			if(kGAMECLASS.pc.isBimbo() && adjectives && rand(100) <= bonus && adjectiveCount < adjectiveLimit)
			{
				if (adjectiveCount > 0) desc+= ", ";
				desc += RandomInCollection(["fuckable","cock-ready","cock-hungry","sex-hungry","yummy-looking","yummy","fuckable","slutty","sexy","adorable"]);
				adjectiveCount++;
			}
			//Omnisuit!
			if(hasStatusEffect("Rubber Wrapped") && adjectiveCount < adjectiveLimit && rand(6) == 0)
			{
				if(adjectiveCount > 0) desc += ", ";
				desc += RandomInCollection("rubber-lined","latex-lined","shrink-wrapped","ebony-coated","latex-lacquered","latex-enclosed","rubber-encased","latex-wrapped","rubber-painted");
				adjectiveCount++;
			}
			//COLOR STUFF!
			//Set up chances
			bonus = 13;
			//Because I think these are exotic and hot and fun to mention moreso than other colors. >.> Fenpreferences!
			if(vag.vaginaColor == "purple") bonus += 7;
			if(vag.vaginaColor == "black") bonus += 7;
			if (adjectives && !forceAdjectives && adjectiveCount < adjectiveLimit && rand(100) <= bonus)
			{
				if (adjectiveCount > 0) desc += ", ";
				//Fix any improperly initialized vag-eye-nas
				if (vag.vaginaColor.length == 0 || vag.vaginaColor == " ") vag.vaginaColor = "pink";
				desc += vaginas[vaginaNum].vaginaColor;
				adjectiveCount++;
			}
			if((vaginalVirgin || vag.hymen) && rand(3) == 0 && adjectives && adjectiveCount < adjectiveLimit)
			{
				if (adjectiveCount > 0) desc+= ", ";
				if(vaginalVirgin) 
				{
					if(adjectiveCount == 0 && rand(2) == 0 && adjectiveLimit >= 2) desc += "pure and unspoiled";
					else desc += RandomInCollection(["virgin","virgin","virgin","virgin","unused","celibate","virgin","unspoiled"]);
				}
				else desc += RandomInCollection(["virginal","virginal","near-virgin"]);
				adjectiveCount++;
			}
			bonus = 4;
			if(adjectives && !forceAdjectives && adjectiveCount < adjectiveLimit && rand(100) <= bonus)
			{
				var collection:Array = [];
				if(vag.hasFlag(GLOBAL.FLAG_RIBBED)) collection.push("ribbed", "ridged");
				if(vag.hasFlag(GLOBAL.FLAG_NUBBY)) collection.push("nubby");
				if(vag.hasFlag(GLOBAL.FLAG_STINGER_BASED)) collection.push("stinger-based");
				if(vag.hasFlag(GLOBAL.FLAG_STINGER_TIPPED)) collection.push("stinger-tipped");
				if(collection.length > 0)
				{
					if(adjectiveCount > 0) desc += ", ";
					desc += RandomInCollection(collection);
					adjectiveCount++;
				}
			}
			//NOUN TIME
			if(adjectiveCount > 0)
			{
				if(complex) desc += ", ";
				else desc += " ";
			}
			if(ultraSimple) desc += vaginaNoun2(vag, true, "default");
			else if(simple) desc += vaginaNoun2(vag, true);
			else desc += vaginaNoun2(vag);
			return desc;
		}
		/* OLD VAGINA DESC - LEFT FOR REFERENCE
		public function vaginaDescript(vaginaNum: Number = 0, forceAdjectives: Boolean = false, adjectives: Boolean = true): String {
			if (vaginaNum > (vaginas.length - 1)) return "<b>Error: Invalid vagina number (" + vaginaNum + ") passed to vaginaDescript()</b>";
			if (vaginaNum < 0) return "<b>Error: Invalid vaginaNum (" + vaginaNum + ") passed to vaginaDescript()</b>";
			//If no vaginas back the fuck out
			if (vaginas.length < 0) return "VAGINA ERROR";

			//Vars
			var vag: String = "";
			var descripted: int = 0;
			var bonus: int = 0;
			var temp: int = 0;

			//Bonus chance for virgins
			if (vaginalVirgin) bonus += 20
			//Color super low chance!
			if (adjectives && !forceAdjectives && rand(15) == 0)
			{
				if (vaginas[vaginaNum].vaginaColor.length > 0)
				{
					descripted++;
					// 9999 CoC's black cunts. Might still use!
					if(InCollection(vaginas[vaginaNum].vaginaColor, "black", "ebony", "obsidian", "onyx", "sable") && rand(2) == 0) {
						if(descripted) vag += ", ";
						vag += RandomInCollection("black", "onyx", "ebony", "dusky", "sable", "obsidian", "midnight-hued", "jet black");
						descripted = true;
					}
					else 
					vag += vaginas[vaginaNum].vaginaColor;
				}
				else
				{
					trace("Vagina doesn't have a color set!");
				}
			}
			//low chance of size descriptor
			if ((adjectives && rand(100) <= 25 + bonus) || forceAdjectives) {
				if (descripted > 0) vag += ", ";
				//Virgin overpowers other shit half the time.
				if (vaginalVirgin && rand(2) == 0) {
					temp = rand(11);
					if (temp <= 3) vag += "virgin";
					else if (temp <= 5) vag += "virginal";
					else if (temp <= 7) vag += "unclaimed";
					else if (temp <= 9) vag += "unspoiled";
					else vag += "pure";
				} else if (vaginas[vaginaNum].looseness() <= 1) {
					temp = rand(11);
					if (temp <= 4) vag += "tight";
					else if (temp <= 5) vag += "vice-like";
					else if (temp <= 6) vag += "constricting";
					else if (temp <= 8) vag += "unstretched";
					else vag += "narrow";
				} else if (vaginas[vaginaNum].looseness() <= 2) {
					//temp = rand(10);
					//if (temp <= 5) vag += "average";
					//else 
					vag += "supple";
				} else if (vaginas[vaginaNum].looseness() <= 3) {
					temp = rand(10);
					if (temp <= 4) vag += "loose";
					else if (temp <= 6) vag += "slightly-stretched";
					else if (temp <= 8) vag += "loosened";
					else vag += "lax";
				} else if (vaginas[vaginaNum].looseness() <= 4) {
					temp = rand(11);
					if (temp <= 3) vag += "slightly-gaped";
					else if (temp <= 5) vag += "well-loosened";
					else if (temp <= 7) vag += "open";
					else if (temp <= 8) vag += "widened";
					else if (temp <= 9) vag += "barely-spread";
					else vag += "parted";
				} else {
					temp = rand(11);
					if (temp <= 4) vag += "gaped";
					else if (temp <= 8) vag += "cavernous";
					else if (temp <= 9) vag += "wide-open";
					else if (vaginas[vaginaNum].minLooseness > 4) vag += "ruined";
					else vag += "yawning";
				}
				descripted++;
			}
			//wetness descript - 30% display rate
			if (descripted < 2 && ((adjectives && rand(100) > 70) || forceAdjectives)) {
				if (descripted > 0) vag += ", ";
				if (vaginas[vaginaNum].wetness() <= 0) {
					temp = rand(10);
					if (temp <= 4) vag += "dry";
					else if (temp <= 7) vag += "unlubricated";
					else vag += "moistureless";
				} else if (vaginas[vaginaNum].wetness() <= 1) {
					temp = rand(10);
					if (temp <= 4) vag += "moist";
					else if (temp <= 7) vag += "sticky";
					else vag += "dewy";
				} else if (vaginas[vaginaNum].wetness() <= 2) {
					temp = rand(10);
					if (temp <= 3) vag += "wet";
					else if (temp <= 5) vag += "sultry";
					else if (temp <= 8) vag += "sweltering";
					else vag += "slippery";
				} else if (vaginas[vaginaNum].wetness() <= 3) {
					temp = rand(12);
					if (temp <= 3) vag += "slick";
					else if (temp <= 6) vag += "drenched";
					else if (temp <= 9) vag += "sopping";
					else vag += "soaked";
				} else if (vaginas[vaginaNum].wetness() <= 4) {
					temp = rand(9);
					if (temp <= 2) vag += "drooling";
					else if (temp <= 5) vag += "dripping";
					else vag += "lube-leaking";
				} else {
					temp = rand(12);
					if (temp <= 2) vag += "slavering";
					else if (temp <= 5) vag += "slobbering";
					else if (temp <= 8) vag += "puddling";
					else vag += "crotch-soaking";
				}
				descripted++;
			}
			//Elasticity references!
			if (descripted < 2 && elasticity >= 1.5 && ((adjectives && rand(3) == 0) || forceAdjectives)) {
				if (descripted > 0) vag += ", ";
				if (elasticity >= 5) {
					temp = rand(10);
					if (temp <= 3) vag += "super-stretchy";
					else if (temp <= 7) vag += "incredibly elastic";
					else vag += "powerfully pliable";
				} else {
					temp = rand(10);
					if (temp <= 1) vag += "stretchy";
					else if (temp <= 3) vag += "elastic";
					else if (temp <= 5) vag += "pliable";
					else if (temp <= 7) vag += "flexible";
					else vag += "pliant";
				}
				descripted++;
			}
			if (descripted < 2 && (skinType == GLOBAL.SKIN_TYPE_GOO || vaginas[vaginaNum].hasFlag(GLOBAL.FLAG_GOOEY)) && ((adjectives && rand(3) == 0) || forceAdjectives)) {
				if (descripted > 0) vag += ", ";
				if (rand(2) == 0) vag += "gooey";
				else vag += "slimy";
				descripted++;
			}
			//Slutty pussy chance!
			if(descripted < 2 && rand(2) == 0 && (vaginas[vaginaNum].hasFlag(GLOBAL.FLAG_PUMPED) || vaginas[vaginaNum].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)))
			{
				if (descripted > 0) vag += ", ";
				if (!vaginas[vaginaNum].hasFlag(GLOBAL.FLAG_PUMPED)) vag += RandomInCollection(["cushy", "chubby", "slightly swollen", "puffy", "slightly pumped"]);
				else vag += RandomInCollection(["bulgy", "swollen", "plump", "pudgy", "permanently pumped", "jiggly", "wobbly", "pump-enhanced", "prodigious", "slutty"]);
				descripted++;
			}
			if(isBimbo() && rand(2) == 0 && descripted == 0)
			{
				vag += RandomInCollection(["slutty", "cock-hungry", "bimbo", "yummy-looking", "fuckable"]);
				descripted++;
			}
			//50% of time, simple cunt.
			if (rand(2) == 0) {
				if (descripted > 0) vag += " ";
				vag += vaginaNoun2(vaginas[vaginaNum], true);
			}
			//50% of the time, complex cunt!
			else {
				if (descripted > 0) vag += ", ";
				vag += vaginaNoun2(vaginas[vaginaNum]);
			}
			return vag;
		}*/
		//eachVagina
		public function eachVagina(): String {
			var desc: String = "";
			if (vaginas.length > 1) desc += "each of ";
			desc += "your " + vaginasDescript();
			return desc;
		}
		//oneVagina
		public function oneVagina(): String {
			var desc: String = "";
			if (vaginas.length > 1) desc += "one of ";
			desc += "your " + vaginasDescript();
			return desc;
		}
		//Allvagina descript
		public function vaginasDescript(): String {
			if (vaginas.length == 1) return vaginaDescript();
			if (vaginas.length > 1) 
			{
				//Matching cunts get type descriptor.
				if(vaginasMatch()) return plural(vaginaDescript(rand(vaginas.length)));
				//Mixed vaginas get plain result - vaginaNoun with oddball value results in plain shit.
				else
				{
					return plural(vaginaNoun2(vaginas[0],true,"default"));
				}
			}
			return "ERROR: vagina<b>s</b>Descript called with no vaginas.";
		}
		public function vaginasDescriptLight(): String {
			var output: String = "";
			if (vaginas.length <= 0) return "<b>ERROR: NO VAGS DETECTED for vaginasDescriptLight()</b>";
			if (matchedVaginas()) output += vaginaNoun2(vaginas[0]);
			else output += vaginaNoun2(vaginas[rand(vaginas.length)]);
			//pluralize dat shit
			if (vaginas.length != 1) output = plural(output);
			return output;
		}
		// hole tightness checks
		public function isHoleTight(indexNum:Number = -1):Boolean
		{
			if(indexNum >= 0)
			{
				if(indexNum >= vaginas.length) return false;
				if(vaginas[indexNum].looseness() < 2) return true;
			}
			else if(ass.looseness() < 2) return true;
			
			return false;
		}
		public function isVagTight(vagNum:Number = 0):Boolean
		{
			if(vagNum >= vaginas.length) return false;
			return isHoleTight(vagNum);
		}
		public function isAssTight():Boolean
		{
			return isHoleTight(-1);
		}
		// Genital matching
		public function vaginasMatch():Boolean 
		{
			return matchedVaginas();
		}
		public function matchedVaginas():Boolean {
			//After the first cooch, see if they match against the previous.
			for(var x:int = 1; x < vaginas.length; x++)
			{
				//Don't match? NOT MATCHED. GTFO.
				if(vaginas[x].type != vaginas[x-1].type) return false;
				//Flag check
				if(vaginas[x].vagooFlags.length == vaginas[x-1].vagooFlags.length)
				{
					for(var i:int = 0; i < vaginas[x].vagooFlags.length; i++)
					{
						if(!vaginas[x-1].hasFlag(vaginas[x].vagooFlags[i])) return false;
					}
				}
			}
			return true;
		}
		public function wombsDescript():String
		{
			var descriptions:Number = 0;
			var buffer:String = "";
			if(vaginas.length <= 0) return "<b>Parse Error: No womb found for wombdescript.</b>";
			//Single goes to "wombDescript":
			if(vaginas.length == 1) return wombDescript(0);

			//Multi cunt descript here:
			var allPreg:Boolean = true;
			for(var x:int = 0; x < vaginas.length; x++)
			{
				if(!isPregnant(x))
				{
					allPreg = false;
					break;
				}
			}
			if(allPreg && rand(3) == 0)
			{
				descriptions++;
				buffer += RandomInCollection(["pregnant","pregnant","gravid","gravid","impregnated","impregnated"]);
			}
			else if(rand(3) && !isPregnant() && inHeat())
			{
				descriptions++;
				buffer += RandomInCollection(["cum-hungry","baby-craving","sex-starved","spunk-starved","breed-hungry","extra-fertile","sperm-sucking"]);
			}
			if(descriptions > 0) buffer += " ";
			buffer += RandomInCollection(["wombs", "wombs", "uteri"]);
			return buffer;
		}
		public function wombDescript(arg:Number = 0):String
		{
			var descriptions:Number = 0;
			var buffer:String = "";
			if(vaginas.length <= 0) return "<b>Parse Error: No womb found for wombdescript.</b>";
			if(arg >= vaginas.length || arg < 0) return "<b>Parse Error: Invalid womb description called. Womb #: " + arg + " does not exist.</b>";

			//Preggo = 1/3 chance
			if(rand(3) == 0 && isPregnant(arg))
			{
				descriptions++;
				buffer += RandomInCollection(["pregnant","pregnant","gravid","gravid","impregnated","impregnated"]);
			}
			else if(rand(3) && !isPregnant(arg) && inHeat())
			{
				descriptions++;
				buffer += RandomInCollection(["cum-hungry","baby-craving","sex-starved","spunk-starved","breed-hungry","extra-fertile","sperm-sucking"]);
			}
			if(descriptions > 0) buffer += " ";
			buffer += RandomInCollection(["womb", "womb", "uterus"]);
			return buffer;
		}
		public function multiCuntDescript(includeIndefiniteArticle:Boolean = false):String
		{
			if(vaginas.length < 1) return "<b>Error! multiCuntDescript() called with no vaginas present!</b>";
			var descript: String = "";
			var adjectives:Number = 0;
			
			//Singles get an easy out!
			if (vaginas.length == 1) return vaginaDescript(0);

			//MOAR
			if(vaginas.length <= 2)
			{
				//For cocks that are the same
				if(includeIndefiniteArticle) descript += RandomInCollection(["a pair of","two"]);
				else descript += RandomInCollection(["pair of","two"]);
			}
			else
			{
				if(includeIndefiniteArticle) descript += RandomInCollection(["three","a trio of","three"]);
				else descript += RandomInCollection(["three","trio of","three"]);
			}
			//50% draw an adjective from the deck.
			if(rand(2) == 0) 
			{
				descript += " " + multiCuntAdjective();
				adjectives++;
			}

			//NOUN PREP!
			var nounComplexity:Number = rand(3);
			if(adjectives > 0)
			{
				if(nounComplexity == 2 && hasSamevType()) descript += ", ";
				else descript += " ";
			}
			else descript += " ";
			var vag:VaginaClass = vaginas[0];

			//ACTUAL NOUN DRAWS
			//Ultrasimple. Basic untyped puss-noun. Needs no variances for matching.
			if(nounComplexity == 0) descript += vaginaNoun2(vag, true, "default");
			//Type-nouns, usually hyphenated. Simplified if unmatched.
			else if(nounComplexity == 1) 
			{
				if(hasSamevType()) descript += vaginaNoun2(vag, true);
				else descript += vaginaNoun2(vag, true, "default");
			}
			//Complex type-nouns. Adjective included with noun.
			else 
			{
				if(hasSamevType()) descript += vaginaNoun2(vag);
				else descript += vaginaNoun2(vag, true, "default");
			}
			return plural(descript);
		}
		public function multiCuntAdjective():String
		{
			var adjectives:Array = [];
			var smallestSize:Number = tightestVaginalLooseness();
			var biggestSize:Number = gapestVaginaLooseness();
			var loosie:Number = -1;
			//Same sizes or within 1 loosness? Yay, basic looseness copy/paste:
			if(biggestSize == smallestSize || biggestSize-1 == smallestSize)
			{
				loosie = biggestSize;
			}
			//Only do looseness if we have a value to describe.
			if(loosie > 0)
			{
				if (isBimbo())
				{
					if(loosie >= 5) adjectives.push("awesomely gaped","gapey","loosey-goosey","size-queen-sized");
					else if(loosie >= 4) adjectives.push("perfect","super loosey","totally awesome");
					else if(loosie <= 1) adjectives.push("perky little","overly-tight","too-tight");
				}
				if (loosie < 2) adjectives.push("tight","tight","tight","tight","narrow","narrow","pert little","pert","vice-like");
				else if (loosie <= 3) adjectives.push("loose","loose","well-practiced","lightly stretched","slightly stretched");
				else if (loosie <= 4) adjectives.push("well-loosened","slightly gaped","slightly gaped","well-used","widened");
				else adjectives.push("gaped","gaped","gaped","wide","exceedingly well-used","ruined","over-used","stretched","dilated","spacious","gaped","fistable","vast");
			}
			//Wetness! The most important one! Always just go with the wettest one for maximum soppage!
			biggestSize = wettestVaginalWetness();
			if(lust() <= 33) biggestSize--;
			if(lust() > 66) biggestSize++;
			if(lust() > 100) biggestSize++;
			//Double them up. Wayyyy more fun to describe than size.
			if (biggestSize <= 1) adjectives.push("moist","dewy","damp","sticky","moist","dewy","damp","sticky","moist","dewy","damp","sticky");
			else if (biggestSize <= 2) adjectives.push("wet","sweltering","slippery","juicy","slick","slippery","wet","sweltering","slippery","juicy","slick","slippery","wet","sweltering","slippery","juicy","slick","slippery");
			else if (biggestSize <= 3) adjectives.push("sopping","soaked","drippy","dripping","succulent","oozy","soggy","drenched","sopping","soaked","drippy","dripping","succulent","oozy","soggy","drenched","sopping","soaked","drippy","dripping","succulent","oozy","soggy","drenched");
			else if (biggestSize <= 4) adjectives.push("drooling","lube-leaking","crotch-soaking","leaky","panty-drenchingly wet","obscenely moist","fluid-oozing","slickness-leaking","drooling","lube-leaking","crotch-soaking","leaky","panty-drenchingly wet","obscenely moist","fluid-oozing","slickness-leaking","drooling","lube-leaking","crotch-soaking","leaky","panty-drenchingly wet","obscenely moist","fluid-oozing","slickness-leaking");
			else adjectives.push("slavering","slobbering","puddling","juice-drooling","thigh-soaking","panty-flooding","leg-drenching","slobbering","fluid-drooling","slavering","slobbering","puddling","juice-drooling","thigh-soaking","panty-flooding","leg-soaking","slobbering","fluid-drooling","slavering","slobbering","puddling","juice-drooling","thigh-soaking","panty-flooding","leg-soaking","slobbering","fluid-drooling");

			//Mimbranes!
			if(this is PlayerCharacter && (this as PlayerCharacter).mimbranePuffiness("Mimbrane Pussy") > 0) adjectives.push("parasite-wrapped","mimbrane-toting","mimbrane-swollen","parasite-engorged","plush","swollen","puffy");

			//Pussy pump can show if ALL are at least pumped.
			biggestSize = -1;
			for(var i:int = 0; i < vaginas.length; i++)
			{
				//No descs if any aren't pumped!
				if(!hasPlumpPussy(i)) biggestSize = 0;
				//Track if they're all bigpump or smolpump
				else if(!vaginas[i].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && biggestSize == -1) biggestSize = 1;
				else if(!vaginas[i].hasFlag(GLOBAL.FLAG_PUMPED) && biggestSize == -1) biggestSize = 2;
				else if(!vaginas[i].hasFlag(GLOBAL.FLAG_HYPER_PUMPED) && biggestSize == -1) biggestSize = 3;
				else if(hasStatusEffect("Soak") && biggestSize < 2) biggestSize = 2;
				else if(hasStatusEffect("Soak Overdose") && biggestSize < 3) biggestSize = 3;
			}
			if(biggestSize > 0)
			{
				if(biggestSize == 1)
				{
					adjectives.push("cushy", "cushy", "cushy", "chubby", "lightly swollen", "puffy");
					if(hasStatusEffect("Pussy Pumped")) adjectives.push("slightly pumped");
					else adjectives.push("slightly plump");
				}
				else if(biggestSize == 2)
				{
					adjectives.push("bulgy", "swollen", "plump", "pudgy", "jiggly", "wobbly", "prodigious", "obscenely swollen", "lewdly bulging", "bulging");
					if(hasStatusEffect("Pussy Pumped")) adjectives.push("permanently pumped", "pump-enhanced", "pump-fattened");
					else adjectives.push("permanently plump", "bloated", "fat");
				}
				else
				{
					adjectives.push("bulgy", "swollen", "plump", "pudgy", "jiggly", "wobbly", "prodigious", "obscenely swollen", "lewdly bulging", "bulging");
					if(hasStatusEffect("Pussy Pumped")) adjectives.push("permanently pumped", "pump-enhanced", "pump-fattened");
					else adjectives.push("permanently plump", "bloated", "fat");
				}
			}

			//Bimbo flavor
			if(isBimbo()) adjectives.push("fuckable","cock-ready","cock-hungry","sex-hungry","yummy-looking","yummy","fuckable","slutty","sexy","adorable");
			//Omnisuit!
			if(hasStatusEffect("Rubber Wrapped")) adjectives.push("rubber-lined","latex-lined","shrink-wrapped","ebony-coated","latex-lacquered","latex-enclosed","rubber-encased","latex-wrapped","rubber-painted");
			
			//Colors! Check for match
			biggestSize = 1;
			for(i = 0; i < vaginas.length; i++)
			{
				if(i == 0 && vaginas[i].vaginaColor != vaginas[i+1].vaginaColor) biggestSize = 0;
				if(i > 0 && vaginas[i].vaginaColor != vaginas[i-1].vaginaColor) biggestSize = 0;
			}
			if(biggestSize == 1) adjectives.push("matching " + vaginas[0].vaginaColor,"matching " + vaginas[0].vaginaColor,"matching " + vaginas[0].vaginaColor,"matching " + vaginas[0].vaginaColor,"matching " + vaginas[0].vaginaColor,"matching " + vaginas[0].vaginaColor,vaginas[0].vaginaColor,vaginas[0].vaginaColor);
			else adjectives.push("contrasting","contrasting","color-clashing","color-clashing");

			if(adjectives.length == 0) adjectives.push("<b>ERROR:CUN7</b>");

			return adjectives[rand(adjectives.length)];			
		}
		public function multiCockDescript(dynamicLength:Boolean = false,includeIndefiniteArticle:Boolean = false): String {
			if (cocks.length < 1) return "<b>Error: multiCockDescript() called with no penises present.</b>";
			//Get cock counts
			var descript: String = "";
			var rando: Number = 0;
			var descripted: Boolean = false;
			var adjectives:Number = 0;

			//Single dick gets normal output
			if (cocks.length == 1) return cockDescript(0, dynamicLength);

			//Numbers!
			else if (cocks.length <= 2) {
				//For cocks that are the same
				if(includeIndefiniteArticle) descript += RandomInCollection(["a pair of","two"]);
				else descript += RandomInCollection(["pair of","two"]);
				//Cut: brace of, matching, twin
			} 
			else if (cocks.length <= 3) {
				if(includeIndefiniteArticle) descript += RandomInCollection(["three","a trio of","three"]);
				else descript += RandomInCollection(["three","trio of","three"]);
				//Cut: group of, menage a trois of, triad of, triumvirate of
			}
			//Large numbers of cocks!
			else 
			{
				if(includeIndefiniteArticle) descript += RandomInCollection(["a bundle of","an obscene group of","a cluster of",num2Text(cocks.length)]);
				else descript += RandomInCollection(["bundle of","obscene group of","cluster of",num2Text(cocks.length)]);
			}
			//cut: "wriggling bunch of"
			var adjectiveArray:Array = cockAdjectivesRedux(cocks[biggestCockIndex()], 1, true);
			//Punctuation is important.
			if(adjectives > 0 && adjectiveArray[1] > 0) descript += ", ";
			else descript += " ";
			//Actually add adjectives, if any.
			descript += adjectiveArray[0];
			//Append Nounse
			if (hasSamecType()) 
			{
				//Not human? Special descripts goooo
				if(cocks[0].cType != GLOBAL.TYPE_HUMAN && rand(3) == 0 && adjectiveArray[1] + adjectives < 2)
				{
					if(adjectiveArray[1] > 0) descript += ", ";
					descript += cockNoun2(cocks[biggestCockIndex()], false);
				}
				//Mediocre descripts go!
				else if(rand(2) == 0)
				{
					if(adjectiveArray[1] > 0) descript += " ";
					descript += cockNoun2(cocks[biggestCockIndex()], true);
				}
				//Ultrasimple
				else
				{
					if(adjectiveArray[1] > 0) descript += " ";
					descript += cockNoun2(cocks[biggestCockIndex()], true, "ultraSimple");
				}
			}
			else {
				if(adjectiveArray[1] > 0) descript += ", ";
				descript += RandomInCollection("mutated cock","mixed dick","mixed cock","mismatched dick","mixed prick","mismatched member");
			}
			return plural(descript);
		}
		public function hasSamecType(): Boolean {
			if (cocks.length <= 0) return false;
			var first: int = cocks[0].cType;
			for (var x: int = 0; x < cocks.length; x++) {
				if (cocks[x].cType != first) return false;
			}
			return true;
		}
		public function hasSamevType(): Boolean {
			if (vaginas.length <= 0) return false;
			var first: int = vaginas[0].type;
			for (var x: int = 0; x < vaginas.length; x++) {
				if (vaginas[x].type != first) return false;
			}
			return true;
		}
		private function clearList(): void {
			list = new Array();
		}
		private function addToList(arg:*): void {
			list[list.length] = arg;
		}
		public function getListLength():uint
		{
			if (list == null) return 0;
			return list.length;
		}
		private function formatList(): String {
			var stuff: String = "";
			if (list.length == 1) return list[0];
			for (var x: int = 0; x < list.length; x++) {
				stuff += list[x];
				if (list.length == 2 && x == 0) {
					stuff += " and ";
				} else if (x < list.length - 2) {
					stuff += ", ";
				} else if (x < list.length - 1) {
					stuff += ", and ";
				}
			}
			list = new Array();
			return stuff;
		}
		public function isPsionic():Boolean
		{
			return false;
		}
		public function gearDescript(): String {
			clearList();
			if (armor.shortName != "") addToList(armor.longName);
			if (upperUndergarment.shortName != "") addToList(upperUndergarment.longName);
			if (lowerUndergarment.shortName != "") addToList(lowerUndergarment.longName);
			if (isNude() || getListLength() <= 0) addToList("gear");
			return formatList();
		}
		public function clothesDescript():String
		{
			if (!(armor is EmptySlot)) return armor.longName;
			else
			{
				clearList();
				if (!(upperUndergarment is EmptySlot)) addToList(upperUndergarment.longName);
				if (!(lowerUndergarment is EmptySlot)) addToList(lowerUndergarment.longName);
				return formatList();
			}
		}
		public function crotchDescript(dynamicLength:Boolean = false):String {

			clearList();
			
			//Nothing to talk about? K
			if(!hasCock() && !hasVagina()) 
			{
				if(rand(2) == 0) return "bare crotch";
				return "bare groin";
			}
			//Make da list!
			if(hasCock()) addToList(cocksDescript(dynamicLength));
			if(balls > 0) addToList(ballsDescript());
			if(hasVagina()) addToList(vaginasDescript());
			
			return formatList();
		}
		public function lowerGarmentDescript(): String {
			if (lowerUndergarment.shortName != "") return lowerUndergarment.longName;
			else if (armor.shortName != "") return armor.longName;
			return "nothing";
		}
		public function covers():String
		{
			var parts:Array = [];
			if(!isCrotchExposedByArmor()) parts.push(armor.longName);
			else if(!isChestExposedByArmor()) parts.push(armor.longName);
			else if(!isAssExposedByArmor()) parts.push(armor.longName);

			if(!isChestExposedByUpperUndergarment()) parts.push(upperUndergarment.longName)
			if(!isCrotchExposedByLowerUndergarment() || !isAssExposedByLowerUndergarment()) parts.push(lowerUndergarment.longName)
			if(parts.length == 0) return "equipment";
			var buffer:String = "";
			for(var coverCount:int = 0; coverCount < parts.length; coverCount++)
			{
				if(coverCount > 0 && parts.length > 2) 
				{
					buffer += ", ";
					if(parts.length-1 == coverCount) buffer += "and ";
				}
				else if(coverCount > 0) buffer += " and ";
				buffer += parts[coverCount];
			}
			return buffer;
		}
		public function crotchCover(): String
		{
			if(!isCrotchExposedByArmor()) return armor.longName;
			else if(!isCrotchExposedByLowerUndergarment()) return lowerUndergarment.longName;
			return "nothing";
		}
		public function crotchCoverUnder(): String
		{
			if(!isCrotchExposedByLowerUndergarment()) return lowerUndergarment.longName;
			else if(!isCrotchExposedByArmor()) return armor.longName;
			return "nothing";
		}
		public function crotchCovers(): String
		{
			var desc:String = "";
			if(!isCrotchExposedByArmor()) desc += armor.longName;
			if(!isCrotchExposedByLowerUndergarment()) 
			{
				if(desc != "") desc += " and ";
				desc += lowerUndergarment.longName;
			}
			if(desc != "") return desc;
			return "nothing";
		}
		public function assCover(): String
		{
			if(!isAssExposedByArmor()) return armor.longName;
			else if(!isAssExposedByLowerUndergarment()) return lowerUndergarment.longName;
			return "nothing";
		}
		public function assCoverUnder(): String
		{
			if(!isAssExposedByLowerUndergarment()) return lowerUndergarment.longName;
			else if(!isAssExposedByArmor()) return armor.longName;
			return "nothing";
		}
		public function assCovers(): String
		{
			var desc:String = "";
			if(!isAssExposedByArmor()) desc += armor.longName;
			if(!isAssExposedByLowerUndergarment()) 
			{
				if(desc != "") desc += " and ";
				desc += lowerUndergarment.longName;
			}
			if(desc != "") return desc;
			return "nothing";
		}
		public function chestCover(): String
		{
			if(!isChestExposedByArmor()) return armor.longName;
			else if(!isChestExposedByUpperUndergarment()) return upperUndergarment.longName;
			return "nothing";
		}
		public function chestCoverUnder(): String
		{
			if(!isChestExposedByUpperUndergarment()) return upperUndergarment.longName;
			else if(!isChestExposedByArmor()) return armor.longName;
			return "nothing";
		}
		public function chestCovers(): String
		{
			var desc:String = "";
			if(!isChestExposedByArmor()) desc += armor.longName;
			if(!isChestExposedByUpperUndergarment()) 
			{
				if(desc != "") desc += " and ";
				desc += upperUndergarment.longName;
			}
			if(desc != "") return desc;
			return "nothing";
		}
		public function lowerGarmentOuterDescript(): String {
			if (armor.shortName != "") return armor.longName;
			else if (lowerUndergarment.shortName != "") return lowerUndergarment.longName;
			return "nothing";
		}
		public function upperGarmentDescript(): String {
			if (upperUndergarment.shortName != "") return upperUndergarment.longName;
			else if (armor.shortName != "") return armor.longName;
			return "nothing";
		}
		public function upperGarmentOuterDescript(): String {
			if (armor.shortName != "") return armor.longName;
			else if (upperUndergarment.shortName != "") return upperUndergarment.longName;
			return "nothing";
		}
		public function upperGarmentsDescript(): String {
			if (upperUndergarment.shortName != "" && armor.shortName != "") return armor.longName + " and " + upperUndergarment.longName;
			else if (upperUndergarment.shortName != "") return upperUndergarment.longName;
			else if (armor.shortName != "") return armor.longName;
			return "nothing";
		}
		public function lowerGarmentsDescript(): String {
			if (lowerUndergarment.shortName != "" && armor.shortName != "") return armor.longName + " and " + lowerUndergarment.longName;
			else if (lowerUndergarment.shortName != "") return lowerUndergarment.longName;
			else if (armor.shortName != "") return armor.longName;
			return "nothing";
		}
		public function underGarmentDescript(): String {
			if (lowerUndergarment.shortName != "") return lowerUndergarment.longName;
			else if (upperUndergarment.shortName != "") return upperUndergarment.longName;
			return "nothing";
		}
		public function underGarmentsDescript(): String {
			if (lowerUndergarment.shortName != "" && upperUndergarment.shortName != "") return upperUndergarment.longName + " and " + lowerUndergarment.longName;
			else if (lowerUndergarment.shortName != "") return lowerUndergarment.longName;
			else if (upperUndergarment.shortName != "") return upperUndergarment.longName;
			return "nothing";
		}
		//Basic multiple cock description.
		public function cocksDescript(dynamicLength:Boolean = false): String {
			if (cocks.length < 1) return "<b>ERROR: NO WANGS DETECTED for cocksDescript()</b>";
			//Single dicks are normal.
			else if (cocks.length == 1) return cockDescript(0, dynamicLength);
			//Matched dicks get full cocknoun.
			if (hasSamecType()) return plural(cockDescript(0,dynamicLength,true));
			//Unmatched get default types
			var adjectivesArray:Array = cockAdjectivesRedux(cocks[0],2,true);
			if(adjectivesArray[1] > 0) return plural(adjectivesArray[0] + " " + randomSimpleCockNoun());
			return plural(randomSimpleCockNoun());
		}
		//Ultra-basic multiple cock description
		public function cocksDescriptLight(): String {
			var output: String = "";
			if (cocks.length < 1) return "<b>ERROR: NO WANGS DETECTED for cocksDescript()</b>";
			if (hasSamecType()) output += cockNoun2(cocks[0]);
			else output += randomSimpleCockNoun();
			//pluralize dat shit
			if (cocks.length > 1) output = plural(output);
			return output;
		}
		public function simpleCockNoun(arg: Number): String {
			if (cocks.length <= 0) return "<b>ERROR: NO WANGS DETECTED for simpleCockNoun()</b>";
			return cockNoun2(cocks[arg], true);
		}
		public function simpleCocksNoun():String {
			var output:String = "";
			
			if (cocks.length <= 0) return "<b>ERROR: NO WANGS DETECTED for simpleCocksNoun()</b>";
			if (hasSamecType()) output += cockNoun2(cocks[0], true);
			else output += randomSimpleCockNoun();
			
			if (cocks.length > 1) output = plural(output);
			
			return output;
		}
		public function cockNounComplex(arg: Number): String {
			if (cocks.length <= 0) return "<b>ERROR: NO WANGS DETECTED for cockNounComplex()</b>";
			return cockNoun2(cocks[arg], false);
		}
		//Spit back an accurate name for the cock
		public function accurateCockName(cockIndex:int):String
		{
			var collection:Array = new Array();
			var type:String = GLOBAL.TYPE_NAMES[cocks[cockIndex].cType];
			type = type.toLowerCase();
			var name:String = RandomInCollection(["prick","cock","cock","cock","penis","tool","member","pecker","dong","phallus","phallus","dick","dick","dick"]);
			
			return type + " " + name;
		}
		// Spit back a singular word related to the shape of the target cock, with the minimum
		// of ambiguity. Basically describe a very clear feature of the cock, either its type or a flag.
		// I didn't want to potentially fuck up an existing descriptor in the process, so I've opted to keep it separate.
		public function cockShape(cockIndex:int,forceType:int = -1):String
		{
			var cock:CockClass = cocks[cockIndex];
			return cockShape2(cock,-1);
		}
		public function cockShape2(cock:CockClass,forceType:int = -1):String
		{
			var collection:Array = [];

			//If forceType is not set, grab it from the index.
			if(forceType == -1) forceType = cock.cType;
			
			// main shapes
			switch (forceType)
			{
				case GLOBAL.TYPE_HUMAN:
					collection = ["terran","human"];
					break;
				case GLOBAL.TYPE_CANINE:
					collection = ["canine"];
					break;
				case GLOBAL.TYPE_VULPINE:
					collection = ["vulpine"];
					break;
				case GLOBAL.TYPE_EQUINE:
				case GLOBAL.TYPE_KUITAN:
					collection = ["equine"];
					break;
				case GLOBAL.TYPE_DEMONIC:
					collection = ["demonic", "nodule-laden"]
					break;
				case GLOBAL.TYPE_JANERIA:
				case GLOBAL.TYPE_TENTACLE:
					collection = ["tentacle"];
					break;
				case GLOBAL.TYPE_FELINE:
					collection = ["feline", "barbed"];
					break;
				case GLOBAL.TYPE_NAGA:
				case GLOBAL.TYPE_SNAKE:
					collection = ["snake-like", "reptilian"];
					break;
				case GLOBAL.TYPE_FROSTWYRM:
				case GLOBAL.TYPE_DRACONIC:
					collection = ["draconic"];
					break;
				case GLOBAL.TYPE_BEE:
					collection = ["wasp-like"];
					break;
				case GLOBAL.TYPE_KANGAROO:
					collection = ["kangaroo"];
					break;
				case GLOBAL.TYPE_ANEMONE:
				case GLOBAL.TYPE_SIREN:
					collection = ["tentacled"];
					break;
				case GLOBAL.TYPE_SIMII:
					collection = ["simii"];
					break;
				case GLOBAL.TYPE_RASKVEL:
					collection = ["raskvel"];
					break;
				case GLOBAL.TYPE_VENUSPITCHER:
					collection = ["plant-like", "vine-like"];
					break;
				case GLOBAL.TYPE_SAURIAN:
					collection = ["saurian", "dinosaur-like"];
					break;
				case GLOBAL.TYPE_SYNTHETIC:
					collection = ["synthetic", "robotic"];
					break;
				case GLOBAL.TYPE_NYREA:
					collection = ["nyrean", "insectile"];
					break;
				case GLOBAL.TYPE_DAYNAR:
					collection = ["daynarian", "reptilian"];
					break;
				case GLOBAL.TYPE_SYDIAN:
					collection = ["sydian", "insectile"];
					break;
				case GLOBAL.TYPE_COCKVINE:
					collection = ["plant-like", "vine-like"];
					break;
				case GLOBAL.TYPE_GABILANI:
					collection = ["gabilani", "goblin-like"];
					break;
				case GLOBAL.TYPE_VANAE:
					collection = ["vanae", "sucker-tipped"];
					break;
				case GLOBAL.TYPE_HRAD:
					collection = ["human", "terran", "bullet-shaped", "bullet-headed"];
					break;
				case GLOBAL.TYPE_GRYVAIN:
					collection = ["draconic", "gryvain"];
					break;
				case GLOBAL.TYPE_INHUMAN:
					collection = ["inhuman", "human-like", "alien"];
					break;
				case GLOBAL.TYPE_SHARK:
					collection = ["tubular", "shark-like", "finned"];
					break;
				case GLOBAL.TYPE_GOAT:
					collection = ["caprine"];
					break;
				case GLOBAL.TYPE_MOTHRINE:
					collection = ["mothrine", "insectile", "alien", "curved"];
					break;
				case GLOBAL.TYPE_SAURMORIAN:
					collection = ["dinosaur", "bestial", "savage", "saurmorian"];
					break;
				case GLOBAL.TYPE_DZAAN:
					collection = ["dzaan", "keratin-nubbed", "keratin-spotted"];
					break;
				default:
					trace("Fallback cock shape used in cockShape() for type: " + GLOBAL.TYPE_NAMES[cock.cType]);
					collection = ["bestial"];
					break;
			}
			
			// flag overrides
			if (cock.hasFlag(GLOBAL.FLAG_KNOTTED)) collection.push("knotted");
			//if (cock.hasFlag(GLOBAL.FLAG_SHEATHED)) collection.push("sheathed");
			if (cock.hasFlag(GLOBAL.FLAG_FLARED)) collection.push("flared");
			if (cock.hasFlag(GLOBAL.FLAG_BLUNT)) collection.push("blunt");
			if (cock.hasFlag(GLOBAL.FLAG_PREHENSILE)) collection.push("prehensile");
			if (cock.hasFlag(GLOBAL.FLAG_TAPERED)) collection.push("tapered");
			if (cock.hasFlag(GLOBAL.FLAG_STINGER_BASED)) collection.push("stinger-based");
			if (cock.hasFlag(GLOBAL.FLAG_STINGER_TIPPED)) collection.push("stinger-tipped");
			if (cock.hasFlag(GLOBAL.FLAG_NUBBY)) collection.push("nubby");
			if (cock.hasFlag(GLOBAL.FLAG_AMORPHOUS)) collection.push("amorphous");
			if (cock.hasFlag(GLOBAL.FLAG_SMOOTH)) collection.push("smooth");
			if (cock.hasFlag(GLOBAL.FLAG_RIBBED)) collection.push("ribbed");
			//if (cock.hasFlag(GLOBAL.FLAG_LUBRICATED)) collection.push("lubricated");
			//if (cock.hasFlag(GLOBAL.FLAG_STICKY)) collection.push("sticky");
			if (cock.hasFlag(GLOBAL.FLAG_FORESKINNED)) collection.push("foreskinned", "foreskin-covered");
			//if (cock.hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) collection.push("aphrodisiac-laced");
			if (cock.hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) collection.push("double-headed");
			if (cock.hasFlag(GLOBAL.FLAG_GOOEY)) collection.push("gooey");
			
			return RandomInCollection(collection);
		}
		//Special - "tail" - Tail description
		//Special - "nipple" - NipplecockDesc
		public function cockNoun2(cock:CockClass, simple:Boolean = true, special:String = ""): String
		{
			var desc: String = "";
			var nouns:Array = new Array();
			var adjectives:Array = new Array();
			var type:int = cock.cType;
			if(special == "ultraSimple") desc += RandomInCollection(["cock","cock","dick","dick","member","member","phallus","prick","tool","shaft"]);
			//Simple = hyphenated shit
			else if(simple)
			{
				//Gooey has chance to override normal shit
				if (cock.hasFlag(GLOBAL.FLAG_GOOEY) && rand(3) == 0) {
					desc += RandomInCollection(["goo-cock","slime-cock","goo-dick","slime-dick","goo-cock","goo-prick","slime-prick","slime-shaft","goo-tool"]);
				}
				//Tail-cock specials
				else if(special == "tail" && rand(2) == 0) desc += "tail-" + RandomInCollection(["cock","cock","dick","prick","cock","dick"]);
				//Nipple-dick specials
				else if(special == "nipple" && rand(2) == 0) desc += RandomInCollection(["dick","cock","prick"]) + "-nipple";
				else
				{
					switch(type)
					{
						case GLOBAL.TYPE_CANINE:
							//adjectives.push("pointed","knotty","bestial","animalistic","knotted","vulpine","vulpine");
							desc += RandomInCollection(["doggie-dong","dog-cock","dog-cock","puppy-prick","puppy-pecker","dog-dick","cock","prick","animal-endowment",mf("bitch-breeder","bitch-boner"),"beast-cock","beast-dick"]);
							break;
						case GLOBAL.TYPE_VULPINE:
							//adjectives.push("pointed","knotty","bestial","animalistic","knotted","vulpine","vulpine");
							desc += RandomInCollection(["fox-cock",mf("vixen-breeder","vixen-prick"),"fox-dick","animal-phallus","fox-phallus","fox-shaft","fox-cock",mf("vixen-inseminator","vixen-dick"),"beast-cock"]);
							break;
						case GLOBAL.TYPE_EQUINE:
							//adjectives.push("flared","equine","bestial","flat-tipped","animalistic","blunted","musky");
							desc += RandomInCollection(["horse-cock","beast-cock","stallion-cock","horse-cock","beast-cock","horse-shaft",mf("stallion-shaft","mare-member"),mf("mare-mounter","mare-member"),"horse-member","stallion-prick","horse-phallus","horse-phallus","phallus","tool"]);
							break;
						case GLOBAL.TYPE_DEMONIC:
							//adjectives.push("nub-covered","nubby","perverse","bumpy","demonic","cursed","infernal","unholy","blighted","fiendish");
							desc += RandomInCollection(["demon-dick","demon-cock","demon-prick","monster-member","monster-dick","corrupted-cock","dick","perverted-prick","nub-shaft","designer-dick"]);
							break
						case GLOBAL.TYPE_JANERIA:
						case GLOBAL.TYPE_TENTACLE:
							desc += RandomInCollection(["tentacle-cock", "cock-tendril", "tentacle-prick", "tentacle-phallus", "dick-tentacle", "dick-tendril", "tentacle-tool"]);
							break;
						case GLOBAL.TYPE_COCKVINE:
						case GLOBAL.TYPE_VENUSPITCHER:
							//adjectives.push("twisting","wriggling","sinuous","squirming","writhing","smooth","undulating","slithering","vine-like");
							desc += RandomInCollection(["tentacle-cock","plant-cock","cock-tendril","plant-prick","tentacle-prick","plant-phallus","tentacle-phallus","dick-tentacle","dick-tendril","tentacle-tool","plant-shaft","vine-cock","vine-dick"]);
							break;
						case GLOBAL.TYPE_FELINE:
							//adjectives.push("feline","spine-covered","spined","kitty","animalistic","soft-barbed","nubby","feline");
							desc += RandomInCollection(["cat-cock","kitty-cock",(!cock.hasFlag(GLOBAL.FLAG_TAPERED) ? "kaithrit-cock" : "cat-cock"),"animal-prick","cat-prick","cat-dick","kitty-dick","cat-phallus","cat-cock","cat-penis"]);
							break;
						case GLOBAL.TYPE_AVIAN:
							desc += RandomInCollection(["bird-cock", "avian-cock", "bird-shaft", "avian-dick", "bird-dick", "bird-phallus", "avian-phallus", "bird-prick", "avian-tool", "bird-cock", "bird-cock"]);
							break;
						case GLOBAL.TYPE_NAGA:
							//adjectives.push("reptilian","ophidian","inhuman","reptilian",/*"herpetological",*/"serpentine","bulbous","bulging");
							desc += RandomInCollection(["snake-cock","reptile-cock","snake-shaft","reptile-dick","snake-dick","snake-phallus","reptile-phallus","snake-prick","reptile-tool","snake-cock","snake-cock"]);
							break;
						case GLOBAL.TYPE_RASKVEL:
							//adjectives.push("reptilian","alien","raskvel","reptilian","smooth","sleek","exotic");
							desc += RandomInCollection(["rask-cock","reptile-cock","rask-cock","alien-endowment","rask-dick","reptile-dick","egg-inseminator","rask-prick","rask-dick","reptile-tool","raskvel-member"]);
							break;
						case GLOBAL.TYPE_ANEMONE:
							//adjectives.push("tentacle-ringed","stinger-laden","pulsating","stinger-coated","near-transparent","tentacle-ringed","squirming");
							desc += RandomInCollection(["anemone-cock","wiggle-cock","anemone-dick","anemone-prick","anemone-phallus","stinger","shaft","anemone-prong","anemone-tool","anemone-cock","anemone-dick"]);
							break;
						case GLOBAL.TYPE_SIREN:
							desc += RandomInCollection(["suula-cock","wiggle-cock","suula-dick","suula-prick","suula-phallus","stinger","shaft","suula-prong","suula-tool","suula-cock","suula-dick"]);
							break;
						case GLOBAL.TYPE_KANGAROO:
							//adjectives.push("pointed","marsupial","tapered","curved");
							desc += RandomInCollection(["kangaroo-cock","kangaroo-dick","kanga-cock"]);
							break;
						case GLOBAL.TYPE_FROSTWYRM:
						case GLOBAL.TYPE_DRACONIC:
						case GLOBAL.TYPE_GRYVAIN:
							//adjectives.push("dragon-like","segmented","pointed","knotted","mythic","draconic","tapered");
							desc += RandomInCollection(["dragon-cock", "wyrm-cock", "dragon-cock", "reptile-cock", "dragon-dick","reptile-dick","wyrm-dick","dragon-phallus","dragon-prick","wyrm-prick","wyrm-phallus"]);
							break;
						case GLOBAL.TYPE_BEE:
							//adjectives.push("foreskin-covered","alien","vaguely human-like","smooth");
							desc += RandomInCollection(["zil-cock","wasp-cock","zil-cock","zil-dick","wasp-dick","prick","prong","zil-member","insect-cock","insect-dick","zil-prick"]);
							break;
						case GLOBAL.TYPE_KUITAN:
							//adjectives.push("alien","bulgy","knot-lined","extra knotty","bestial","kui-tan","inhuman","exotic","knotted");
							desc += RandomInCollection(["‘nuki-cock","kui-cock","‘nuki-cock","xeno-dick","‘nuki-dick","knotty-cock","prick","phallus","member","‘nuki-member","shaft","tool"]);
							break;
						case GLOBAL.TYPE_SIMII:
							//adjectives.push("simian");
							desc += RandomInCollection(["simii-dick","simii-cock","member","member","phallus","prick","tool","shaft"]);
							break;
						case GLOBAL.TYPE_SAURIAN:
						case GLOBAL.TYPE_SAURMORIAN:
							//adjectives.push("dinosaur", "saurian");
							desc += RandomInCollection(["dino-cock","reptile-cock","dinosaur-cock","dino-dick","reptile-dick","dinosaur-prick","dinosaur-tool","member","cock"]);
							break;
						case GLOBAL.TYPE_SYNTHETIC:
							//adjectives.push("metallic", "synthetic", "mechanical", "robotic", "sleek");
							desc += RandomInCollection(["synth-cock","robo-cock","mecha-cock","robo-dick","mecha-dick","synth-shaft","synth-cock","robot-prong","robo-tool","synth-phallus","mecha-prick","robo-prick"]);
							break;
						case GLOBAL.TYPE_NYREA:
							//adjectives.push("nyrean", "insectile", "egg-laying", "nyrean", "insectile");
							desc += RandomInCollection(["ovipositor","ovi-cock","egg-layer","nyrea-cock","ovi-dong","ovi-dick","egg-dick","nyrea-dick","egg-organ","nyrea-prick","nyrea-dick","ovi-member","egg-shaft","ovi-shaft"]);
							break;
						case GLOBAL.TYPE_DAYNAR:
							//adjectives.push("daynarian", "reptilian", "inhuman", "reptilian");
							desc += RandomInCollection(["daynar-cock", "reptile-cock", "cock", "daynar-dick", "reptile-dick","lizard-cock","lizard-prick","reptile-phallus","lizard-member","daynar-prick"]);
							break;
						case GLOBAL.TYPE_SYDIAN:
							//adjectives.push("sydian", "insectile", "inhuman", "bristly", "brush-like");
							desc += RandomInCollection(["sydian-cock","bug-cock","xeno-cock","sydian-dick","bug-dick","sydian-prick","sydian-shaft","dong","bug-prick"]);
							break;
						case GLOBAL.TYPE_GABILANI:
							//adjectives.push("alien", "bulbous", "double-crowned", "gabilani", "goblin", "inhuman", "exotic", "two-headed");
							desc += RandomInCollection(["goblin-cock","gabilani-cock","goblin-cock","gabilani-dick","goblin-dick","xeno-dick","goblin-prick","gabilani-phallus","goblin-tool","xeno-tool","goblin-member"]);
							break;
						case GLOBAL.TYPE_VANAE:
							//adjectives.push("vanae", "alien", "suckler-tipped", "vanae", "cephalopod-like", "inhuman", "exotic");
							desc += RandomInCollection(["vanae-cock","vanae-dick","vanae-prick","cock","cock","member","xeno-dick","phallus"]);
							break;
						case GLOBAL.TYPE_SHARK:
							desc += RandomInCollection(["shark-cock", "cock", "shark-dick", "clasper", "shark-shaft", "shaft", "shark-prong", "shark-tool", "shark-phallus", "phallus"]);
							break;
						case GLOBAL.TYPE_SWINE:
							desc += RandomInCollection(["swine-cock","swine-schlong","pig-cock","pig-prick","hog-dick","cock","boar-dick",mf("sow-seeder","sow-schlong")]);
							break;
						case GLOBAL.TYPE_GOAT:
							desc += RandomInCollection(["caprine-cock", "caprine-schlong", "goat-cock", "goat-prick", "goat-dick", "cock", "caprine-dick", "phallus"]);
							break;
						case GLOBAL.TYPE_MOTHRINE:
							desc += RandomInCollection(["ovipositor", "ovi-cock", "egg-layer", "moth-cock", "ovi-dong", "ovi-dick", "egg-dick", "moth-dick", "egg-organ", "moth-prick", "mothipositor", "ovi-member", "egg-shaft", "ovi-shaft"]);
							break;
						case GLOBAL.TYPE_DZAAN:
							desc += RandomInCollection(["dzaan-cock","dzaan-dick","dzaan-prick","cock","cock","member","xeno-dick","phallus"]);
							break;
						//Basic dicks names: "cock",
						case GLOBAL.TYPE_HUMAN:
						//Nothing special for these two.
						case GLOBAL.TYPE_HRAD:
						case GLOBAL.TYPE_INHUMAN:
						//Catch-all
						default:
							desc += RandomInCollection(["cock","cock","dick","dick","member","member","phallus","prick","tool","shaft"]);
							break;
					}
				}
			}
			//Long type descriptions
			else
			{
				//Gooey has chance to override normal shit
				if (cock.hasFlag(GLOBAL.FLAG_GOOEY) && rand(2) == 0) {
					desc += RandomInCollection(["gooey cock","gooey cock","gooey dick","gooey prick","gooey tool","gooey shaft","self-lubricating goo-cock","self-lubricating shaft","self-lubricating member","self-lubricating slime-cock","slick shaft","slick cock","slick dick","slick goo-cock","slick goo-dick","slippery slime-cock","slippery slime-dick","slippery prick"]);
				}
				//TO BE COMPLETED LATER - TAIL AND NIPPLE STUFF
				else if(special == "tail" && rand(2) == 0) desc += cockShape2(cock,type) + " tail-" + RandomInCollection(["cock","cock","dick","prick","cock","dick"]);
				else if(special == "nipple" && rand(2) == 0) desc += cockShape2(cock,type) + " " + RandomInCollection(["dick","cock","prick"]) + "-nipple";
				else
				{
					switch(type)
					{
						case GLOBAL.TYPE_CANINE:
							//adjectives.push("pointed","knotty","bestial","animalistic","knotted","vulpine","vulpine");
							desc += RandomInCollection(["canine cock","bestial cock","knotty dog-cock","canine cock","animalistic dick","pointed prick","bestial member","animalistic shaft","bestial shaft","canine shaft","knotted tool","feral prick"]);
							break;
						case GLOBAL.TYPE_VULPINE:
							//adjectives.push("pointed","knotty","bestial","animalistic","knotted","vulpine","vulpine");
							desc += RandomInCollection(["vulpine cock","bestial fox-cock","bestial cock","knotty cock","vulpine cock","animalistic dick","pointed prick","bestial member","animalistic shaft","bestial shaft","vulpine shaft","knotted tool","feral prick"]);
							break;
						case GLOBAL.TYPE_EQUINE:
							//adjectives.push("flared","equine","bestial","flat-tipped","animalistic","blunted","musky");
							desc += RandomInCollection(["flared horse-cock","blunted horse-cock","bestial cock","equine cock","musky cock","flared cock","musky horse-dick","animalistic dick","blunt-tipped dick","flared horse-dick","bestial member","musky member","equine shaft","animalistic shaft","equine member","horse-prick","flat-tipped horse-boner","bestial tool","equine phallus","equine tool"]);
							break;
						case GLOBAL.TYPE_DEMONIC:
							//adjectives.push("nub-covered","nubby","perverse","bumpy","demonic","cursed","infernal","unholy","blighted","fiendish");
							desc += RandomInCollection(["nub-covered cock","nub-covered demon-cock","demonic cock","nubby cock","fiendish cock","nub-covered dick","nubby dick","perverse dick","bumpy dick","demonic dick","fiendish dick","demonic shaft","blighted tool","fiendish prick"]);
							break
						case GLOBAL.TYPE_JANERIA:
						case GLOBAL.TYPE_TENTACLE:
						case GLOBAL.TYPE_COCKVINE:
						case GLOBAL.TYPE_VENUSPITCHER:
							//adjectives.push("twisting","wriggling","sinuous","squirming","writhing","smooth","undulating","slithering","vine-like");
							desc += RandomInCollection(["twisting cock","twisting tentacle-cock","sinuous plant-cock","sinuous cock","vine-like cock","squirming vine-cock","slithering dick-tentacle","squirming tentacle-dick","plant-like dick","smooth vine-dick","sinuous plant-member","undulating member","wiggly tentacle-phallus","twisting plant-prick"]);
							break;
						case GLOBAL.TYPE_FELINE:
							//adjectives.push("feline","spine-covered","spined","kitty","animalistic","soft-barbed","nubby","feline");
							desc += RandomInCollection(["feline cock","spine-covered cock","animalistic cat-cock","soft-barbed cock","nubby cock","spined kitty-dick","soft-barbed cat-dick","animalistic dick","feline dick","kitty dick","feline tool","feline prick","animalistic shaft","barbed animal-prick"]);
							break;
						case GLOBAL.TYPE_AVIAN:
							desc += RandomInCollection(["avian cock", "bestial cock", "birdy cock", "glossy bird-cock", "avian dick", "bird-like dick", "exotic cock", "pointed cock", "curved avian-dick", "undulating prick", "tapered tool", "pointed prick", "undulating member", "avian shaft", "bird-like shaft"]);
							break;
						case GLOBAL.TYPE_NAGA:
							//adjectives.push("reptilian","ophidian","inhuman","reptilian",/*"herpetological",*/"serpentine","bulbous","bulging");
							desc += RandomInCollection(["reptilian cock","inhuman cock","serpentine cock","bulbous snake-cock","ophidian cock","reptilian dick","serpentine dick","bulbous dick","ophidian dick","bulbous snake-dick","reptilian phallus","inhuman phallus","bulbous phallus","serpentine member","inhuman member","reptilian member","bulgy member","reptilian prick","bulbous snake-prick"]);
							break;
						case GLOBAL.TYPE_RASKVEL:
							//adjectives.push("reptilian","alien","raskvel","reptilian","smooth","sleek","exotic");
							desc += RandomInCollection(["reptilian cock","alien cock","raskvel cock","sleek cock","exotic rask-cock","exotic cock","reptilian dick","alien dick","smooth rask-dick","reptilian prick","alien phallus","exotic phallus","sleep prick","reptilian tool","alien tool"]);
							break;
						case GLOBAL.TYPE_ANEMONE:
						case GLOBAL.TYPE_SIREN:
							//adjectives.push("tentacle-ringed","stinger-laden","pulsating","stinger-coated","near-transparent","tentacle-ringed","squirming");
							desc += RandomInCollection(["tentacle-ringed cock","pulsating cock","stinger-lined cock",("squirming " + (type == GLOBAL.TYPE_SIREN ? "suula" : "anemone") + "-cock"),"exotic cock","stinger-laden dick","stinger-covered dick","tentacle-ringed dick","pulsating prick","tentacle-ringed prick","squirming prick","near-transparent phallus","stinger-laden phallus","tentacle-ringed tool","tentacle-lined tool"]);
							break;
						case GLOBAL.TYPE_KANGAROO:
							//adjectives.push("pointed","marsupial","tapered","curved");
							desc += RandomInCollection(["pointed kangaroo-cock","marsupial cock","tapered kanga-cock","curved cock","pointed kangaroo-dick","marsupial dick","curved kanga-dick","curved dick","marsupial prick","tapered prick","marsupial member","pointed prick","curved member","marsupial tool","tapered kangaroo-tool"]);
							break;
						case GLOBAL.TYPE_FROSTWYRM:
						case GLOBAL.TYPE_DRACONIC:
						case GLOBAL.TYPE_GRYVAIN:
							//adjectives.push("dragon-like","segmented","pointed","knotted","mythic","draconic","tapered");
							desc += RandomInCollection(["dragon-like cock","segmented dragon-cock","segmented wyrm-cock","draconic cock","tapered dragon-cock","segmented dick","segmented dragon-dick","draconic dick","segmented phallus","dragon-like phallus","tapered phallus","pointed prick","draconic prick","tapered wyrm-tool","segmented tool","tapered dragon-tool","draconic tool"]);
							break;
						case GLOBAL.TYPE_BEE:
							//adjectives.push("foreskin-covered","alien","vaguely human-like","smooth");
							desc += RandomInCollection(["thick-skinned zil-cock","smooth wasp-cock","foreskin-covered cock","alien cock","human-like cock","foreskin-covered zil-dick","alien dick","smooth wasp-dick","alien prick","smooth insect-dick","foreskin-sheathed zil-prick","alien prong","smooth wasp-tool"]);
							break;
						case GLOBAL.TYPE_KUITAN:
							//adjectives.push("alien","bulgy","knot-lined","extra knotty","bestial","kui-tan","inhuman","exotic","knotted");
							desc += RandomInCollection(["bulgy ‘nuki-cock", "knot-lined kui-cock", "bestial cock", "exotic kui-cock", "exotic cock", "knotted ‘nuki-cock", "knot-lined dick","knotted dick","bulgy ‘nuki-dick","kui-tan cock","kui-tan dick","extra-knotty dick","bulgy dick","knot-lined prick","bulgy prick","knot-lined tool","bulgy shaft","knotted member","kui-tan member","bulgy shaft","alien shaft"]);

							break;
						case GLOBAL.TYPE_SIMII:
							//adjectives.push("simian");
							desc += RandomInCollection(["simian cock","simian cock","inhuman cock","bestial monkey-cock","alien cock","simian dick","simian shaft","simian member","simian tool","inhuman monkey-dick","alien dick","simian phallus"]);
							break;
						case GLOBAL.TYPE_SAURIAN:
							//adjectives.push("dinosaur", "saurian");
							desc += RandomInCollection(["dinosaur cock","saurian cock","reptilian cock","prehistoric dino-cock","dinosaur dick","saurian shaft","dinosaur dick","reptilian member","saurian member","saurian tool","saurian prick","dinosaur prick","prehistoric dino-dick"]);
							break;
						case GLOBAL.TYPE_SAURMORIAN:
							//adjectives.push("dinosaur", "saurian");
							desc += RandomInCollection(["dinosaur cock","saurmorian cock","reptilian cock","dino-cock","dinosaur dick","saurmorian shaft","dinosaur dick","reptilian member","saurmorian member","saurmorian tool","saurmorian prick","dinosaur prick","dino-dick"]);
							break;
						case GLOBAL.TYPE_SYNTHETIC:
							//adjectives.push("metallic", "synthetic", "mechanical", "robotic", "sleek");
							desc += RandomInCollection(["metallic member","metallic cock","metallic cock","metallic shaft","metallic dick","synthetic cock","synthetic dick","synthetic cock","synthetic tool","synthetic prick","robotic cock","robotic cock","robotic dick","robotic prick","robotic tool","sleek synth-cock","sleek robo-cock","sleek synth-dick","mechanical dick","mechanical cock","mechanical member"]);
							break;
						case GLOBAL.TYPE_NYREA:
							//adjectives.push("nyrean", "insectile", "egg-laying", "nyrean", "insectile");
							desc += RandomInCollection(["nyrean ovipositor","nyrean ovi-cock","nyrean cock","nyrean egg-organ","nyrean egg-shaft","nyrean shaft","nyrean tool","nyrean cock","nyrean egg-layer","nyrean lady-cock","insectile ovi-cock","insectile cock","insectile ovi-dick","insectile ovipositor","insectile prick","insectile shaft","insectile member"]);
							break;
						case GLOBAL.TYPE_DAYNAR:
							//adjectives.push("daynarian", "reptilian", "inhuman", "reptilian");
							desc += RandomInCollection(["daynarian dick","daynarian cock","daynarian tool","daynarian member","daynarian prick","daynarian cock","reptilian cock","reptilian cock","reptilian dick","reptilian member","reptilian phallus","daynarian phallus","alian cock","alien dick","inhuman reptile-dick","daynarian lizard-cock"]);
							break;
						case GLOBAL.TYPE_SYDIAN:
							//adjectives.push("sydian", "insectile", "inhuman", "bristly", "brush-like");
							desc += RandomInCollection(["bristle-covered cock","bristle-covered prick","brush-coated cock","brush-coated dick","brush-coated prick","brush-coated cock","brush-coated phallus","sydian dick","sydian cock","insectile prong","insectile cock","insectile dick","insectile member","insectile tool","sydian shaft","sydian member","sydian cock"]);
							break;
						case GLOBAL.TYPE_GABILANI:
							//adjectives.push("alien", "bulbous", "double-crowned", "gabilani", "goblin", "inhuman", "exotic", "two-headed");
							desc += RandomInCollection(["two-headed goblin-cock","two-headed cock","bulbous cock","bulbous goblin-cock","bulbous goblin-dick","bulbous prick","double-crowned dick","double-crowned dong","gabilanian phallus","gabilanian member","gabilanian cock","exotic goblin-cock","double-crowned cock"]);
							break;
						case GLOBAL.TYPE_VANAE:
							//adjectives.push("vanae", "alien", "suckler-tipped", "vanae", "cephalopod-like", "inhuman", "exotic");
							desc += RandomInCollection(["alien cock","sucker-tipped cock","sucker-tipped dick","sucker-tipped prick","sucker-tipped cock","sucker-crowned cock","sucker-crowned dick","sucker-capped member","sucker-capped phallus","alien dick","exotic vanae-cock","exotic vanae-dick","sucker-topped prick"]);
							break;
						case GLOBAL.TYPE_SHARK:
							desc += RandomInCollection(["tubular shark-dong", "finned piscine-penis", "finned shark-dick", "tubular shark-penis", "finned shark-penis", "finned, tubular tool", "finned shark-dong", "finned shark-cock", "tubular, finned penis", "finned shark-phallus", "tubular phallus", "finned shark-cock", "finned, tubular shark-cock"]);
							break;
						case GLOBAL.TYPE_SWINE:
							desc += RandomInCollection(["swine cock","swine schlong","pig prick","corkscrew-shaped pig cock","twisted swine dick","animalistic dick","twisted prick","animalistic shaft"]);
							break;
						case GLOBAL.TYPE_GOAT:
							desc += RandomInCollection(["caprine cock", "caprine schlong", "goat prick", "caprine dick", "bestial cock", "animalistic dick", "animalistic shaft"]);
							break;
						case GLOBAL.TYPE_MOTHRINE:
							desc += RandomInCollection(["mothrine ovipositor", "mothrine ovi-cock", "mothrine cock", "mothrine egg-organ", "mothrine egg-shaft", "mothrine shaft", "mothrine tool", "mothrine cock", "mothrine egg-layer", "mothrine lady-cock", "insectile ovi-cock", "insectile cock", "insectile ovi-dick", "insectile ovipositor", "insectile prick", "insectile shaft", "insectile member"]);
							break;
						//Basic dicks names: "cock",
						case GLOBAL.TYPE_HUMAN:
							desc += RandomInCollection(["terran cock","human cock","human dick","terran dick","human member","terran member","terran phallus","human prick","terran tool","human shaft"]);
							break;
						//Nothing special for these two.
						case GLOBAL.TYPE_HRAD:
						case GLOBAL.TYPE_INHUMAN:
						//Dafault catch-all
						default:
							desc += RandomInCollection(["exotic cock","inhuman cock","alien dick","inhuman dick","alien member","exotic member","inhuman phallus","exotic prick","alien tool","alien shaft"]);
							break;
					}
				}
			}
			return desc;
		}
		//New new cock adjectives. For cool kids that aren't afraid of anything.
		public function cockAdjectivesRedux(cock:CockClass, adjectiveLimit:int = 2, multi:Boolean = false):Array
		{
			var descript: String = "";
			var adjectives: int = 0;
			var bonus:int = 0;
			var x:int = 0;
			//If we're doing multidicks, let's use the biggest one
			if(multi) cock = cocks[biggestCockIndex()];
			//Get length
			var cLength: Number = cock.cLength();
			//Get width
			var cWidth:Number = cock.thickness();
			//We want to avoid doing both as it can lead to some awkward results: "gargantuan, meaty cock"
			var lengthDescribed:Boolean = false;
			var girthDescribed:Boolean = false;
			var multiOkay:Boolean = false;
			//Determine length chances! - nothing for "normal" length. Bonus for super small or progressively larger!
			bonus = 0;
			if(cLength <= 5) bonus = 25;
			if(cLength <= 4) bonus += 10;

			if(cLength >= 7) bonus = 15;
			if(cLength >= 14) bonus += 6;
			if(cLength >= 18) bonus += 6;
			if(cLength >= 30) bonus += 3;
			if(cLength >= 50) bonus += 3;
			if(cLength >= 100) bonus += 3;
			if(multi)
			{
				multiOkay = true;
				for(x = 0; x < cocks.length; x++)
				{
					if(x > 0)
					{
						if(Math.abs(cocks[x].cLength() - cocks[x-1].cLength()) > 5) multiOkay = false;
					}
				}
			}
			if (rand(100) < bonus && (!multi || multiOkay)) {
				if (cLength <= 4) descript += RandomInCollection(["little","toy-sized","mini","tiny","diminutive",]);
				else if (cLength <= 5) descript += RandomInCollection(["short","small","petite"]);
				//This one should pretty much never proc
				else if (cLength < 7) descript += RandomInCollection(["fair-sized","nice"]);
				else if (cLength < 11) descript += RandomInCollection([(cock.cType == GLOBAL.TYPE_EQUINE) ? "pony-sized" : "long","lengthy","long","lengthy","wrench-length","cucumber-sized","large"]);
				else if (cLength < 14) descript += RandomInCollection(["huge","foot-long",(cock.cType == GLOBAL.TYPE_CANINE) ? "mastiff-sized" : "pornstar-sized","impressive","beefy"]);
				else if (cLength < 18) descript += RandomInCollection(["massive",(cLength >= tallness/5 ? "knee-length":"extensive"),(cLength >= tallness/6 ? "forearm-length":"very long"),"imposing","seam-straining","pant-bulging"]);
				else if (cLength < 30) descript += RandomInCollection(["enormous","enormous","giant","giant",(cock.cType == GLOBAL.TYPE_EQUINE) ? "clydesdale-sized" : "arm-sized","seam-shredding",(femininity > 60) ? "panty-destroying" : "pant-ripping","hulking"]);
				else if (cLength < 50) descript += RandomInCollection(["towering","monstrous","prodigious","ultrapornstar-sized","hyper-sized","unnaturally large","unwieldy"]);
				else if (cLength < 100) descript += RandomInCollection(["person-sized","ridiculously massive","extremely prodigious","overly imposing","room-dominating","body-dominating","colossal","monumental","immense","ponderous","unwieldy"]);
				else if (cLength < 150) descript += RandomInCollection(["car-sized","vehicle-length","movement-impairing","monumentally long","couch-length","impossibly long"]);
				else if (cLength < 270) descript += RandomInCollection(["room-sized","hall-length","exquisitely over-sized","bus-length","ship-length","impossibly lengthy","tremendously long"]);
				else descript += RandomInCollection(["bus-sized","ship-sized","universe-shaming","house-crushing","mansion-filling","distractingly distended","gorgeously gigantic"]);
				adjectives++;
				lengthDescribed = true;
			}
			if(multi)
			{
				multiOkay = true;
				for(x = 0; x < cocks.length; x++)
				{
					if(x > 0)
					{
						if(cLength <= tallness * 2/3) multiOkay = false;
					}
				}
			}
			//Chance of special relative descriptions
			else if(cLength > tallness * 2/3 && rand(9) == 0 && (!multi || multiOkay))
			{
				if(adjectives > 0) descript += ", ";
				descript += RandomInCollection("floor-dragging","ground-dragging","floor-polishing");
				adjectives++;
				lengthDescribed = true;
			}
			//TIME FOR GIRTH!
			bonus = 10;
			//"average" aint never gonna show up
			if(cWidth >= 1 && cWidth <= 1.2) bonus = 0;
			//Super fatties show up more
			if(cWidth > 2) bonus + 10;
			if(multi)
			{
				multiOkay = true;
				for(x = 0; x < cocks.length; x++)
				{
					if(x > 0)
					{
						if(Math.abs(cocks[x].thickness() - cocks[x-1].thickness()) > .5) multiOkay = false;
					}
				}
			}
			if(adjectives < adjectiveLimit && rand(100) < bonus && (!multi || multiOkay))
			{
				if(adjectives > 0) descript += ", ";
				if (cWidth < 1) descript += RandomInCollection(["thin","slender","narrow","girlish"]);
				//This should NEVER proc, but leaving here in case I change my mind down the road
				else if (cWidth <= 1.2) descript += RandomInCollection(["modest","substantial","fleshy"]);
				else if (cWidth <= 1.6) descript += RandomInCollection(["ample","meaty","generously-proportioned"]);
				else if (cWidth <= 2) descript += RandomInCollection(["broad","girthy","expansive","thick"]);
				else if (cWidth <= 3.5) descript += RandomInCollection(["fat","wide","distended"]);
				else descript += RandomInCollection(["incredibly thick","bloated","mammoth","monstrously thick","swollen","tremendously wide"]);
				girthDescribed = true;
				adjectives++;
			}
			//Bimbo flavor - 1/6 chance
			if(adjectives < adjectiveLimit && rand(6) == 0 && isBimbo())
			{
				if(adjectives > 0) descript += ", ";
				if(cLength < 6 && rand(7) == 0) descript += "cute";
				else if(cLength >= 10 && rand(7) == 0) descript += "awe-inspiring";
				else descript += RandomInCollection(["mouth-watering", "totally sexy", "super hot", "delicious-looking", "yummy"]);
				adjectives++;
			}
			//Hornyness 25%
			if (adjectives < adjectiveLimit && lust() >= 75 && rand(4) == 0) 
			{
				if(adjectives > 0) descript += ", ";
				var cum:Number = cumQ();
				//Uber horny like a baws!
				if (lust() > 90)
				{
					//Weak as shit cum
					if (cum < 150) descript += RandomInCollection(["throbbing","pulsating"]);
					//lots of cum? drippy.
					else if (cum < 1000) descript += RandomInCollection(["throbbing","pulsating","pre-leaking","pre-drooling","pre-oozing","pre-dribbling"]);
					//Tons of cum
					else descript += RandomInCollection(["throbbing","pulsating","pre-gushing","cum-bubbling","pre-soaked","pre-slicked","cum-dribbling"]);
				}
				//A little less lusty, but still lusty.
				else {
					if (cum < 50) descript += RandomInCollection(["turgid","rock-hard","tumescent","stiff","eager"]);
					//A little drippy
					else if (cum < 200) descript += RandomInCollection(["turgid","rock-hard","stiff","tumescent","eager","pre-beading","pre-leaking"]);
					//uber drippy
					else descript += RandomInCollection(["pre-dribbling","pre-drooling","precum-oozing","turgid","hard","rock-hard","tumescent","fully engorged"]);
				}
				adjectives++;
			}
			//Knot - 1/5 chance. Only specifically called out if dick isn't dog, since knot shows up with the
			//canine nouns.
			if(multi)
			{
				multiOkay = true;
				for(x = 0; x < cocks.length; x++)
				{
					if(!cocks[x].hasFlag(GLOBAL.FLAG_KNOTTED)) multiOkay = false;
				}
			}
			if(adjectives < adjectiveLimit && rand(5) == 0 && cock.hasFlag(GLOBAL.FLAG_KNOTTED) && !InCollection(cock.cType, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_SNAKE, GLOBAL.TYPE_NAGA, GLOBAL.TYPE_KUITAN) && (!multi || multiOkay))
			{
				if(adjectives > 0) descript += ", ";
				descript += RandomInCollection(["knotted","bulbous","knotty"]);
				adjectives++;
			}
			//Pierced - 1/5 chance
			if(multi)
			{
				multiOkay = true;
				for(x = 0; x < cocks.length; x++)
				{
					if(hasCockPiercing(x)) multiOkay = false;
				}
			}
			if (adjectives < adjectiveLimit && rand(5) == 0 && hasCockPiercing(x) && (!multi || multiOkay)) 
			{
				if(adjectives > 0) descript += ", ";
				descript += "pierced";
				adjectives++;
			}
			if(hasStatusEffect("Rubber Wrapped") && adjectives < adjectiveLimit && rand(6) == 0)
			{
				if(adjectives > 0) descript += ", ";
				descript += RandomInCollection("rubber-wrapped","latex-encased","shrink-wrapped","ebony-coated","latex-lacquered","suit-encased","latex-enclosed","rubber-encased","latex-wrapped","rubber-painted");
				adjectives++;
			}
			//Color: 1/15 chance
			if(multi)
			{
				multiOkay = true;
				for(x = 0; x < cocks.length; x++)
				{
					if(x > 0)
					{
						if(cocks[x].cockColor != cocks[x-1].cockColor) multiOkay = false;
					}
				}
			}
			if (adjectives < adjectiveLimit && rand(10) == 0 && (!multi || multiOkay)) 
			{
				if(adjectives > 0) descript += ", ";
				descript += cock.cockColor;
				adjectives++;
			}
			//Cocksocks!
			//Sock - 1/5 chance
			if(multi)
			{
				multiOkay = true;
				for(x = 0; x < cocks.length; x++)
				{
					if(hasCocksock(x)) multiOkay = false;
				}
			}
			if (adjectives < adjectiveLimit && !multi && rand(5) == 0 && !(cock.cocksock is EmptySlot)) {
				var sockAdj:Array = [];
				// Generic adjectives
				if(cock.cocksock.hasFlag(GLOBAL.ITEM_FLAG_COCKRING))
				{
					sockAdj.push("ringed","jewelry-decorated","jewelry-ringed");
					if(!cock.cocksock.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) sockAdj.push("jewelry-covered","jewelry-encased");
				}
				if(cock.cocksock.hasFlag(GLOBAL.ITEM_FLAG_COCKSOCK))
				{
					sockAdj.push("wrapped","garment-wrapped","smartly dressed");
					// Actually coverd like socks
					if(!cock.cocksock.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) sockAdj.push("covered","sock-sheathed","sock-shrouded","cloth-shrouded","fabric swaddled","fabric-encased");
				}
				if(sockAdj.length > 0)
				{
					if(adjectives > 0) descript += ", ";
					descript += RandomInCollection(sockAdj);
					adjectives++;
				}
			}
			return [descript,adjectives];
		}
		/*Old cockAdjective left for reference - not that this WAS the "new hotness". So many generations of parsers.
		public function cockAdjective(cockNum: Number = -1, dynamicLength:Boolean = false):String {
			var descript: String = "";
			var rando: Number = 0;
			var multi: Boolean = false;
			//If used for multiple cocks, set multi flag
			if (cockNum < 0) {
				//Since we have multi dicks lets talk about the biggest!
				cockNum = biggestCockIndex();
				multi = true;
			}
			var cLength: Number = cLength(cockNum, dynamicLength);
			//Color: 1/15 chance
			if (!multi && rand(15) == 0)
			{
				descript += cocks[cockNum].cockColor;
			}
			//Bimbo flavor - 1/6 chance
			else if(rand(6) == 0 && isBimbo())
			{
				if(rand(7) == 8 && cLength < 6) descript += "cute";
				else if(rand(7) == 0) descript += "mouth-watering";
				else if(rand(6) == 0) descript += "totally sexy";
				else if(rand(5) == 0) descript += "super hot";
				else if(rand(4) == 0) descript += "delicious-looking";
				else if(rand(3) == 0 && cLength >= 10) descript += "awe-inspiring";
				else descript += "yummy";
			}
			//Pierced - 1/5 chance
			else if (!multi && rand(5) == 0 && cocks[cockNum].pierced > 0) {
				descript += "pierced";
			}
			//Cocksocks!
			else if (!multi && rand(5) == 0 && cocks[cockNum].sock != "") {
				rando = rand(6);
				if (rando == 0) descript += "sock-sheathed";
				else if (rando == 1) descript += "garment-wrapped";
				else if (rando == 2) descript += "smartly dressed";
				else if (rando == 3) descript += "cloth-shrouded";
				else if (rando == 4) descript += "fabric swaddled";
				else descript += "covered";
			}
			//Goo - 1/4 chance
			else if (skinType == GLOBAL.SKIN_TYPE_GOO || cocks[cockNum].hasFlag(GLOBAL.FLAG_GOOEY) && rand(4) == 0) {
				rando = rand(3);
				if (rando == 0) descript += "goopey";
				else if (rando == 1) descript += "gooey";
				else descript += "slimy";
			}
			//Knot - 1/5 chance. Only specifically called out if dick isn't dog, since knot shows up with the
			//canine nouns.
			else if(rand(5) == 0 && cocks[cockNum].hasFlag(GLOBAL.FLAG_KNOTTED) && cocks[cockNum].cType != GLOBAL.TYPE_CANINE && cocks[cockNum].cType != GLOBAL.TYPE_SNAKE && cocks[cockNum].cType != GLOBAL.TYPE_NAGA)
			{
				if(rand(3) == 0) descript += "knotted";
				else if(rand(2) == 0) descript += "bulbous";
				else descript += "knotty";
			}
			//Length 1/3 chance
			else if (rand(3) == 0) {
				if (cLength < 3) {
					rando = rand(4);
					if (rando == 0) descript = "little";
					else if (rando == 1) descript = "toy-sized";
					else if (rando == 2) descript = "mini";
					else if (rando == 3) descript = "budding";
					else descript = "tiny";
				} else if (cLength < 5) {
					rando = rand(2);
					if (rando == 0) descript = "short";
					else descript = "small";
				} else if (cLength < 7) {
					rando = rand(2);
					if (rando == 0) descript = "fair-sized";
					else descript = "nice";
				} else if (cLength < 11) {
					rando = rand(3);
					if (rando == 0) {
						if (cocks[cockNum].cType == GLOBAL.TYPE_EQUINE) descript = "pony-sized";
						else descript = "long";
					} else if (rando == 1) {
						if (cocks[cockNum].cType == GLOBAL.TYPE_EQUINE) descript = "colt-like";
						else descript = "lengthy";
					} else descript = "sizable";
				} else if (cLength < 14) {
					rando = rand(3);
					if (rando == 0) descript = "huge";
					else if (rando == 1) {
						if (cocks[cockNum].cType == GLOBAL.TYPE_CANINE) descript = "mastiff-like";
						else descript = "cucumber-length";
					} else descript = "foot-long";
				} else if (cLength < 18) {
					rando = rand(3);
					if (rando == 0) descript = "massive";
					else if (rando == 1) descript = "knee-length";
					else descript = "forearm-length";
				} else if (cLength < 30) {
					rando = rand(3);
					if (rando == 0) descript = "enormous";
					else if (rando == 1) descript = "giant";
					else descript = "arm-length";
				} else if (cLength < 50) {
					rando = rand(7);
					if (cocks[cockNum].cType == GLOBAL.TYPE_FELINE && rand(4) == 0) descript = "coiled ";
					else {
						if (rando == 0) descript = "towering";
						else if (rando == 1) descript = "freakish";
						else if (rando == 2) descript = "monstrous";
						else if (rando == 3) descript = "imposing";
						else if (rando == 4) descript = "prodigious";
						else if (rando == 5) descript = "hyper";
						else descript = "massive";
					}
				} else if (cLength < 100) {
					rando = rand(8);
					if (cocks[cockNum].cType == GLOBAL.TYPE_FELINE && rand(4) == 0) descript = "coiled ";
					else {
						if (rando == 0) descript = "person-sized";
						else if (rando == 1) descript = "ridiculously massive";
						else if (rando == 2) descript = "extremely prodigious";
						else if (rando == 3) descript = "overly imposing";
						else if (rando == 4)
						{
							if(cocks[cockNum].cLength() > (tallness * 2/3)) descript = "floor-dragging";
							else descript = "incredibly immense";
						}
						else if (rando == 5) descript = "colossal";
						else if (rando == 6) descript = "very hyper";
						else descript = "monumental";
					}
				} else {
					rando = rand(6);
					if (cocks[cockNum].cType == GLOBAL.TYPE_FELINE && rand(4) == 0) descript = "coiled ";
					else {
						if (rando == 0) descript = "car-sized";
						else if (rando == 1) descript = "vehicle-sized";
						else if (rando == 2) descript = "movement-impairing";
						else if (rando == 3) descript = "floor-dragging";
						else if (rando == 4) descript = "extremely hyper";
						else descript = "monumental";
					}
				}
			}
			//Hornyness 1/2
			else if (lust() > 75 && rand(2) == 0) {
				//Uber horny like a baws!
				if (lust() > 90) {
					//Weak as shit cum
					if (cumQ() < 50) {
						if (rand(2) == 0) descript += "throbbing";
						else descript += "pulsating";
					}
					//lots of cum? drippy.
					else if (cumQ() < 200) {
						rando = rand(3);
						if (rando == 0) descript += "dribbling";
						else if (rando == 1) descript += "drooling";
						else descript += "leaking";
					}
					//Tons of cum
					else {
						rando = rand(5);
						if (rando == 0) descript += "very drippy";
						else if (rando == 1) descript += "pre-gushing";
						else if (rando == 2) descript += "cum-bubbling";
						else if (rando == 3) descript += "pre-slicked";
						else descript += "pre-drooling";
					}
				}
				//A little less lusty, but still lusty.
				else if (lust() > 75) {
					if (cumQ() < 50) {
						rando = rand(5);
						if (rando == 0) descript += "turgid";
						else if (rando == 1) descript += "blood-engorged";
						else if (rando == 2) descript += "rock-hard";
						else if (rando == 3) descript += "stiff";
						else descript += "eager";
					}
					//A little drippy
					else if (cumQ() < 200) {
						rando = rand(10);
						if (rando == 0) descript += "turgid";
						else if (rando == 1) descript += "blood-engorged";
						else if (rando == 2) descript += "rock-hard";
						else if (rando == 3) descript += "stiff";
						else if (rando == 4) descript += "eager";
						else if (rando < 7) descript += "fluid-beading";
						else descript += "slowly-oozing";
					}
					//uber drippy
					else {
						rando = rand(4);
						if (rando == 0) descript += "dribbling";
						else if (rando == 1) descript += "drooling";
						else if (rando == 2) descript += "fluid-leaking";
						else descript += "leaking";
					}
				}
			}
			//Girth - fallback
			else {
				if (cocks[cockNum].thickness() <= .99) {
					rando = rand(3);
					if (rando == 0) descript += "thin";
					else if (rando == 1) descript += "slender";
					else descript += "narrow";
				} else if (cocks[cockNum].thickness() <= 1.2) {
					descript += "modest";
					
					//else if (rando == 1) descript += "fleshy";
					//else descript += "substantial";
				} else if (cocks[cockNum].thickness() <= 1.6) {
					rando = rand(3);
					if (rando == 0) descript += "ample";
					else if (rando == 1) descript += "meaty";
					else descript += "generously-proportioned";
				} else if (cocks[cockNum].thickness() <= 2) {
					rando = rand(4);
					if (rando == 0) descript += "broad";
					else if (rando == 1) descript += "girthy";
					else if (rando == 2) descript += "expansive";
					else descript += "thick";
				} else if (cocks[cockNum].thickness() <= 3.5) {
					rando = rand(4);
					if (rando == 0) descript += "fat";
					else if (rando == 1) descript += "wide";
					else if (rando == 2) descript += "voluminous";
					else descript += "distended";
				} else if (cocks[cockNum].thickness() > 3.5) {
					rando = rand(4);
					if (rando == 0) descript += "inhumanly distended";
					else if (rando == 1) descript += "bloated";
					else if (rando == 2) descript += "mammoth";
					else descript += "monstrously thick";
				}
			}
			return descript;
		}*/
		//New cock adjectives. The old one sucked dicks
		public function statCockAdjective(l: int, w: int, type: int = 0):String {
			var descript: String = "";
			var multi: Boolean = false;
			//Goo - 1/4 chance
			if ((skinType == GLOBAL.SKIN_TYPE_GOO) && rand(4) == 0) {
				descript += RandomInCollection(["goopey", "gooey", "slimy"]);
			}
			//Length 1/3 chance
			else if (rand(3) == 0) {
				if (l < 3) {
					descript = RandomInCollection(["little", "toy-sized", "mini", "budding", "tiny"]);
				} else if (l < 5) {
					descript = RandomInCollection(["short", "small"]);
				} else if (l < 7) {
					descript = RandomInCollection(["fair-sized", "nice"]);
				} else if (l < 11) {
					if (rand(3) != 0) {
						if (type == GLOBAL.TYPE_EQUINE) descript = RandomInCollection(["pony-sized", "colt-like"]);
						else descript = RandomInCollection(["long", "lengthy"]);
					} else descript = "sizable";
				} else if (l < 14) {
					if (rand(3) == 0) {
						if (type == GLOBAL.TYPE_CANINE) descript = "mastiff-like";
						else descript = "cucumber-length";
					} else descript = RandomInCollection(["huge", "foot-long"]);
				} else if (l < 18) {
					descript = RandomInCollection(["massive", "knee-length", "forearm-length"]);
				} else if (l < 30) {
					descript = RandomInCollection(["enormous", "giant", "arm-length"]);
				} else if (l < 50) {
					if (type == GLOBAL.TYPE_FELINE && rand(4) == 0) descript = "coiled ";
					else {
						descript = RandomInCollection(["towering", "freakish", "monstrous", "imposing", "prodigious", "hyper", "massive"]);
					}
				} else if (l < 100) {
					if (type == GLOBAL.TYPE_FELINE && rand(4) == 0) descript = "coiled ";
					else {
						if (rand(8) == 0)
						{
							if(l > (tallness * 2/3)) descript = "floor-dragging";
							else descript = "incredibly immense";
						}
						else descript = RandomInCollection(["person-sized", "ridiculously massive", "extremely prodigious", "overly imposing", "colossal", "very hyper", "monumental"]);
					}
				} else {
					if (type == GLOBAL.TYPE_FELINE && rand(4) == 0) descript = "coiled ";
					else {
						descript = RandomInCollection(["car-sized", "vehicle-sized", "movement-impairing", "floor-dragging", "extremely hyper", "monumental"]);
						// , "virgin destroying", "small asteroid sized";
					}
				}
			}
			//Hornyness 1/2
			else if (lust() > 75 && rand(2) == 0) {
				var lust:Number = lust();
				var cumQ:Number = cumQ();
				//Uber horny like a baws!
				if (lust > 90) {
					//Weak as shit cum
					if (cumQ < 50) {
						descript += RandomInCollection(["throbbing", "pulsating"]);
					}
					//lots of cum? drippy.
					else if (cumQ < 200) {
						descript += RandomInCollection(["dribbling", "drooling", "leaking"]);
					}
					//Tons of cum
					else {
						descript += RandomInCollection(["very drippy", "pre-gushing", "cum-bubbling", "pre-slicked", "pre-drooling"]);
					}
				}
				//A little less lusty, but still lusty.
				else if (lust > 75) {
					if (cumQ < 50) {
						descript += RandomInCollection(["turgid", "blood-engorged", "rock-hard", "stiff", "eager"]);
					}
					//A little drippy
					else if (cumQ < 200) {
						if (rand(10) <= 3) descript += RandomInCollection(["fluid-beading", "slowly-oozing"]);
						else descript += RandomInCollection(["turgid", "blood-engorged", "rock-hard", "stiff", "eager"]);
					}
					//uber drippy
					else {
						descript += RandomInCollection(["dribbling", "drooling", "fluid-leaking", "leaking"]);
					}
				}
			}
			//Girth - fallback
			else {
				if (w <= .99) {
					descript += RandomInCollection(["thin", "slender", "narrow"]);
				} else if (w <= 1.2) {
					descript += RandomInCollection(["ordinary", "fleshy", "substantial"]);
				} else if (w <= 1.6) {
					descript += RandomInCollection(["ample", "meaty", "generously-proportioned"]);
				} else if (w <= 2) {
					descript += RandomInCollection(["broad", "girthy", "expansive", "thick"]);
				} else if (w <= 3.5) {
					descript += RandomInCollection(["fat", "wide", "distended"]);
				} else if (w > 3.5) {
					descript += RandomInCollection(["inhumanly distended", "bloated", "mammoth", "monstrously thick"]);
				}
			}
			return descript;
		}
		public function nippleLength(row: int = 0): Number {
			if (row >= bRows()) return 0;
			else if (row < 0) return 0;
			return (nippleLengthRatio * .25 * ((10 + breastRows[row].breastRating()) / 10));
		}
		public function nippleWidth(row: int = 0): Number {
			if (row >= bRows()) return 0;
			else if (row < 0) return 0;
			return (nippleWidthRatio * .5 * ((10 + breastRows[row].breastRating()) / 10));
		}
		//New cock adjectives. The old one sucked dicks
		public function nippleCockAdjective(plural: Boolean = false):String {
			var descript: String = "";
			var l: Number = nippleLength(0) * dickNippleMultiplier;
			var w: Number;
			if (l <= 10) w = l / 6;
			else if (l <= 30) w = (l - 10) / 10 + 10 / 6;
			else w = 20 / 10 + 10 / 6 + (l - 30) / 20;
			//Nipple descriptions 1/4 of the time!
			if (rand(4) == 0) {
				descript += RandomInCollection(["nipple-sheathed", (nippleColor + "-surrounded"), (plural ? "areola-wreathed" : "areolae-wreathed")]);
				}
			//Goo - 1/4 chance
			else if (skinType == GLOBAL.SKIN_TYPE_GOO && rand(4) == 0) {
				descript += RandomInCollection(["goopey", "gooey", "slimy"]);
			}
			//Length 1/3 chance
			else if (rand(3) == 0) {
				if (l < 3) {
					descript = RandomInCollection(["little", "mini", "budding", "tiny"]);
				} else if (l < 5) {
					descript = RandomInCollection(["short", "small"]);
				} else if (l < 7) {
					descript = RandomInCollection(["fair-sized", "nice"]);
				} else if (l < 11) {
					if (rand(3) != 0) {
						if (dickNippleType == GLOBAL.TYPE_EQUINE) descript = RandomInCollection(["pony-sized", "colt-like"]);
						else descript = RandomInCollection(["long", "lengthy"]);
					} else descript = "sizable";
				} else if (l < 14) {
					if (rand(3) == 0) {
						if (dickNippleType == GLOBAL.TYPE_CANINE) descript = "mastiff-like";
						else descript = "cucumber-length";
					} else descript = RandomInCollection(["huge", "foot-long"]);
				} else if (l < 18) {
					descript = RandomInCollection(["massive", "knee-length", "forearm-length"]);
				} else if (l < 30) {
					descript = RandomInCollection(["enormous", "giant", "arm-length"]);
				} else if (l < 50) {
					if (dickNippleType == GLOBAL.TYPE_FELINE && rand(4) == 0) descript = "coiled ";
					else {
						descript = RandomInCollection(["towering", "freakish", "monstrous", "imposing", "prodigious", "hyper", "massive"]);
					}
				} else if (l < 100) {
					if (dickNippleType == GLOBAL.TYPE_FELINE && rand(4) == 0) descript = "coiled ";
					else {
						if (rand(8) == 0)
						{
							if(l > (tallness * 4/5)) descript = "floor-dragging";
							else descript = "incredibly immense";
						}
						else descript = RandomInCollection(["person-sized", "ridiculously massive", "extremely prodigious", "overly imposing", "colossal", "very hyper", "monumental"]);
					}
				} else {
					if (dickNippleType == GLOBAL.TYPE_FELINE && rand(4) == 0) descript = "coiled ";
					else {
						descript = RandomInCollection(["car-sized", "vehicle-sized", "movement-impairing", "floor-dragging", "extremely hyper", "monumental"]);
					}
				}
			}
			//Hornyness 1/2
			else if (lust() > 75 && rand(2) == 0) {
				var lust:Number = lust();
				var cumQ:Number = cumQ();
				//Uber horny like a baws!
				if (lust > 90) {
					//Weak as shit cum
					if (cumQ < 50) {
						descript += RandomInCollection(["throbbing", "pulsating"]);
					}
					//lots of cum? drippy.
					else if (cumQ < 200) {
						descript += RandomInCollection(["dribbling", "drooling", "leaking"]);
					}
					//Tons of cum
					else {
						descript += RandomInCollection(["very drippy", "pre-gushing", "cum-bubbling", "pre-slicked", "pre-drooling"]);
					}
				}
				//A little less lusty, but still lusty.
				else if (lust > 75) {
					if (cumQ < 50) {
						descript += RandomInCollection(["turgid", "blood-engorged", "rock-hard", "stiff", "eager"]);
					}
					//A little drippy
					else if (cumQ < 200) {
						descript += RandomInCollection(["turgid", "blood-engorged", "rock-hard", "stiff", "eager", "fluid-beading", "slowly-oozing"]);
					}
					//uber drippy
					else {
						descript += RandomInCollection(["dribbling", "drooling", "fluid-leaking", "leaking"]);
					}
				}
			}
			//Girth - fallback
			else {
				if (w <= .99) {
					descript += RandomInCollection(["thin", "slender", "narrow"]);
				} else if (w <= 1.2) {
					descript += RandomInCollection(["ordinary", "fleshy", "substantial"]);
				} else if (w <= 1.6) {
					descript += RandomInCollection(["ample", "meaty", "generously-proportioned"]);
				} else if (w <= 2) {
					descript += RandomInCollection(["broad", "girthy", "expansive", "thick"]);
				} else if (w <= 3.5) {
					descript += RandomInCollection(["fat", "wide", "distended"]);
				} else if (w > 3.5) {
					descript += RandomInCollection(["inhumanly distended", "bloated", "mammoth", "monstrously thick"]);
				}
			}
			return descript;
		}
		public function cumColor(): String {
			return fluidColor(cumType);
		}
		public function milkColor(): String {
			return fluidColor(milkType);
		}
		public function girlCumColor(): String {
			return fluidColor(girlCumType);
		}
		public function fluidFlavor(arg: int):String {
			var collection:Array = new Array();
			//CUM & MILK TYPES
			switch(arg)
			{
				case GLOBAL.FLUID_TYPE_MILK:
					collection.push("creamy", "creamy", "creamy", "creamy", "creamy", "delicious", "delicious", "delicious", "sweet", "creamy");
					break;
				case GLOBAL.FLUID_TYPE_CUM:
					collection.push("salty", "salty", "salty", "salty", "salty", "salty", "salty", "potent", "potent", "potent");
					if(isBimbo()) collection.push("yummy", "yummy", "yummy", "delicious", "delicious", "tasty");
					break;
				case GLOBAL.FLUID_TYPE_HONEY:
				case GLOBAL.FLUID_TYPE_NECTAR:
					collection.push("sweet", "sweet", "sweet", "sweet", "sweet", "syrupy", "syrupy", "syrupy", "sugary", "sugary");
					break;
				case GLOBAL.FLUID_TYPE_OIL:
					collection.push("tasteless");
					break;
				case GLOBAL.FLUID_TYPE_MILKSAP:
					collection.push("creamy", "creamy", "creamy", "creamy", "creamy", "sweet", "sweet", "sweet", "sugary", "delicious");
					break;
				case GLOBAL.FLUID_TYPE_GIRLCUM:
					collection.push("tangy", "tangy", "tangy", "tangy", "tangy", "tangy", "tangy", "flavorful", "flavorful", "flavorful");
					break;
				case GLOBAL.FLUID_TYPE_CUMSAP:
					collection.push("salty-sweet", "salty-sweet", "salty-sweet", "salty-sweet", "salty-sweet", "syrupy", "syrupy", "syrupy", "salty", "salty");
					break;
				case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
				case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
					collection.push("creamy", "creamy", "creamy", "delicious", "delicious", "sweet", "chocolatey", "cocoa-flavored", "rich");
					break;
				case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
					collection.push("creamy", "creamy", "creamy", "delicious", "delicious", "sweet", "strawberry-flavored", "fruity", "rich");
					break;
				case GLOBAL.FLUID_TYPE_SYDIAN_CUM:
					collection.push("citrusy", "citrusy", "citrusy", "citrusy", "citrusy", "tangy", "tangy", "tangy", "metallic", "metallic");
					break;
				case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
				case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
				case GLOBAL.FLUID_TYPE_VANAE_CUM:
					collection.push("sweet", "fruity");
					break;
				case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
					collection.push("tangy", "tangy", "tangy", "tangy", "tangy", "sweet", "sweet", "sweet", "intoxicating", "intoxicating");
					break;
				case GLOBAL.FLUID_TYPE_VANILLA:
					collection.push("sweet", "sugary", "creamy", "vanilla");
					break;
				case GLOBAL.FLUID_TYPE_NYREA_CUM:
				case GLOBAL.FLUID_TYPE_NYREA_GIRLCUM:
					collection.push("salty", "salty", "salty", "salty", "salty", "salty", "salty", "potent", "potent", "potent");
					break;
				case GLOBAL.FLUID_TYPE_GABILANI_CUM:
					collection.push("salty", "potent");
					break;
				case GLOBAL.FLUID_TYPE_GABILANI_GIRLCUM:
					collection.push("tangy", "flavorful");
					break;
				case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
					collection.push("blueberry", "blueberry", "blueberry", "delicious", "sweet", "fruity");
					break;
				case GLOBAL.FLUID_TYPE_HRAD_CUM:
					collection.push("sweet", "vanilla", "sugary");
					break;
				case GLOBAL.FLUID_TYPE_SPECIAL_GOO:
				case GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO:
					collection.push("sweet", "tangy", "citrusy");
					break;
				case GLOBAL.FLUID_TYPE_FRUIT_CUM:
				case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
					collection.push("fruity", "sweet", "tart", "zesty", "citrusy", "pear-flavored", "apple-flavored");
					break;
				case GLOBAL.FLUID_TYPE_EGGNOG:
					collection.push("sweet", "sweet", "savory", "rich", "rich", "rich", "delicious", "delicious", "creamy", "creamy");
					break;
				case GLOBAL.FLUID_TYPE_PEPPERMINT:
					collection.push("peppermint", "minty", "minty", "minty", "fresh", "fresh", "sweet", "minty-sweet", "minty-sweet");
					break;
				case GLOBAL.FLUID_TYPE_SUGAR:
					collection.push("sweet", "sweet", "sweet", "sugary", "sugary", "saccharine");
					break;
			}
			if(collection.length <= 0) return "bland";
			
			return RandomInCollection(collection);
		}
		public function fluidViscosity(arg: int):String {
			var collection:Array = new Array();
			
			//CUM & MILK TYPES
			switch(arg)
			{
				case GLOBAL.FLUID_TYPE_MILK:
				case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
				case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
				case GLOBAL.FLUID_TYPE_VANILLA:
					collection.push("creamy");
					break;
				case GLOBAL.FLUID_TYPE_CUM:
				case GLOBAL.FLUID_TYPE_SYDIAN_CUM:
				case GLOBAL.FLUID_TYPE_VANAE_CUM:
					collection.push("thick", "thick", "thick", "slick", "creamy");
					break;
				case GLOBAL.FLUID_TYPE_GIRLCUM:
					collection.push("slick", "slick", "slick", "slick", "slick", "slick", "slick", "slippery", "slippery", "slippery");
					break;
				case GLOBAL.FLUID_TYPE_HONEY:
				case GLOBAL.FLUID_TYPE_NECTAR:
					collection.push("sticky", "sticky", "sticky", "slick", "slick");
					break;
				case GLOBAL.FLUID_TYPE_OIL:
					collection.push("slippery", "slick");
					break;
				case GLOBAL.FLUID_TYPE_MILKSAP:
					collection.push("creamy", "syrupy");
					break;
				case GLOBAL.FLUID_TYPE_CUMSAP:
					collection.push("slick", "slick", "slick", "slick", "slick", "sticky", "sticky", "sticky", "syrupy", "syrupy");
					break;
				case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
				case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
					collection.push("creamy", "creamy", "creamy", "sticky", "sticky");
					break;
				case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
				case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
					collection.push("thick", "thick", "thick", "creamy", "creamy");
					break;
				case GLOBAL.FLUID_TYPE_NYREA_CUM:
					collection.push("thick", "thick", "thick", "slick", "creamy");
					if(statusEffectv1("Nyrea Eggs") > 0) collection.push("egg-filled", "eggy", "bubbly", "pulpy");
					break;
				case GLOBAL.FLUID_TYPE_GABILANI_CUM:
				case GLOBAL.FLUID_TYPE_GABILANI_GIRLCUM:
					collection.push("oily", "coating");
					break;
				case GLOBAL.FLUID_TYPE_SPECIAL_GOO:
				case GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO:
					collection.push("slick", "viscous", "slippery"); /* "slimy", */
					break;
				case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
				case GLOBAL.FLUID_TYPE_NYREA_GIRLCUM:
					collection.push("thick", "sticky");
					break;
				case GLOBAL.FLUID_TYPE_HRAD_CUM:
					collection.push("semi-thick", "syrupy");
					break;
				case GLOBAL.FLUID_TYPE_FRUIT_CUM:
				case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
					collection.push("juicy", "liquid", "drippy");
					break;
				case GLOBAL.FLUID_TYPE_EGGNOG:
					collection.push("thick", "smooth", "smooth", "creamy", "creamy", "viscous");
					break;
				case GLOBAL.FLUID_TYPE_PEPPERMINT:
					collection.push("sticky", "sticky", "sticky", "gooey", "gooey", "molasses-like");
					break;
				case GLOBAL.FLUID_TYPE_SUGAR:
					collection.push("gooey", "sticky", "syrupy");
					break;
			}
			if(collection.length <= 0) return "fluid";
			
			return RandomInCollection(collection);
		}
		public function fluidColor(arg: int): String {
			var collection:Array = new Array();
			//trace("BOOP DA SNOOT");
			//CUM & MILK TYPES
			switch(arg)
			{
				case GLOBAL.FLUID_TYPE_MILK:
				case GLOBAL.FLUID_TYPE_CUM:
				case GLOBAL.FLUID_TYPE_VANILLA:
					if(short == "Pwink") collection.push("pinkish white", "pinkish white", "pinkish white", "pinkish white", "pinkish white");
					else collection.push("white", "white", "white", "white", "white", "alabaster", "alabaster", "alabaster", "ivory", "ivory");
					break;
				case GLOBAL.FLUID_TYPE_HONEY:
				case GLOBAL.FLUID_TYPE_NECTAR:
					collection.push("amber", "amber", "amber", "amber", "amber", "yellow", "yellow", "yellow", "gold", "tawny");
					break;
				case GLOBAL.FLUID_TYPE_OIL:
					collection.push("semi-transparent", "semi-transparent", "semi-transparent", "semi-transparent", "semi-transparent", "translucent brown", "translucent brown", "translucent brown", "lucent", "lucent");
					break;
				case GLOBAL.FLUID_TYPE_MILKSAP:
					collection.push("whitish-yellow", "whitish-yellow", "whitish-yellow", "whitish-yellow", "whitish-yellow", "ivory gold", "ivory gold", "ivory gold", "off-white", "off-white");
					break;
				case GLOBAL.FLUID_TYPE_GIRLCUM:
					collection.push("translucent", "translucent", "translucent", "translucent", "translucent", "clear", "clear", "clear", "semi-transparent", "semi-transparent");
					break;
				case GLOBAL.FLUID_TYPE_CUMSAP:
					collection.push("off-white", "off-white", "off-white", "off-white", "off-white", "pearl-marbled amber", "pearl-marbled amber", "pearl-marbled amber", "ivory-amber", "ivory-amber");
					break;
				case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
				case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
					collection.push("chocolate", "chocolate", "chocolate", "chocolate", "chocolate", "creamy brown", "creamy brown", "creamy brown", "dark chocolate", "dark chocolate");
					break;
				case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
					collection.push("pink", "pink", "pink", "pink", "pink", "creamy pink", "creamy pink", "creamy pink", "light pink", "light pink");
					break;
				case GLOBAL.FLUID_TYPE_SYDIAN_CUM:
					collection.push("silvery", "silvery", "silvery", "silvery", "silvery", "metallic silver", "metallic silver", "metallic silver", "silver", "silver");
					break;
				case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
					collection.push("pink", "pink", "pink", "pink", "pink", "milky-pink", "milky-pink", "milky-pink", "pink-marbled cream", "pink-marbled cream");
					break;
				case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
					collection.push("violet", "violet", "violet", "violet", "violet", "milky-violet", "milky-violet", "milky-violet", "violet-marbled cream", "violet-marbled cream");
					break;
				case GLOBAL.FLUID_TYPE_VANAE_CUM:
					collection.push("blue", "blue", "glowing blue", "glowing blue", "glow-in-the-dark");
					break;
				case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
					collection.push("alabaster", "alabaster", "alabaster", "alabaster", "alabaster", "semi-transparent", "semi-transparent", "semi-transparent", "off-white", "off-white");
					break;
				case GLOBAL.FLUID_TYPE_NYREA_CUM:
					collection.push("purple", "purple", "purple", "violet");
					break;
				case GLOBAL.FLUID_TYPE_NYREA_GIRLCUM:
					collection.push("off-white", "semi-transparent");
					break;
				case GLOBAL.FLUID_TYPE_GABILANI_CUM:
					collection.push("off-white", "semi-clear", "semi-transparent");
					break;
				case GLOBAL.FLUID_TYPE_GABILANI_GIRLCUM:
					collection.push("gray", "semi-clear", "semi-transparent");
					break;
				case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
					collection.push("violet", "purple");
					break;
				case GLOBAL.FLUID_TYPE_HRAD_CUM:
					collection.push("translucent white", "creamy white", "nearly transparent", "ghostly white");
					break;
				case GLOBAL.FLUID_TYPE_SPECIAL_GOO:
				case GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO:
					if(skinType == GLOBAL.SKIN_TYPE_GOO) collection.push(skinTone);
					else if(hairType == GLOBAL.HAIR_TYPE_GOO) collection.push(hairColor);
					else collection.push("green", "emerald");
					break;
				case GLOBAL.FLUID_TYPE_FRUIT_CUM:
				case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
					collection.push("pale yellow", "blanched yellow", "creamy lemon");
					break;
				case GLOBAL.FLUID_TYPE_EGGNOG:
					collection.push("creamy yellow", "creamy yellow", "light yellow", "muddy golden", "cream colored", "cream colored");
					break;
				case GLOBAL.FLUID_TYPE_PEPPERMINT:
					collection.push("white", "opaque white", "ivory", "ivory", "alabaster", "alabaster");
					break;
				case GLOBAL.FLUID_TYPE_SUGAR:
					collection.push("white", "white", "semi-clear", "ivory", "alabaster", "pure white");
					break;
			}
			if(collection.length <= 0) return "ERROR, INVALID FLUID TYPE.";
			
			return RandomInCollection(collection);
		}
		public function cumGem():String
		{
			return fluidGem(cumType);
		}
		public function milkGem():String
		{
			return fluidGem(milkType);
		}
		public function girlCumGem():String
		{
			return fluidGem(girlCumType);
		}

		public function fluidGem(arg:int):String
		{
			var fColor:String = fluidColorSimple(arg);
			switch(fColor)
			{
				case "white":
					return RandomInCollection("pearl", "opal");
				case "pink":
					return RandomInCollection("rose quartz", "pink diamond");
				case "red":
					return RandomInCollection("ruby", "garnet");
				case "brown":
					return RandomInCollection("citrine", "citrine");
				case "orange":
				case "yellow":
					return RandomInCollection("amber", "citrine", "topaz");
				case "green":
					return RandomInCollection("emerald", "jade");
				case "blue":
					return RandomInCollection("aquamarine", "sapphire");
				case "purple":
					return RandomInCollection("amethyst", "amethyst");
				case "silver":
				case "gray":
					return RandomInCollection("silver", "silver");
				case "transparent":
					return RandomInCollection("crystal", "diamond");
				default:
					return RandomInCollection("pearl", "pearl");
			}
		}
		public function fluidColorSimple(arg: int):String
		{
			switch(arg)
			{
				case GLOBAL.FLUID_TYPE_MILK:
				case GLOBAL.FLUID_TYPE_CUM:
				case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
				case GLOBAL.FLUID_TYPE_CUMSAP:
				case GLOBAL.FLUID_TYPE_MILKSAP:
				case GLOBAL.FLUID_TYPE_VANILLA:
				case GLOBAL.FLUID_TYPE_PEPPERMINT:
				case GLOBAL.FLUID_TYPE_SUGAR:
				case GLOBAL.FLUID_TYPE_NYREA_GIRLCUM:
				case GLOBAL.FLUID_TYPE_GABILANI_CUM:
				case GLOBAL.FLUID_TYPE_HRAD_CUM:
					return "white";
				case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
				case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
					return "pink";
				case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
				case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
					return "brown";
				case GLOBAL.FLUID_TYPE_HONEY:
				case GLOBAL.FLUID_TYPE_NECTAR:
				case GLOBAL.FLUID_TYPE_FRUIT_CUM:
				case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
				case GLOBAL.FLUID_TYPE_EGGNOG:
					return "yellow";
				case GLOBAL.FLUID_TYPE_SPECIAL_GOO:
				case GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO:
					if(skinType == GLOBAL.SKIN_TYPE_GOO) return skinTone;
					else if(hairType == GLOBAL.HAIR_TYPE_GOO) return hairColor;
					return "green";
				case GLOBAL.FLUID_TYPE_VANAE_CUM:
					return "blue";
				case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
				case GLOBAL.FLUID_TYPE_NYREA_CUM:
				case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
					return "purple";
				case GLOBAL.FLUID_TYPE_GABILANI_GIRLCUM:
					return "gray";
				case GLOBAL.FLUID_TYPE_SYDIAN_CUM:
					return "silver";
				case GLOBAL.FLUID_TYPE_OIL:
				case GLOBAL.FLUID_TYPE_GIRLCUM:
					return "transparent";
				default:
					return "white";
			}
		}
		public function fluidNoun(arg: int): String {
			var collection:Array = new Array();
			
			//CUM & MILK TYPES
			switch(arg)
			{
				case GLOBAL.FLUID_TYPE_MILK:
				case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
				case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
					collection.push("milk");
					//if(arg == GLOBAL.FLUID_TYPE_MILK && rand(10) == 0) collection.push("cream");
					if(kGAMECLASS.silly && cowScore() >= 4 && rand(5) == 0) collection.push("moo juice");
					break;
				case GLOBAL.FLUID_TYPE_CUM:
				case GLOBAL.FLUID_TYPE_CUNDARIAN_SEED:
				case GLOBAL.FLUID_TYPE_SYDIAN_CUM:
				case GLOBAL.FLUID_TYPE_GABILANI_CUM:
				case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
				case GLOBAL.FLUID_TYPE_VANAE_CUM:
				case GLOBAL.FLUID_TYPE_NYREA_GIRLCUM:
				case GLOBAL.FLUID_TYPE_PEPPERMINT:
					collection.push("cum");
					if(isBimbo() || isBro()) collection.push("cum", "spunk", "spunk", "jism", "jizz","spooge");
					break;
				case GLOBAL.FLUID_TYPE_GIRLCUM:
				case GLOBAL.FLUID_TYPE_GABILANI_GIRLCUM:
				case GLOBAL.FLUID_TYPE_NYREA_CUM:
					collection.push("girl-cum","girl-cum","fem-cum");
					if(isBimbo() || isBro()) collection.push("girl-cum", "girl-lube", "girl-lube", "girl-juice", "cunny-honey");
					if(libido() >= 50) collection.push("girl-spunk","fem-spunk","fem-cum");
					break;
				case GLOBAL.FLUID_TYPE_HONEY:
					collection.push("honey");
					break;
				case GLOBAL.FLUID_TYPE_OIL:
					collection.push("oil");
					break;
				case GLOBAL.FLUID_TYPE_MILKSAP:
					collection.push("milk-sap");
					break;
				case GLOBAL.FLUID_TYPE_CUMSAP:
					collection.push("cum-sap", "cum-sap", "botanical spunk", "floral jism");
					break;
				case GLOBAL.FLUID_TYPE_VANILLA:
				case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
				case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
				case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
					collection.push("milk");
					break;
				case GLOBAL.FLUID_TYPE_NECTAR:
					collection.push("nectar");
					break;
				case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
					collection.push("yogurt");
					break;
				case GLOBAL.FLUID_TYPE_HRAD_CUM:
					collection.push("syrup", "cum");
					break;
				case GLOBAL.FLUID_TYPE_SPECIAL_GOO:
					collection.push("slime", "goo");
					break;
				case GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO:
					collection.push("slime-spunk", "goo-cum", "slime-semen", "goo-spooge", "slime-spooge", "goo-spunk", "slime-cum");
					break;
				case GLOBAL.FLUID_TYPE_FRUIT_CUM:
					collection.push("seed");
					break;
				case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
					collection.push("juice");
					break;
				case GLOBAL.FLUID_TYPE_EGGNOG:
					collection.push("eggnog");
					break;
				case GLOBAL.FLUID_TYPE_SUGAR:
					collection.push("glaze", "frosting", "icing");
					break;
			}
			if(collection.length <= 0) return "ERROR: NONVALID FLUID TYPE PASSED TO fluidNoun.";
			
			return RandomInCollection(collection);
		}
		public function fluidDescript(fluidType:int = 0): String {
			var temp: int = rand(10);
			var desc: String = "";
			var described: Boolean = false;
			if (rand(3) == 0) {
				desc += fluidColor(fluidType);
				described = true;
			}
			if (described) desc += " ";
			desc += fluidNoun(fluidType);
			return desc;
		}
		public function milkDescript(): String {
			return fluidDescript(milkType);
		}
		public function cumDescript(): String {
			if(kGAMECLASS.silly && cumType == GLOBAL.FLUID_TYPE_HONEY && rand(3) == 0) return ((rand(3) == 0 ? (fluidColor(cumType) + " ") : "") + "honey nut");
			return fluidDescript(cumType);
		}
		public function girlCumDescript(): String {
			return fluidDescript(girlCumType);
		}
		public function nippleCuntDescript(appearance: Boolean = false): String {
			var descript: String = "";
			if (rand(10) <= 6 && !appearance) descript += RandomInCollection(["penetrable", "fuckable", "pliable", "stretchy"]) + " ";
			descript += RandomInCollection(["cunt", "cunt"]);
			if (!appearance) descript += "-nipple";
			return descript;
		}
		public function nippleCuntsDescript(appearance: Boolean = false): String {
			return plural(nippleCuntDescript(appearance));
		}
		public function nippleCockDescript(appearance: Boolean = false): String {
			var descript: String = "";
			//Set up a placeholder cock to pass for descripts
			var cock:CockClass = new CockClass();
			cock.cType = dickNippleType;
			//Non boring descriptions!
			//70% of the time add a descriptor
			if (rand(10) <= 6 && !appearance) {
				descript += nippleCockAdjective();
				//50% of the time add supplimental cock adjective with the noun.
				if(rand(2) == 0) descript += ", " + cockNoun2(cock, false, "nipple");
				//Otherwise normal
				else descript += " " + cockNoun2(cock, true, "nipple");
			}
			//These guys get a bonus adjective 70% of the time.
			else {
				if (rand(10) <= 6 && !appearance) descript += cockNoun2(cock, false, "nipple");
				else descript += cockNoun2(cock, true);
			}
			return descript;
		}
		public function nippleCocksDescript(appearance: Boolean = false): String {
			return plural(nippleCockDescript(appearance));
		}
		public function cockSkin(arg2:int = 0):String
		{
			if(cocks.length <= 0 || arg2 < 0 || arg2 >= cocks.length) return "ERROR";
			
			var sDesc:String = "";
			var aNoun:Array = ["dickskin", "dickskin", "cockskin"];
			var aAdjective:Array = [];
			
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_SMOOTH)) aAdjective.push("smooth");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_LUBRICATED)) aAdjective.push("lubricated", "slick", "slimy");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_GOOEY)) aAdjective.push("gooey", "slimy", "slick");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_STICKY)) aAdjective.push("sticky");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_SQUISHY)) aAdjective.push("squishy");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_FURRED)) aAdjective.push("furred", "furry");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_SCALED)) aAdjective.push("scaled", "scaly");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_CHITINOUS)) aAdjective.push("chitinous", "armored");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_FEATHERED)) aAdjective.push("feathered", "furry");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_NUBBY)) aAdjective.push("nubby", "nodule-covered");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_RIBBED)) aAdjective.push("ribbed");
			if(cocks[arg2].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) aAdjective.push("aphrodisiac-laced");
			//Colors - no more than 25% of the time. If no other adjectives, only push color adjective 50% of time for resulting 25% chance.
			if(aAdjective.length > 0 || rand(2) == 0) aAdjective.push(cocks[arg2].cockColor);

			if(aAdjective.length > 0 && rand(2) == 0) sDesc += aAdjective[rand(aAdjective.length)] + " ";
			
			sDesc += aNoun[rand(aNoun.length)];
			
			return sDesc;
		}
		public function cockColor(arg2:int = 0):String
		{
			if(cocks.length <= 0 || arg2 < 0 || arg2 >= cocks.length) return "ERROR";
			return cocks[arg2].cockColor;
		}
		public function vaginaColor(arg2:int = 0):String
		{
			if(vaginas.length <= 0 || arg2 < 0 || arg2 >= vaginas.length) return "ERROR";
			return vaginas[arg2].vaginaColor;
		}
		public function tailGenitalColorDesc(arg:int = 0):String
		{
			return tailGenitalColor;
		}
		public function tailGenitalDescript(): String
		{
			if (hasTailCock()) return tailCockDescript();
			if (hasTailCunt()) return tailVaginaDescript();
			return "ERROR: TAIL GENITAL DESCRIPT CALLED WITH NO TAIL GENITALS PRESENT.";
		}
		public function tailGenitalsDescript(): String
		{
			if (hasTailCock()) return tailCocksDescript();
			if (hasTailCunt()) return tailVaginasDescript();
			return "ERROR: TAIL GENITAL DESCRIPT CALLED WITH NO TAIL GENITALS PRESENT.";
		}
		public function oneTailGenitalDescript(genOverride:String = "any"):String
		{
			var tailDesc:String = "ERROR: No tail genitals!";
			
			if (tailCount <= 0) return tailDesc;
			
			switch(genOverride)
			{
				case "cock":
					tailDesc = (hasTailCock() ? tailCockDescript() : "ERROR: No tail cock!");
					break;
				case "cunt":
					tailDesc = (hasTailCunt() ? tailVaginaDescript() : "ERROR: No tail vagina!");
					break;
				default:
					if(hasTailCock()) tailDesc = tailCockDescript();
					else if(hasTailCunt()) tailDesc = tailVaginaDescript();
					break;
			}
			
			if (tailCount == 1) return "your " + tailDesc;
			return "one of your " + plural(tailDesc);
		}
		public function eachTailGenitalDescript(genOverride:String = "any"):String
		{
			var tailDesc:String = "ERROR: No tail genitals!";
			
			if (tailCount <= 0) return tailDesc;
			
			switch(genOverride)
			{
				case "cock":
					tailDesc = (hasTailCock() ? tailCockDescript() : "ERROR: No tail cock!");
					break;
				case "cunt":
					tailDesc = (hasTailCunt() ? tailVaginaDescript() : "ERROR: No tail vagina!");
					break;
				default:
					if(hasTailCock()) tailDesc = tailCockDescript();
					else if(hasTailCunt()) tailDesc = tailVaginaDescript();
					break;
			}
			
			if (tailCount == 1) return "your " + tailDesc;
			return "each of your " + plural(tailDesc);
		}
		public function hasHardLightEquipped():Boolean
		{
			return (lowerUndergarment.hardLightEquipped);
		}
		// PC wears underwear with HL support and nothing else
		public function hasOnlyHLUndiesEquipped():Boolean
		{
			if (!hasArmor() && !hasUpperGarment() && hasHardLightEquipped()) return true;
			return false;
		}
		public function hasHardLightUpgraded():Boolean
		{
			return (hasKeyItem("Hardlight Strap-on Upgrades"));
		}
		public function hasHardLightStrapOn():Boolean
		{
			// Check equipment
			if(hasHardLightEquipped()) return true;
			// Check inventory
			if(inventory.length > 0)
			{
				for(var i:int = 0; i < inventory.length; i++)
				{
					if(inventory[i].hardLightEquipped) return true;
				}
			}
			return false;
		}
		public function hasHardLightAvailable():Boolean
		{
			return hasHardLightUpgraded() || hasHardLightStrapOn();
		}
		public function hardLightVolume():Number
		{
			return 30;
		}
		// Always picks the main anatomy--no need to complicate it!
		//Ids:
		//-4 = catch-all "strapon"
		//-3 = autoselect
		//-2 = giant clitosaurus
		//-1 = force hardlight strapon
		//0+ = force specific dick
		public function cockOrStrapon(idxOverride:int = -3,forceAdjective: int = 0): String {
			var descript: String = "";
			var sAdjective:Array = [];
			var sNoun:Array = [];

			//if a idxOverride is set higher than your current dick count, set it to autopick something different
			if(idxOverride >= cocks.length) idxOverride = -3;
			//Autopick? Prefer dick if available.
			if(idxOverride == -3)
			{
				//Have cock? Use it by default
				if(hasCock()) idxOverride = 0;
				//No dick? Use the hard light
				else if(hasHardLightAvailable()) idxOverride = -1;
				//No hard light, use your clit.
				else if(clitLength >= 4 && totalClits() > 0) idxOverride = -2;
				//Nothing appropriate? Must be a strap-on
				else idxOverride = -4;
			}
			//Hardlight wins
			if(idxOverride == -1)
			{
				sAdjective = ["hardlight", "hardlight", "hardlight", "hardlight", "holo-", "holo-", "holo-", "projected", "projected", "holographic"];
				sNoun = ["strapon", "strapon", "strapon", "dildo", "dildo"];
				if(kGAMECLASS.silly)
				{
					sAdjective.push("lite-brite");
					sAdjective.push("glow-in-the-dark");
					sNoun.push("beam saber");
					sNoun.push("lazer beam");
					sNoun.push("funstick");
					sNoun.push("disco stick");
					sNoun.push("pillar of ecstasy");
				}
				//Force an adjective
				if(forceAdjective == 1)
				{
					descript += RandomInCollection(sAdjective);
					if(descript != "holo-") descript += " ";
				}
				//Chance of adjective!
				else if(forceAdjective == 0 && rand(2) == 0)
				{
					descript += RandomInCollection(sAdjective);
					if(descript != "holo-") descript += " ";
				}
				descript += RandomInCollection(sNoun);
				return descript;
			}
			// Penis?
			else if(idxOverride >= 0)
			{
				if(forceAdjective == -1) return simpleCockNoun(idxOverride);
				return cockDescript(idxOverride);
			}
			// Giant Clits?
			else if(idxOverride == -2)
			{
				if(kGAMECLASS.silly && clitLength >= 12 && rand(2) == 0)
				{
					if(forceAdjective == 1 || (forceAdjective == 0 && rand(2) == 0)) descript += "mighty ";
					descript += "clitosaurus";
					return descript;
				}
				else
				{
					return clitDescript(0);
				}
			}
			// Error, return something though!
			return "strapon";
		}
		
		public function cockOrStraponHead(idxOverride:int = -3): String {
			//if a idxOverride is set higher than your current dick count, set it to autopick something different
			if(idxOverride >= cocks.length) idxOverride = -3;
			//Autopick? Prefer dick if available.
			if(idxOverride == -3)
			{
				//Have cock? Use it by default
				if(hasCock()) idxOverride = 0;
				//No dick? Use the hard light
				else if(hasHardLightAvailable()) idxOverride = -1;
				//No hard light, use your clit.
				else if(clitLength >= 4 && totalClits() > 0) idxOverride = -2;
				//Nothing appropriate? Must be a strap-on
				else idxOverride = -4;
			}
			if(idxOverride >= 0) return cockHead(idxOverride);
			return cockOrStrapon(idxOverride,-1);
		}

		public function cockOrVag(): String {
			if(hasCock()) return cocksDescriptLight();
			else if (hasVagina()) return vaginasDescriptLight();
			// Error, return something though!
			else return ("thigh");
		}
		
		//Check if the pc has a cock, strapon, or massive clit to do some sexin'
		public function hasCockOrStrapOrClit(countTailCock: Boolean = false):Boolean {
			if (hasCock()) return true;
			else if (hasHardLightEquipped()) return true;
			else if (kGAMECLASS.silly && clitLength >= 12) return true;
			else if (countTailCock == true && hasTailCock()) return true;
			else return false;
		}
		
		public function cockDescript(cockNum: Number = 0, dynamicLength:Boolean = false, multi:Boolean = false): String {
			if (cocks.length <= 0) return "<b>ERROR: CockDescript Called But No Cock Present</b>";
			if (cocks.length <= cockNum || cockNum < 0) return "<b>ERROR: CockDescript called with index of " + cockNum + " - out of BOUNDS</b>";

			//Variables
			var adjectiveLimit:Number = 2;
			var adjectiveCount:Number = 0;
			var ultraSimple:Boolean = false;
			var simple:Boolean = false;
			var complex:Boolean = false;
			var cock:CockClass = cocks[cockNum];
			var bonus:Number = 0;
			var descript:String = "";

			//Determine type of cock description. This varies based on type
			switch(cock.cType)
			{
				//human cunts tend to get over-simplistic ones.
				case GLOBAL.TYPE_HUMAN:
					ultraSimple = true;
					break;
				//These all get 70% complex, 10% ultraSimple, 20% simple
				case GLOBAL.TYPE_EQUINE:
				case GLOBAL.TYPE_CANINE:
				case GLOBAL.TYPE_VULPINE:
				case GLOBAL.TYPE_FELINE:
				case GLOBAL.TYPE_NAGA:
				case GLOBAL.TYPE_LEITHAN:
				case GLOBAL.TYPE_SYNTHETIC:
					if(rand(10) <= 6) 
					{
						complex = true;
						adjectiveLimit = 1;
					}
					else if(rand(3) == 0) ultraSimple = true;
					else simple = true;
					break;
				//Everything else gets 33% splits
				default:
					if(rand(3) == 0) 
					{
						complex = true;
						adjectiveLimit = 1;
					}
					else if(rand(2) == 0) ultraSimple = true;
					else simple = true;
					break;
			}
			//Get adjectives!
			var adjectivesReturn:Array = cockAdjectivesRedux(cock, adjectiveLimit, multi);
			descript = adjectivesReturn[0];
			if(ultraSimple)
			{
				if(adjectivesReturn[1] > 0) descript += " ";
				descript += cockNoun2(cock, true, "ultraSimple");
			}
			else if(simple)
			{
				if(adjectivesReturn[1] > 0) descript += " ";
				descript += cockNoun2(cock, true);
			}
			//Complexico!
			else 
			{
				if(adjectivesReturn[1] > 0) descript += ", ";
				descript += cockNoun2(cock, false);
			}
			return descript;
		}
		public function randomSimpleCockNoun():String
		{
			return RandomInCollection("cock","cock","cock","cock","dick","dick","phallus","phallus","prick","tool","member","shaft","dong");
		}
		public function tailCocksDescript(): String {
			if (tailCount > 1) return plural(tailCockDescript());
			else if (tailCount == 1) return tailCockDescript();
			return "ERROR: TAIL DESCRIPT CALLED WITH NO TAILS PRESENT.";
		}
		public function tailCockDescript(): String {
			var descript: String = "";
			//Placeholder for new cock stuff
			var cock:CockClass = new CockClass();
			cock.cType = tailGenitalArg;
			//Non boring descriptions!
			//70% of the time add a descriptor
			if (rand(10) <= 6) {
				descript += statCockAdjective(8, 2);
				//50% of the time add supplimental cock adjective with the noun.
				if (rand(2) == 0) descript += ", " + cockNoun2(cock, false, "tail");
				//or 10% of that time, mention color.
				else if (rand(10) == 0 && tailGenitalColor != "") descript += ", " + tailGenitalColor + " " + cockNoun2(cock, false, "tail");
				//Otherwise normal
				else descript += " " + cockNoun2(cock, false, "tail");
			}
			//These guys get a bonus adjective 70% of the time.
			else {
				if (rand(10) <= 6) descript += cockNoun2(cock, false, "tail");
				else descript += cockNoun2(cock, true, "tail");
			}
			return descript;
		}
		public function allBreastsDescript(): String {
			var storage: String = "";
			if (breastRows.length == 0) {
				if (tone < 30 && rand(4) == 0) {
					if(thickness < 30 && rand(2) == 0) return "flat chest";
					return "unremarkable chest muscles";
				}
				return RandomInCollection(["chest", "pectorals", (mf("manly", "boyish", true) + " chest")]);
			}
			if (breastRows.length == 2) {
				if (totalBreasts() == 4) storage += RandomInCollection(["quad ", "four "]);
				else storage += "two rows of ";
			}
			if (breastRows.length == 3) {
				storage += RandomInCollection(["three rows of ", "multi-layered "]);
			}
			if (breastRows.length == 4) {
				storage += RandomInCollection(["four rows of ", "four-tiered "]);
			}
			if (breastRows.length == 5) {
				storage += RandomInCollection(["five rows of ", "five-tiered "]);
			}
			storage += biggestBreastDescript();
			return storage;
		}
		public function breastSize(val: Number): String {
			var descript: String = "";
			//Catch all for dudes.
			if (val < 1) 
			{
				if (rand(2) == 0)
				{
					var adjective:String = "";
					if (tone >= 100)
					{
						if (rand(4) == 0) return mf("extremely pronounced","very pronounced", true);
						else if (thickness > 70) return "immense";
						else if (thickness >= 30) return "robust";
						else return "chiseled";
					}
					else if (tone > 70)
					{
						if (rand(4) == 0) return mf("well-defined","well-toned", true);
						else if (thickness > 70) return "broad";
						else if (thickness >= 30) return "healthy";
						else return "fit";
					}
					else if (tone >= 30)
					{
						if (rand(4) == 0) return mf("toned","lightly-toned", true);
						else if (thickness > 70) return "thick";
						else if (thickness >= 30) return "average";
						else return "soft";
					}
					else
					{
						if (rand(4) == 0) return "unremarkable";
						else if (thickness > 70) return "wide";
						else if (thickness >= 30) return "passable";
						else return "flat";
					}
				}
				else
				{
					// Feminine/Andro, Low/Medium Tone
					if((mfn("m","f","n", true) != "m") && tone < 60) {
						return RandomInCollection(["soft, flat", "flat, girly", "smooth, featureless"]);
					}
					// Masculine, High Tone, High Thickness
					else if((mf("m","f", true) == "m") && tone >= 60 && thickness >= 60) {
						return RandomInCollection(["manly, rippling", "big, muscular", "beefcake"]);
					}
					// Masculine, Low Tone, High Thickness
					else if((mf("m","f", true) == "m") && tone <= 30 && thickness >= 60) {
						return RandomInCollection(["broad, cuddly", "bear-like", "fleshy, manly"]);
					}
					// Masculine/Feminine/Andro, High Tone, Low Thickness
					else if(tone >= 60 && thickness <= 30) {
						return RandomInCollection([mf("tight, firm","firm, flat", true), mf("hard, sleek","athletic", true), mf("fine, flat","sleek, firm", true)]);
					}
					// Default
					else {
						return RandomInCollection(["plain", "flat"]);
					}
				}
				//OLD.
				//return RandomInCollection(["tight", "hard", "fine", "manly"]);
			}
			//A-cup
			else if (val == 1) {
				descript += RandomInCollection(["cute", "soft", "small"]);
			}
			//Small - A->B
			else if (val <= 2) {
				descript += RandomInCollection(["palmable", "tight", "perky", "baseball-sized"]);
			}
			//C-D
			else if (val <= 4) {
				descript += RandomInCollection(["nice", "hand-filling", "well-rounded", "supple"]);
				// , "softball-sized";
			}
			//DD->big EE
			else if (val < 11) {
				descript += RandomInCollection(["big", "large", "pillowy", "jiggly", "volleyball-sized"]);
			}
			//F->big FF
			else if (val < 15) {
				descript += RandomInCollection(["soccerball-sized", "generous", "jiggling"]);
			}
			//G -> HHH
			else if (val < 24) {
				descript += RandomInCollection(["basketball-sized", "whorish", "cushiony", "wobbling"]);
			}
			//I -> KK
			else if (val < 35) {
				descript += RandomInCollection(["massive motherly", "luscious", "smothering", "prodigious"]);
			}
			//K- > MMM+
			else {
				descript += RandomInCollection(["mountainous", "monumental", "back-breaking", "exercise-ball-sized", "immense"]);
			}
			return descript;
		}
		public function breastDescript(rowNum: Number): String {
			//ERROR PREVENTION
			if (breastRows.length - 1 < rowNum) return "<b>ERROR, breastDescript() working with invalid breastRow</b>";
			if (breastRows.length == 0) return "<b>ERROR, breastDescript() called when no breasts are present.</b>";

			var descript: String = "";
			var milkied:Boolean = false;
			var bRowRating:Number = breastRows[rowNum].breastRating();
			/*
			if (bRowRating < 1) {
				if(rand(2) == 0)
				{
					if (tone < 30) return RandomInCollection([mf("pecs", "flat tits", true), mf("pectoral muscles", "flat breasts", true)]);
					return RandomInCollection(["pecs", "pectoral muscles"]);
				}
				return "flat, almost non-existent breasts";
			}*/
			//33% of the time size-descript them
			if (rand(3) == 0) descript += breastSize(bRowRating);
			//Lactation notices are rare unless near-empty or full!
			var lacBonusChance:Number = 0;
			if(canMilkSquirt()) lacBonusChance = 2;
			if(canLactate() && milkFullness < 10) lacBonusChance = 1;
			if (canLactate() && rand(8) <= (1+lacBonusChance))
			{
				var milkAdjectives:Array = [];
				//Tits reeel full
				if (milkFullness >= 80)
				{
					switch(milkType)
					{
						//Milk
						case GLOBAL.FLUID_TYPE_MILK:
						case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
						case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
						case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
						case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
						case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
							milkAdjectives.push("milk-packed", "milk-stuffed", "milk-filled", "fluid-filled","milk-engorged","swollen","engorged","stuffed","milk-bloated","lactation-swollen","milk-swollen","cream-filled","cream-stuffed","milk-stuffed","milk-laden","full","full");
							break;
						//Hunny Bunny
						case GLOBAL.FLUID_TYPE_HONEY:
						case GLOBAL.FLUID_TYPE_NECTAR:
						case GLOBAL.FLUID_TYPE_MILKSAP:
						case GLOBAL.FLUID_TYPE_CUMSAP:
						case GLOBAL.FLUID_TYPE_VANILLA:
						case GLOBAL.FLUID_TYPE_SUGAR:
							if(InCollection(milkType, [GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_NECTAR])) milkAdjectives.push("honey-laden","honey-stuffed","honey-engorged","honey-swollen");
							milkAdjectives.push("sugar-stuffed","sugar-swollen","sugar-laden","sugar-engorged","swollen","engorged","full","full");
							break;
						//Nonspecific weird-boob-filler
						default:
							milkAdjectives.push("lactation-engorged", "fluid-filled","swollen","engorged","full","full","fluid-laden");
							break;
					}
				}
				//Enough milk to express sum milk
				//Not a ton of variance but shouldn't show up TOO much.
				else if (isLactating())
				{
					switch(milkType)
					{
						//Milk
						case GLOBAL.FLUID_TYPE_MILK:
						case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
						case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
						case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
						case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
						case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
							milkAdjectives.push("milky","milky","creamy","lactating","lactating","milky","motherly","motherly");
							break;
						//Hunny Bunny
						case GLOBAL.FLUID_TYPE_HONEY:
						case GLOBAL.FLUID_TYPE_NECTAR:
						case GLOBAL.FLUID_TYPE_MILKSAP:
						case GLOBAL.FLUID_TYPE_CUMSAP:
						case GLOBAL.FLUID_TYPE_VANILLA:
						case GLOBAL.FLUID_TYPE_SUGAR:
							if(InCollection(milkType, [GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_NECTAR])) milkAdjectives.push("honey-infused");
							milkAdjectives.push("sugary","sugary","sugary","motherly");
							break;
						//Nonspecific gets NUTHING
					}
				}
				//Fuckin' empty bro
				else 
				{
					if(rand(5) != 0) milkAdjectives.push("drained",(fluidNoun(milkType) + "-drained"),"empty","empty");
				}
				if(milkAdjectives.length > 0)
				{
					if (descript != "") descript += ", ";
					descript += RandomInCollection(milkAdjectives);
				}
				//Used to prevent milk-related nounse from being used.
				milkied = true;			
			}
			// A-cups
			if(bRowRating == 1) {
				if(descript != "") descript += ", ";
				descript += RandomInCollection(["tiny", "girly", "waifish"]) + " ";
				descript += RandomInCollection(["breasts", "mammaries", "boobs", "tits"]);
			}
			else if(bRowRating < 1) {
				if(descript != "") descript += " ";
				descript += "pecs";
			}
			else if(bRowRating > 1) {
				var adjectives:Array = [];
				// Silicone
				var silicone:Number = siliconeRating("tits");
				var siliconePref:int = statusEffectv1("Silicone Preference");
				if(silicone > 0 && siliconePref != -1 && rand(2) == 0) {
					adjectives.length = 0;
					if(silicone >= 2) adjectives.push("gravity defying");
					if(silicone >= 5) adjectives.push("ridiculously perky");
					if(siliconePref != 1 && siliconePref != 2)
					{
						adjectives.push("fake", "plastic");
						if(silicone >= 4) adjectives.push("bolt-on");
					}
					if(siliconePref != 2) adjectives.push("artificially-enhanced", "augmented", "silicone-filled");
					if(bRowRating >= 4) adjectives.push("perfectly rounded", "globular");
					if(descript != "") descript += ", ";
					descript += adjectives[rand(adjectives.length)];
				}
				if(descript != "") descript += " ";
				descript += chestNoun(rowNum,milkied);
			}
			return descript;
		}
		//"milkied" is used to tell if a milk description was appended. If not, lactation-enhanced nounage can show up :3
		public function breastNoun(rowNum:int = 99, milkied:Boolean = false):String
		{
			if(rowNum < 0 || rowNum == 99) rowNum = 0;
			var nouns:Array = [];
			var bRowRating:Number = breastRows[rowNum].breastRating();
			var silicone:Number = siliconeRating("tits");
			var siliconePref:int = statusEffectv1("Silicone Preference");
			if (isLactating())
			{
				if(!milkied)
				{
					if(bRowRating >= 5)
					{
						if(InCollection(milkType,GLOBAL.FLUID_TYPE_NECTAR,GLOBAL.FLUID_TYPE_NECTAR) && bRowRating >= 2) nouns.push("sugar-melon","honey-melon");
						nouns.push("milk-tank","milk-jug");
					}
					else nouns.push("milker","milker");
				}
				if(bRowRating >= 2) nouns.push("udder", "udder", "udder", "udder");
			}
			nouns.push("breast", "breast", "breast", "breast", "breast", "breast");
			nouns.push("tit", "tit", "tit");
			if(bRowRating > 6) nouns.push("tit");
			if(silicone > 0 && siliconePref != -1) {
				nouns.push("balloon");
				if(silicone >= 2) nouns.push("balloon");
				if(silicone >= 5) nouns.push("balloon");
				if(silicone >= 10) nouns.push("balloon");
			}
			nouns.push("jug");
			//Disabled due to "pillowy love-pillows" nouns.push("love-pillow");
			nouns.push("boob");
			nouns.push("mammary");
			nouns.push("melon");
			nouns.push("mound");
			
			return nouns[rand(nouns.length)];
		}
		//"milkied" is used to tell if a milk description was appended. If not, lactation-enhanced nounage can show up :3
		public function chestNoun(rowNum:int = 99, milkied:Boolean = false):String
		{
			if (rowNum < 0 || rowNum == 99) rowNum = 0;
			if (breastRows[rowNum].breastRating() < 1) return "chest";
			return plural(breastNoun(rowNum, milkied));
		}
		public function biggestBreastDescript(): String {
			return (breastDescript(biggestTitRow()));
		}

		public function cocksMatch():Boolean 
		{
			return matchedCocks();
		}
		public function matchedCocks():Boolean {
			//After the first cock, see if they match against the previous.
			for(var x:int = 1; x < cocks.length; x++)
			{
				//Don't match? NOT MATCHED. GTFO.
				if(cocks[x].cType != cocks[x-1].cType) return false;
			}
			return true;
		}

		public function eachCockHead(): String {
			if (cocks.length == 1) return "your " + cockHead(-1);
			return "each of your " + plural(cockHead(-1));
		}
		public function oneCockHead(): String {
			if (cocks.length == 1) return "your " + cockHead(-1);
			return "one of your " + plural(cockHead(-1));
		}
		public function cockHead(cockNum: Number = 0): String {
			if (cockNum >= cocks.length) return "ERROR";
			var temp: int;
			var type: int;
			if (cocks.length <= 0)
				return "ERROR. CockHead lookup with no cocks!";
			if (cockNum < 0) type = GLOBAL.TYPE_HUMAN;
			else type = cocks[cockNum].cType;

			return cockHeadGetName(type);
		}
		public function cockHeadNoun(cockNum: Number = 0):String {
			if (cocks.length <= 0)
				return "ERROR. CockHeadNoun lookup with no cocks!";
			return cockHead(cockNum).split(" ").pop();
		}
		public function cockHeads(cockNum:Number = 0):String {
			if(cocks.length == 1) return cockHead(cockNum);
			return plural(cockHead(cockNum));
		}
		public function cockHeadsNoun():String
		{
			if(cocks.length == 1) return cockHead(0).split(" ").pop();
			if(cocksMatch()) return plural(cockHead(0).split(" ").pop());
			return plural(cockHead(-1).split(" ").pop());
		}
		public function tailCockHead(): String {
			if (!hasTailCock()) return "|||<b>ERROR:</b> No tail cock to describe |||";
			return cockHeadGetName(tailGenitalArg);
		}
		public function tailCockHeads(): String {
			if (!hasTailCock()) return "|||<b>ERROR:</b> No tail cock to describe |||";
			if (tailCount == 1) return cockHeadGetName(tailGenitalArg);
			return plural(cockHeadGetName(tailGenitalArg));
		}
		public function cockHeadGetName(type: int = 0): String {
			var names: Array;
			
			switch(type)
			{
				case GLOBAL.TYPE_EQUINE:
					names = ["flare", "blunt head", "equine glans", "flat tip", "cock-head"];
					break;
				case GLOBAL.TYPE_FROSTWYRM:
					names = ["flare", "blunt head", "flat tip", "cock-head"];
					break;
				case GLOBAL.TYPE_CANINE:
				case GLOBAL.TYPE_VULPINE:
					names = ["canine crown", "pointed cock-head", "narrow glans", "tip", "cock-head"];
					break;
				case GLOBAL.TYPE_DEMONIC:
					names = ["tainted crown", "nubby head", "demonic glans", "nub-ringed tip", "cock-head"];
					break;
				case GLOBAL.TYPE_TENTACLE:
					names = ["crown", "tentacle-head", "floral glans", "tip", "mushroom-like tip", "wide, plant-like crown"];
					break;
				case GLOBAL.TYPE_JANERIA:
					names = ["crown", "tentacle-head", "tip", "diamond-shaped tip", "pointed head", "tapered tip", "piscine glans", "piscine crown", "piscine cock-head"];
					break;
				case GLOBAL.TYPE_NAGA:
				case GLOBAL.TYPE_LIZAN:
				case GLOBAL.TYPE_SNAKE:
				case GLOBAL.TYPE_DRACONIC:
				case GLOBAL.TYPE_GRYVAIN:
					names = ["point", "narrow tip", "pointed glans", "tip", "pointed tip", "reptilian crown"];
					break;
				case GLOBAL.TYPE_ANEMONE:
				case GLOBAL.TYPE_SIREN:
					names = ["eye-catching tip", "tentacle-ringed glans", "exotic cock-head", "aphrodisiac-laced head", "wiggling crown"];
					break;
				case GLOBAL.TYPE_SAURIAN:
					names = ["nubbed crown", "nubby head", "monstrous glans", "nub-ringed tip", "cock-head"];
					break;
				case GLOBAL.TYPE_NYREA:
					names = ["x-shaped crown", "alien head", "flared glans", "exotic tip", "cock-head"];
					break;
				case GLOBAL.TYPE_GABILANI:
					names = ["coupled crown", "paired head", "doubled glans", "twinned tip", "doubled cock-head"];
					break;
				case GLOBAL.TYPE_VANAE:
					names = ["suckler crown", "suckered head", "bowl-like glans", "sucker tip", "suckered cock-head"];
					break;
				case GLOBAL.TYPE_HRAD:
					names = ["bullet-shaped tip", "angry cock-head", "foreskin-covered crown", "foreskin-covered tip", "bullet-shaped head"];
					break;
				case GLOBAL.TYPE_SHARK:
					names = ["pointed head", "tapered tip", "piscine glans", "piscine crown", "piscine cock-head"];
					break;
				default:
					names = ["crown", "head", "glans", "tip", "cock-head"];
					break;
			}
			
			return RandomInCollection(names);
		}

		/**
		 * Effectively an interface to define the default sexual preferences for a given creature.
		 * Ensure that the function is overridden before calling this (or the error can be replaced with a "default" set
		 * of possible sexprefs for ALL creatures.
		 */
		public function setDefaultSexualPreferences(): void
		{
			throw new Error("Sexual preferences must be configured on a per-creature basis before this function should be called! Override the function signature in the child creature class.");
		}
		
		/**
		 * These methods are stubs, intended to be overriden on a character-by-character basis.
		 * Check the PlayerCharacter class to see what I mean.
		 */
		
		public function loadInCunt(cumFrom:Creature = null, vagIndex:int = -1):Boolean
		{
			if (cumFrom is PlayerCharacter) sstdChecks(cumFrom,"vagina");
			// Only run the knockup shit if the creature actually gets saved
			if (neverSerialize == false && cumFrom != null)
			{
				cumflationHappens(cumFrom,vagIndex);
				if(this is Emmy) 
				{
					createStatusEffect("Drain Cooldown");
					setStatusMinutes("Drain Cooldown",250);
				}
				return tryKnockUp(cumFrom, vagIndex);
			}
			else
			{
				trace("WARNING: Attempting to call knockUp on a Creature class that isn’t serialized to save data. Better check this shit yo.");
			}
			return false;
		}
		public function loadInAss(cumFrom:Creature = null):Boolean
		{
			if (cumFrom is PlayerCharacter) sstdChecks(cumFrom,"ass");
			if (neverSerialize == false && cumFrom != null)
			{
				cumflationHappens(cumFrom,3);
				return tryKnockUp(cumFrom, 3);
			}
			else
			{
				trace("WARNING: Attempting to call knockUp on a Creature class that isn’t serialized to save data. Better check this shit yo.");
			}
			return false;
		}
		public function milkInMouth(milkFrom:Creature = null):Boolean
		{
			if (milkFrom is PlayerCharacter) sstdChecks(milkFrom,"mouth");
			return false;
		}
		public function girlCumInMouth(cumFrom:Creature = null):Boolean
		{
			if (cumFrom is PlayerCharacter) sstdChecks(cumFrom,"mouth");
			return false;
		}
		public function loadInMouth(cumFrom:Creature = null):Boolean
		{
			if (cumFrom is PlayerCharacter) sstdChecks(cumFrom,"mouth");
			if (cumFrom != null) cumflationHappens(cumFrom,4);
			return false;
		}
		public function loadInNipples(cumFrom:Creature = null):Boolean
		{
			if (cumFrom is PlayerCharacter) sstdChecks(cumFrom,"nipple");
			return false;
		}
		
		public function loadInCuntTail(cumFrom:Creature = null):Boolean
		{
			if (cumFrom is PlayerCharacter) sstdChecks(cumFrom,"tail cunt");
			if (neverSerialize == false && cumFrom != null)
			{
				return tryKnockUp(cumFrom, 4);
			}
			else
			{
				trace("Warning: Attempting to call knockUp on a Creature class that isn’t serialized to save data. Better check this shit yo.");
			}
			return false;
		}
		public function addBiomass(arg:Number):void
		{
			kGAMECLASS.gooBiomass(arg);
		}
		public function cumflationHappens(cumFrom:Creature, hole:Number):void
		{
			// Exceptions
			if(cumFrom.hasStatusEffect("Ovilium Effect")) return;
			
			var fluidType:int = GLOBAL.FLUID_TYPE_CUM;
			var fluidVolume:Number = 0;
			
			if(cumFrom != null)
			{
				fluidType = cumFrom.cumType;
				fluidVolume = cumFrom.cumQ();
			}
			
			// Goo fluid absorb
			if(!cumflationEnabled())
			{
				if(hairType == GLOBAL.HAIR_TYPE_GOO && fluidVolume > 0) addBiomass(fluidVolume);
				return;
			}
			
			var effectDesc:String = (this is PlayerCharacter ? ("You’ve got some fluids inside you" + ((cumFrom is PlayerCharacter) ? "" : ", leftovers from a recent lover") + ".") : "Leftovers from a recent lover.");
			
			if(hole >= 0 && hole < 3)
			{
				// Pregnant vaginas can't get cumflated?
				if(!hasVagina() || isPregnant(hole)) fluidVolume = 0;
				if(fluidVolume <= 0) return;
				
				if(!hasStatusEffect("Vaginally-Filled")) createStatusEffect("Vaginally-Filled",fluidVolume,fluidVolume,fluidType,0,false,"Icon_Vagina",effectDesc,false,0,0xB793C4);
				else
				{
					setStatusTooltip("Vaginally-Filled",effectDesc);
					//Track the new type.
					setStatusValue("Vaginally-Filled",3,fluidType);
					//Add the liquid volume.
					addStatusValue("Vaginally-Filled",1,fluidVolume);
					//If new high score, set it.
					if(statusEffectv1("Vaginally-Filled") > statusEffectv2("Vaginally-Filled")) setStatusValue("Vaginally-Filled",2,statusEffectv1("Vaginally-Filled"));
				}
			}
			else if(hole == 3)
			{
				if(fluidVolume <= 0) return;
				
				if(!hasStatusEffect("Anally-Filled")) createStatusEffect("Anally-Filled",fluidVolume,fluidVolume,fluidType,0,false,"Icon_Donut",effectDesc,false,0,0xB793C4);
				else
				{
					setStatusTooltip("Anally-Filled",effectDesc);
					//Track the hole it's in along with the new type.
					setStatusValue("Anally-Filled",3,fluidType);
					//Add the liquid volume.
					addStatusValue("Anally-Filled",1,fluidVolume);
					//If new high score, set it.
					if(statusEffectv1("Anally-Filled") > statusEffectv2("Anally-Filled")) setStatusValue("Anally-Filled",2,statusEffectv1("Anally-Filled"));
				}
			}
			else if(hole == 4)
			{
				if(fluidVolume <= 0) return;
				
				if(!hasStatusEffect("Orally-Filled")) createStatusEffect("Orally-Filled",fluidVolume,fluidVolume,fluidType,0,false,"Icon_Lips_Glossed",effectDesc,false,0,0xB793C4);
				else
				{
					setStatusTooltip("Orally-Filled",effectDesc);
					//Track the hole it's in along with the new type.
					setStatusValue("Orally-Filled",3,fluidType);
					//Add the liquid volume.
					addStatusValue("Orally-Filled",1,fluidVolume);
					//If new high score, set it.
					if(statusEffectv1("Orally-Filled") > statusEffectv2("Orally-Filled")) setStatusValue("Orally-Filled",2,statusEffectv1("Orally-Filled"));
				}
			}
		}
		
		/**
		 * Defined impregnation handler that this Creature will attempt to use.
		 */
		public var impregnationType:String = "";
		
		// Male-centric stuff (Father)
		public var cumQualityRaw:Number = 1;
		public var cumQualityMod:Number = 0;
		public function cumQuality(arg:Number = 0):Number
		{
			if(arg != 0)
			{
				cumQualityRaw += arg;
			}
			if (hasBirthControl() || hasPerk("Infertile") || hasPerk("Firing Blanks"))
			{
				if (hasPerk("Infertile") || !hasStatusEffect("Priapin")) return 0;
			}
			var bonus:Number = 0;
			bonus += perkv1("Virile");
			bonus += statusEffectv1("Priapin");
			bonus += statusEffectv4("Rut");
			bonus += statusEffectv4("Lagonic Rut");
			return (cumQualityRaw + cumQualityMod + bonus);
		}
		
		/**
		 * Virility should be the overall multiplier used to modify the basePregnancyChance of any given pregnancy.
		 * It should include all things that could possibly influence the raw "power" of virility.
		 * @return
		 */
		public function virility(arg:Number = 0):Number
		{
			return cumQuality(arg);
		}
		
		public var pregnancyIncubationBonusFatherRaw:Number = 1;
		public var pregnancyIncubationBonusFatherMod:Number = 0;
		public function pregnancyIncubationBonusFather():Number
		{
			return pregnancyIncubationBonusFatherRaw + pregnancyIncubationBonusFatherMod;
		}
		
		// Female-centric stuff (Mother)
		public var pregnancyMultiplierRaw:Number = 1;
		public var pregnancyMultiplierMod:Number = 0;
		public function pregnancyMultiplier():Number
		{
			var bonus:Number = 0;
			bonus += perkv1("Broodmother");
			return (pregnancyMultiplierRaw + pregnancyMultiplierMod + bonus);
		}
		
		public var fertilityRaw:Number = 1;
		public var fertilityMod:Number = 0;
		public function fertility(arg:Number = 0):Number
		{
			if(arg != 0)
			{
				fertilityRaw += arg;
			}
			if (hasBirthControl() || hasPerk("Infertile") || hasPerk("Sterile")) return 0;
			var bonus:Number = 0;
			bonus += perkv1("Fertility");
			bonus += statusEffectv1("Heat");
			
			return fertilityRaw + fertilityMod + bonus;
		}
		
		public var pregnancyIncubationBonusMotherRaw:Number = 1;
		public var pregnancyIncubationBonusMotherMod:Number = 0;
		public function pregnancyIncubationBonusMother():Number
		{
			var bonus:Number = 0;
			if(hasPerk("Incubator")) bonus += perkv1("Incubator");
			if(hasPerk("Breed Hungry")) bonus += 1;
			return pregnancyIncubationBonusMotherRaw + pregnancyIncubationBonusMotherMod + bonus;
		}
		
		public function hasBirthControl():Boolean
		{
			if(hasStatusEffect("Infertile")) return true;
			return false;
		}
		
		public var bellyRatingRaw:Number = 0;
		public var bellyRatingMod:Number = 0;
		public function bellyRating():Number
		{
			var bonus:Number = 0;
			var numEggs:int = eggCount();
			
			if(numEggs > 50) bonus += (numEggs - 50) * 0.01;
			bonus += perkv3("Fecund Figure");
			bonus += statusEffectv1("Anally-Filled")/1000;
			bonus += statusEffectv1("Vaginally-Filled")/1000;
			bonus += statusEffectv1("Orally-Filled")/1000;
			
			var currBellyRating:Number = bellyRatingRaw + bellyRatingMod + bonus;
			
			if (currBellyRating < 0)
			{
				return 0;
			}
			else
			{
				return currBellyRating;
			}
		}
		public var bellyPiercing:ItemSlotClass = new EmptySlot();
		
		// Pregnancy Data Storage
		public var pregnancyData:Array = new Array();
		
		// Pregnancy Utility Methods
		
		/**
		 * Determine if a creature has a pregnancy. Optionally supply an index to check for a specific pregnancy slot.
		 * @param	slot	index to check, -1 for any
		 * @return			true/false
		 */
		public function isPregnant(slot:int = -1):Boolean
		{
			// Any pregnancy
			if (slot == -1)
			{
				for (var i:int = 0; i < pregnancyData.length; i++)
				{
					if ((pregnancyData[i] as PregnancyData).pregnancyType != "") return true;
				}
			}
			
			// Check the slot is in range
			if (slot < -1 || slot > 3)
			{
				throw new Error("isPregnant argument out of range. Expected -1 to 3, got " + slot);
			}
			if (slot >= pregnancyData.length)
			{
				throw new Error("isPregnant not of normal range. Currently -1 to " + (pregnancyData.length - 1) + ", got " + slot);
			}
			
			// Find a pregnancy in a given slot
			if (slot >= 0 && slot <= 3)
			{
				if (!hasVagina(slot) && slot != 3)
				{
					return false;
				}
				
				if ((pregnancyData[slot] as PregnancyData).pregnancyType != "") return true;
			}
			
			return false;
		}
		public function isFullyWombPregnant():Boolean
		{
			return (totalWombPregnancies() >= vaginas.length);
		}
		public function isFullyPregnant():Boolean
		{
			return (isFullyWombPregnant() && hasAnalPregnancy());
		}
		public function hasPregnancy():Boolean { return isPregnant(); }
		public function hasWombPregnancy():Boolean
		{
			return (totalWombPregnancies() > 0);
		}
		public function hasAnalPregnancy():Boolean
		{
			return (isPregnant(3));
		}
		
		// Get pregnancy time in minutes.
		public function getPregnancyTime(slot:int = -1):Number
		{
			if (isPregnant(slot))
			{
				var pData:PregnancyData = null;
				var pTime:Number = 0;
				
				// Latest-most pregnancy
				if (slot == -1)
				{
					var nTime:Number = 0;
					for (var i:int = 0; i < pregnancyData.length; i++)
					{
						pData = pregnancyData[i];
						nTime = (Math.floor(pData.pregnancyIncubation * (1 / pData.pregnancyIncubationMulti)));
						if (pTime > nTime) pTime = nTime;
					}
				}
				else
				{
					pData = pregnancyData[slot];
					pTime = (Math.floor(pData.pregnancyIncubation * (1 / pData.pregnancyIncubationMulti)));
				}
				return pTime;
			}
			return 0;
		}
		public function getPregnancyTimeString(slot:int = -1, casualOnly:Boolean = false, article:Boolean = true):String
		{
			return shortMinutes(getPregnancyTime(slot), casualOnly, article);
		}
		
		//Argument is the same string as defined in the handler.
		//Example: VenusPitcherSeedCarrier
		public function hasPregnancyOfType(type:String):Boolean
		{
			for (var i:int = 0; i < pregnancyData.length; i++)
			{
				if ((pregnancyData[i] as PregnancyData).pregnancyType == type) return true;
			}
			return false;
		}
		
		public function hasPregnancyOfTypeOtherThan(type:String):Boolean
		{
			for (var i:int = 0; i < pregnancyData.length; i++)
			{
				if ((pregnancyData[i] as PregnancyData).pregnancyType != "" && (pregnancyData[i] as PregnancyData).pregnancyType != type) return true;
			}
			
			return false;
		}
		
		public function getPregnancyOfType(type:String):PregnancyData
		{
			for (var i:int = 0; i < pregnancyData.length; i++)
			{
				if ((pregnancyData[i] as PregnancyData).pregnancyType == type) return pregnancyData[i];
			}
			return null;
		}
		
		public function findPregnancyOfType(type:String):int
		{
			for (var i:int = 0; i < pregnancyData.length; i++)
			{
				if ((pregnancyData[i] as PregnancyData).pregnancyType == type) return i;
			}
			return -1;
		}
		
		public function hasPregnancyOfChildType(type:uint):Boolean
		{
			return PregnancyManager.hasPregnancyOfChildType(this, type);
		}
		
		/**
		 * Find the total number of pregnancies for a given creature.
		 * @return			total pregnancies
		 */
		public function totalPregnancies():int
		{
			var count:int = 0;
			for (var i:int = 0; i < pregnancyData.length; i++)
			{
				if ((pregnancyData[i] as PregnancyData).pregnancyType != "") count++;
			}
			return count;
		}
		public function totalWombPregnancies():int
		{
			var count:int = 0;
			for (var i:int = 0; i < vaginas.length; i++)
			{
				if ((pregnancyData[i] as PregnancyData).pregnancyType != "") count++;
			}
			return count;
		}
		public function totalPregnanciesOfType(type:String):int
		{
			var count:int = 0;
			for (var i:int = 0; i < pregnancyData.length; i++)
			{
				if ((pregnancyData[i] as PregnancyData).pregnancyType == type) count += 1;
			}
			return count;
		}
		public function totalBabiesOfType(type:String):int
		{
			var count:int = 0;
			for (var i:int = 0; i < pregnancyData.length; i++)
			{
				if ((pregnancyData[i] as PregnancyData).pregnancyType == type) count += (pregnancyData[i] as PregnancyData).pregnancyQuantity;
			}
			return count;
		}
		
		/**
		 * Find the index of the first empty pregnancy slot
		 * @return			index of the first empty pregnancy slot, -1 if none available.
		 */
		public static const PREGSLOT_NONE:uint = 99;
		public static const PREGSLOT_ANY:uint = 0;
		public static const PREGSLOT_VAG:uint = 1;
		public static const PREGSLOT_ASS:uint = 2;
		public function findEmptyPregnancySlot(type:uint):int
		{
			if (type == PREGSLOT_ANY || type == PREGSLOT_VAG)
			{
				for (var i:int = 0; i < vaginas.length; i++)
				{
					if ((pregnancyData[i] as PregnancyData).pregnancyType == "") return i;
				}
			}
			
			if (type == PREGSLOT_ANY || type == PREGSLOT_ASS)
			{
				if ((pregnancyData[3] as PregnancyData).pregnancyType == "") return 3;
			}
			
			return -1;
		}
		public function findUsedPregnancySlot(type:uint):int
		{
			if (type == PREGSLOT_ANY || type == PREGSLOT_VAG)
			{
				for (var i:int = 0; i < vaginas.length; i++)
				{
					if ((pregnancyData[i] as PregnancyData).pregnancyType != "") return i;
				}
			}
			
			if (type == PREGSLOT_ANY || type == PREGSLOT_ASS)
			{
				if ((pregnancyData[3] as PregnancyData).pregnancyType != "") return 3;
			}
			
			return -1;
		}
		
		//Used for ovipositors
		public var eggs: int = 0;
		public var fertilizedEggs: int = 0;
		
		/*
		public function canOvipositSpider(): Boolean 
		{
			if (eggs >= 10 && hasTailFlag(GLOBAL.FLAG_OVIPOSITOR) && isDrider()) return true;
			return false;
		}
		
		public function canOvipositBee(): Boolean 
		{
			if (eggs >= 10 && hasTailFlag(GLOBAL.FLAG_OVIPOSITOR) && tailType == GLOBAL.TYPE_BEE) return true;
			return false;
		}
		*/

		//Fuck you, Nonesuch
		public function isBlocked(arg:Number):Boolean
		{
			if(isPlugged(arg)) return true;
			//Blocked via other method?
			if(isChastityBlocked(arg)) return true;
			//No pluggo, boyo
			return false;
		}
		//No but seriously, come on man.
		public function isPlugged(arg:Number):Boolean
		{
			var hole:VaginaClass = ass;
			var holed:Boolean = false;
			if (arg == -1) 
			{
				holed = true;
				hole = ass;
			}
			else if(arg >= 0 && arg < vaginas.length)
			{
				holed = true;
				hole = vaginas[arg];
			}
			//Oh no - plugged with goo or some shit!
			if(holed) { 
				if(hole.hasFlag(GLOBAL.FLAG_PLUGGED)) return true; 
			}
			return false;
		}
		public function pluggedVaginas():Number
		{
			if(vaginas.length <= 0) return 0;
			var count:Number = 0;
			for(var i:int = 0; i < vaginas.length; i++)
			{
				if(vaginas[i].hasFlag(GLOBAL.FLAG_PLUGGED)) count++;
			}
			return count;
		}
		public function blockedVaginas():Number
		{
			if(vaginas.length <= 0) return 0;
			var count:Number = 0;
			for(var i:int = 0; i < vaginas.length; i++)
			{
				if(vaginas[i].hasFlag(GLOBAL.FLAG_PLUGGED) || isChastityBlocked(i)) count++;
			}
			return count;
		}
		public function pickUnblocked():Number
		{
			var options:Array = [];
			for(var i:int = 0; i < vaginas.length; i++)
			{
				if(!isBlocked(i)) options.push(i);
			}
			if(options.length == 0) return -1;
			else return options[rand(options.length)];
		}
		//Why you gotta do me like this?
		public function isChastityBlocked(arg:Number):Boolean
		{
			if(arg >= 0 && lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_VAGINAL_CHASTITY)) return true;
			if(arg == -1 && lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANAL_CHASTITY)) return true;
			return false;
		}

		public function canOviposit(slot:String = "any"): Boolean 
		{
			//if (canOvipositSpider() || canOvipositBee()) return true;
			if (eggs < 10) return false;
			
			var ovipossible:Boolean = false;
			switch(slot)
			{
				case "tail":
					if(totalTailOvipositors() > 0) ovipossible = true;
					break;
				case "penis":
				case "dick":
				case "cock":
					if(totalCockOvipositors() > 0) ovipossible = true;
					break;
				case "vagina":
				case "pussy":
				case "cunt":
					if(totalVagOvipositors() > 0) ovipossible = true;
					break;
				case "any":
					if(hasOvipositor()) ovipossible = true;
					break;
			}
			
			return ovipossible;
		}
		
		public function hasTailOvipositor(): Boolean 
		{
			return (hasTailFlag(GLOBAL.FLAG_OVIPOSITOR) && tailCount > 0);
		}
		public function isCockOvipositor(slot:int = -1): Boolean 
		{
			if (slot >= 0 && cocks.length > 0 && cocks[slot].hasFlag(GLOBAL.FLAG_OVIPOSITOR)) return true;
			return false;
		}
		public function isVaginaOvipositor(slot:int = -1): Boolean 
		{
			if (slot >= 0 && vaginas.length > 0 && vaginas[slot].hasFlag(GLOBAL.FLAG_OVIPOSITOR)) return true;
			return false;
		}
		public function totalTailOvipositors(): int 
		{
			var count:int = 0;
			if (hasTailOvipositor()) count = tailCount;
			return count;
		}
		public function totalCockOvipositors(): int 
		{
			var x:int = 0;
			var count:int = 0;
			if (cocks.length > 0)
			{
				for(x = 0; x < cocks.length; x++)
				{
					if(isCockOvipositor(x)) count++;
				}
			}
			return count;
		}
		public function totalVagOvipositors(): int 
		{
			var x:int = 0;
			var count:int = 0;
			if (vaginas.length > 0)
			{
				for(x = 0; x < vaginas.length; x++)
				{
					if(isVaginaOvipositor(x)) count++;
				}
			}
			return count;
		}
		public function totalOvipositors(): int 
		{
			return (totalTailOvipositors() + totalCockOvipositors() + totalVagOvipositors());
		}
		public function hasOvipositor(): Boolean 
		{
			if (totalOvipositors() > 0) return true;
			return false;
		}
		
		// countType: -1 is unfertilized only, 1 is fertilized only, 0 is all
		public function eggCount(countType:int = 0):Number
		{
			var bonus:Number = 0;
			if(countType == 0 || countType == -1) bonus += statusEffectv1("Nyrea Eggs");
			
			if(countType == -1) return ((eggs - fertilizedEggs) + bonus);
			if(countType == 1) return (fertilizedEggs + bonus);
			return (eggs + bonus);
		}
		
		public function addEggs(arg: int = 0): int 
		{
			if (!canOviposit()) return -1;
			else {
				eggs += arg;
				//if (eggs > 50) eggs = 50;
			}
			return eggs;
		}
		
		public function dumpEggs(): void 
		{
			if (!canOviposit()) return;
			eggs = 0;
			fertilizedEggs = 0;
		}
		
		public function setEggs(arg: int = 0): int 
		{
			if (!canOviposit()) return -1;
			else {
				eggs = arg;
				if (eggs > 50) eggs = 50;
				return eggs;
			}
		}
		
		public function fertilizeEggs(slot:String = "any", percent:Number = 50): int 
		{
			if(this is PlayerCharacter)
			{
				if(slot == "tail" && hasCuntSnake()) return kGAMECLASS.fertilizeCuntSnake();
			}
			if (!canOviposit(slot)) return -1;
			fertilizedEggs += Math.round(eggs * percent / 100);
			if (fertilizedEggs > eggs) fertilizedEggs = eggs;
			return fertilizedEggs;
		}
		
		// countType: -1 is unfertilized only, 1 is fertilized only, 0 is all
		// if all, unfertilized eggs take priority
		public function releaseEggs(countType:int = 0, percent:Number = 50): Number 
		{
			var eggsOut:Number = 0;
			var numEggs:Number = eggs;
			if(countType == -1) numEggs = (eggs - fertilizedEggs);
			if(countType == 1) numEggs = (fertilizedEggs);
			
			eggsOut = numEggs - Math.round(numEggs * percent / 100);
			
			if(countType == 1)
			{
				if(eggsOut > fertilizedEggs) eggsOut = fertilizedEggs;
				fertilizedEggs -= eggsOut;
			}
			else
			{
				if(eggsOut > eggs) eggsOut = eggs;
				eggs -= eggsOut;
			}
			
			if(fertilizedEggs > eggs) fertilizedEggs = eggs;
			if(fertilizedEggs < 0) fertilizedEggs = 0;
			if(eggs < 0) eggs = 0;
			
			return eggsOut;
		}
		
		// Preg slot is the incubation slot we're gonna occupy, following the same rules as the array
		// 0 is butt, 1-3 are vagina(s)
		// This isn't perfect, but it's a start.
		/**
		 * Try to impregnate this creature.
		 * @param	cumFrom
		 * @param	pregSlot
		 * @return	success/failure
		 */
		public function tryKnockUp(cumFrom:Creature, pregSlot:int = -1):Boolean
		{
			// Vagina/butt slot checking
			if (pregSlot < -2 || (pregSlot >= 0 && pregSlot <= 2 && !hasVagina(pregSlot)) || pregSlot > 4)
			{
				throw new Error("Unexpected pregnancy slot used to call tryKnockUp.");
			}
			
			// The array storing chars will just throw out a null if a key doesn't exist - catch that and shit out an obvious error.
			if (cumFrom == null)
			{
				if(this is PlayerCharacter && kGAMECLASS.hasOvalastingEgg(this, pregSlot))
				{
					cumFrom = kGAMECLASS.ovalastingPregnancySwap(cumFrom, this, pregSlot);
					return PregnancyManager.tryKnockUp(cumFrom, this, pregSlot);
				}
				throw new Error("Null creature used to call tryKnockUp. Does this creature actually have a defined statblock?");
			}
			
			if(!cumFrom.hasStatusEffect("Ovilium Effect") && this is PlayerCharacter && kGAMECLASS.hasOvalastingEgg(this, pregSlot))
			{
				// Ovalasting abort for vaginas that get preg while unfertilized
				if(pregSlot >= 0 && pregSlot <= 2 && pregnancyData[pregSlot] != "OvalastingEggPregnancy")
				{
					if(PregnancyManager.tryKnockUp(cumFrom, this, pregSlot))
					{
						createStatusEffect("Ovalasting Early Clutch Timer", pregSlot, 0, 0, 0, true, "", "", false, 60);
						return true;
					}
				}
				cumFrom = kGAMECLASS.ovalastingPregnancySwap(cumFrom, this, pregSlot);
			}
			
			return PregnancyManager.tryKnockUp(cumFrom, this, pregSlot);
		}
		
		// Find the handler(s) dealing with the creatures current pregnancy(ies) and query them for descriptive output 
		public function pregBellyFragment():String
		{
			if (!isPregnant()) return "ERROR: No current pregnancies";
			
			var tarSlot:int = -1;
			
			for (var i:int = 0; i < 4; i++)
			{
				if (isPregnant(i))
				{
					if (tarSlot == -1) tarSlot = i;
					else if (pregnancyData[i].pregnancyBellyRatingContribution > pregnancyData[tarSlot].pregnancyBellyRatingContribution) tarSlot = i;
				}
			}
			
			if (tarSlot != -1)
			{
				return PregnancyManager.getPregBellyFragment(this, tarSlot);
			}
			
			return "ERROR: Couldn’t find a valid pregnancy slot but the creature is defined as being pregnant. SHITS FUCKED YO.";
		}
		
		public function addPregnancyBellyMod(pregSlot:int, value:Number, perOffspring:Boolean = true):void
		{
			// Error, out of range!
			if(pregSlot < 0 || pregSlot >= pregnancyData.length) return;
			
			var pData:PregnancyData = pregnancyData[pregSlot];
			var addValue:Number = value;
			
			if (perOffspring) addValue *= pData.pregnancyQuantity;
			
			if (pData.pregnancyType != "")
			{
				pData.pregnancyBellyRatingContribution += addValue;
				bellyRatingMod += addValue;
				trace("Adding", addValue, "bellyRating from pregnancy in slot", pregSlot);
			}
			else
			{
				trace("Attempted to add bellyRating contribution to a null pregnancy.");
			}
		}
		public function cuntsChange(volume:Number, display:Boolean = true):void
		{
			for(var b:int = 0; b < vaginas.length; b++) {
				cuntChange(b,volume,display);
			}
		}
		public function cuntChange(arg:int, volume:Number, display:Boolean = true, spacingsF:Boolean = true, spacingsB:Boolean = false):Boolean 
		{
			//Notice for treated PCs with increased stretchiness.
			if(hasStatusEffect("Treatment Elasticity Report Needed"))
			{
				if(!hasStatusEffect("Treatment Elasticity Report Q'ed")) createStatusEffect("Treatment Elasticity Report Q'ed");
			}
			//Actually change.
			return holeChange(arg,volume,display,spacingsF,spacingsB);
		}
		
		public function buttChange(volume:Number, display:Boolean = true, spacingsF:Boolean = true, spacingsB:Boolean = false):Boolean 
		{
			//Notice for treated PCs with increased stretchiness.
			if(hasStatusEffect("Treatment Elasticity Report Needed"))
			{
				if(!hasStatusEffect("Treatment Elasticity Report Q'ed")) createStatusEffect("Treatment Elasticity Report Q'ed",1);
			}
			//Actually change.
			return holeChange(-1,volume,display,spacingsF,spacingsB);
		}
		
		// Cock penetrates vagina/ass
		public function cockChange(spacingsF:Boolean = true, spacingsB:Boolean = false, display:Boolean = true):Boolean 
		{
			if (cockVirgin && hasCock())
			{
				cockVirgin = false;
				if(display)
				{
					var msg:String = "";
					if(spacingsF) msg += " ";
					msg += "<b>"
					if (this is PlayerCharacter)
					{
						msg += "You have succumbed to your desires and lost your";
						if (hasVagina()) msg += " masculine";
						msg += " virginity.";
					}
					else
					{
						msg += capitalA + short + " has succumbed to " + mf("his", "her") + " desires and lost " + mf("his", "her");
						if (hasVagina()) msg += " masculine";
						msg += " virginity.";
					}
					msg += "</b>"
					if (spacingsB) msg += " ";
					output(msg);
				}
				return true;
			}
			return false;
		}
		// Cock being penetrated
		public function cockHoleChange(hole:int = -1, volume:Number = 0, display:Boolean = true, spacingsF:Boolean = true, spacingsB:Boolean = false):Boolean 
		{
			if(hole > cocks.length - 1) return false;
			
			// True Doll penetration marker
			if(hasPerk("True Doll")) addPerkValue("True Doll", 3, 1);
			
			return true;
		}
		// Vagina/Ass being penetrated
		public function holeChange(hole:int, volume:Number, display:Boolean = true, spacingsF:Boolean = true, spacingsB:Boolean = false):Boolean 
		{
			var stretched:Boolean = false;
			var devirgined:Boolean = false;
			var capacity:Number;
			var holePointer:VaginaClass;
			//Set capacity based on the hole.
			if(hole == -1) {
				capacity = analCapacity();
				holePointer = ass;
			}
			else {
				if(hole+1 > vaginas.length) return false;
				else {
					capacity = vaginalCapacity(hole);
					holePointer = vaginas[hole];
				}
			}
			
			// True Doll penetration marker
			if(hasPerk("True Doll")) addPerkValue("True Doll", 3, 1);
			
			// ignore stretching!
			if(isStretchImmune()) {
				stretched = false;
			}
			//cArea > capacity = autostreeeeetch.
			else if(volume >= capacity) {
				if(holePointer.looseness() >= 5) {}
				else holePointer.looseness(1);
				stretched = true;
			}
			//If within top 10% of capacity, 50% stretch
			else if(volume >= (.9 * capacity) && rand(2) == 0) {
				holePointer.looseness(1);
				stretched = true;
			}
			//if within 75th to 90th percentile, 25% stretch
			else if(volume >= (.75 * capacity) && rand(4) == 0) {
				holePointer.looseness(1);
				stretched = true;
			}
			//If virgin
			if (holePointer.hymen || (hole < 0 && analVirgin) || (hole >= 0 && vaginalVirgin)) {
				if (display)
				{
					var msg:String = "";
					if (spacingsF) msg += " ";
					
					if (this is PlayerCharacter)
					{
						if (holePointer.hymen && hole >= 0)
						{
							msg += "<b>Your hymen is torn";
							holePointer.hymen = false;
							if (vaginalVirgin) msg += ", robbing you of your vaginal virginity";
							msg += ".</b>";
						}
						else if (hole < 0)
						{
							msg += "<b>You have been penetrated";
							if (analVirgin) msg += ", robbing you of your anal virginity";
							msg += ".</b>";
						}
					}
					else
					{
						if (holePointer.hymen && hole >= 0)
						{
							msg += "<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " hymen is torn";
							holePointer.hymen = false;
							if (hole >= 0 && vaginalVirgin)	msg += ", robbing " + mf("him", "her") + " of " + mf("his", "her") + " vaginal virginity";
							msg += ".</b>";
						}
						else if (hole < 0)
						{
							msg += "<b>" + capitalA + short + " has been penetrated";
							if (hole < 0 && analVirgin) msg += ", robbing " + mf("him", "her") + " of " + mf("his", "her") + " anal virginity";
							msg += ".</b>";
						}
					}
					if(spacingsB) msg += " ";
					output(msg);
				}
				
				if (hole >= 0 && vaginalVirgin) 
				{
					vaginalVirgin = false;
					holePointer.hymen = false;
					devirgined = true;
				}
				else if (hole < 0 && analVirgin)
				{
					analVirgin = false;
					devirgined = true;
				}
			}
			//Delay anti-stretching
			if(volume >= (.35 * capacity)) {
				if(hole >= 0) {
					holePointer.shrinkCounter = 0;
				}
				else {
					holePointer.shrinkCounter = 0;
				}
			}
			if(stretched) {
				trace(short + " HOLE CODE #:" + hole + " STRETCHED TO " + holePointer.looseness() + ".");
				//STRETCH SUCCESSFUL - begin flavor text if outputting it!
				if(display) {
					//Virgins get different formatting
					if(devirgined) {
						//If no spaces after virgin loss
						if(!spacingsB) output(" ");
					}
					//Non virgins as usual
					else if(spacingsF) output(" ");
					if (hole >= 0) {
						if (this is PlayerCharacter)
						{
							if(holePointer.looseness() >= 5) output("<b>Your " + vaginaDescript(hole) + " is stretched painfully wide, gaped in a way that practically invites huge monster-cocks to plow you.</b>");
							else if(holePointer.looseness() >= 4) output("<b>Your " + vaginaDescript(hole) + " painfully stretches, the lips now wide enough to gape slightly.</b>");
							else if(holePointer.looseness() >= 3) output("<b>Your " + vaginaDescript(hole) + " is now somewhat loose.</b>");
							else if(holePointer.looseness() >= 2) output("<b>Your " + vaginaDescript(hole) + " is a little more used to insertions.</b>");
							else output("<b>Your " + vaginaDescript(hole) + " is stretched out a little bit.</b>");
						}
						else
						{
							if(holePointer.looseness() >= 5) output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + vaginaDescript(hole) + " is stretched painfully wide, gaped in a way that practically invites huge monster-cocks to plow " + mf("him", "her") +".</b>");
							else if(holePointer.looseness() >= 4) output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + vaginaDescript(hole) + " painfully stretches, the lips now wide enough to gape slightly.</b>");
							else if(holePointer.looseness() >= 3) output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + vaginaDescript(hole) + " is now somewhat loose.</b>");
							else if(holePointer.looseness() >= 2) output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + vaginaDescript(hole) + " is a little more used to insertions.</b>");
							else output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + vaginaDescript(hole) + " is stretched out a little bit.</b>");
						}
					}
					else if (hole < 0) {
						if (this is PlayerCharacter)
						{
							if(holePointer.looseness() >= 5) output("<b>Your " + assholeDescript() + " is stretched painfully wide, gaped in a way that practically invites huge monster-cocks to plow you.</b>");
							else if(holePointer.looseness() >= 4) output("<b>Your " + assholeDescript() + " painfully dilates, the pucker now able to gape slightly.</b>");
							else if(holePointer.looseness() >= 3) output("<b>Your " + assholeDescript() + " is now somewhat loose.</b>");
							else if(holePointer.looseness() >= 2) output("<b>Your " + assholeDescript() + " is a little more used to insertions.</b>");
							else output("<b>Your " + assholeDescript() + " is stretched out a little bit.</b>");
						}
						else
						{
							if(holePointer.looseness() >= 5) output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + assholeDescript() + " is stretched painfully wide, gaped in a way that practically invites huge monster-cocks to plow " + mf("him", "her") +".</b>");
							else if(holePointer.looseness() >= 4) output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + assholeDescript() + " painfully stretches, the lips now wide enough to gape slightly.</b>");
							else if(holePointer.looseness() >= 3) output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + assholeDescript() + " is now somewhat loose.</b>");
							else if(holePointer.looseness() >= 2) output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + assholeDescript() + " is a little more used to insertions.</b>");
							else output("<b>" + (capitalA == "" ? short + "’s" : capitalA + possessive(short)) + " " + assholeDescript() + " is stretched out a little bit.</b>");
						}
					}
					if(spacingsB) output(" ");
				}
			}
			return (stretched || devirgined);
		}
		
		public function isStretchImmune():Boolean
		{
			if(hasPerk("True Doll") && elasticity >= perkv1("True Doll")) return true;
			return false;
		}
		
		public function instaBuzzed():String
		{
			var outputS:String = "";
			//Imbibe some to keep party train going.
			imbibeAlcohol(20);
			var thisStatus:StorageClass = getStatusEffect("Alcohol");
		
			if (thisStatus == null) return "";
			
			//Bump booze in blood up to buzzed level
			if(thisStatus.value2 < 25) thisStatus.value2 = 25;
			
			// Alcohol is consumed at a rate of 1 unit per minute
			if (!hasStatusEffect("Buzzed"))
			{
				createStatusEffect("Buzzed",0,0,0,0, false, "Icon_DizzyDrunk", "You’re a little buzzed, leaving you feeling strong but a little slower of wit and weaker of will.\n\nThis status will expire as your alcohol levels drop.", false, 0,0xB793C4);
				physiqueMod += 2;
				willpowerMod -= 1;
				intelligenceMod -= 1;
				if(this is PlayerCharacter) outputS += "\n\nDamn, that stuff you were drinking was awesome. <b>You’re feeling pretty good right now. You must be buzzed.</b>";
			}
			return outputS;
		}
		public function instaDrunk():String
		{
			var outputS:String = "";
			//Imbibe some to keep party train going.
			imbibeAlcohol(30);
			var thisStatus:StorageClass = getStatusEffect("Alcohol");
		
			if (thisStatus == null) return "";
			
			//Bump booze in blood up to drunko level
			if(thisStatus.value2 < 50) thisStatus.value2 = 50;
			
			// Alcohol is consumed at a rate of 1 unit per minute
			if (!hasStatusEffect("Buzzed"))
			{
				createStatusEffect("Buzzed",0,0,0,0, false, "Icon_DizzyDrunk", "You’re a little buzzed, leaving you feeling strong but a little slower of wit and weaker of will.\n\nThis status will expire as your alcohol levels drop.", false, 0,0xB793C4);
				physiqueMod += 2;
				willpowerMod -= 1;
				intelligenceMod -= 1;
				if(this is PlayerCharacter) outputS += "\n\nDamn, that stuff you were drinking was awesome. <b>You’re feeling pretty good right now. You must be buzzed.</b>";
			}
			if (!hasStatusEffect("Drunk"))
			{
				if (hasStatusEffect("Buzzed"))
				{
					getStatusEffect("Buzzed").hidden = true;
				}
				physiqueMod += 2;
				reflexesMod -= 1;
				createStatusEffect("Drunk",0,0,0,0, false, "Icon_DizzyDrunk", (this is PlayerCharacter ? "You’re feeling a little drunk at the moment. Your faculties and reflexes are dulled, but you feel like you could arm wrestle the world if you were so inclined.\n\nThis status will expire as your alcohol levels drop." : ""), false, 0,0xB793C4);
				if(this is PlayerCharacter) outputS += "\n\nYour sense of balance is slipping a little. <b>You might be a little drunk. Just a little, you assure yourself.</b>";
			}
			return outputS;
		}
		public function instaSmashed():String
		{
			var outputS:String = "";
			//Imbibe some to keep party train going.
			imbibeAlcohol(30);
			var thisStatus:StorageClass = getStatusEffect("Alcohol");
			
			if (thisStatus == null) return "";
			
			//Bump booze in blood up to smashed level
			if(thisStatus.value2 < 75) thisStatus.value2 = 75;
			
			// Alcohol is consumed at a rate of 1 unit per minute
			if (!hasStatusEffect("Buzzed"))
			{
				createStatusEffect("Buzzed",0,0,0,0, false, "Icon_DizzyDrunk", (this is PlayerCharacter ? "You’re a little buzzed, leaving you feeling strong but a little slower of wit and weaker of will.\n\nThis status will expire as your alcohol levels drop." : ""), false, 0,0xB793C4);
				physiqueMod += 2;
				willpowerMod -= 1;
				intelligenceMod -= 1;
				if(this is PlayerCharacter) outputS += "\n\nDamn, that stuff you were drinking was awesome. <b>You’re feeling pretty good right now. You must be buzzed.</b>";
			}
			if (!hasStatusEffect("Drunk"))
			{
				if (hasStatusEffect("Buzzed"))
				{
					getStatusEffect("Buzzed").hidden = true;
				}
				physiqueMod += 2;
				reflexesMod -= 1;
				createStatusEffect("Drunk",0,0,0,0, false, "Icon_DizzyDrunk", (this is PlayerCharacter ? "You’re feeling a little drunk at the moment. Your faculties and reflexes are dulled, but you feel like you could arm wrestle the world if you were so inclined.\n\nThis status will expire as your alcohol levels drop." : ""), false, 0,0xB793C4);
				if(this is PlayerCharacter) outputS += "\n\nYour sense of balance is slipping a little. <b>You might be a little drunk. Just a little, you assure yourself.</b>";
			}
			if (!hasStatusEffect("Smashed"))
			{
				if (hasStatusEffect("Drunk"))
				{
					getStatusEffect("Drunk").hidden = true;
				}
				physiqueMod += 1;
				reflexesMod -= 1;
				willpowerMod -= 1;
				intelligenceMod -= 1;
				createStatusEffect("Smashed",0,0,0,0, false, "Icon_DizzyDrunk", (this is PlayerCharacter ? "You’re three sheets to the wind, but you feel like you could flip a truck.\n\nThis status will expire as your alcohol levels drop." : ""), false, 0,0xB793C4);
				if(this is PlayerCharacter) return outputS += "\n\n" + ParseText("[pc.Walking] is increasingly difficult, but you’ll be damned if you don’t feel like you can do anything. <b>You’re smashed!</b>");
			}
			return outputS;
		}

		public function imbibeAlcohol(alcoholRating:int = 1):void
		{
			//E'rrybody should have dis status yo, it's da TiTS.
			if(!hasStatusEffect("Alcohol")) createStatusEffect("Alcohol",0,0,0,0);
			//V1 stores the PC's current alcohol belly level.
			//V2 is the actual blood drunkeness
			addStatusValue("Alcohol",1,alcoholRating);
			//100% alcohol is yer cap
			if(statusEffectv1("Alcohol") >= 100) setStatusValue("Alcohol",1,100);
			tolerance(1);
		}

		public function tolerance(arg:Number = 0):Number
		{
			if(!hasStatusEffect("Tolerance")) createStatusEffect("Tolerance",0,0,0,0);
			var currentTolerance:Number = statusEffectv1("Tolerance");
			if(arg != 0) 
			{
				//Bounds check
				if(currentTolerance + arg < 0) setStatusValue("Tolerance",1,0);
				else if(currentTolerance + arg > 100) setStatusValue("Tolerance",1,100);
				else addStatusValue("Tolerance",1,arg);
			}
			return statusEffectv1("Tolerance");
		}
		public function isDrunk():Boolean
		{
			return (hasStatusEffect("Drunk") || hasStatusEffect("Smashed"));
		}
		public function isSmashed():Boolean
		{
			return hasStatusEffect("Smashed");
		}
		public function isBuzzed():Boolean
		{
			return (hasStatusEffect("Buzzed") || hasStatusEffect("Drunk") || hasStatusEffect("Smashed"));
		}
		
		public function hasHorns(hType:Number = 0):Boolean
		{
			if (horns > 0 && hornType != 0)
			{
				// Specific type
				if (hType > 0 && hType == hornType) return true;
				// Any type
				if (hType == 0 ) return true;
			}
			return (hasStatusEffect("Horn Bumps"));
		}
		public function hasLongHorns():Boolean
		{
			return (hasHorns() && hornLength > 3);
		}
		public function removeHorns():void
		{
			hornType = 0;
			horns = 0;
			hornLength = 0;
			removeStatusEffect("Horn Bumps");
			removeStatusEffect("Horn Style");
			return;
		}
		
		public function eachHorn():String
		{
			if (horns > 1) return "each of your " + plural(hornDescript());
			return "your " + hornDescript();
		}
		
		public function oneHorn():String
		{
			if (horns > 1) return "one of your " + plural(hornDescript());
			return "your " + hornDescript();
		}
		
		public function hornsDescript():String
		{
			if (horns > 1) return plural(hornDescript());
			return hornDescript();
		}
		
		public function hornDescript(): String 
		{
			var descript: String = "";
			var descripted: Number = 0;
			var types: Array = [];
	
			if(hasStatusEffect("Horn Bumps"))
			{
				if (rand(3) == 0)
				{
					descript += RandomInCollection("visible ", "upraised ");
				}
				descript += "horn-bump";
			}
			else
			{
				//Length Adjective - 50% chance
				if (rand(3) == 0) {
					//tiny
					if (hornLength < 1) {
						descript += RandomInCollection("tiny", "little", "petite", "diminutive", "miniature");
						descripted++;
					}
					//small
					else if (hornLength < 2) {
						descript += RandomInCollection("one-inch", "small");
						descripted++;
					}
					//two-inch
					else if (hornLength < 3) {
						descript += "two-inch";
						descripted++;
					}
					//three-inch
					else if (hornLength < 4) {
						descript += "three-inch";
						descripted++;
					}
					//medium
					else if (hornLength < 5) {
						descript += RandomInCollection("four-inch", "noticeable");
						descripted++;
					}
					//big
					else if (hornLength < 6) {
						descript += RandomInCollection("five-inch", "big");
						descripted++;
					}
					//half-foot
					else if (hornLength < 8) {
						descript += "half-foot";
						descripted++;
					}
					//large
					else if (hornLength < 12) {
						descript += RandomInCollection("long", "substantial", "large");
						descripted++;
					}
					//foot
					else if (hornLength == 12) {
						descript += "foot-long";
						descripted++;
					}
					//huge
					else if (hornLength < 20) {
						descript += RandomInCollection("very large", "considerable", "hulking", "huge", "vast");
						descripted++;
					}
					//ginormous
					else {
						descript += RandomInCollection("monster", "tremendous", "colossal", "enormous", "oversized", "glorious");
						descripted++;
					}
				}
				//Descriptive descriptions - 50% chance of being called
				if (rand(3) == 0 && descripted < 2) {
					switch (hornType)
					{
						case GLOBAL.TYPE_XHELARFOG:
							types.push(hornColor+" gradated", "curved together");
							break;
						case GLOBAL.TYPE_FROSTWYRM:
						case GLOBAL.TYPE_DRACONIC:
							types.push("draconic");
							break;
						case GLOBAL.TYPE_GRYVAIN:
							types.push("draconic", "ridged");
							break;
						case GLOBAL.TYPE_DEMONIC:
							types.push("demonic", "sinister");
							break;
						case GLOBAL.TYPE_BOVINE:
							types.push("bovine");
							break;
						case GLOBAL.TYPE_LIZAN:
							types.push("reptilian");
							break;
						case GLOBAL.TYPE_DEER:
							types.push("deer-like");
							break;
						case GLOBAL.TYPE_GOAT:
							switch(statusEffectv1("Horn Style"))
							{
								case 1: types.push("curled", "ridged", "bony", "ornate"); break;
								case 2: types.push("bow-curved", "ridged", "bony", "ornate"); break;
								case 3: types.push("ibex", "thick", "back-curved", "imperious", "ridged"); break;
								case 4: types.push("oryx", "ridged", "slender", "curved"); break;
								case 5: types.push("markhor", "wisting", "regal", "bony"); break;
							}
							types.push("goat");
							break;
						case GLOBAL.TYPE_SHEEP:
							if (hornLength >= 10) types.push("ram");
							else types.push("ewe");
							types.push("sheep");
							break;
						case GLOBAL.TYPE_RHINO:
							types.push("rhino");
							if(horns > 2) types.push("dinosaur", "saurian");
							break;
						case GLOBAL.TYPE_NARWHAL:
							types.push("narwhal", "unicorn-like");
							break;
						case GLOBAL.TYPE_DRYAD:
							types.push("dryad", (hornLength < 12 ? "twig" : "branch") + "-like", "oaken");
							if(hornLength > 12) types.push("tree-like");
							break;
						case GLOBAL.TYPE_DZAAN:
							types.push("dzaan", "keratin");
							break;
					}
					if(types.length > 0)
					{
						if (descripted > 0) descript += ", ";
						descript += RandomInCollection(types);
						descripted++;
					}
				}
				//Horn nouns
				if (descripted > 0) descript += " ";
				descript += hornNoun();
			}
			
			return descript;
		}
		public function hornsNoun():String 
		{
			if (horns > 1) return plural(hornNoun());
			return hornNoun();
		}
		public function hornNoun():String 
		{
			//Horn nouns
			if(InCollection(hornType, GLOBAL.TYPE_DEER, GLOBAL.TYPE_DRYAD)) return "antler";
			return "horn";
		}
		public function hornColor():String 
		{
			var sColor:String = "";
			if(hornType == GLOBAL.TYPE_SAURMORIAN) sColor = "silver";
			if(hasStatusEffect("Horn Style")) sColor = getStatusTooltip("Horn Style");
			
			return (sColor != "" ? sColor : "naturally-colored");
		}
		
		public function hasAntennae(aType:Number = 0):Boolean
		{
			if (antennae > 0 && antennaeType != 0)
			{
				// Specific type
				if (aType > 0 && aType == antennaeType) return true;
				// Any type
				if (aType == 0) return true;
			}
			return false; 
		}
		public function removeAntennae():void
		{
			antennaeType = GLOBAL.TYPE_HUMAN;
			antennae = 0;
			return;
		}
		public function antennaeDescript(asPlural:Boolean = true): String 
		{
			var description:String = "";
			var adjectives:Array = [];
			var nouns:Array = ["antenna"];
			var noun:String = "antenna";
			
			switch (antennaeType)
			{
				default:
					adjectives.push("non-existent");
					break;
					
				case GLOBAL.TYPE_BEE:
					adjectives.push("zil", "bee-like", "insect-like", "insectile");
					nouns.push("feeler");
					break;
				case GLOBAL.TYPE_SYDIAN:
					adjectives.push("sydian", "brush-like", "bristly", "insectile");
					nouns.push("feeler");
					break;
				case GLOBAL.TYPE_MYR:
					adjectives.push("myr", "ant-like", "insect-like", "insectile");
					nouns.push("feeler");
					break;
				case GLOBAL.TYPE_MOTHRINE:
					adjectives.push("mothrine", "feather-like", "feathery", "frilly", "expressive", "foot-long");
					nouns.push("feeler");
					break;
				case GLOBAL.TYPE_HRAD:
					adjectives.push("hradian", "bubble-topped", "ball-tipped", "orb-capped", "alien");
					break;
			}
			
			if(adjectives.length > 0 && rand(2) == 0) description += RandomInCollection(adjectives) + " ";
			if(nouns.length > 1) noun = RandomInCollection(nouns);
			
			if(asPlural && antennae > 1)
			{
				if(noun == "antenna") noun += "e";
				else noun = plural(noun);
			}
			
			description += noun;
			
			return description;
		}
		
		// Calculates the value of body strength (carry threshold).
		public function bodyStrength():Number
		{
			// Raw body weight
			var nBodyWeight:Number = bodyWeight();
			// Muscles buff, how much extra body weight can PC lift
			var nMuscles:Number = ((tone * nBodyWeight) * (physique() / 100));
			// Assume weakest PC can lift their own body weight, each physique point adds 'm' more pounds
			var m:Number = 5;
			var nStrength:Number = nBodyWeight + nMuscles + (physique() * m);
			// Modifiers:
			if(hasStatusEffect("Buzzed")) nStrength += (m/2);
			if(hasStatusEffect("Drunk")) nStrength += m;
			if(hasStatusEffect("Smashed")) nStrength += (2*m);
			
			return nStrength;
		}
		// Calculates the body weight, without the extra bits.
		public function bodyWeight():Number
		{
			// Simple BMI: 20 is underweight, 25 is average, 30 is overweight
			var nBMI:Number = (25 + ((thickness - 50) / 10));
			if (hasPerk("Hollow Bones")) nBMI -= perkv1("Hollow Bones"); // usually 10
			if (nBMI < 5) nBMI = 5; // to avoid total weirdshit
			// Raw body weight, assume without extra parts
			var nWeight: Number = ((tallness / 12) * nBMI * (tallness / 75));
			
			// Tiny boost for heeps
			if(hipRating() > 0) nWeight += (hipRating() * (tallness / 60) * 0.1);
			
			// Special bodies
			if(isGoo()) nWeight *= (0.75 + ((legCount - 1) * 0.125));
			else if(isTaur()) nWeight *= (1.75 + ((legCount - 4) * 0.125));
			else if(isNaga()) nWeight *= (1.5 + ((legCount - 1) * 0.125));
			else if(isDrider()) nWeight *= (1.25 + (legCount * 0.05));
			else if(legCount > 2) nWeight *= (1 + (legCount * 0.125));
			
			return nWeight;
		}
		public function fullBodyWeight():Number
		{
			return bodyPartWeight("total");
		}
		private function bodyPartParse(partName:String = "none"):String
		{
			// Parsing stuff:
			if(InCollection(partName, "total", "all", "body", "everything", "full")) partName = "total";
			else if(InCollection(partName, "breast", "breasts", "boob", "boobs", "tit", "tits")) partName = "breast";
			else if(InCollection(partName, "belly", "tummy", "stomach", "womb")) partName = "belly";
			else if(InCollection(partName, "butt", "ass", "booty", "rump", "rear", "heinie")) partName = "butt";
			else if(InCollection(partName, "clitoris", "clit", "clits", "button", "buzzer")) partName = "clitoris";
			else if(InCollection(partName, "penis", "penises", "cock", "cocks", "dong", "wiener")) partName = "penis";
			else if(InCollection(partName, "testicle", "testicles", "balls", "scrotum", "nuts", "prostate")) partName = "testicle";
			
			return partName;
		}
		// Calculates weight of a body part.
		public function bodyPartWeight(partName:String = "none", partNum: Number = -1):Number
		{
			// Initialize variables:
			var num: int = 0;
			var tempSize: Number = 0;
			var weight: Number = 0;
			var weightBreast: Number = 0;
			var weightBelly: Number = 0;
			var weightButt: Number = 0;
			var weightClitoris: Number = 0;
			var weightPenis: Number = 0;
			var weightTesticle: Number = 0;
			var weightFluid: Number = 0; // Used for fluid weight
			var weightFat: Number = 0; // Used for excess weight
			
			partName = bodyPartParse(partName);
			
			// Everything:
			if(partName == "total")
			{
				weight += bodyWeight();
				partNum = -1;
			}
			// Breasts:
			if(partName == "breast" || partName == "total")
			{
				// Get total size/volume:
				tempSize = 0;
				if(partNum >= 0)
				{
					tempSize += breastRows[partNum].breastRating() * breastRows[partNum].breasts;
				}
				else
				{
					for (num = 0; num < breastRows.length; num++)
					{
						tempSize += breastRows[num].breastRating() * breastRows[num].breasts;
					}
				}
				// Calculate weight: Simple, Each cup is 10/25th lbs.
				weightBreast += tempSize * 0.4;
				// Modifiers:
				if(hasPerk("Fertility")) weightBreast *= 0.75;
				if(milkQ() > 0)
				{
					weightFluid = fluidWeight(milkQ(), milkType);
					if(isMilkTank()) weightFluid *= 0.5;
					else if(hasPerk("Milky") || hasPerk("Treated Milk")) weightFluid *= 0.75;
					if(partNum >= 0) weightFluid /= bRows();
					weightBreast += weightFluid;
				}
				if(thickness > tone)
				{
					weightFat = (thickness - tone) * 0.01;
					if(partNum >= 0) weightFat /= bRows();
					weightBreast += weightFat;
				}
			}
			// Belly:
			if(partName == "belly" || partName == "total")
			{
				// Get size/volume:
				tempSize = bellyRating() * (tallness / 60);
				// Calculate weight: Simple, Each size is half a pound.
				weightBelly += tempSize * 0.5;
				// Modifiers:
				if(isPregnant())
				{
					// offspring weight
					for (num = 0; num < pregnancyData.length; num++)
					{
						if(isPregnant(num))
						{
							tempSize = pregnancyData[num].pregnancyBellyRatingContribution;
							var pChildType:int = PregnancyManager.getPregnancyChildType(this, num);
							if(pChildType == GLOBAL.CHILD_TYPE_LIVE) tempSize *= 1;
							else if(pChildType == GLOBAL.CHILD_TYPE_EGGS) tempSize *= 0.50;
							else if(pChildType == GLOBAL.CHILD_TYPE_SEED) tempSize *= 0.35;
							weightBelly += tempSize;
						}
					}
					if(hasPerk("Breed Hungry")) weightBelly *= 0.75;
				}
				weightFluid = 0;
				weightFluid += fluidWeight(statusEffectv1("Anally-Filled"), statusEffectv3("Anally-Filled"));
				weightFluid += fluidWeight(statusEffectv1("Vaginally-Filled"), statusEffectv3("Vaginally-Filled"));
				weightFluid += fluidWeight(statusEffectv1("Orally-Filled"), statusEffectv3("Orally-Filled"));
				//if(hasCock() || balls > 0) weightFluid += fluidWeight((cumQ() * 0.5), cumType);
				weightBelly += weightFluid;
				// Generic ovipositor eggs
				if(eggs > 0) weightBelly += (0.125 * eggs);
				if(thickness > tone)
				{
					weightFat = (thickness - tone) * 0.01 * (tallness / 60);
					weightBelly += weightFat;
				}
			}
			// Butt:
			if(partName == "butt" || partName == "total")
			{
				// Get size/volume:
				tempSize = buttRating() * (tallness / 60);
				// Calculate weight: Simple, Each size is half a pound.
				weightButt += tempSize * 0.5;
				// Modifiers:
				if(thickness > tone)
				{
					weightFat = (thickness - tone) * 0.01 * (tallness / 60);
					weightButt += weightFat;
				}
			}
			// Clitoris:
			if(partName == "clitoris" || partName == "total")
			{
				// Get total length:
				tempSize = 0;
				if(hasVagina())
				{
					if(partNum >= 0) tempSize += clitLength * vaginas[partNum].clits;
					else tempSize += clitLength * totalClits();
					// Calculate weight: Simple, Each inch of length is 1/80th lbs.
					weightClitoris += tempSize * 0.0125;
					// Modifiers:
					if(hasPerk("Hung")) weightClitoris *= 0.75;
				}
			}
			// Penis:
			if(partName == "penis" || partName == "total")
			{
				// Get total size/volume:
				tempSize = 0;
				if(hasCock())
				{
					if(partNum >= 0)
					{
						tempSize += cockVolume(partNum);
					}
					else
					{
						for (num = 0; num < cocks.length; num++)
						{
							tempSize += cockVolume(num);
						}
					}
					// Calculate weight: Simple, Each volume unit is 1/20th lbs.
					weightPenis += tempSize * 0.05;
					// Modifiers:
					if(partNum >= 0)
					{
						if(hasKnot(partNum))
						{
							weightFat = cocks[partNum].thickness() * cocks[partNum].knotMultiplier * 0.25;
							weightPenis += weightFat;
						}
					}
					else
					{
						for (num = 0; num < cocks.length; num++)
						{
							if(hasKnot(num))
							{
								weightFat = cocks[num].thickness() * cocks[num].knotMultiplier * 0.25;
								weightPenis += weightFat;
							}
						}
					}
					if(hasPerk("Hung")) weightPenis *= 0.75;
				}
			}
			// Testicles:
			if(partName == "testicle" || partName == "total")
			{
				// Get total size/volume:
				tempSize = 0;
				if(hasCock() || balls > 0)
				{
					if(balls <= 0) num = 1;
					else num = balls;
					tempSize = ballVolume();
					// Calculate weight: Simple, Each volume unit is 1/80th lbs.
					weightTesticle += tempSize * num * 0.0125;
					// Modifiers:
					if(cumQ() > 0)
					{
						// Maybe only 50% is housed in the balls?
						weightFluid = fluidWeight((cumQ() * 0.5), cumType);
						if(hasPerk("Potent") && hasPerk("Breed Hungry")) weightFluid *= 0.5;
						else if(hasPerk("Potent") || hasPerk("Breed Hungry")) weightFluid *= 0.75;
						if(hasOvipositor() && hasStatusEffect("Nyrea Eggs")) weightFluid += (0.0125 * statusEffectv1("Nyrea Eggs"));
						if(partNum > 0 && partNum <= num) weightFluid = (weightFluid / num);
						weightTesticle += weightFluid;
					}
					if(hasPerk("Bulgy")) weightTesticle *= 0.75;
				}
			}
			
			// Add up all the weights
			weight += weightBreast;
			weight += weightBelly;
			weight += weightButt;
			weight += weightClitoris;
			weight += weightPenis;
			weight += weightTesticle;
			
			return weight;
		}
		// Calculates the weight of an amount of fluid.
		public function fluidWeight(fluidAmount: Number = 0, fluidType:int = -1):Number
		{
			// Reference: 1 mL is about 1/473.18 lbs
			//	1 mL of water is about 0.0022 lbs of water
			//	1 mL of honey is about 0.0033 lbs of honey
			
			if(InCollection(fluidType, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_MILKSAP, GLOBAL.FLUID_TYPE_CUMSAP, GLOBAL.FLUID_TYPE_NECTAR, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT)) fluidAmount *= 0.0035;
			else if(InCollection(fluidType, GLOBAL.FLUID_TYPE_CUM, GLOBAL.FLUID_TYPE_GABILANI_CUM, GLOBAL.FLUID_TYPE_NYREA_CUM, GLOBAL.FLUID_TYPE_VANAE_CUM)) fluidAmount *= 0.0027;
			else fluidAmount *= 0.0025;
			
			return fluidAmount;
		}
		// Weight Quotient for comparisons between strength (weight load).
		public function weightQ(partName:String = "none", partNum: Number = -1):Number
		{
			partName = bodyPartParse(partName);
			
			var weight: Number = bodyPartWeight(partName, partNum);
			
			// Compare to strength:
			return Math.round((weight / bodyStrength()) * 100);
		}
		// Is a part of anatomy heavy?
		// partName: String, name of part, 'total' for everything.
		// partNum: Number, row number or array ID if 0 or higher.
		public function isHeavy(partName:String = "none", partNum: Number = -1):Boolean
		{
			if(weightQ(partName, partNum) > 50) return true;
			return false;
		}
		// Height Ratio for comparisons.
		public function heightRatio(partName:String = "none", partNum: Number = -1):Number
		{
			var nRatio: Number = 0;
			
			if(partName == "total") { /* Nothing! */ }
			else if(partName == "breast")
			{
				if(hasBreasts())
				{
					if(partNum >= 0) nRatio = bRating(partNum) / tallness;
					else nRatio = biggestTitSize() / tallness;
				}
			}
			else if(partName == "belly") nRatio = bellyRating() / 20;
			else if(partName == "butt") nRatio = buttRating() / 20;
			else if(partName == "clitoris")
			{
				if(hasVagina()) nRatio = clitLength / tallness;
			}
			else if(partName == "penis")
			{
				if(hasCock())
				{
					if(partNum >= 0) nRatio = cLength(partNum) / tallness;
					else nRatio = biggestCockLength() / tallness;
				}
			}
			else if(partName == "testicle")
			{
				if(balls > 0) nRatio = ballDiameter() / tallness;
			}
			
			return nRatio;
		}
		
		public function isDefeated():Boolean
		{
			if (HP() <= 0 || lust() >= lustMax()) return true;
			return false;
		}
		
		/**
		 * Core combat AI handling; this methods called on each creature present in a fight
		 * (excepting the player).
		 * The array names are relative to the creature in question, f.ex
		 * PC vs NPC1, NPC2 =>
		 * 		PC alliedCreatures(PC), hostileCreatures(NPC1, NPC2)
		 * 		NPC1 alliedCreatures(NPC1, NPC2), hostileCreatures(PC)
		 */
		public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			throw new Error("Creature combat handler for " + short + " has not been overriden!");
		}
		
		/**
		 * Handy helper to select a potential target at random!
		 * TODO: Include some standard "weighting" effects to influence target selection
		 * f.ex prefer potential targets that have debuffs granting increased accuracy against them
		 * @param	otherTeam
		 * @return
		 */
		protected function selectTarget(otherTeam:Array):Creature
		{
			var selTarget:Creature = null;
			
			var posTargets:Array = [];
			
			for (var i:int = 0; i < otherTeam.length; i++)
			{
				// If it hasn't been defeated already this turn
				if (otherTeam[i].HP() > 0 && otherTeam[i].lust() < otherTeam[i].lustMax())
				{
					var posTarget:Object = { v: otherTeam[i], w: 10 };
					posTargets.push(posTarget);
					
					// Example "forced" effect selection
					if (otherTeam[i].hasStatusEffect("Focus Fire"))
					{
						selTarget = otherTeam[i];
					}
					
					// Smugglers are slightly less likely to be targeted
					if (otherTeam[i].characterClass == GLOBAL.CLASS_SMUGGLER)
					{
						posTarget.w -= 1;
					}
					// Mercs slightly more
					else if (otherTeam[i].characterClass == GLOBAL.CLASS_MERCENARY)
					{
						posTarget.w += 1;
					}
					
				}
			}
			
			if (posTargets.length == 0) selTarget = null;
			else if (posTargets.length == 1) selTarget = posTargets[0].v;
			else selTarget = weightedRand(posTargets);
			
			notifyTargetSelection(this, selTarget, this);
			
			return selTarget;
		}
		
		private function notifyTargetSelection(attacker:Creature, target:Creature, enemy:Creature):void
		{
			kGAMECLASS.setAttacker(attacker);
			kGAMECLASS.setTarget(target);
			kGAMECLASS.setEnemy(enemy);
		}
		
		/**
		 * Allow the energy cost of an attack to be potentially modified.
		 * @param	inCost
		 * @return
		 */
		public function CalculateEnergyCost(attack:SingleCombatAttack):Number
		{
			return attack.EnergyCost;
		}
		
		public function untypedDroneDamage(calc:String = ""):Number
		{
			var dmg:Number = 1 + level;
			var dmgMod:Number = (calc == "min" ? 0 : Math.round((2 + level) / 2));
			if(calc == "") dmg += rand(dmgMod);
			if(calc == "max") dmg += (dmgMod - 1);
			var bonus:Number = 0;
			
			if(hasPerk("Attack Drone") && hasActiveCombatDrone(true, true)) bonus += level;
			if(hasPerk("Drone Control")) bonus += Math.floor(bimboIntelligence()/4);
			
			return dmg + bonus;
		}
		
		public function droneDamage(calc:String = ""):TypeCollection
		{
			var d:Number = untypedDroneDamage(calc);
			return new TypeCollection( { electric: d } );
		}
		public function hasTamWolf():Boolean
		{
			return (accessory is TamWolf || accessory is TamWolfDamaged || accessory is TamWolfII);
		}
		
		public var droneTarget:Creature = null; // Transient
		public var concentratedFireTarget:Creature = null; // Transient
		public var isUniqueInFight:Boolean = false;
		public var uniqueName:String = null; // Transient
		public function get flags():Dictionary { return kGAMECLASS.flags; } // Transient
		public var alreadyDefeated:Boolean = false; // Transient
		public var shieldDisplayName:String = "SHIELDS"; // Transient
		public var hpDisplayName:String = "HP";
		
		/**
		 * Return the name for the bust this character should display. This'll be used during combat, but also potentially
		 * useful for other things. A getter function to support introspection to vary busts based on lust etc.
		 */
		public function get bustDisplay():String
		{
			return "";
		}
		
		public function getCombatDescriptionExtension():void
		{
			// noop
		}
		
		// These functions override the "creature is down" messages in group fights.
		// If they are null, the standard descriptions are used.
		// If they return a 0-length string ("") _no_ description is output.
		// Anything else is output. There is no baked in formatting to the output, but new lines are created.
		// f.ex do: return "<b>She ded!</b>"
		public function downedViaLust():String
		{
			return null;
		}
		
		public function downedViaHP():String
		{
			return null;
		}
		
		public var btnTargetText:String // Base text used for buttons
		public var buttonText:String; // Transient version of ^ with a unique ID appended
		
		//Cumflation
		//v1 = current in belly
		//v2 = most had in belly
		//v3 = most recent cum "type".
		public function cumFlationSimulate(timePassed:Number, doOut:Boolean = true):void
		{
			//Vag filled
			var z:int = -1;
			//Anally Filled
			var a:int = -1;
			//Orally filled
			var o:int = -1;
			//Place to store draining notices.
			var notice:String = "";
			var fluidType:int = GLOBAL.FLUID_TYPE_CUM;
			var amountVented:Number;
			var removals:Array = new Array();
			var cumDrain:Boolean = (!hasPerk("No Cum Leakage") && !hasStatusEffect("No Cum Leakage"));
			var amountStored:Number = 0;
			var omitNotice:Boolean = hasStatusEffect("Omit Cumflation Messages");
			
			//Find the index value for various types of cumflation.
			for(var x:int = 0; x < statusEffects.length; x++)
			{
				switch(statusEffects[x].storageName)
				{
					case "Anally-Filled":
						a = x;
						amountStored += statusEffects[a].value1;
						break;
					case "Vaginally-Filled":
						z = x;
						amountStored += statusEffects[z].value1;
						break;
					case "Orally-Filled":
						o = x;
						amountStored += statusEffects[o].value1;
						break;
				}
			}
			//If has vaginally-filled status effect!
			if(z >= 0)
			{
				amountVented = 0;
				fluidType = statusEffects[z].value3;
				// Plugged exceptions
				if(pluggedVaginas() >= vaginaTotal()) cumDrain = false;
				if(this is PlayerCharacter && armor is GooArmor && flags["GOO_ARMOR_AUTOSUCK"] == -1) cumDrain = false;
				//Fen - added blocked vag check here instead of in cumdrain as putting it in the cumdrain check would need a more complicated if check
				if(cumDrain && blockedVaginas() < vaginas.length && (!lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_VAGINALLY_SEALED) || statusEffects[z].value1 > 300000))
				{
					//Figure out how much cum is vented over time.
					//Should vent 1/2 the current amount over 30 minutes
					//+a small amount based off the maximum amount full you've been for this proc.
					amountVented = statusEffects[z].value1 / 4 / 2 + statusEffects[z].value2 / 48;
					//Mult times minutes passed
					amountVented *= timePassed/60;
					//trace("CURRENT CUM BANKED: " + statusEffects[z].value1 + " VENTING: " + amountVented);
					//Apply to actual status
					statusEffects[z].value1 -= amountVented;
					amountStored -= amountVented;
				}
				//Special notices!
				if(this is PlayerCharacter && notice == "")
				{
					if(armor is GooArmor && flags["GOO_ARMOR_AUTOCLEAN"] == 1)
					{
						if(amountVented >= 500 || statusEffects[z].value1 <= 0) notice = kGAMECLASS.gooArmorAutoCleanBlurb("cunt", amountVented, fluidType);
					}
					else if(amountVented >= 25000) 
					{
						notice = upperCase(fluidViscosity(fluidType)) + " " + fluidNoun(fluidType) + " hoses out ";
						if(legCount > 1) notice += ParseText("from between your [pc.legs] ");
						else notice += "of you ";
						notice += "in a seemingly endless tide. You can’t even move without wet gushes splattering onto the ground, marking a slut-shaming trail wherever you move.";
						if(!isCrotchExposed()) notice += ParseText(" It wouldn’t be so bad if most of it didn’t wind up inside your [pc.lowerGarments], leaving you slick and musky with residual love.");
					}
					else if(amountVented >= 10000)
					{
						notice = "Trailing " + fluidNoun(fluidType) + " behind you like slime from a slug, clearly marking your passage more effectively than any tracking bug ever could. There’s nothing you can do about it either, save for waiting for the boundless sexual effluvia to finish spilling from your soiled body.";
					}
					else if(amountVented >= 5000)
					{
						notice = "There’s so much " + fluidNoun(fluidType) + " sliding out of you. You can’t ";
						if(isNaga() || isGoo()) notice += "slither a few feet";
						else notice += "take a step";
						notice += ParseText(" without thick blobs of goo rolling down your [pc.leg] to the floor, advertising your sexual adventures to anyone close to enough to see, or smell, you.");
					}
					else if(amountVented >= 2500)
					{
						notice = upperCase(fluidNoun(fluidType)) + " is everywhere. It just won’t stop coming out of you. Sure, the more " + fluidViscosity(fluidType) + " goop leaks out, the tighter your belly becomes, but it’s just so damn messy! You’re pretty sure you could’ve filled up a two liter bottle and then some if you were so inclined. Just how thoroughly did you get stuffed?";
					}
					else if(amountVented >= 1000)
					{
						notice = upperCase(fluidNoun(fluidType)) + ParseText(" gets all over the place. It keeps drooling down your [pc.legOrLegs]");
						if(!isCrotchExposed()) notice += ParseText(" and getting all over your [pc.lowerGarments]");
						notice += ", squishing and sliding and making you absolutely reek of sex.";
					}
					else if(amountVented >= 500)
					{
						notice = "There’s no lack of " + fluidNoun(fluidType) + ParseText(" dripping down your [pc.thighs], evidence of your recent and all-too sloppy encounter.");
					}
					
					if (!omitNotice && notice != "")
					{
						AddLogEvent(notice, "words", timePassed);
						notice = "";
					}
				}
				if(statusEffects[z].value1 <= 0) removals.push("Vaginally-Filled");
			}
			//If has anally-filled status effect!
			if(a >= 0)
			{
				amountVented = 0;
				fluidType = statusEffects[a].value3;
				// Plugged exception
				if(isPlugged(-1)) cumDrain = false;
				if(this is PlayerCharacter && armor is GooArmor && flags["GOO_ARMOR_AUTOSUCK"] == -1) cumDrain = false;
				if(cumDrain && (!lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANALLY_SEALED) || statusEffects[a].value1 > 300000))
				{
					//Figure out how much cum is vented over time.
					//Should vent 1/2 the current amount over 30 minutes
					//+a small amount based off the maximum amount full you've been for this proc. 
					amountVented = statusEffects[a].value1 / 4 / 2 + statusEffects[a].value2 / 48;
					//Mult times minutes passed
					amountVented *= timePassed/60;
					//Apply to actual status
					statusEffects[a].value1 -= amountVented;
					amountStored -= amountVented;
				}
				//Special notices!
				if(this is PlayerCharacter && notice == "")
				{
					if(armor is GooArmor && flags["GOO_ARMOR_AUTOCLEAN"] == 1)
					{
						if(amountVented >= 500 || statusEffects[a].value1 <= 0) notice = kGAMECLASS.gooArmorAutoCleanBlurb("butt", amountVented, fluidType);
					}
					else if(amountVented >= 25000) 
					{
						notice = upperCase(fluidViscosity(fluidType)) + " " + fluidNoun(fluidType) + " hoses out ";
						if(legCount > 1) notice += ParseText("from between your [pc.legs] ");
						else notice += "of you ";
						notice += "in a seemingly endless tide. You can’t even move without wet gushes splattering onto the ground, marking a slut-shaming trail wherever you move.";
						if (!isCrotchExposed()) notice += ParseText(" It wouldn’t be so bad if most of it didn’t wind up inside your [pc.lowerGarments], leaving you slick and musky with residual love.");
					}
					else if(amountVented >= 10000)
					{
						notice = "Trailing " + fluidNoun(fluidType) + " behind you like slime from a slug, clearly marking your passage more effectively than any tracking bug ever could. There’s nothing you can do about it either, save for waiting for the boundless sexual effluvia to finish spilling from your soiled body.";
					}
					else if(amountVented >= 5000)
					{
						notice = "There’s so much " + fluidNoun(fluidType) + " sliding out of you. You can’t ";
						if(isNaga() || isGoo()) notice += "slither a few feet";
						else notice += "take a step";
						notice += ParseText(" without thick blobs of goo rolling down your [pc.leg] to the floor, advertising your sexual adventures to anyone close to enough to see, or smell, you.");
					}
					else if(amountVented >= 2500)
					{
						notice = upperCase(fluidNoun(fluidType)) + " is everywhere. It just won’t stop coming out of you. Sure, the more " + fluidViscosity(fluidType) + " goop leaks out, the tighter your belly becomes, but it’s just so damn messy! You’re pretty sure you could’ve filled up a two liter bottle and then some if you were so inclined. Just how thoroughly did you get stuffed?";
					}
					else if(amountVented >= 1000)
					{
						notice = upperCase(fluidNoun(fluidType)) + ParseText(" gets all over the place. It keeps drooling down your [pc.legOrLegs]");
						if(!isCrotchExposed()) notice += ParseText(" and getting all over your [pc.lowerGarments]");
						notice += ", squishing and sliding and making you absolutely reek of sex.";
					}
					else if(amountVented >= 500)
					{
						notice = "There’s no lack of " + fluidNoun(fluidType) + ParseText(" dripping down your [pc.thighs], evidence of your recent and all-too sloppy encounter.");
					}
					
					if (!omitNotice && notice != "")
					{
						AddLogEvent(notice, "words", timePassed);
						notice = "";
					}
				}
				if(statusEffects[a].value1 <= 0) removals.push("Anally-Filled");
			}
			//If has orally-filled status effect!
			if(o >= 0)
			{
				amountVented = 0;
				fluidType = statusEffects[o].value3;
				
				// Conservation of spunk
				var oralSources:Array = [];
				if(hairType == GLOBAL.HAIR_TYPE_GOO) oralSources.push("Goo Hair");
				if(hasPerk("Honeypot")) oralSources.push("Honeypot");
				if(hasPerk("'Nuki Nuts") && InCollection(fluidType, GLOBAL.VALID_CUM_TYPES)) oralSources.push("'Nuki Nuts");
				
				// Because Cum Cascade adds a new status effect and resorts the list, messing up the statusEffects indexing, we'll flag to play it at the end instead.
				var cumCascaded:Boolean = false;
				
				if(oralSources.length <= 0) oralSources.push("default");
				
				if(cumDrain)
				{
					//Figure out how much cum is vented over time.
					//Should vent 1/2 the current amount over 30 minutes
					//+a small amount based off the maximum amount full you've been for this proc. 
					amountVented = statusEffects[o].value1 / 8 / 2 + statusEffects[o].value2 / 48;
					var oralVented:Number = amountVented * oralSources.length;
					//Mult times minutes passed
					oralVented *= timePassed/60;
					//Apply to actual status
					statusEffects[o].value1 -= oralVented;
					amountStored -= oralVented;
				}
				//Special notices!
				if(this is PlayerCharacter && amountVented > 0)
				{
					for(var i:int = 0; i < oralSources.length; i++)
					{
						switch(oralSources[i])
						{
							default:
								if(notice == "")
								{
									//If Jacques00 or Geddy wants to write stuff for this, feel free, but I'm fine with it being more laid back.
									//9999 apply cum-drenched flag as appropriate?
								}
								break;
							case "Goo Hair":
								addBiomass(amountVented);
								break;
							case "Honeypot":
								if(amountVented > 0) kGAMECLASS.honeyPotBump();
								if(amountVented >= 500) kGAMECLASS.honeyPotBump();
								if(amountVented >= 1000) kGAMECLASS.honeyPotBump();
								if(amountVented >= 2000) kGAMECLASS.honeyPotBump();
								break;
							case "'Nuki Nuts":
								cumCascaded = canCumCascade();
								break;
						}
					}
					if (!omitNotice && notice != "")
					{
						AddLogEvent(notice, "words", timePassed);
						notice = "";
					}
				}
				if(statusEffects[o].value1 <= 0) removals.push("Orally-Filled");
				if(cumCascaded) cumCascade(amountVented, fluidType, timePassed);
			}
			//Remove if no more cum!
			while(removals.length > 0) 
			{
				removeStatusEffect(removals[0]);
				removals.splice(0,1);
			}
			if(!omitNotice)
			{
				if(amountStored >= (25000 / 4 / 2))
				{
					var delayTime:int = 30 * Math.floor(amountStored / 25000);
					if(delayTime > 240) delayTime = 240;
					if(delayTime < 30) delayTime = 30;
					createStatusEffect("Omit Cumflation Messages", 0, 0, 0, 0, true, "Icon_Sperm_Hearts", "Cumflation messages are currently disabled.", false, delayTime);
				}
			}
		}
		public function isCumflated():Boolean
		{
			return (cumFlationAmount() > 0);
		}
		public function cumFlationAmount():Number
		{
			return (statusEffectv1("Anally-Filled") + statusEffectv1("Vaginally-Filled") + statusEffectv1("Orally-Filled"));
		}

		public function canCumCascade(): Boolean 
		{
			if(balls <= 0) return false;
			if(!hasPerk("'Nuki Nuts")) return false;
			if(hasStatusEffect("Cum Cascade Suppressant")) return false;
			if(hasPerk("Cum Cascade")) return true;
			if(nukiScore() >= 3) return true;
			return false;
		}
		public function cumCascade(amount:Number, fluid:int = GLOBAL.FLUID_TYPE_CUM, timePassed:int = 0): void 
		{
			if(balls <= 0) return;
			
			// Give Cum Cascade effect
			if (!hasStatusEffect("Cum Cascade"))
			{
				if (this is PlayerCharacter)
				{
					AddLogEvent(ParseText(" You hear a faint gurgling from your stomach and [pc.balls] as you feel " + (balls == 1 ? "it" : "them") + " " + (ballFullness >= 100 ? "swelling with more and more [pc.cumNoun]" : "getting fuller and fuller with [pc.cumNoun]") + " each passing second. With your kui-tan physiology, all that " + fluidNoun(fluid) + " you ingested must have spiked your own [pc.cumNoun] production!"), "passive");
				}
				lust(5);
				createStatusEffect("Cum Cascade", 0, 0, fluid, 0, true, "Icon_Sperm_Hearts", "Side effect of ‘Nuki Nuts.", false, 0, 0xB793C4);
			}
			
			// Tracking
			addStatusValue("Cum Cascade", 1, amount);
			if (amount > statusEffectv1("Cum Cascade")) setStatusValue("Cum Cascade", 3, fluid);
			
			var cumTransfer:Number = Math.round(amount / 10);
			cumTransfer *= (timePassed / 60);
			if (cumTransfer > amount) cumTransfer = amount;
			
			addStatusValue("Cum Cascade", 1, (-1 * cumTransfer));
			addStatusValue("Cum Cascade", 2, cumTransfer);
		}
		public function cumStatusUpdate():void
		{
			// Blueballs
			if(hasStatusEffect("Blue Balls") && balls <= 0) removeStatusEffect("Blue Balls");
			
			// Cum Cascade
			if(hasStatusEffect("Cum Cascade") && (balls <= 0 || !hasPerk("'Nuki Nuts") || !hasStatusEffect("Orally-Filled") || !InCollection(statusEffectv3("Orally-Filled"), GLOBAL.VALID_CUM_TYPES))) removeStatusEffect("Cum Cascade");
		}
		public function applyBlueBalls(effectOnly:Boolean = false):void
		{
			if(!effectOnly && ballFullness < 100) ballFullness = 100;
			if(balls <= 0) return;
			createStatusEffect("Blue Balls", 0,0,0,0,false,"Icon_Sperm_Hearts", "Take 25% more lust damage in combat!", false, 0,0xB793C4);
		}
		
		// Tiredness Conditions
		public function isSore():Boolean
		{
			return (hasStatusEffect("Sore") || hasStatusEffect("Very Sore") || hasStatusEffect("Worn Out"));
		}
		public function isWornOut():Boolean
		{
			return (hasStatusEffect("Worn Out"));
		}
		
		// OnTakeDamage is called as part of applyDamage.
		// You should generate a message for /deferred/ display in the creature
		// rather than emitting text immediately. You should then emit it
		// during the CombatAI call before taking any other action. See
		// CrystalGooT1 for an example.
		protected var OnTakeDamageOutput:String;
		public function OnTakeDamage(incomingDamage:TypeCollection):void
		{

		}
		
		// Uveto Specials
		public function hasHeatBelt():Boolean
		{
			return shield.hasFlag(GLOBAL.ITEM_FLAG_HEATBELT);
		}
		
		public function willTakeColdDamage(resToAvoid:Number = 25.0):Boolean
		{
			if (hasHeatBelt()) return false;
			if (getHPResistances().freezing.resistanceValue >= resToAvoid) return false;
			if (accessory.hasFlag(GLOBAL.ITEM_FLAG_HEAT_GENERATOR) || armor.hasFlag(GLOBAL.ITEM_FLAG_HEAT_GENERATOR) || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_HEAT_GENERATOR) || upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_HEAT_GENERATOR)) return false;
			if (hasStatusEffect("T.Pack")) return false;
			
			// Perk for some kinda TF or some shit, effect for a temporary/timed effect?
			if (hasPerk("Icy Veins") || hasStatusEffect("Icy Veins") || (hasFur() && perkv1("Wooly") >= 1)) return false;
			return true;
		}
		
		public function willTakeBurnDamage(resToAvoid:Number = 25.0):Boolean
		{
			if (hasStatusEffect("Deep Freeze")) return false;
			if (getHPResistances().burning.resistanceValue >= resToAvoid) return false;
			return true;
		}
		
		public function hasCybernetics():Boolean
		{
			if(isCyborg()) return true;
			return false;
		}
		
		// top kek
		public function myMiddleNameIsJensen():Boolean { return hasCybernetics(); }
		
		public function isInvisible():Boolean
		{
			return (hasStatusEffect("Stealth Field Generator") || hasStatusEffect("Camouflage"));
		}
		public function hasBlindImmunity():Boolean
		{
			return (accessory is FlashGoggles || hasStatusEffect("Blind Immune"));
		}
		public function hasAirtightSuit():Boolean
		{
			return (!hasStatusEffect("Corroded Seals") && hasArmor() && armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT));
		}
		public function hasShields():Boolean
		{
			if(shieldDisplayName == null) return false;
			// For actual energy shields (to damage, drain, disable, etc.)
			return (shieldDisplayName.toLowerCase().indexOf("shield") != -1);
		}
		
		public function onLeaveBuyMenu():void
		{
			throw new Error("Vendor doesn’t have a buy-menu leave functor specified.");
		}
		
		// Item Slot Shenanigans
		public function lockItemSlot(slot:Number, msg:String = "", minutes:Number = 0):void
		{
			switch(slot)
			{
				case GLOBAL.CLOTHING:
				case GLOBAL.ARMOR:
					createStatusEffect("Armor Slot Disabled", 0, 0, 0, 0, true, "Blocked", msg, false, minutes);
					break;
				case GLOBAL.MELEE_WEAPON:
					createStatusEffect("Melee Weapon Slot Disabled", 0, 0, 0, 0, true, "Blocked", msg, false, minutes);
					break;
				case GLOBAL.RANGED_WEAPON:
					createStatusEffect("Ranged Weapon Slot Disabled", 0, 0, 0, 0, true, "Blocked", msg, false, minutes);
					break;
				case GLOBAL.SHIELD:
					createStatusEffect("Shield Slot Disabled", 0, 0, 0, 0, true, "Blocked", msg, false, minutes);
					break;
				case GLOBAL.ACCESSORY:
					createStatusEffect("Accessory Slot Disabled", 0, 0, 0, 0, true, "Blocked", msg, false, minutes);
					break;
				case GLOBAL.LOWER_UNDERGARMENT:
					createStatusEffect("Lower Garment Slot Disabled", 0, 0, 0, 0, true, "Blocked", msg, false, minutes);
					break;
				case GLOBAL.UPPER_UNDERGARMENT:
					createStatusEffect("Upper Garment Slot Disabled", 0, 0, 0, 0, true, "Blocked", msg, false, minutes);
					break;
			}
			return;
		}
		public function unlockItemSlot(slot:Number):void
		{
			switch(slot)
			{
				case GLOBAL.CLOTHING:
				case GLOBAL.ARMOR:
					removeStatusEffect("Armor Slot Disabled");
					break;
				case GLOBAL.MELEE_WEAPON:
					removeStatusEffect("Melee Weapon Slot Disabled");
					break;
				case GLOBAL.RANGED_WEAPON:
					removeStatusEffect("Ranged Weapon Slot Disabled");
					break;
				case GLOBAL.SHIELD:
					removeStatusEffect("Shield Slot Disabled");
					break;
				case GLOBAL.ACCESSORY:
					removeStatusEffect("Accessory Slot Disabled");
					break;
				case GLOBAL.LOWER_UNDERGARMENT:
					removeStatusEffect("Lower Garment Slot Disabled");
					break;
				case GLOBAL.UPPER_UNDERGARMENT:
					removeStatusEffect("Upper Garment Slot Disabled");
					break;
			}
			return;
		}
		public function itemSlotUnlocked(slot:Number):Boolean
		{
			if
			(	(InCollection(slot, [GLOBAL.CLOTHING, GLOBAL.ARMOR]) && (hasStatusEffect("Armor Slot Disabled") || armor.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE) || hasStatusEffect("Body Paint")))
			||	(slot == GLOBAL.MELEE_WEAPON && (hasStatusEffect("Melee Weapon Slot Disabled") || meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)))
			||	(slot == GLOBAL.RANGED_WEAPON && (hasStatusEffect("Ranged Weapon Slot Disabled") || rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)))
			||	(slot == GLOBAL.SHIELD && (hasStatusEffect("Shield Slot Disabled") || shield.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)))
			||	(slot == GLOBAL.ACCESSORY && (hasStatusEffect("Accessory Slot Disabled") || accessory.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)))
			||	(slot == GLOBAL.LOWER_UNDERGARMENT && (hasStatusEffect("Lower Garment Slot Disabled") || lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)))
			||	(slot == GLOBAL.UPPER_UNDERGARMENT && (hasStatusEffect("Upper Garment Slot Disabled") || upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)))
			)	return false;
			return true;
		}
		
		public function getCombatName():String
		{
			if (isUniqueInFight) return (a + uniqueName);
			else return uniqueName;
		}
		
		public function getCombatPronoun(type:String):String
		{
			if(isPlural)
			{
				if (type == "s" || type == "heshe") return "they";
				if (type == "o" || type == "himher") return "them";
				if (type == "pa" || type == "hisher") return "their";
				if (type == "pp" || type == "hishers") return "theirs";
				if (type == "sl" || type == "himselfherself") return "themselves";
			}
			if (type == "s" || type == "heshe") return (this is PlayerCharacter ? "you" : mfn("he", "she", "it"));
			if (type == "o" || type == "himher") return (this is PlayerCharacter ? "you" : mfn("him", "her", "it"));
			if (type == "pa" || type == "hisher") return (this is PlayerCharacter ? "your" : mfn("his", "her", "its"));
			if (type == "pp" || type == "hishers") return (this is PlayerCharacter ? "yours" : mfn("his", "hers", "its"));
			if (type == "sl" || type == "himselfherself") return (this is PlayerCharacter ? "yourself" : mfn("himself", "herself", "itself"));
			
			return "ERROR: <b>Unknown pronoun specifier.</b>";
		}

		// TODO: The log timestamp function needs to accept a timestamp override, so calculated positions along the total time passage can display a corrected timestamp
		// of when the event actually takes place.
		public function processTime(deltaT:uint, doOut:Boolean):void
		{
			minutesSinceCum += deltaT;
			
			updateStatusEffects(deltaT, doOut);
			updateAlcoholState(deltaT, doOut);
			sstdPurgeCheck(deltaT, doOut);
			
			updateLustValues(deltaT, doOut);
			updateCumValues(deltaT, doOut);
			updateMilkValues(deltaT, doOut);
			
			// Restore shields outside of combat.
			if(!inCombat()) shieldsRaw = shieldsMax();
		}
		
		public function updateVaginaStretch(deltaT:uint, doOut:Boolean):void
		{
			var totalHours:int = ((kGAMECLASS.minutes + deltaT) / 60);
			var bonusMult:int = 1;
			
			// Speed modifiers
			if(hasPerk("True Doll")) bonusMult *= 24;
			
			if (vaginas.length > 0 && totalHours >= 1)
			{
				for (var i:int = 0; i < vaginas.length; i++)
				{
					var tv:VaginaClass = vaginas[i] as VaginaClass;
					
					if (tv.loosenessRaw > tv.minLooseness)
					{
						tv.shrinkCounter += (totalHours * bonusMult);
					}
					else
					{
						tv.shrinkCounter = 0;
						continue;
					}
					
					var tightnessChange:Boolean = false;
					// These are now chained to allow multiple potential shrinks to happen in a single update, depending on total time
					if (tv.loosenessRaw >= 5 && tv.shrinkCounter >= 60)
					{
						tv.loosenessRaw--;
						tv.shrinkCounter -= 60;
						tightnessChange = true;
					}
					if (tv.loosenessRaw >= 4 && tv.shrinkCounter >= 96)
					{
						tv.loosenessRaw--;
						tv.shrinkCounter -= 96;
						tightnessChange = true;
					}
					if (tv.loosenessRaw >= 3 && tv.shrinkCounter >= 132)
					{
						tv.loosenessRaw--;
						tv.shrinkCounter -= 132;
						tightnessChange = true;
					}
					if (tv.loosenessRaw >= 2 && tv.shrinkCounter >= 168)
					{
						tv.loosenessRaw--;
						tv.shrinkCounter -= 168;
						tightnessChange = true;
					}
					if (tv.loosenessRaw >= tv.minLooseness && tv.shrinkCounter >= 204)
					{
						tv.loosenessRaw--;
						tv.shrinkCounter -= 204;
						tightnessChange = true;
					}
					
					if (tightnessChange)
					{
						if (tv.loosenessRaw < tv.minLooseness) tv.loosenessRaw = tv.minLooseness;
						if(this is PlayerCharacter) AddLogEvent(("<b>Your" + (vaginas.length > 1 ? " " + num2Ordinal(i + 1) : "") + " " + vaginaDescript(i) + " has recovered from its ordeals, tightening up a bit.</b>"), "passive", deltaT);
					}
				}
			}
		}
		
		public function updateButtStretch(deltaT:uint, doOut:Boolean):void
		{
			var totalHours:int = ((kGAMECLASS.minutes + deltaT) / 60);
			var bonusMult:int = 1;
			
			// Speed modifiers
			if(hasPerk("True Doll")) bonusMult *= 24;
			
			if (totalHours >= 1)
			{
				if (ass.loosenessRaw > ass.minLooseness)
				{
					ass.shrinkCounter += (totalHours * bonusMult);
				}
				else
				{
					ass.shrinkCounter = 0;
					return;
				}
				
				var origTightness:Number = ass.loosenessRaw;
				if (ass.loosenessRaw >= 5 && ass.shrinkCounter >= 12)
				{
					ass.loosenessRaw--;
					ass.shrinkCounter -= 12;
				}
				if (ass.loosenessRaw >= 4 && ass.shrinkCounter >= 24)
				{
					ass.loosenessRaw--;
					ass.shrinkCounter -= 24;
				}
				if (ass.loosenessRaw >= 3 && ass.shrinkCounter >= 48)
				{
					ass.loosenessRaw--;
					ass.shrinkCounter -= 48;
				}
				if (ass.loosenessRaw >= 2 && ass.shrinkCounter >= 72)
				{
					ass.loosenessRaw--;
					ass.shrinkCounter -= 72;
				}
				if (ass.loosenessRaw >= ass.minLooseness && ass.shrinkCounter >= 96)
				{
					ass.loosenessRaw--;
					ass.shrinkCounter -= 96;
				}
				
				if (origTightness != ass.loosenessRaw)
				{
					if (ass.loosenessRaw < ass.minLooseness) ass.loosenessRaw = ass.minLooseness;
					
					if (this is PlayerCharacter)
					{
						if (origTightness <= 4) AddLogEvent(("<b>Your " + assholeDescript() + " has recovered from its ordeals and is now a bit tighter.</b>"), "passive", deltaT);
						else AddLogEvent(("<b>Your " + assholeDescript() + " recovers from the brutal stretching it has received and tightens up.</b>"), "passive", deltaT);
					}
				}
			}
		}
		
		private function updateLustValues(deltaT:uint, doOut:Boolean):void
		{
			if (lustSimulate || this is PlayerCharacter)
			{
				var lustCap:Number = Math.round(lustMax() * 0.75);
				
				if (hasStatusEffect("Egg Addled 2"))
				{
					lustCap = lustMax();
				}
				
				var prodFactor:Number = 100 / (1920) * ((libido() * 3 + 100) / 100);
				if (hasPerk("Extra Ardor")) prodFactor *= 2;
				if (hasPerk("Lusty Afterglow") && isCumflated()) prodFactor *= 2;
				if (hasStatusEffect("Ludicrously Endowed")) prodFactor *= 1.5;
				if (hasStatusEffect("Overwhelmingly Endowed")) prodFactor *= 2;
				if (hasStatusEffect("Red Myr Venom")) prodFactor *= 1.5;
				if (hasStatusEffect("Egg Addled 1")) prodFactor *= 1.25;
				if (hasStatusEffect("Egg Addled 3")) prodFactor *= 1.75;
				if (hasStatusEffect("X-Zil-Rate") || hasStatusEffect("Mead")) prodFactor *= 4;
				if (hasItemByClass(Savicite)) prodFactor *= (1.2 * numberOfItemByClass(Savicite));
				if (hasPiercing()) prodFactor *= 1 + piercingLustGainTotal();
				if (hasPerk("Ice Cold")) prodFactor /= 2;
				if (hasStatusEffect("Oil Numbed")) prodFactor /= 1.2;
				if (hasStatusEffect("Dzaan Withdrawal")) prodFactor *= 1.5;
				
				var producedLust:Number = deltaT * prodFactor;
				if (perkv1("Ultra-Exhibitionist") > 0) producedLust += (0.5 * deltaT * exposureLevel(true));
				
				if (lust() + producedLust < lustCap)
				{
					lust(producedLust);
				}
				else if (lust() > lustCap)
				{
					// Optimised slightly- mul/div is more expensive than add/sub, but
					// we can treat chained mul/divs as adds/subs to the same factor, thus
					// add up all the shit then operate once.
					
					var reducer:int = 0.0;
					
					if (hasPerk("Ice Cold")) reducer -= 0.25;
					if (hasPerk("Extra Ardor")) reducer += 0.25;
					
					if (reducer >= 0) lust( -producedLust * reducer);
				}
				else
				{
					lustRaw = lustCap;
				}
			}
		}
		
		private function updateCumValues(deltaT:uint, doOut:Boolean):void
		{
			// imo fluid simulate could be replaced wholesale with !neverSerialize-- any character
			// we save we care about these potential values in a broad sense.
			
			if ((fluidSimulate || this is PlayerCharacter) && !hasStatusEffect("Cum Paused") && flags["NURSERY_MATERNITY_WAIT_ACTIVE"] == undefined)
			{
				cumFlationSimulate(deltaT, doOut);
				if (hasPerk("'Nuki Nuts") || ballFullness < 100) cumProduced(deltaT, doOut);
				cumStatusUpdate();
			}
		}
		
		private function updateMilkValues(deltaT:uint, doOut:Boolean):void
		{
			if ((fluidSimulate || this is PlayerCharacter) && canLactate() && !hasStatusEffect("Milk Paused") && flags["NURSERY_MATERNITY_WAIT_ACTIVE"] == undefined)
			{
				milkProduced(deltaT, doOut);
			}
		}
		
		// TODO: Convert any item function used by stauts updates to static functions, so we don't have to construct the object to call it
		// TODO: Refactor what gets passed around- pass the actual StorageClass where possible, thus allowing ALL removal to be done here.
		private function updateStatusEffects(deltaT:uint, doOut:Boolean):void
		{
			if (!(this is PlayerCharacter) && !statusSimulate) return;
			
			var deferredEvents:Array = [];
			
			var i:int = 0;
			var y:int = 0;
			var z:int = 0;
			
			var wholeHoursPassed:uint = Math.floor((kGAMECLASS.minutes + deltaT) / 60);
			
			for (i = 0; i < statusEffects.length; i++)
			{
				var thisStatus:StorageClass = statusEffects[i];
				
				// Untimed status effect checks
				switch (thisStatus.storageName)
				{
					case "Butt Bug (Female)":
						if(this is PlayerCharacter)
						{
							kGAMECLASS.processButtBugParasitism(deltaT, maxEffectLength, doOut, this, thisStatus);
						}
						break;
					case "Foxfire":
						if(this is PlayerCharacter)
						{
							if (thisStatus.value4 < kGAMECLASS.GetGameTimestamp() || thisStatus.value4 <= 60) thisStatus.value4 = kGAMECLASS.GetGameTimestamp(); // failsafe and update for the old system
							var endTime:uint = kGAMECLASS.GetGameTimestamp() + deltaT;
							
							while (thisStatus.value4 <= endTime)
	 						{
								Foxfire.attemptTF(this);
								thisStatus.value4 += ((3 * 60) + rand(2 * 60));
	 						}
						}
						break;
					case "Cum Soaked":
					case "Pussy Drenched":
					case "Milk Bathed":
						if(hasSkinFlag(GLOBAL.FLAG_ABSORBENT))
						{
							var cumScale:Number = Math.min((deltaT / 60), 1);
							if(this is PlayerCharacter && hairType == GLOBAL.HAIR_TYPE_GOO)
							{
								addBiomass(Math.round(500 * cumScale));
								if(hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) addBiomass(Math.round(500 * cumScale));
							}
							thisStatus.value1 -= cumScale;
							if(thisStatus.value1 <= 0 && thisStatus.minutesLeft <= 0) thisStatus.minutesLeft = 1;
						}
						break;
					case "adjjjisjjrhiwig":
					case "Goblinola Bar":
					case "Laquine Ears":
					case "LimberTime":
					case "The Treatment":
						if(thisStatus.minutesLeft <= 0) thisStatus.minutesLeft = 1;
						break;
					case "Furpies Simplex H":
					case "Furpies Simplex C":
					case "Furpies Simplex D":
						if(thisStatus.minutesLeft <= 0 && thisStatus.value4 < 12) thisStatus.minutesLeft = 1;
						break;
					case "Ovilium":
						if(thisStatus.minutesLeft < deltaT) thisStatus.minutesLeft = (deltaT + 1);
						break;
					case "Zil Pheromones":
					case "Zil Pregnancy Reflex Mod":
						if (!hasPregnancyOfType("ZilPregnancy")) thisStatus.minutesLeft = 1;
						break;
					/*
					case "Exhibitionism Reserve":
						// Wearing exposed clothing should not prevent reset.
						if(isFullyExposed(true)) thisStatus.minutesLeft += deltaT;
						break;
					*/
				}
				
				// Effects created with a 0 or less duration aren't handled by this code ever.
				if (thisStatus.minutesLeft <= 0 && thisStatus.tooltip != "< REMOVE >") continue;
				
				var startEffectLength:uint = thisStatus.minutesLeft;
				var maxEffectLength:uint = Math.min(deltaT, thisStatus.minutesLeft);
				thisStatus.minutesLeft -= maxEffectLength;
				
				var requiresRemoval:Boolean = (thisStatus.minutesLeft <= 0);
				
				var desc:String = "";
				
				switch (thisStatus.storageName)
				{
					//+20 libidoMod
					case "Iyla’s Milk":
						if(requiresRemoval)
						{
							this.libidoMod -= 20;
						}
						break;
					//+5 willpower, +15 libido
					case "Xanose":
						if(requiresRemoval)
						{
							this.willpowerMod -= 5;
							this.libidoMod -= 15;
						}
						break;
					//+10 reflexes
					case "Vipris":
						if(requiresRemoval)
						{
							this.reflexesMod -= 10;
						}
						break;
					//+5 reflexes, +5 intelligence
					case "Sinthine":
						if(requiresRemoval)
						{
							this.reflexesMod -= 5;
							this.intelligenceMod -= 5;
						}
						break;
					//+5 aim, +5 reflexes
					case "Cromesc":
						if(requiresRemoval)
						{
							this.aimMod -= 5;
							this.reflexesMod -= 5;
						}
						break;
					case "Anal Lubricant":
						if(requiresRemoval) ass.wetnessMod -= thisStatus.value1;
						break;
					case "Soak":
						if(requiresRemoval)
						{
							//Strip out bonus wet.
							for(y = 0; y < this.totalVaginas(); y++) 
							{
								if(vaginas[y].wetnessMod >= 5) vaginas[y].wetnessMod -= 5; 
							}
							if(clitLength >= 0.6) clitLength -= 0.5;
							if (this is PlayerCharacter && hasVagina()) kGAMECLASS.eventQueue.push(new Soak().soakOverWrapper);
						}
						break;
					case "Shekka_Pay_CD":
						if (this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent("Now would be a good time to check back in with Shekka...", "words", maxEffectLength);
						}
						break;
					case "Shekka_Cure_CD":
						if (this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent("<b>It’s been a while since you left Shekka with everything she needed to pursue a cure. Now would be a good time to check on her progress.</b>", "words", maxEffectLength);
						}
						break;
					case "LimberTime":
						if (this is PlayerCharacter && requiresRemoval)
						{
							kGAMECLASS.eventQueue.push(kGAMECLASS.paigeLimberRemove);
						}
						break;
					case "GastiUnlockTimer":
						if (this is PlayerCharacter && requiresRemoval)
						{
							//email unlock
							kGAMECLASS.goMailGet("gastigoth_unlock");
						}
						break;
					case "PAIGE_COMA_EMAIL_CD":
						if (this is PlayerCharacter && requiresRemoval)
						{
							kGAMECLASS.eventQueue.push(kGAMECLASS.paigeEyeholeEmailEvent);
						}
						break;
					case "Kally Cummed Out":
						if(this is PlayerCharacter && requiresRemoval && kGAMECLASS.currentLocation == "CANADA5")
						{
							AddLogEvent("Kally stumbles back into the bar while you’re waiting. Her garb isn’t quite as meticulously arranged. Her hair is damp, and when she thinks nobody is looking, she sighs dreamily, licking her lips.", "passive", maxEffectLength);
						}
						break;
					case "Flahne_Extra_Pissed":
						if (this is PlayerCharacter && requiresRemoval)
						{
							flags["FLAHNE_MAKEUP"] = 1;
						}
						break;
					case "STELLA_PREGNANT":
						if (this is PlayerCharacter && requiresRemoval) kGAMECLASS.flags["STELLA_PREGNANCY_NOTIFIER"] = thisStatus.value1;
						break;
					case "IQ B-Gone":
					case "Brainmelt Lamps":
					case "Mindwashed":
					case "Latex Sprayed":
					case "Bimboleum":
						if (!thisStatus.combatOnly)
						{
							kGAMECLASS.doDollMakerStatusEffects(this, thisStatus, startEffectLength, requiresRemoval);
						}
						break;
					case "Massaging":
					case "Slow Fucking":
						if (requiresRemoval)
						{
							if(this is PlayerCharacter) kGAMECLASS.emmyTeaseCum();
							deferredEvents.push(kGAMECLASS.emmyTeaseCumEffects);
						}
						break;
					case "Drain Cooldown":
						if (requiresRemoval)
						{
							if(this is PlayerCharacter) kGAMECLASS.emmyCumClearance();
							deferredEvents.push(kGAMECLASS.emmyCumStatusPurge);
						}
						break;
					case "Uveto Cloudy":
						if (this is PlayerCharacter && requiresRemoval)
						{
							kGAMECLASS.uvetoCloudyEnds(deltaT);
						}
						break;
					case "Uveto Blizzard":
						if (this is PlayerCharacter && requiresRemoval)
						{
							kGAMECLASS.uvetoIntenseBlizzardEnds();
						}
						break;
					case "Laquine Ears":
						if(this is PlayerCharacter)
						{
							if (startEffectLength >= 1140 && thisStatus.minutesLeft < 1140) LaquineEars.effectProc(this, startEffectLength, 1140);
							if (startEffectLength >= 840 && thisStatus.minutesLeft < 840) LaquineEars.effectProc(this, startEffectLength, 840);
							if (startEffectLength >= 540 && thisStatus.minutesLeft < 540) LaquineEars.effectProc(this, startEffectLength, 540);
							if (startEffectLength >= 240 && thisStatus.minutesLeft < 240) LaquineEars.effectProc(this, startEffectLength, 240);
							if (requiresRemoval) LaquineEars.effectProc(this, startEffectLength, 0);
						}
						break;
					case "Heat":
						if(!hasVagina() || fertility() <= 0) requiresRemoval = true;
						if(this is PlayerCharacter && requiresRemoval) AddLogEvent("You feel a little more calm and rational now that <b>your heat has ended.</b>","passive", maxEffectLength);
						else if(isFullyWombPregnant())
						{
							deferredEvents.push(heatCleanup);
						}
						break;
					case "Rut":
					case "Lagonic Rut":
						if(!hasCock() || virility() <= 0) requiresRemoval = true;
						if(this is PlayerCharacter && requiresRemoval) AddLogEvent("You find yourself more calm, less aggressive and sexually driven. <b>It appears your rut has ended.</b>", "words", maxEffectLength);
						break;
					case "Exhibitionism Reserve":
						if(this is PlayerCharacter && requiresRemoval) AddLogEvent("The urge to publicly display yourself, which has been welling up inside of you fades from your body. <b>You may now enjoy public sex without the risk of becoming a permanent exhibitionist... for a while.</b>", "words", maxEffectLength);
						break;
					case "Woozy":
						if(this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent("You are no longer woozy.", "words", maxEffectLength);
							intelligenceMod -= 10;
							aimMod += 10;
							reflexesMod += 10;
							lustMod -= 9000;
						}
						break;
					case "Curdsonwhey": 
						if(this is PlayerCharacter)
						{
							if (startEffectLength >= 180 && thisStatus.minutesLeft < 180) Curdsonwhey.effectProc(this, startEffectLength, 180);
							if (startEffectLength >= 120 && thisStatus.minutesLeft < 120) Curdsonwhey.effectProc(this, startEffectLength, 120);
							if (startEffectLength >= 60 && thisStatus.minutesLeft < 60) Curdsonwhey.effectProc(this, startEffectLength, 60);
							if (requiresRemoval)
							{
								Curdsonwhey.effectProc(this, startEffectLength, 0);
								AddLogEvent("You swallow, and nod with approval as the bitterness of the Curdsonwhey at the back of your throat finally washes away.", "passive", maxEffectLength);
							}
						}
						break;
					case "Painted Penis":
						if(requiresRemoval)
						{
							if(this is PlayerCharacter) AddLogEvent("The paint on your phallus flakes away, leaving you bare and unadorned once more.", "passive", maxEffectLength);
							libidoMod -= thisStatus.value4;
						}
						break;
					case "Priapism":
						if(requiresRemoval)
						{
							if(this is PlayerCharacter && hasCock()) AddLogEvent("The constant pressure on [pc.eachCock] subsides... You sigh in relief as you feel your maleness able to soften once more. <b>It looks like your case of priapism has finally passed!</b>", "passive", maxEffectLength);
						}
						break;
					case "Painted Tits":
						if(requiresRemoval)
						{
							if(this is PlayerCharacter) AddLogEvent("The paint on your chest has dissolved away, taking the extra libidinous tingling with it.", "passive", maxEffectLength);
							libidoMod -= thisStatus.value4;
						}
						break;
					case "Body Paint":
						if(this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent("The paint that was covering your body has dried up and faded away.","passive", maxEffectLength);
						}
						break;
					case "Full Stomach":
						if(this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent(ParseText("Your [pc.belly] gives off a slight rumble and you feel a bit more... comfortable? It seems your stomach has digested the vast amounts of food within it, returning your physique and reflexes back to more normal levels."), "passive", maxEffectLength);
						}
						break;
					case "Pumped!":
						if(this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent(ParseText("The boost of adrenaline pumping through your veins has subsided, returning your physique and aim back to more normal levels."), "passive", maxEffectLength);
						}
						break;
					case "IQBGoneTimer":
						if(this is PlayerCharacter && requiresRemoval) kGAMECLASS.IQBeGoneCashOut();
						break;
					case "Fuck Fever":
					case "Flushed":
					case "Strangely Warm":
						//Wears off
						if(requiresRemoval)
						{
							if(this is PlayerCharacter) AddLogEvent("The heat in your body finally recedes after an exhausting couple of days. <b>You are no longer feeling so unnaturally aroused.</b>", "passive", maxEffectLength);
							if(hasPerk("Omega Fever")) createStatusEffect("Omega Fever Delay", 0, 0, 0, 0, true, "", "", false, maxEffectLength + 1440);
						}
						//Pregnancy clears - gotta cheat to get the Omega Oil status clear.
						else if(hasAnalPregnancy())
						{
							deferredEvents.push(analHeatCleanup);
						}
						//Random notices for top 2 status tiers
						else if(this is PlayerCharacter && rand(100) == 0 && thisStatus.storageName != "Strangely Warm")
						{
							var omegaBlurbs:Array = [];
							omegaBlurbs.push("Bolts of want zap down your spine as the irrational need to " + ((hasKnees()) ? "kneel" : "bow down") + " and submit to an alien " + RandomInCollection(["stranger","beauty"]) + " as you pass by them stops you in your tracks. They do not notice you. The urge fades pretty soon.\n\nWeird.");
							omegaBlurbs.push("You suddenly really, <i>really</i> want to get knotted " + RandomInCollection(["like a bitch in heat","by a nice dildo or a well-endowed stud","and pumped full of cum"]) + ". Your [pc.asshole] " + RandomInCollection(["spasms","clenches around nothing"]) + ", desperately empty.");
							omegaBlurbs.push("You find yourself idly wondering how much a breeding stand custom-made to your measurements would cost, and if it would really be worth the investment.");
							omegaBlurbs.push("You feel oddly serene, for someone who’s supposed to crave being fucked all the time.");
							AddLogEvent(omegaBlurbs[rand(omegaBlurbs.length)], "passive", maxEffectLength);
						}
						break;
					case "Condensol-A":
					case "Condensol-B":
						if (!hasCock())
						{
							requiresRemoval = true;
						}
						else if (requiresRemoval)
						{
							var condensolMult:int = 1;
							if(thisStatus.storageName == "Condensol-A") condensolMult = 2;
							if(thisStatus.storageName == "Condensol-B") condensolMult = 4;
							for(y = 0; y < cocks.length; y++)
							{
								cocks[y].cLengthRaw *= condensolMult;
							}
							if(this is PlayerCharacter) AddLogEvent(ParseText("You feel your groin relax, and check your [pc.cocks] to discover that everything is more or less as it should be. The Condensol must have worn off."), "passive", maxEffectLength);
						}
						break;
						break;
					case "Lane's Hypnosis":
					case "Lane's Hypnosis - Physique":
					case "Lane's Hypnosis - Reflexes":
					case "Lane's Hypnosis - Aim":
					case "Lane's Hypnosis - Intelligence":
					case "Lane's Hypnosis - Willpower":
						if (this is PlayerCharacter && requiresRemoval)
						{
							kGAMECLASS.baseHypnosisWearsOff(thisStatus.storageName);
						}
						break;
					case "Horse Pill":
						if (this is PlayerCharacter && (wholeHoursPassed >= 1 || requiresRemoval))
						{
							HorsePill.OnHourTF(deltaT, maxEffectLength, doOut, this, thisStatus);
						}
						break;
					case "Goblinola Bar":
						if (this is PlayerCharacter && (wholeHoursPassed >= 1 || requiresRemoval))
						{
							Goblinola.OnHourTF(deltaT, maxEffectLength, doOut, this, thisStatus);
						}
						break;
					case "Gabilani Face Change":
						if (this is PlayerCharacter && requiresRemoval)
						{
							Goblinola.itemGoblinFaceTF(deltaT, maxEffectLength, doOut, this, thisStatus);
						}
						break;
					case "Clippex Gel":
						if(this is PlayerCharacter)
						{
							Clippex.ClippexLustIncrease(deltaT, doOut, this, thisStatus);
							if (requiresRemoval)
							{
								Clippex.ClippexTF(deltaT, doOut, this, thisStatus); 
							}
						}
						break;
					//Doesn't actually get removed! Nyahahah~!
					case "Taint_CD":
						if(this is PlayerCharacter && requiresRemoval && !hasPerk("Corrupted"))
						{
							var taintCycles:int = Math.max(Math.floor(deltaT / (72*60)), 1);
							taint(-1 * taintCycles);
							thisStatus.minutesLeft = (72*60);
							requiresRemoval = false;
						}
						break;
					case "Semen's Candy":
						if(this is PlayerCharacter)
						{
							SemensFriend.LibidoIncrease(deltaT, doOut, this, thisStatus);
							if (requiresRemoval)
							{
								SemensFriend.TFProcs(deltaT, doOut, this, thisStatus);
							}
						}
						break;
					case "Cerespirin":
						// This has been refactored to handle an extra proc round if the effect
						// expires this update, and the item mechanics treat the end-effect
						// as just another round of TF
						if(this is PlayerCharacter) Cerespirin.itemPlantTF(maxEffectLength, doOut, this, thisStatus);
						break;
					case "Hair Flower":
						if (this is PlayerCharacter && requiresRemoval)
						{
							Cerespirin.loseHairFlower(this, thisStatus.value1, maxEffectLength);
						}
						break;
					case "Priapin":
						if (requiresRemoval)
						{
							Priapin.effectEnds(maxEffectLength, doOut, this, thisStatus);
						}
						break;
					case "adjjjisjjrhiwig":
						if (this is PlayerCharacter && (wholeHoursPassed >= 1 || requiresRemoval))
						{
							Capraphorm.OnHourTF(deltaT, maxEffectLength, doOut, this, thisStatus);
						}
						break;
					case "Hair Regoo":
						if (requiresRemoval)
						{
							if(hasHair() && hairType != GLOBAL.HAIR_TYPE_GOO)
							{
								if(this is PlayerCharacter) AddLogEvent(ParseText("The tingling along your scalp becomes stronger as you realize something has been gradually changing. As the sensation fades, you run your hand across the top of your head and notice some excess slime stick to it... It looks like <b>your [pc.hair] has reverted back into gooey hair</b>."), "passive", maxEffectLength);
								if(hairType == GLOBAL.HAIR_TYPE_TENTACLES) hairStyle == "tentacle";
								hairType = GLOBAL.HAIR_TYPE_GOO;
							}
						}
						break;
					case "Latex Regrow":
						if (requiresRemoval)
						{
							RubberMade.latexRegrow(maxEffectLength, doOut, this, thisStatus);
						}
						break;
					case "The Mango":
						if (this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent("Your attractive aura fades from you as your sexiness returns to normal levels." + (kGAMECLASS.silly && rand(3) != 0 ? "You could no longer handle the mango!" : "The wild mango’s effect has worn off!"), "passive", maxEffectLength);
						}
						break;
					case "Jaded":
						if (this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent("No longer bored from your previous whoring session, you feel a bit more refreshed now.", "passive", maxEffectLength);
						}
						break;
					case "Mighty Tight":
						if (this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent("Pausing for a moment, you feel your backdoor" + (hasVagina() ? ParseText(" and [pc.vaginas] relaxing") : " relax") + " a bit. It is probably safe to say that you are no longer under the effects of Mighty Tight.", "passive", maxEffectLength);
						}
						break;
					case "Boobswell Pads":
						BoobswellPads.updateEffect(deltaT, maxEffectLength, doOut, this, thisStatus);
						if (this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent("Unfortunately, as you admire your now-larger bosom, you realize that the gentle, wet rumble of the pads has come to a stop. <b>It looks like you’ve exhausted the BoobSwell Pads" + (bRows() > 1 ? " on your " + num2Ordinal(thisStatus.value1+1) + " row of breasts" : "") + ParseText("!</b> You peel them off your [pc.skinFurScales] and toss them away."), "passive", maxEffectLength);
						}
						break;
					case "Ass Slap Patch":
						AssSlapPatch.updateEffect(deltaT, maxEffectLength, doOut, this, thisStatus);
						if (this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent(ParseText("You begin to feel odd for a second, as if something is missing. Then your realize that the patch on your [pc.ass] has grown quiet and cold, you take a second to reach down and peel the pad off your [pc.skinFurScalesColor] [pc.skinFurScalesNoun] and dispose of it."), "passive", maxEffectLength);
						}
						break;
					case "Cum High":
						if (this is PlayerCharacter && requiresRemoval)
						{
							AddLogEvent("Your reflexes and mental abilities return to their natural state, as well as the concerns about your quest. <b>You are no longer cum high.</b> You are positive it will take you a while to be able to experience this high again.", "passive", maxEffectLength);
							createStatusEffect("Cum High Cooldown", 0, 0, 0, 0, true, "", "", false, 2880);
						}
						break;
					case "The Treatment":
						if (this is PlayerCharacter && (wholeHoursPassed >= 1 || requiresRemoval))
						{
							kGAMECLASS.treatmentHourProcs(wholeHoursPassed, thisStatus);
						}
						break;
					case "Infertile":
						if (this is PlayerCharacter && requiresRemoval)
						{
							var infertileMsg:String = "A strange tingling sensation spreads through your loins as your microsurgeons are suddenly reinvigorated. Your codex then beeps to notify you that you have regained your";
							if(hasGenitals())
							{
								if(hasVagina()) infertileMsg += " fertility";
								if(isHerm()) infertileMsg += " and";
								if(hasCock()) infertileMsg += " virility";
							}
							else infertileMsg += " fertility and virility should you ever have the genitals for them";
							infertileMsg += ". <b>Your ability to potentially create life has been restored!</b>";
							AddLogEvent(infertileMsg, "passive", maxEffectLength);
						}
						break;
					case "Bottled Poison":
						if (requiresRemoval)
						{
							physiqueMod += thisStatus.value1;
							aimMod += thisStatus.value1;
							reflexesMod += thisStatus.value1;
						}
						break;
					case "Crabbst":
						if (requiresRemoval)
						{
							physiqueMod -= thisStatus.value2;
							reflexesMod += thisStatus.value2;
							aimMod += thisStatus.value2;
							intelligenceMod += thisStatus.value2;
							willpowerMod += thisStatus.value2;
						}
						break;
					case "Mead":
						if (requiresRemoval)
						{
							physiqueMod -= thisStatus.value2;
							reflexesMod += thisStatus.value2 * .5;
							aimMod += thisStatus.value2 * .5;
							intelligenceMod += thisStatus.value2 * .5;
							willpowerMod += thisStatus.value2 * .5;
						}
						break;
					case "X-Zil-rate":
						if (requiresRemoval)
						{
							physiqueMod -= thisStatus.value2;
						}
						break;
					case "Quivering Quasar":
						if (requiresRemoval)
						{
							physiqueMod -= thisStatus.value2;
						}
						break;
					case "Zil Sting":
						if (requiresRemoval)
						{
							reflexesMod += thisStatus.value1;
							libidoMod -= thisStatus.value1;
						}
						break;
					case "Naleen Venom":
						if (requiresRemoval)
						{
							physiqueMod += thisStatus.value1;
							aimMod += thisStatus.value1;
							willpowerMod += thisStatus.value1;
							reflexesMod += thisStatus.value1;
						}
						break;
					case "GaloMax":
						if (requiresRemoval)
						{
							if(this is PlayerCharacter) kGAMECLASS.eventQueue.push(kGAMECLASS.galoMaxTFProc);
						}
						break;
					case "Goo Armor Defense Drain":
						if (this is PlayerCharacter && requiresRemoval)
						{
							if(armor is GooArmor) AddLogEvent(ParseText("[goo.name] wriggles around you and tightens, testing her strength. <i>“Ahh, I feel better now!”</i> She seems to have fully recovered!"), "passive", maxEffectLength);
							if(hasItemByClass(GooArmor)) AddLogEvent(ParseText("[goo.name] happily mumbles something to herself, but you don’t quite catch it. Feeling her energetic movements, you can only assume that she has finally recovered!"), "passive", maxEffectLength);
							kGAMECLASS.gooArmorDefense(thisStatus.value1);
						}
						break;
					case "Red Myr Venom":
						if (this is PlayerCharacter && requiresRemoval)
						{
							deferredEvents.push(kGAMECLASS.venomExpirationNotice);
						}
						break;
					case "Ovalasting Message":
						if (this is PlayerCharacter && requiresRemoval)
						{
							var ovaBigEggMsg:String = "";
							// Ten minutes later if Egg Trainer level < 3
							if(flags["EGG_TRAINING_OVALASTING_LEVEL"] < 3) ovaBigEggMsg += "Warm gooeyness continues to ooze out of your [pc.vagOrAss " + thisStatus.value1 + "] and down your [pc.thigh], conspicuously not getting soaked up by the Ovalasting eggs within. Presumably they’ve gotten all they want - or they can sense, somehow, you aren’t built to take any more swelling. You feel a nagging annoyance about that. What a nice feature it is, to not worry about " + (isCrotchGarbed() ? "ruining your [pc.lowerGarments]" : "leaving a trail of cum behind you") + " every time you take a good, hard fuck. Perhaps if you egg trained yourself a little more...?";
							else ovaBigEggMsg += "Warmth throbs within you, the Ovalasting eggs within your [pc.vagOrAss " + thisStatus.value1 + "] reacting eagerly to the second bath of healthy, filthy fluids you’ve soaked them in. You groan with sheer contentment as your [pc.belly] swells even further, your brood already pushing against your sensitive walls, eager to colonize every last inch of space you have to give. Hell in the Void, is this making you feel ponderous... and amazing. Perhaps you could call back your last lover, see if they aren’t willing to pump you even fuller?";
							AddLogEvent(ovaBigEggMsg, "passive", maxEffectLength);
						}
						break;
					case "Ovalasting Early Clutch Timer":
						if (this is PlayerCharacter && requiresRemoval)
						{
							requiresRemoval = false;
							kGAMECLASS.eventQueue.push(kGAMECLASS.ovalastingPrematureBirth);
						}
						break;
					case "Ovilium":
						if (!hasPregnancyOfType("OviliumEggPregnancy"))
						{
							requiresRemoval = true;
						}
						break;
					case "Oil Warmed":
						if(this is PlayerCharacter) thisStatus.tooltip = "You’re covered in warm, protective oil!";
						else thisStatus.tooltip = capitalA + short + " is covered in warm, protective oil!";
						thisStatus.tooltip += "\nFreezing Resistance: +" + Math.ceil(MathUtil.LinearInterpolate(5, 15, getStatusMinutes("Oil Warmed") / 1440)) + "%";
						break;
					case "Oil Cooled":
						if(this is PlayerCharacter) thisStatus.tooltip = "You’re covered in cool, protective oil!";
						else thisStatus.tooltip = capitalA + short + " is covered in cool, protective oil!";
						thisStatus.tooltip += "\nBurning Resistance: +" + Math.ceil(MathUtil.LinearInterpolate(5, 15, getStatusMinutes("Oil Cooled") / 1440)) + "%";
						break;
					case "Oil Numbed":
						if(this is PlayerCharacter) thisStatus.tooltip = "You’re covered in numbing, lust-inhibiting oil!";
						else thisStatus.tooltip = capitalA + short + " is covered in numbing, lust-inhibiting oil!";
						thisStatus.tooltip += "\nLust gains are decreased.";
						break;
					case "Oil Aroused":
						if(this is PlayerCharacter) thisStatus.tooltip = "You’re covered in arousing, lust-inducing oil!";
						else thisStatus.tooltip = capitalA + short + " is covered in arousing, lust-inducing oil!";
						thisStatus.tooltip += "\nTeasing is more effective, but arousal comes more easily.";
						break;
					case "Oil Slicked":
						if(this is PlayerCharacter) thisStatus.tooltip = "You’re covered in super slippery oil!";
						else thisStatus.tooltip = capitalA + short + " is covered in super slippery oil!";
						thisStatus.tooltip += "\nIt’s easier to slip away from someone’s grasp.";
						break;
					case "Tentatool":
						if (this is PlayerCharacter && requiresRemoval)
						{
							Tentacool.tentacoolTF(this, thisStatus, maxEffectLength); 
						}
						break;
					case "Thicc&Shake":
						if(this is PlayerCharacter && requiresRemoval)
						{
							ThiccNShake.effectEnds(maxEffectLength, doOut, this, thisStatus);
						}
						break;
					case "Beta's Satisfaction":
						if(this is PlayerCharacter)
						{
							if(requiresRemoval && !hasStatusEffect("Dzaan Withdrawal"))
							{
								AddLogEvent(ParseText("The lingering satisfaction from serving your alpha has dissipated, leaving nothing but a disturbing thirst for more of her spunk in its wake. <b>You are in withdrawal!</b>"), "passive", maxEffectLength);
								//"Dzaan Withdrawal" -50% rest healing & +50% lust gain over time
								createStatusEffect("Dzaan Withdrawal",0,0,0,0,false,"Icon_Charmed","You crave your alpha’s cum, gaining Lust more quickly over time, and you find recovering during rest difficult with such distracted thoughts.", false, (kGAMECLASS.ardiaDomLevel() < 4 ? 24*28*60 : 0), 0xFF0000);
							}
						}
						break;
					case "Dzaan Withdrawal":
						if(this is PlayerCharacter)
						{
							if(requiresRemoval)
							{
								AddLogEvent(ParseText("The constant craving to serve at Ardia’s feet has finally faded. <b>You’re no longer addicted to her!</b>"), "passive", maxEffectLength);
								setStatusMinutes("Dzaan Addicted",1);
							}
						}
						break;
					case "Butt Bug Message Cooldown":
						if(requiresRemoval)
						{
							if(this is PlayerCharacter) kGAMECLASS.messageButtBugParasitism(deltaT, maxEffectLength, doOut, this, thisStatus);
							thisStatus.minutesLeft = ((6 + rand(19)) * 60);
							requiresRemoval = false;
						}
						break;
					case "Butt Bug Egg Cycle":
						if(requiresRemoval && statusEffectv1("Butt Bug (Female)") == 1)
						{
							thisStatus.value1 = (thisStatus.value1 != 0 ? 0 : 1);
							thisStatus.value2 = 0;
							thisStatus.value4 = 0;
							thisStatus.minutesLeft = (7 * 24 * 60);
							requiresRemoval = false;
							if(this is PlayerCharacter) AddLogEvent(ParseText("Your [pc.asshole] pulses " + (thisStatus.value1 == 0 ? "softly for a moment before settling down. <b>It seems like your attached butt bug has ended its egg-production cycle... for now.</b>" : "quickly in preparation to work overtime. <b>It seems your attached butt bug is ready to produce more eggs!</b>")), "passive", maxEffectLength);
						}
						if(statusEffectv1("Butt Bug (Female)") != 1) requiresRemoval = true;
						break;
					case "Undetected Furpies":
					case "Furpies Simplex H":
					case "Furpies Simplex C":
					case "Furpies Simplex D":
						if(this is PlayerCharacter)
						{
							kGAMECLASS.furpiesProcsGoooo(deltaT, maxEffectLength, doOut, this, thisStatus);
							if(requiresRemoval) 
							{
								thisStatus.minutesLeft = 0;
								requiresRemoval = false;
							}
						}
						break;
					case "Undetected Locofever":
					case "Locofever":
						if(this is PlayerCharacter)
						{
							kGAMECLASS.locofeverProcs(deltaT, maxEffectLength, doOut, this, thisStatus);
							if(requiresRemoval) 
							{
								kGAMECLASS.locofeverFinish(deltaT, maxEffectLength, doOut, this, thisStatus);
								requiresRemoval = false;
							}
						}
						break;
					case "Undetected Cooties":
					case "Cooties":
						if(this is PlayerCharacter)
						{
							kGAMECLASS.cootiesProcGoooo(deltaT, maxEffectLength, doOut, this, thisStatus);
						}
						break;
					case "Undetected Sneezing Tits":
					case "Sneezing Tits":
						if(this is PlayerCharacter)
						{
							kGAMECLASS.sneezingTitsProcs(deltaT, maxEffectLength, doOut, this, thisStatus);
							if(thisStatus.value4 < 0) requiresRemoval = true;
							else if(requiresRemoval)
							{
								kGAMECLASS.sneezingTitsFinish(deltaT, maxEffectLength, doOut, this, thisStatus);
								requiresRemoval = false;
							}
						}
						break;
				}
				
				// Removal check!
				if (thisStatus.tooltip == "< REMOVE >") requiresRemoval = true;
				
				if (requiresRemoval)
				{
					statusEffects.splice(i, 1);
					i--;
				}
			}
			
			if (deferredEvents != null && deferredEvents.length > 0)
			{
				for (i = 0; i < deferredEvents.length; i++)
				{
					deferredEvents[i]();
				}
			}
		}
		public function analHeatCleanup():void
		{
			clearAnalHeat();
			removeStatusEffect("Omega Oil");
		}
		public function heatCleanup():void
		{
			clearHeat();
		}
		public function updateAlcoholState(deltaT:uint, doOut:Boolean):void
		{
			var thisStatus:StorageClass = getStatusEffect("Alcohol");
			
			if (thisStatus == null) return;
			
			var timeConsuming:Number = 0;
			
			if (thisStatus.value1 > 0)
			{
				// Alcohol is consumed at a rate of 1 unit per minute
				timeConsuming = Math.min(deltaT, thisStatus.value1);
				thisStatus.value1 -= timeConsuming;
				
				if (hasPerk("'Nuki Drunk")) thisStatus.value2 += (timeConsuming * 0.5);
				else thisStatus.value2 += timeConsuming;
				
				thisStatus.value3 = 0;
				
				if (thisStatus.value2 >= 25 && !hasStatusEffect("Buzzed"))
				{
					createStatusEffect("Buzzed",0,0,0,0, false, "Icon_DizzyDrunk", (this is PlayerCharacter ? "You’re a little buzzed, leaving you feeling strong but a little slower of wit and weaker of will.\n\nThis status will expire as your alcohol levels drop." : ""), false, 0,0xB793C4);
					physiqueMod += 2;
					willpowerMod -= 1;
					intelligenceMod -= 1;
					if(this is PlayerCharacter) AddLogEvent("Damn, that stuff you were drinking was awesome. <b>You’re feeling pretty good right now. You must be buzzed.</b>", "passive", deltaT);
				}
				
				if (thisStatus.value2 >= 50 && !hasStatusEffect("Drunk"))
				{
					if (hasStatusEffect("Buzzed"))
					{
						getStatusEffect("Buzzed").hidden = true;
					}
					
					physiqueMod += 2;
					reflexesMod -= 1;
					createStatusEffect("Drunk",0,0,0,0, false, "Icon_DizzyDrunk", (this is PlayerCharacter ? "You’re feeling a little drunk at the moment. Your faculties and reflexes are dulled, but you feel like you could arm wrestle the world if you were so inclined.\n\nThis status will expire as your alcohol levels drop." : ""), false, 0,0xB793C4);
					if(this is PlayerCharacter) AddLogEvent("Your sense of balance is slipping a little. <b>You might be a little drunk. Just a little, you assure yourself.</b>", "passive", deltaT);
				}
				
				if (thisStatus.value2 >= 75 && !hasStatusEffect("Smashed"))
				{
					if (hasStatusEffect("Drunk"))
					{
						getStatusEffect("Drunk").hidden = true;
					}
					
					physiqueMod += 1;
					reflexesMod -= 1;
					willpowerMod -= 1;
					intelligenceMod -= 1;
					createStatusEffect("Smashed",0,0,0,0, false, "Icon_DizzyDrunk", (this is PlayerCharacter ? "You’re three sheets to the wind, but you feel like you could flip a truck.\n\nThis status will expire as your alcohol levels drop." : ""), false, 0,0xB793C4);
					if(this is PlayerCharacter) AddLogEvent(ParseText("[pc.Walking] is increasingly difficult, but you’ll be damned if you don’t feel like you can do anything. <b>You’re smashed!</b>"), "passive", deltaT);
				}
			}
			
			// Confer how long it has been since anything was last imbibed. This is essentially (total time passing - max time consuming latent volume)
			var postConsumptionTime:Number = deltaT - timeConsuming;
			thisStatus.value3 += postConsumptionTime;
			
			var soberingTime:Number = 0;
			
			if (thisStatus.value3 > 60 && thisStatus.value2 > 0)
			{
				soberingTime = Math.min(thisStatus.value2, (hasPerk("'Nuki Drunk") ? (postConsumptionTime * 0.25) : postConsumptionTime));
				thisStatus.value2 -= soberingTime;
				
				if (thisStatus.value2 < 75 && hasStatusEffect("Smashed"))
				{
					if (hasStatusEffect("Drunk"))
					{
						getStatusEffect("Drunk").hidden = false;
					}
					else
					{
						createStatusEffect("Drunk",0,0,0,0, false, "Icon_DizzyDrunk", (this is PlayerCharacter ? "You’re feeling a little drunk at the moment. Your faculties and reflexes are dulled, but you feel like you could arm wrestle the world if you were so inclined.\n\nThis status will expire as your alcohol levels drop." : ""), false, 0,0xB793C4);
					}
					
					physiqueMod -= 1;
					reflexesMod += 1;
					willpowerMod += 1;
					intelligenceMod += 1;
					
					removeStatusEffect("Smashed");
					
					if(this is PlayerCharacter) AddLogEvent("Your head is starting to clear a little, but <b>you’re still pretty drunk.</b>", "passive", deltaT);
				}
				
				if (thisStatus.value2 < 50 && hasStatusEffect("Drunk"))
				{
					if (hasStatusEffect("Buzzed"))
					{
						getStatusEffect("Buzzed").hidden = false;
					}
					else
					{
						createStatusEffect("Buzzed",0,0,0,0, false, "Icon_DizzyDrunk", (this is PlayerCharacter ? "You’re a little buzzed, leaving you feeling strong but a little slower of wit and weaker of will.\n\nThis status will expire as your alcohol levels drop." : ""), false, 0,0xB793C4);
					}
					
					physiqueMod -= 2;
					reflexesMod += 1;
					
					removeStatusEffect("Drunk");
					
					if(this is PlayerCharacter) AddLogEvent("The more time passes, the more nimble you feel. Your reflexes are sharpening as the alcohol fades from your system. <b>You’re only buzzed.</b>", "passive", deltaT);
				}
				
				if (thisStatus.value2 < 25 && hasStatusEffect("Buzzed"))
				{
					
					physiqueMod -= 2;
					willpowerMod += 1;
					intelligenceMod += 1;
					
					removeStatusEffect("Buzzed");
					
					if(this is PlayerCharacter) AddLogEvent("Blinking, you realize that the alcohol has faded from your system. <b>You’re no longer buzzed.</b>", "passive", deltaT);
				}
			}
			
			if (thisStatus.value2 <= 0)
			{
				removeStatusEffect("Alcohol");
				//Remove the companion status from Kally's brews~!
				removeStatusEffect("Adorahol");
			}
		}
	
		/**
		 * This is something I tangentially discussed with Nonesuch. This is basically a "catch all" means of figuring out if the player would take an almost exclusively submissive path when offered choices.
		 * It's not intended to be a "special" event or single perk, but instead a collection of potential sources that should be treated in this manner.
		 * Rather than "documenting" it officially, we keep it on the down-low until we have a few things that could potentially feed into it.
		 * @return
		 */
		public function isSubby():Boolean
		{
			return hasPerk("Peace of Mind");
		}
		
		public function hasPlumpAsshole():Boolean
		{
			return (ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) || ass.hasFlag(GLOBAL.FLAG_PUMPED) || ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED));
		}
		public function hasPlumpPussy(arg:Number = -1):Boolean
		{
			if(vaginas.length <= 0) return false;
			if(arg >= 0 && arg > vaginas.length-1) return false;
			if(arg >= 0) return (vaginas[arg].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) || vaginas[arg].hasFlag(GLOBAL.FLAG_PUMPED) || vaginas[arg].hasFlag(GLOBAL.FLAG_HYPER_PUMPED));
			//check em all, fam
			else
			{
				for (var x:int = 0; x < vaginas.length; x++)
				{
					if(vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) || vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) || vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) return true;
				}
			}

			return false;
		}
		public function catDog(c:String, d:String, prefDog:Boolean = true):String
		{
			var r:String = raceShort();
			if (r.indexOf("kaithrit") != -1 || r.indexOf("feline") != -1 || r.indexOf("naleen") != -1) return c;
			if (r.indexOf("ausar") != -1 || r.indexOf("huskar") != -1 || r.indexOf("milodan") != -1 || r.indexOf("korgonne") != -1 || r.indexOf("canine") != -1 || r.indexOf("vulpine") != -1 || r.indexOf("lupine") != -1) return d;
			return (prefDog ? d : c);
		}
		
		public var assignedModule:ShipModule;
		public function hasSSTD(sstdName:String = "all", inFamily:Boolean = false):Boolean
		{
			if(inFamily)
			{
				if(sstdTotal(sstdName) > 0) return true;
			}
			else if(sstdName != "all")
			{
				var sstdList:Array = kGAMECLASS.sstdList();
				if(InCollection(sstdName, sstdList))
				{
					for(var i:int = 0; i < statusEffects.length; i++)
					{
						if(statusEffects[i].storageName == sstdName) return true;
					}
				}
				return false;
			}
			return (getRandomSSTD() != "none");
		}
		public function clearSSTDs(filter:String = "all"):void
		{
			removeSSTDs(filter);
		}
		public function removeSSTDs(filter:String = "all"):void
		{
			var sstdList:Array = kGAMECLASS.sstdList(filter);
			for(var i:int = 0; i < sstdList.length; i++)
			{
				removeStatusEffect(sstdList[i]);
			}
		}
		public function sstdTotal(filter:String = "all"):Number
		{
			var sstdList:Array = kGAMECLASS.sstdList(filter);
			var num:Number = 0;
			for(var i:int = 0; i < statusEffects.length; i++)
			{
				if(InCollection(statusEffects[i].storageName, sstdList)) num++;
			}

			return num;
		}
		public function getRandomSSTD(filter:String = "all"):String
		{
			var sstdList:Array = kGAMECLASS.sstdList(filter);
			var SSTDs:Array = [];
			for(var i:int = 0; i < statusEffects.length; i++)
			{
				if(InCollection(statusEffects[i].storageName, sstdList)) SSTDs.push(statusEffects[i].storageName);
			}

			if(SSTDs.length == 0) return "none";
			else return SSTDs[rand(SSTDs.length)];
		}
		public function isSSTDImmune():Boolean
		{
			if(hasPerk("STD Immune") || hasStatusEffect("STD Immunity")) return true;
			return false;
		}
		public function sstdChecks(cumFrom:Creature, location:String):void
		{
			if(isSSTDImmune() || cumFrom == null || cumFrom.isSSTDImmune()) return;
			
			var catchSSTD:String = "";
			if(!(cumFrom is PlayerCharacter) && cumFrom.hasSSTD())
			{
				sstdCatch(cumFrom, this, location);
			}
			if((cumFrom is PlayerCharacter) && hasSSTD())
			{
				sstdCatch(this, cumFrom, location);
			}
		}
		public function sstdCatch(cumFrom:Creature, victim:Creature, location:String):void
		{
			var catchSSTD:String = cumFrom.getRandomSSTD();
			//output(catchSSTD);
			switch(catchSSTD)
			{
				case "Undetected Furpies":
					//FURPIES!
					if(victim.hasSSTD("Furpies", true)) { /* Already have it! */ }
					else if(victim.hasFur()) { /* Furries are immune to furpies. */ }
					else victim.createStatusEffect("Undetected Furpies",0,0,0,0,true,"","Hidden furpies infection! OH NOEZ",false,17280,0xFF69B4);
					break;
				case "Undetected Locofever":
					if(victim.hasSSTD("Locofever", true)) { /* Already have it! */ }
					else victim.createStatusEffect("Undetected Locofever", 0, 0, 0, 0, true, "LustUp", "Hidden Locofever infection!", false, 17280, 0xFF69B4);
					break;
				case "Undetected Sneezing Tits":
					if(victim.hasSSTD("Sneezing Tits", true)) { /* Already have it! */ }
					else victim.createStatusEffect("Undetected Sneezing Tits", 0, 0, 0, 0, true, "Icon_Boob_Torso", "Hidden Sneezing Tits infection!", false, 10080, 0xFF69B4);
					break;
				case "Undetected Cooties":
					if(victim.hasSSTD("Cooties", true)) { /* Already have it! */ }
					else victim.createStatusEffect("Undetected Cooties", 0, 0, 0, 0, true, "Icon_Boob_Torso", "Hidden Cooties infection!", false, 4320, 0xFF69B4);
					break;
			}
		}
		public function sstdPurgeCheck(deltaT:uint, doOut:Boolean):void
		{
			if(hasSSTD() && isSSTDImmune())
			{
				if(this is PlayerCharacter)
				{
					AddLogEvent("Your codex beeps, alerting you that your immune system’s activity has suddenly spiked before returning to normal levels. <b>You body has purged itself from any and all SSTD infections.</b>", "words", deltaT);
				}
				removeSSTDs();
			}
		}
		public function applyCumSoaked():void
		{
			var desc:String = "";
			
			if(!hasStatusEffect("Cum Soaked"))
			{
				if(this is PlayerCharacter) desc = "You’re drenched in cum! Anyone can tell at a glance what sort of activities you’ve been engaging in!";
				else desc = capitalA + short + " " + (!isPlural ? "is" : "are") + " completely covered in cum!";
				createStatusEffect("Cum Soaked",1,0,0,0,false,"Icon_Splatter",desc,false,0,0xB793C4);
			}
			else addStatusValue("Cum Soaked",1,1);
			
			if(this is PlayerCharacter) kGAMECLASS.mimbraneFeed("all");
		}
		public function applyPussyDrenched():void
		{
			var desc:String = "";
			
			if(!hasStatusEffect("Pussy Drenched"))
			{
				if(this is PlayerCharacter) desc = "You’re drenched in girlcum! Anyone can tell at a glance what sort of activities you’ve been engaging in!";
				else desc = capitalA + short + " " + (!isPlural ? "is" : "are") + " completely covered in girlcum!";
				createStatusEffect("Pussy Drenched",1,0,0,0,false,"Icon_Water_Drop",desc,false,0,0xB793C4);
			}
			else addStatusValue("Pussy Drenched",1,1);
			
			if(this is PlayerCharacter) kGAMECLASS.mimbraneFeed("all");
		}
		public function applyPussySoaked():void
		{
			applyPussyDrenched();
		}
		public function applyMilkBathed():void
		{
			var desc:String = "";
			
			if(!hasStatusEffect("Milk Bathed"))
			{
				if(this is PlayerCharacter) desc = "You’re drenched in breastmilk! Anyone can tell at a glance what sort of activities you’ve been engaging in!";
				else desc = capitalA + short + " " + (!isPlural ? "is" : "are") + " completely covered in breastmilk!";
				createStatusEffect("Milk Bathed",1,0,0,0,false,"Icon_Rain_Drops",desc,false,0,0xB793C4);
			}
			else addStatusValue("Milk Bathed",1,1);
			
			if(this is PlayerCharacter) kGAMECLASS.mimbraneFeed("all");
		}
		public function applyPriapism():void
		{
			var desc:String = "";
			
			if(this is PlayerCharacter) desc = "You are unnaturally hard and erect regardless of your arousal level. The added discomfort prevents you from covering up!";
			else desc = capitalA + short + " " + (!isPlural ? "is" : "are") + " unnaturally erect regardless of arousal level!";
			
			// Priapism
			// Minimum lust raised to 33 if below :3
			// Lasts 7 days, but every orgasm reduces it by 15 hours.
			// v1: 0 for orgasm timer reducer, 1 for ignore orgasms
			createStatusEffect("Priapism", 0, 0, 0, 0, false, "OffenseUp", desc, false, 0, 0xB793C4);
			setStatusMinutes("Priapism", (7*24*60));
		}
		
		// Floor-touching check
		public function isOnGround():Boolean
		{
			if(hasStatusEffect("Tripped")) return true;
			if(hasFlightEffects() || hasJetpack()) return false;
			if(isRidingMount() || hasItemByClass(Hoverboard)) return false;
			return true;
		}
		// Firmly planted on the ground
		public function isPlanted():Boolean
		{
			if(hasStatusEffect("Planted")) return true;
			return false;
		}
		// Mounts!
		public function isRidingMount():Boolean
		{
			if(accessory is KordiiakLeash || accessory is GrunchLeash || accessory is NogwichLeash) return true;
			return false;
		}
		
		// Silicone
		public function siliconeRating(sType:String = "all"):Number
		{
			var nRating:Number = 0;
			
			switch(sType)
			{
				case "hips":
					nRating += statusEffectv1("Nym-Foe Injections");
					break;
				case "butt":
					nRating += statusEffectv2("Nym-Foe Injections");
					break;
				case "tits":
					nRating += statusEffectv3("Nym-Foe Injections");
					break;
				case "lips":
					nRating += statusEffectv4("Nym-Foe Injections");
					break;
				case "all":
					nRating += statusEffectv1("Nym-Foe Injections");
					nRating += statusEffectv2("Nym-Foe Injections");
					nRating += statusEffectv3("Nym-Foe Injections");
					nRating += statusEffectv4("Nym-Foe Injections");
					break;
			}
			
			return nRating;
		}
		public function hasSilicone(sType:String = "all"):Boolean
		{
			return (siliconeRating(sType) > 0);
		}
		public function hasDildo():Boolean
		{
			for(var i:int = 0; i < inventory.length; i++)
			{
				if(inventory[i] is Dildo) return true;
			}
			return false;
		}
	}
}