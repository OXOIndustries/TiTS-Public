	package classes {
	import classes.CockClass;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.SingleCombatAttack;
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
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.*;
	import classes.ShittyShips.ShittyShipGear.Gadgets.ShieldDisruptor;

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

		public var wardrobeSizeRaw:Number = 10;
		public var equipmentSizeRaw:Number = 10;
		public var consumableSizeRaw:Number = 10;
		public var valuablesSizeRaw:Number = 10;
		public var toysSizeRaw:Number = 10;

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
			var bonus:Number = 0;
			bonus += equippedItemCountByClass(ShieldDisruptor) * 5;
			return intelligenceRaw;
		}
		public var shipCapacityRaw:Number = 3;
		//Probably set via perk.
		public function shipCapacity():Number
		{
			return shipCapacityRaw;
		}
		public function shipCrewCapacity():Number
		{
			return (shipCapacity() - this.inventory.length + 1);
		}
		//STORAGE SIZES!
		public function wardrobeSize():Number
		{
			return wardrobeSizeRaw;
		}
		public function equipmentSize():Number
		{
			return equipmentSizeRaw;
		}
		public function consumableSize():Number
		{
			return consumableSizeRaw;
		}
		public function valuablesSize():Number
		{
			return valuablesSizeRaw;
		}
		public function toysSize():Number
		{
			return toysSizeRaw;
		}

		//MORE ADVANCED BS
		//(Agility/Speed Combination, +equipment evasion stat, +pcreflexes) - a % chance of 
		public function shipEvasion():Number
		{
			var bonus:Number = 0;
			if(hasPerk("PCs")) bonus = kGAMECLASS.pc.reflexes()/4;
			if(hasStatusEffect("Evading!")) bonus += 50;
			return bonus + shipStatBonusTotal(0);
		}
		//(Sensors + Systems +Chosen weapon stat, +pcaim) - additively reduces enemy evasion
		public function shipAccuracy():Number
		{
			var bonus:Number = 0;
			if(hasPerk("PCs")) bonus = kGAMECLASS.pc.aim()/4;
			return bonus + shipStatBonusTotal(1);
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
				if(inventory[i].type != GLOBAL.RANGED_WEAPON) shieldDefense += inventory[i].shieldDefense;
				fortification += inventory[i].fortification;
				shields = inventory[i].shields;
			}
			//Locked in equipment additions:
			evasion += meleeWeapon.evasion + rangedWeapon.evasion + armor.evasion + shield.evasion + accessory.evasion;
			accuracy += meleeWeapon.attack + rangedWeapon.attack + armor.attack + shield.attack + accessory.attack;

			defense += meleeWeapon.defense + rangedWeapon.defense + armor.defense + shield.defense + accessory.defense;
			fortification += meleeWeapon.fortification + rangedWeapon.fortification + armor.fortification + shield.fortification + accessory.fortification;

			shields += meleeWeapon.shields + rangedWeapon.shields + armor.shields + shield.shields + accessory.shields;
			if(meleeWeapon.type != GLOBAL.RANGED_WEAPON) shieldDefense += meleeWeapon.shieldDefense;
			if(rangedWeapon.type != GLOBAL.RANGED_WEAPON) shieldDefense += rangedWeapon.shieldDefense;
			if(armor.type != GLOBAL.RANGED_WEAPON) shieldDefense += armor.shieldDefense;
			if(shield.type != GLOBAL.RANGED_WEAPON) shieldDefense += shield.shieldDefense;
			if(accessory.type != GLOBAL.RANGED_WEAPON) shieldDefense += accessory.shieldDefense;			
			if(type == 0) return evasion;
			else if(type == 1) return accuracy;
			else if(type == 2) return defense;
			else if(type == 3) return shieldDefense;
			else if(type == 4) return fortification;
			else if(type == 5) return shields;
			else return -1;
		}
		public function gadgetCount():int
		{
			var count:int = 0;

			if(meleeWeapon.type == GLOBAL.GADGET) count++;
			if(rangedWeapon.type == GLOBAL.GADGET) count++;
			if(accessory.type == GLOBAL.GADGET) count++;
			if(lowerUndergarment.type == GLOBAL.GADGET) count++;
			if(upperUndergarment.type == GLOBAL.GADGET) count++;
			if(armor.type == GLOBAL.GADGET) count++;
			if(shield.type == GLOBAL.GADGET) count++;

			if(inventory.length == 0) return count;
			for (var i:uint = 0; i < inventory.length; i++)
			{
				if (inventory[i].type == GLOBAL.GADGET) count ++;
			}
			return count;
		}
		public function equippedItemCountByClass(arg:Class):int
		{
			if(arg == null) return 0;
			var count:int = 0;

			if(meleeWeapon is arg) count++;
			if(rangedWeapon is arg) count++;
			if(accessory is arg) count++;
			if(lowerUndergarment is arg) count++;
			if(upperUndergarment is arg) count++;
			if(armor is arg) count++;
			if(shield is arg) count++;

			if(inventory.length == 0) return count;
			for (var i:uint = 0; i < inventory.length; i++)
			{
				if (inventory[i] is arg) count ++;
			}
			return count;
		}
		public function listShipEquipment(all:Boolean = false):Array
		{
			var equipment:Array = [];
			if(!(meleeWeapon is EmptySlot)) equipment.push(meleeWeapon);
			if(!(rangedWeapon is EmptySlot)) equipment.push(rangedWeapon);
			if(!(accessory is EmptySlot)) equipment.push(accessory);
			if(!(lowerUndergarment is EmptySlot)) equipment.push(lowerUndergarment);
			if(!(upperUndergarment is EmptySlot)) equipment.push(upperUndergarment);
			for(var i:int = 0; i < inventory.length; i++)
			{
				equipment.push(inventory[i]);
			}
			//Shields/Armor are stock and dont really need this, but futureproof
			if(all && !(shield is EmptySlot)) equipment.push(shield);
			if(all && !(armor is EmptySlot)) equipment.push(armor);
			return equipment;
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
		public function listShipGadgets():Array
		{
			var gadgets:Array = [];
			if(meleeWeapon.type == GLOBAL.GADGET) gadgets.push(meleeWeapon);
			if(rangedWeapon.type == GLOBAL.GADGET) gadgets.push(rangedWeapon);
			if(accessory.type == GLOBAL.GADGET) gadgets.push(accessory);
			if(shield.type == GLOBAL.GADGET) gadgets.push(shield);
			if(armor.type == GLOBAL.GADGET) gadgets.push(armor);
			if(lowerUndergarment.type == GLOBAL.GADGET) gadgets.push(lowerUndergarment);
			if(upperUndergarment.type == GLOBAL.GADGET) gadgets.push(upperUndergarment);
			for(var i:int = 0; i < inventory.length; i++)
			{
				if(inventory[i].type == GLOBAL.GADGET) gadgets.push(inventory[i]);
			}
			return gadgets;
		}
		public function shipWeaponDamage(weapon:ItemSlotClass):TypeCollection
		{
			var modifiedDamage:TypeCollection;
			
			modifiedDamage = weapon.baseDamage.makeCopy();
			if(hasPerk("PCs")) modifiedDamage.add(kGAMECLASS.pc.aim()/2);
			
			return modifiedDamage;
		}
		override public function HPMax():Number
		{
			var bonus:int = 0;
			bonus = fortification();
			var hitPoints:Number = 15 + HPMod + bonus;
			//Boost by up to 10% based on physique.
			if(hasPerk("PCs")) hitPoints = Math.ceil(hitPoints + (hitPoints * (kGAMECLASS.pc.physique() / (kGAMECLASS.pc.level * 50))));
			return hitPoints;
		}
		override public function shieldsMax(): Number {
			//No proper shield generator? NO SHIELD!
			if(hasShields() && !hasShieldGenerator(true)) return 0;
			
			var temp: int = 0;
			temp += meleeWeapon.shields;
			temp += rangedWeapon.shields;
			temp += armor.shields + upperUndergarment.shields + lowerUndergarment.shields + accessory.shields + shield.shields;
			
			if(hasPerk("PCs")) temp = Math.ceil(temp + (temp * (kGAMECLASS.pc.willpower() / (kGAMECLASS.pc.level * 5 * 4))));

			if (temp < 0) temp = 0;
			return temp;
		}
		public function resetEquipment():void
		{
			var equipment:Array = listShipEquipment();
			for(var i:int = 0; i < equipment.length; i++)
			{
				if(equipment[i].hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF)) equipment[i].deleteFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF);
			}
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			var shots:Number = 0;
			//Fire built-in weapons
			if(meleeWeapon.type == GLOBAL.RANGED_WEAPON && !meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF)) 
			{
				if(shots++ > 0) output("\n");
				CombatAttacks.SingleRangedShipAttackImpl(this, target,meleeWeapon, false, "ranged");
			}
			if(rangedWeapon.type == GLOBAL.RANGED_WEAPON && !rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF)) 
			{
				if(shots++ > 0) output("\n");
				CombatAttacks.SingleRangedShipAttackImpl(this, target, rangedWeapon, false, "ranged");
			}
			if(accessory.type == GLOBAL.RANGED_WEAPON && !accessory.hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF)) 
			{
				if(shots++ > 0) output("\n");
				CombatAttacks.SingleRangedShipAttackImpl(this, target, accessory, false, "ranged");
			}
			//Fire "inventory" weapons that are turned on.
			for(var x:int = 0; x < this.inventory.length; x++)
			{
				if(inventory[x].type == GLOBAL.RANGED_WEAPON && !inventory[x].hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF))
				{
					if(shots++ > 0) output("\n");
					CombatAttacks.SingleRangedShipAttackImpl(this, target, inventory[x], false, "ranged");
				}
			}
			//RECOVER POWER
			this.energy(this.shipPowerGen());
			if (target == null) return;
		}
	}
}