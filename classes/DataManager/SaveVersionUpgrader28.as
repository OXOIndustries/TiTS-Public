package classes.DataManager 
{
	import classes.Creature;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import classes.StorageClass;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader28 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 29;
		
		public function SaveVersionUpgrader28() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var pc:Object = data.characters["PC"];
			var i:int = 0;
			var variant:int = 0;
			
			// Replace corny shirt items (quantity always at 1)
			if (pc.inventory != undefined)
			{
				for (i = 0; i < pc.inventory.length; i++)
				{
					if (pc.inventory[i].classInstance == "classes.Items.Apparel::CornyTShirt" && pc.inventory[i].hasRandomProperties == true)
					{
						switch(pc.inventory[i].shortName)
						{
							case "CrnyShirtV1": variant = 1; break;
							case "CrnyShirtV2": variant = 2; break;
							case "CrnyShirtV3": variant = 3; break;
							case "CrnyShirtV4": variant = 4; break;
							case "CrnyShirtV5": variant = 5; break;
							case "CrnyShirtV6": variant = 6; break;
							default: variant = 0; break;
						}
						if(variant == 0) pc.inventory[i].classInstance = "classes.Items.Apparel::CornyTShirt";
						else pc.inventory[i].classInstance = "classes.Items.Apparel::CornyTShirtV" + variant;
						pc.inventory[i].hasRandomProperties = false;
					}
				}
			}
			if (pc.ShipStorageInventory != undefined)
			{
				for(i = 0; i < pc.ShipStorageInventory.length; i++)
				{
					if (pc.ShipStorageInventory[i].classInstance == "classes.Items.Apparel::CornyTShirt" && pc.ShipStorageInventory[i].hasRandomProperties == true)
					{
						switch(pc.ShipStorageInventory[i].shortName)
						{
							case "CrnyShirtV1": variant = 1; break;
							case "CrnyShirtV2": variant = 2; break;
							case "CrnyShirtV3": variant = 3; break;
							case "CrnyShirtV4": variant = 4; break;
							case "CrnyShirtV5": variant = 5; break;
							case "CrnyShirtV6": variant = 6; break;
							default: variant = 0; break;
						}
						if(variant == 0) pc.ShipStorageInventory[i].classInstance = "classes.Items.Apparel::CornyTShirt";
						else pc.ShipStorageInventory[i].classInstance = "classes.Items.Apparel::CornyTShirtV" + variant;
						pc.ShipStorageInventory[i].hasRandomProperties = false;
					}
				}
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 28 received data version " + data.version + " during a verification call. Wakka wakka.");
				return false;
			}
			
			if (data.minVersion == undefined)
			{
				trace("wat");
			}
			
			if (data.minVersion == undefined || data.minVersion != this._newVersionValue)
			{
				throw new VersionUpgraderError("MinVersion invalid!");
				return false;
			}
			
			return true;
		}
	}
}