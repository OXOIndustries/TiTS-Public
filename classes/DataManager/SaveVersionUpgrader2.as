package classes.DataManager 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader2 implements ISaveVersionUpgrader
	{
		private const _newVersionValue = 3;
		
		public function SaveVersionUpgrader2() 
		{}
		
		/* INTERFACE classes.DataManager.ISaveVersionUpgrader */
		
		public function upgrade(data:Object):Boolean 
		{
			// This is going to be a pain in the fucking ASSHOLE. Lube up, the hyperhorsedong is going in dry D:
			
			// We have go iterate over every character...
			for (var k in data.characters)
			{
				trace("Upgrading " + k + "...");
				
				this.upgradeChar(data.characters[k]);
				
				trace("Upgraded!");
			}
			
			
			return data;
		}
		
		private function upgradeChar(char:Object):void
		{	
			// We need to upgrade all of the item instances...
			this.upgradeItem(char.accessory);
		}
		
		private function upgradeItem(item:Object):void
		{
			// We know that there are NO properties that are random in any current item, so all we have to do
			// is clear out defunct properties and set the version/classInstance property
			
			// Ideally classInstance can be killed off at some point down the line, and work off of 
			// known properties of a class that can slot into a given parent property; like we can drive
			// weapon saving off the fact that a weapon is either in the inventory or a ranged/melee slot
			// and we'll always know the shortName. ATM this is more for verification purposes than "the
			// system requires it to function"
			
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
			
			var cInstance:String = "classes.Items.";
			
			switch (item.shortName)
			{
				case "":
					cInstance += "Miscellaneous::Empty";
					break;
				case "DressCloth":
					cInstance += "Apparel::DressClothes";
					break;
				case "Bra":
					cInstance += "Apparel::PlainBra";
					break;
				case "Briefs":
					cInstance += "Apparel::PlainBriefs";
					break;
				case "Panties":
					cInstance += "Apparel::PlainPanties";
					break;
				case "Undershirt":
					cInstance += "Apparel::PlainUndershirt";
					break;
				case "E.Handgun":
					cInstance += "Guns::EagleHandgun";
					break;
				case "Hld.Pistol":
					cInstance += "Guns::HoldOutPistol";
					break;
				case "LaserPistol":
					cInstance += "Guns::LaserPistol";
					break;
				case "S.Pistol":
					cInstance += "Guns::ScopedPistol";
					break;
				case "knife":
					cInstance += "Melee::Knife";
					break;
				case "Rock":
					cInstance += "Melee::Rock";
					break;
				case "NaleenNip":
					cInstance += "Miscellaneous::NaleenNip";
					break;
				case "ZilRation":
					cInstance += "Miscellaneous::ZilRation";
					break;
				case "BasicShld":
					cInstance += "Protection::BasicShield";
					break;
				default:
					throw new Error("Couldn't figure out the classInstance required for " + item.shortName);
					break;
			}
			
			trace("Set class instance for item");
		}
		
		public function verify(data:Object):Boolean 
		{
			
			return true;
		}
		
	}

}