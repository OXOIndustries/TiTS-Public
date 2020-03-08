package classes.DataManager 
{
	import classes.Creature;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import classes.StorageClass;
	import flash.net.SharedObject;
	import classes.Util.InCollection;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader21 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 22;
		
		public function SaveVersionUpgrader21() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var pc:Object = data.characters.PC;
			
			if (pc.inventory != undefined)
			{
				var hasBlood:Boolean = false;
				
				var newInventory:Array = [];
				
				for (var i:int = 0; i < pc.inventory.length; i++)
				{
					if (pc.inventory[i].classInstance != "classes.Items.Miscellaneous::RedMyrBlood")
					{
						newInventory.push(pc.inventory[i])
					}
					else
					{
						hasBlood = true;
					}
				}
				
				if (hasBlood)
				{
					pc.inventory = newInventory;
					
					var ki:StorageClass = new StorageClass();
					ki.storageName = "Red Myr Blood";
					
					pc.keyItems.push(ki.getSaveObject());
					
					(pc.keyItems as Array).sortOn("storageName", Array.CASEINSENSITIVE);
				}
			}
			
			data.version = 22;
			data.minVersion = 22;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 21 received data version " + data.version + " during a verification call. Wakka wakka.");
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