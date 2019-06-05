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
	import classes.Items.Piercings.OpalRingPiercing;
	import classes.Items.Transformatives.*;
	import classes.Items.Treasures.Savicite;
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

	public class ShittyShip extends Creature {
	
		//Constructor
		public function ShittyShip() {
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

		public var captainDisplay:String = "UNKNOWN";
		public var modelDisplay:String = "UNKNOWN";
		public var factionDisplay:String = "UNKNOWN";

		//================================================================
		//
		//				Fenoxo's Hacky Ship Bullship.
		//					Seriously, this is garbage. Will
		//					probably be cut later. Sorry.
		//
		//================================================================
		//Base Stats
		//Agility (mapped to reflexes)
		public function shipAgility():Number
		{
			return reflexesRaw;
		}
		//Speed (mapped to physique)
		public function shipSpeed():Number
		{
			return physiqueRaw;
		}
		//Power Generation (mapped to willpower)
		public function shipPowerGen():Number
		{
			return willpowerRaw;
		}
		//Sensors (Mapped to Aim)
		public function shipSensors():Number
		{
			return aimRaw;
		}
		//Systems (Mapped to Intelligence)
		public function shipSystems():Number
		{
			return intelligenceRaw;
		}
		//Probably set via perk.
		public function shipCapacity():Number
		{
			return 3;
		}
		//(Agility/Speed Combination, +equipment evasion stat, +pcreflexes) - a % chance of 
		public function shipEvasion():Number
		{
			return shipStatBonusTotal(0);
		}
		//(Sensors + Systems +Chosen weapon stat, +pcaim) - additively reduces enemy evasion
		public function shipAccuracy():Number
		{
			return shipStatBonusTotal(1);
		}
		public function shipShieldDef():Number
		{
			return shipStatBonusTotal(3);
		}
		public function shipDefense():Number
		{
			return shipStatBonusTotal(2);
		}
		//0 - evasion
		//1 - accuracy
		//2 - defense
		//3 - shielddef
		//4 - fortification
		//5 - shields
		//? - More to cum as needed, probs
		public function shipStatBonusTotal(type:Number = 0):Number
		{
			//I cant think of an easy way to map the argument to the actual sub variables we need to pull, so I'll just total everything, and then pass out whichever one is needed. Is this dumb? Probably.
			var evasion:Number = 0;
			var accuracy:Number = 0;
			var defense:Number = 0;
			var shieldDefense:Number = 0;
			var fortification:Number = 0;
			var shields:Number = 0;

			//Inventory additions
			for(var i:int = 0; i < inventory.length; i++)
			{
				evasion += inventory[i].evasion;
				accuracy += inventory[i].attack;
				defense += inventory[i].defense;
				shieldDefense += inventory[i].shieldDefense;
				fortification += inventory[i].fortification;
				shields = inventory[i].shields;
			}
			//Locked in equipment additions:
			evasion += meleeWeapon.evasion + rangedWeapon.evasion + armor.evasion + shield.evasion + accessory.evasion;
			accuracy += meleeWeapon.attack + rangedWeapon.attack + armor.attack + shield.attack + accessory.attack;

			defense += meleeWeapon.defense + rangedWeapon.defense + armor.defense + shield.defense + accessory.defense;
			fortification += meleeWeapon.fortification + rangedWeapon.fortification + armor.fortification + shield.fortification + accessory.fortification;

			shields += meleeWeapon.shields + rangedWeapon.shields + armor.shields + shield.shields + accessory.shields;
			shieldDefense += meleeWeapon.shieldDefense + rangedWeapon.shieldDefense + armor.shieldDefense + shield.shieldDefense + accessory.shieldDefense;
			
			if(type == 0) return evasion;
			else if(type == 1) return accuracy;
			else if(type == 2) return defense;
			else if(type == 3) return shieldDefense;
			else if(type == 4) return fortification;
			else if(type == 5) return shields;
			else return -1;
		}
		public function listShipWeapons():Array
		{
			var weaps:Array = [];
			if(meleeWeapon.type == GLOBAL.RANGED_WEAPON) weaps.push(meleeWeapon);
			if(rangedWeapon.type == GLOBAL.RANGED_WEAPON) weaps.push(rangedWeapon);
			for(var i:int = 0; i < inventory.length; i++)
			{
				if(inventory[i].type == GLOBAL.RANGED_WEAPON) weaps.push(inventory[i]);
			}
			return weaps;
		}
	}
}