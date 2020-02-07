package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.SexualPreferences;
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader2 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:* = 3;
		
		public function SaveVersionUpgrader2() 
		{}
		
		/* INTERFACE classes.DataManager.ISaveVersionUpgrader */
		
		public function upgrade(data:Object):Boolean 
		{
			// This is going to be a pain in the fucking ASSHOLE. Lube up, the hyperhorsedong is going in dry D:
			
			// We have go iterate over every character...
			for (var k:* in data.characters)
			{
				trace("Upgrading " + k + "...");
				
				this.upgradeChar(data.characters[k]);
				
				trace("Upgraded!");
			}
			
			data.minVersion = this._newVersionValue;
			data.version = this._newVersionValue;
			
			return this.verify(data);
		}
		
		private function upgradeChar(char:Object):void
		{	
			// We need to upgrade all of the item instances...
			this.upgradeItem(char.accessory);
			this.upgradeItem(char.armor);
			this.upgradeItem(char.lowerUndergarment);
			this.upgradeItem(char.meleeWeapon);
			this.upgradeItem(char.rangedWeapon);
			this.upgradeItem(char.shield);
			this.upgradeItem(char.upperUndergarment);
			
			char.ass.classInstance = "classes::VaginaClass";
			
			// Titties
			if (char.breastRows.length > 0)
			{
				for (var bRow:int = 0; bRow < char.breastRows.length; bRow++)
				{
					char.breastRows[bRow].classInstance = "classes::BreastRowClass";
				}
			}
			
			// Cocks
			if (char.cocks.length > 0)
			{
				for (var cRow:int = 0; cRow < char.cocks.length; cRow++)
				{
					char.cocks[cRow].classInstance = "classes::CockClass";
				}
			}
			
			// Inventory
			var newInventory:Array = new Array();
			
			if (char.inventory.length > 0)
			{
				for (var iRow:int = 0; iRow < char.inventory.length; iRow++)
				{
					if (char.inventory[iRow].quantity > 0)
					{
						upgradeItem(char.inventory[iRow]);
						newInventory.push(char.inventory[iRow]);
					}
				}
			}
			
			char.inventory = newInventory;
			
			// Vagoos
			if (char.vaginas.length > 0)
			{
				for (var vRow:int = 0; vRow < char.vaginas.length; vRow++)
				{
					char.vaginas[vRow].classInstance = "classes::VaginaClass";
				}
			}
			
			// Key items
			if (char.keyItems.length > 0)
			{
				for (var kRow:int = 0; kRow < char.keyItems.length; kRow++)
				{
					char.keyItems[kRow].classInstance = "classes::StorageClass";
				}
			}
			
			// Perks
			if (char.perks.length > 0)
			{
				for (var pRow:int = 0; pRow < char.perks.length; pRow++)
				{
					char.perks[pRow].classInstance = "classes::StorageClass";
				}
			}
			
			// Status'
			if (char.statusEffects.length > 0)
			{
				for (var sRow:int = 0; sRow < char.statusEffects.length; sRow++)
				{
					char.statusEffects[sRow].classInstance = "classes::StorageClass";
				}
			}
			char.sexualPreferences = new Object();
			char.sexualPreferences.classInstance = "classes::SexualPreferences";
		}
		
		private function upgradeItem(item:Object):void
		{			
			// Ideally classInstance can be killed off at some point down the line, and work off of 
			// known properties of a class that can slot into a given parent property; like we can drive
			// weapon saving off the fact that a weapon is either in the inventory or a ranged/melee slot
			// and we'll always know the shortName. ATM this is more for verification purposes than "the
			// system requires it to function"
			
			var cInstance:String = "classes.Items.";
			
			switch (item.longName)
			{
				case "nothing":
					cInstance += "Miscellaneous::Empty";
					pruneItem(item);
					break;
				case "comfortable clothes":
					cInstance += "Apparel::ComfortableClothes";
					pruneItem(item);
					break;
				case "dress clothes":
					cInstance += "Apparel::DressClothes";
					pruneItem(item);
					break;
				case "gooey coverings":
					cInstance += "Apparel::GooeyConverings";
					pruneItem(item);
					break;
				case "plain bra":
					cInstance += "Apparel::PlainBra";
					pruneItem(item);
					break;
				case "plain briefs":
					cInstance += "Apparel::PlainBriefs";
					pruneItem(item);
					break;
				case "plain panties":
					cInstance += "Apparel::PlainPanties";
					pruneItem(item);
					break;
				case "undershirt":
					cInstance += "Apparel::PlainUndershirt";
					pruneItem(item);
					break;
				case "U.G.C. Peacekeeper uniform":
					cInstance += "Apparel::UGCUniform";
					pruneItem(item);
					break;
				case "eagle handgun":
					cInstance += "Guns::EagleHandgun";
					pruneItem(item);
					break;
				case "hold-out pistol":
					cInstance += "Guns::HoldOutPistol";
					pruneItem(item);
					break;
				case "mark III laser pistol":
					cInstance += "Guns::LaserPistol";
					pruneItem(item);
					break;
				case "scoped pistol":
					cInstance += "Guns::ScopedPistol";
					pruneItem(item);
					break;
				case "fist":
					cInstance += "Melee::Fists";
					pruneItem(item);
					break;
				case "gooey psuedopod":
					cInstance += "Melee:GooeyPsuedopod";
					pruneItem(item);
					break;
				case "knife":
					cInstance += "Melee::Knife";
					pruneItem(item);
					break;
				case "rock":
					cInstance += "Melee::Rock";
					pruneItem(item);
					break;
				case "tonfas":
					cInstance += "Melee::Tonfas";
					pruneItem(item);
					break;
				case "pouch of naleen nip":
					cInstance += "Miscellaneous::NaleenNip";
					pruneItem(item);
					break;
				case "tasty-smelling zil ration":
					cInstance += "Miscellaneous::ZilRation";
					pruneItem(item);
					break;
				case "cheap JoyCo shield generator":
					cInstance += "Protection::BasicShield";
					pruneItem(item);
					break;
				case "fangs":
					cInstance = "classes::ItemSlotClass";
					item.hasRandomProperties = true;
					break;
				case "glittering scales":
					cInstance = "classes::ItemSlotClass";
					item.hasRandomProperties = true;
					break;
				case "fists":
					cInstance += "Melee::Fists";
					pruneItem(item);
					break;
				case "dart":
					cInstance = "classes::ItemSlotClass";
					item.hasRandomProperties = true;
					break;
				case "chitinous plating":
					cInstance = "classes::ItemSlotClass";
					item.hasRandomProperties = true;
					break;
				case "semi-solid fist":
					cInstance = "classes::ItemSlotClass";
					item.hasRandomProperties = true;
					break;
				case "durable dermis":
					cInstance = "classes::ItemSlotClass";
					item.hasRandomProperties = true;
					break;
				case "claws":
					cInstance = "classes::ItemSlotClass";
					item.hasRandomProperties = true;
					break;
				case "shimmering scales":
					cInstance = "classes::ItemSlotClas";
					item.hasRandomProperties = true;
					break;
				case "A-type personal defense suit":
					cInstance = "classes::ItemSlotClass";
					item.hasRandomProperties = true;
					break;
				case "":
					cInstance += "Miscellaneous::Empty";
					item.hasRandomProperties = false;
					break;
				default:
					throw new Error("Couldn't figure out the classInstance required for " + item.longName);
					break;
			}
			
			item.classInstance = cInstance;
			
			if (cInstance.indexOf("Empty") == -1)
			{
				if (item.quantity == 0) item.quantity = 1;
			}
		}
		
		private function pruneItem(item:Object):void
		{
			delete item.attack;
			delete item.attackVerb;
			delete item.basePrice;
			delete item.bonusResistances;
			delete item.critBonus;
			delete item.damage;
			delete item.damageType;
			delete item.defense;
			delete item.description;
			delete item.evasion;
			delete item.fortification;
			delete item.itemFlags;
			delete item.longName;
			delete item.sexiness;
			delete item.shieldDefense;
			delete item.shields;
			delete item.stackSize;
			delete item.tooltip;
			delete item.type;
		}
		
		public function verify(data:Object):Boolean 
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 2 received data version " + data.version + " during a verification call. Wakka wakka.");
			}
			
			if (data.minVersion != this._newVersionValue)
			{
				throw new VersionUpgraderError("How the fuck did this happen? Upgrade failed to set an appropriate minVersion value!");
			}
			
			return true;
		}
		
	}

}