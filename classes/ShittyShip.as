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
	import classes.ShittyShips.ShittyShipGear.Gadgets.*;
	import classes.ShittyShips.ShittyShipGear.Upgrades.*;
	import classes.ShittyShips.ClydesdaleK7;
	import classes.ShittyShips.NPCShips.TeyaalsMSXI;

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
			var bonus:Number = (equippedItemCountByClass(ThrustVectoringSystem)*20);
			return (reflexesRaw+bonus);
		}
		//Speed (mapped to physique)
		public function shipThrust():Number { return shipSpeed(); }
		public function shipSpeed():Number
		{
			var bonus:Number = (equippedItemCountByClass(AuxiliaryThrusters) * 25);
			return (physiqueRaw + bonus);
		}
		//Power Generation (mapped to willpower)
		public function shipPowerGen():Number
		{
			return willpowerRaw + (equippedItemCountByClass(PowerCoreTuner)*15);
		}
		//Sensors (Mapped to Aim)
		public function shipSensors():Number
		{
			var bonus:Number = (equippedItemCountByClass(SensorSuite) * 25);
			return (aimRaw + bonus);
		}
		//Systems (Mapped to Intelligence)
		public function shipSystems():Number
		{
			var bonus:Number = 0;
			bonus += equippedItemCountByClass(ShieldDisruptor) * 5;
			bonus += equippedItemCountByClass(HardenedSystems) * 25;
			return intelligenceRaw + bonus;
		}
		public var shipGunCapacityRaw:Number = 2;
		public var shipCapacityRaw:Number = 3;
		//Probably set via perk.
		public function shipCapacity():Number
		{
			var bonus:Number = 0;
			return shipCapacityRaw + bonus;
		}
		public function shipWeaponCapacity():Number { return shipGunCapacity(); }
		public function shipGunCapacity():Number
		{
			return shipGunCapacityRaw;
		}
		public function bonusCrewCapacity(statDisplay:Boolean = false):Number
		{
			var bonus:Number = 0;
			if(this is ClydesdaleK7) bonus += 2;
			bonus += (equippedItemCountByClass(AdvancedQuarters) * (statDisplay ? 1 : 2));
			return bonus;
		}
		public function shipCrewCapacity():Number
		{
			return ((shipCapacity() + bonusCrewCapacity()) - this.inventory.length);
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
			if(hasStatusEffect("Stealth Field")) bonus += 80;
			return bonus + shipThrust()/2 + shipAgility() + shipStatBonusTotal(0);
		}
		//(Sensors + Systems +Chosen weapon stat, +pcaim) - additively reduces enemy evasion
		public function shipAccuracy():Number
		{
			var bonus:Number = 0;
			if(hasPerk("PCs")) bonus = kGAMECLASS.pc.aim()/4;
			return bonus + shipSystems()/2 + shipSensors() + shipStatBonusTotal(1);
		}
		override public function shieldDefense(): Number 
		{
			return shipStatBonusTotal(3);
		}
		override public function defense():Number
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
				if(inventory[i].type != GLOBAL.RANGED_WEAPON && inventory[i].type != GLOBAL.GADGET) shieldDefense += inventory[i].shieldDefense;
				fortification += inventory[i].fortification;
				shields += inventory[i].shields;
			}
			//Locked in equipment additions:
			evasion += meleeWeapon.evasion + rangedWeapon.evasion + armor.evasion + shield.evasion + accessory.evasion;
			accuracy += meleeWeapon.attack + rangedWeapon.attack + armor.attack + shield.attack + accessory.attack;

			defense += meleeWeapon.defense + rangedWeapon.defense + armor.defense + shield.defense + accessory.defense;
			fortification += meleeWeapon.fortification + rangedWeapon.fortification + armor.fortification + shield.fortification + accessory.fortification;

			//Shields
			shields += meleeWeapon.shields + rangedWeapon.shields + armor.shields + shield.shields + accessory.shields;
			//ShieldDef
			if(meleeWeapon.type != GLOBAL.RANGED_WEAPON && meleeWeapon.type != GLOBAL.GADGET) shieldDefense += meleeWeapon.shieldDefense;
			if(rangedWeapon.type != GLOBAL.RANGED_WEAPON && rangedWeapon.type != GLOBAL.GADGET) shieldDefense += rangedWeapon.shieldDefense;
			if(armor.type != GLOBAL.RANGED_WEAPON && armor.type != GLOBAL.GADGET) shieldDefense += armor.shieldDefense;
			if(shield.type != GLOBAL.RANGED_WEAPON && shield.type != GLOBAL.GADGET) shieldDefense += shield.shieldDefense;
			if(accessory.type != GLOBAL.RANGED_WEAPON && accessory.type != GLOBAL.GADGET) shieldDefense += accessory.shieldDefense;			

			//Output the variable.
			if(type == 0) return evasion;
			else if(type == 1) return accuracy;
			else if(type == 2) return defense;
			else if(type == 3) return shieldDefense;
			else if(type == 4) return fortification;
			else if(type == 5) return shields;
			else return -1;
		}
		public function shipCost():Number
		{
			var cost:Number = credits;
			for(var i:int = 0; i < inventory.length; i++)
			{
				cost += inventory[i].basePrice;
			}
			return cost;
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
		public function getFixedEquipment():Array
		{
			var equipment:Array = [];
			if(!(meleeWeapon.type is EmptySlot)) equipment.push(meleeWeapon);
			if(!(rangedWeapon.type is EmptySlot)) equipment.push(rangedWeapon);
			if(!(accessory.type is EmptySlot)) equipment.push(accessory);
			if(!(lowerUndergarment.type is EmptySlot)) equipment.push(lowerUndergarment);
			if(!(upperUndergarment.type is EmptySlot)) equipment.push(upperUndergarment);
			return equipment;
		}
		public function shipWeaponDamage(weapon:ItemSlotClass):TypeCollection
		{
			var modifiedDamage:TypeCollection;
			
			modifiedDamage = weapon.baseDamage.makeCopy();
			if(hasPerk("PCs")) modifiedDamage.add(kGAMECLASS.pc.aim()/2);
			
			return modifiedDamage;
		}
		override public function fortification(): Number {
			var temp: int = 0;
			temp += meleeWeapon.fortification;
			temp += rangedWeapon.fortification;
			temp += armor.fortification + upperUndergarment.fortification + lowerUndergarment.fortification + accessory.fortification + shield.fortification;
			for(var i:int = 0; i < inventory.length; i++)
			{
				temp += inventory[i].fortification;
			}
			return temp;
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
			
			var temp: int = shipStatBonusTotal(5);			
			if(hasPerk("PCs")) temp = Math.ceil(temp + (temp * (kGAMECLASS.pc.willpower() / (kGAMECLASS.pc.level * 5 * 4))));

			if (temp < 0) temp = 0;
			return temp;
		}
		override public function getCombatName():String
		{
			if (isUniqueInFight) return (a + "<i>" + uniqueName + "</i>");
			return ("<i>" + uniqueName + "</i>");
		}
		public function resetEquipment(gunsOnly:Boolean = false):void
		{
			var equipment:Array = listShipEquipment();
			for(var i:int = 0; i < equipment.length; i++)
			{
				if(equipment[i].hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF)) 
				{
					if(!gunsOnly || (gunsOnly && equipment[i].type == GLOBAL.RANGED_WEAPON)) equipment[i].deleteFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF);
				}
			}
		}
		public function offensiveGadgetAI(alliedCreatures:Array, target:Creature):Boolean
		{
			if(target == null) return false;
			
			var gadgets:Array = listShipGadgets();
			var HPPercent:Number = target.HP()/target.HPMax();
			var shieldPercent:Number = target.shields()/target.shieldsMax();
			if(shieldPercent >= 0.5)
			{
				if((this.hasPerk("AGGRESSIVE_AI") && rand(2) == 0) || (this.hasPerk("TACTICAL_AI") && shieldPercent >= 0.75) || shieldPercent >= 0.80 || (this.hasPerk("RANDOM_AI") && rand(3) == 0))
				{
					for(var i:int = 0; i < gadgets.length; i++)
					{
						if(gadgets[i] is ShieldDisruptor && !gadgets[i].hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF) && this.energy() >= gadgets[i].shieldDefense)
						{
							gadgets[i].useFunction(target,this);
							return true;
						}

					}
				}
			}
			return false;
		}
		public function shipHealGadgetAI(alliedCreatures:Array, target:Creature):Boolean
		{
			if(target == null) return false;
			
			var gadgets:Array = listShipGadgets();
			var HPPercent:Number = this.HP()/this.HPMax();
			var shieldPercent:Number = this.shields() / this.shieldsMax();

			var i:int = 0;

			//Shield healing prioritized
			if(shieldPercent < 1)
			{
				var shieldMe:Boolean = false;
				if(this is TeyaalsMSXI)
				{
					if(shieldPercent <= 0.66) shieldMe = true;
				}
				else if(this.hasPerk("DEFENSIVE_AI"))
				{
					if(shieldPercent <= 0.66) shieldMe = true;
				}
				else if(this.hasPerk("AGGRESSIVE_AI"))
				{
					if(shieldPercent <= 0.25) shieldMe = true;
				}
				else if(this.hasPerk("TACTICAL_AI"))
				{
					if(shieldPercent <= 0.5) shieldMe = true;
				}
				else if(rand(3) == 0) shieldMe = true;

				if(shieldMe)
				{
					for(i = 0; i < gadgets.length; i++)
					{
						//Shield vamp only used if target has shields to leech.
						if(gadgets[i] is ShieldVampire && !gadgets[i].hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF) && this.energy() >= gadgets[i].shieldDefense && target.shields() >= 750)
						{
							gadgets[i].useFunction(target,this);
							return true;
						}
						if(gadgets[i] is ShieldBoosterForShips && !gadgets[i].hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF) && this.energy() >= gadgets[i].shieldDefense)
						{
							gadgets[i].useFunction(this,this);
							return true;
						}
					}
				}
			}
			//HP Healing
			if(HPPercent < 1)
			{
				var healMe:Boolean = false;
				if(this.hasPerk("DEFENSIVE_AI") && HPPercent <= 0.66) healMe = true;
				else if(this.hasPerk("AGGRESSIVE_AI") && HPPercent <= 0.25) healMe = true;
				else if(this.hasPerk("TACTICAL_AI") && HPPercent <= 0.5) healMe = true;
				else if(rand(3) == 0) healMe = true;

				if(healMe)
				{
					//Actual heal loop
					for(i = 0; i < gadgets.length; i++)
					{
						if(gadgets[i] is RepairModule && !gadgets[i].hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF) && this.energy() >= gadgets[i].shieldDefense)
						{
							gadgets[i].useFunction(this,this);
							return true;
						}
					}
					//Defense loop.
					for(i = 0; i < gadgets.length; i++)
					{
						if(gadgets[i] is StealthFieldForShips && !gadgets[i].hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF) && this.energy() >= gadgets[i].shieldDefense)
						{
							gadgets[i].useFunction(this,this);
							return true;
						}
					}
				}
			}
			var energyPercent:Number = energy() / energyMax();
			if(energy() < energyMax())
			{
				var energyMe:Boolean = false;
				if(this.hasPerk("DEFENSIVE_AI"))
				{
					if(energyPercent < 0.25) energyMe = true;
				}
				else if(this.hasPerk("AGGRESSIVE_AI"))
				{
					if(energyPercent < 0.5) energyMe = true;
				}
				else if(this.hasPerk("TACTICAL_AI"))
				{
					if(energyPercent <= 0.5) energyMe = true;
				}
				else if(rand(3) == 0) energyMe = true;
				if(energyMe)
				{
					for(i = 0; i < gadgets.length; i++)
					{
						if(gadgets[i] is CapacitorBank && !gadgets[i].hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF) && this.energy() >= gadgets[i].shieldDefense)
						{
							gadgets[i].useFunction(this,this);
							return true;
						}
					}
				}
			}
			return false;
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			var guns:Array = this.listShipWeapons();
			var i:int = 0;
			var acted:Boolean = false;
			
			//AI TYPES:
			//Aggressive
				//All out on gunshots when possible.
				//Uses recharge when below 40% energy
				//Uses healing item if below 50% hp
			//Tactical
				//Uses typing advantages on weapon fire
				//Uses recharge if armor is undamaged and cant fire
				//Uses evade if has no firing options and is HP damaged
			//Defensive
				//Single, picked shots
				//Evasion for reload
				//Attempts to flee if shields are gone (once only)
			var defensiveAI:Boolean = this.hasPerk("DEFENSIVE_AI");
			var tacticalAI:Boolean = this.hasPerk("TACTICAL_AI");
			var aggressiveAI:Boolean = this.hasPerk("AGGRESSIVE_AI");
			var randomAI:Boolean = this.hasPerk("RANDOM_AI");

			//Clear "Off flags"
			resetEquipment(true);
			
			//Defensive boiz pick 1 gun.
			if(defensiveAI)
			{
				//Healing is A#1 priority!
				if(shipHealGadgetAI(alliedCreatures, target)) acted = true;
				if(offensiveGadgetAI(alliedCreatures, target)) acted = true;

				var defensiveChoiceGuns:Array = [];
				for(i = 0; i < guns.length; i++)
				{
					//Pick out all guns with "type" advantages
					if(target.shields() > 0 && (guns[i].baseDamage.electric.damageValue > 0 || guns[i].baseDamage.burning.damageValue > 0))
					{
						if(guns[i].shieldDefense <= this.energy()) defensiveChoiceGuns.push(guns[i]);
					}
					else if(target.shields() == 0 && (guns[i].baseDamage.corrosive.damageValue > 0))
					{
						if(guns[i].shieldDefense <= this.energy()) defensiveChoiceGuns.push(guns[i]);
					}
				}
				//No type advantage guns? Take all guns and pick 1 at random.
				if(defensiveChoiceGuns.length == 0)
				{
					for(i = 0; i < guns.length; i++)
					{
						if(guns[i].shieldDefense < this.energy()) defensiveChoiceGuns.push(guns[i]);
					}
				}
				//If we have more than 1 gun, pick just one at random.
				while(defensiveChoiceGuns.length > 1)
				{
					defensiveChoiceGuns.splice(rand(defensiveChoiceGuns.length),1);
				}
				//====================
				//Actual Actions Here:
				//====================
				if(!acted && defensiveChoiceGuns.length > 0)
				{
					CombatAttacks.performShipWeaponAttack(this, target, defensiveChoiceGuns[0]);
					acted = true;
				}
				//Evade to pad out energy recovery
				if(!acted) 
				{
					CombatAttacks.EvasionImpl(alliedCreatures, hostileCreatures, this, target);
					acted = true;
				}
			}
			else if(aggressiveAI)
			{
				//Healing is A#1 priority!
				if(shipHealGadgetAI(alliedCreatures, target)) acted = true;
				if(offensiveGadgetAI(alliedCreatures, target)) acted = true;

				//Even if we can fire a little bit, recharge if low
				if(this.energy()/this.energyMax() < 0.33 && !acted)
				{
					CombatAttacks.RechargeImpl(alliedCreatures, hostileCreatures, this, target);
					acted = true;
				}

				var aggroGuns:Array = [];
				for(i = 0; i < guns.length; i++)
				{
					//Fire all guns it seems like we could fire.
					if(guns[i].shieldDefense <= this.energy()) aggroGuns.push(guns[i]);
				}
				//Shoot gunz
				if(aggroGuns.length > 0 && !acted)
				{
					var tempGun:ItemSlotClass = aggroGuns[0];
					var slot:Number = 0;
					//Randomize gun firing order somewhat
					for(i = 0; i < 3; i++)
					{
						//Pick a random gun, pull it out of the list, then jam it back in the end.
						slot = rand(aggroGuns.length);
						tempGun = aggroGuns[slot];
						aggroGuns.splice(slot,1);
						aggroGuns.push(tempGun);	
					}
					//Actually shootz!
					for(i = 0; i < aggroGuns.length; i++) { 
						if(i > 0) output("\n");
						CombatAttacks.performShipWeaponAttack(this, target, aggroGuns[i]); 
					}
					acted = true;
				}
				//Recharge if not that hurt.
				else if(this.HP()/this.HPMax() > 0.5 && !acted) 
				{
					CombatAttacks.RechargeImpl(alliedCreatures, hostileCreatures, this, target);
					acted = true;
				}
				//Evade if hurt!
				else if(!acted)
				{
					CombatAttacks.EvasionImpl(alliedCreatures, hostileCreatures, this, target);
					acted = true;
				}
			}
			else if(tacticalAI)
			{
				//Healing is A#1 priority!
				if(shipHealGadgetAI(alliedCreatures, target)) acted = true;
				if(offensiveGadgetAI(alliedCreatures, target)) acted = true;

				var tactiGuns:Array = [];
				var unusedGuns:Array = [];
				var energyCost:Number = 0;
				for(i = 0; i < guns.length; i++)
				{
					//Pick out all guns with "type" advantages
					if(target.shields() > 0 && (guns[i].baseDamage.electric.damageValue > 0 || guns[i].baseDamage.burning.damageValue > 0))
					{
						if(guns[i].shieldDefense+energyCost <= this.energy()) tactiGuns.push(guns[i]);
						energyCost += guns[i].shieldDefense;
					}
					else if(target.shields() == 0 && (guns[i].baseDamage.corrosive.damageValue > 0))
					{
						if(guns[i].shieldDefense+energyCost <= this.energy()) tactiGuns.push(guns[i]);
						energyCost += guns[i].shieldDefense;
					}
					else if(target.shields() == 0 && (guns[i].baseDamage.kinetic.damageValue > 0))
					{
						if(guns[i].shieldDefense+energyCost <= this.energy()) tactiGuns.push(guns[i]);
						energyCost += guns[i].shieldDefense;
					}
					else 
					{
						unusedGuns.push(guns[i]);
					}
				}
				//If all our guns are bad fits, let's pick a few to fire, because we have to damage SOMEHOW
				if(tactiGuns.length == 0)
				{
					for(i = 0; i < guns.length; i++)
					{
						if(energyCost + guns[i].shieldDefense <= this.energy())
						{
							tactiGuns.push(guns[i]);
							energyCost += guns[i].shieldDefense;
						}
					}
				}
				//Even if we can fire a little bit, recharge if low
				if(this.energy()/this.energyMax() < 0.35 && !acted)
				{
					CombatAttacks.RechargeImpl(alliedCreatures, hostileCreatures, this, target);
					acted = true;
				}
				else if(tactiGuns.length > 0 && !acted)
				{
					//Actually shootz!
					for(i = 0; i < tactiGuns.length; i++) { 
						if(i > 0) output("\n");
						CombatAttacks.performShipWeaponAttack(this, target, tactiGuns[i]); 
					}
					acted = true;
				}
				//The more hurt we are, the more we evade
				else if(!acted && rand(100) > this.HP()/this.HPMax()*100)
				{
					CombatAttacks.EvasionImpl(alliedCreatures, hostileCreatures, this, target);
					acted = true;
				}
				//Else recharge
				else if(!acted)
				{
					CombatAttacks.RechargeImpl(alliedCreatures, hostileCreatures, this, target);
					acted = true;
				}
			}
			else if(randomAI)
			{
				//Healing is A#1 priority!
				if(shipHealGadgetAI(alliedCreatures, target)) acted = true;
				if(offensiveGadgetAI(alliedCreatures, target)) acted = true;
				var energyCost2:Number = 0;
				var randomGuns:Array = [];
				for(i = 0; i < guns.length; i++)
				{
					//Build a random firing order for maximum random.
					if(guns[i].shieldDefense + energyCost2 < this.energy())
					{
						randomGuns.insertAt(rand(randomGuns.length),guns[i]);
						energyCost2 += guns[i].shieldDefense;
					}
				}
				if(randomGuns.length > 0 && !acted)
				{
					//Actually shootz!
					for(i = 0; i < randomGuns.length; i++) { 
						if(i > 0) output("\n");
						CombatAttacks.performShipWeaponAttack(this, target, randomGuns[i]); 
					}
					acted = true;
				}
				if(!acted)
				{
					if(rand(2) == 0) CombatAttacks.EvasionImpl(alliedCreatures, hostileCreatures, this, target);
					else CombatAttacks.RechargeImpl(alliedCreatures, hostileCreatures, this, target);
					acted = true;
				}
			}
			//Recharge is generic "nothing" activity to cover my bases as a shitty dev!
			if(!acted) CombatAttacks.RechargeImpl(alliedCreatures, hostileCreatures, this, target);
			//RECOVER POWER
			this.energy(this.shipPowerGen());
			if (target == null) return;
		}
	}
}