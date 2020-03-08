package classes.DataManager 
{
	import classes.Creature;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import classes.StorageClass;
	import flash.net.SharedObject;
	import classes.Util.InCollection;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader25 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 26;
		
		public function SaveVersionUpgrader25() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var c:Object = data.characters["PC"];
			
			// Move the old DOVEFOUR & DOVESIX types to the new DOVE type and set the wing count appropriately
			if (c.wingType == 29 || c.wingType == 30)
			{
				c.wingType = 28;
				c.wingCount = (c.wingType == 29 ? 4 : 6);
			}
			// If the creature has wings but the count is unset, set it to a safe default.
			else if (c.wingType != 0 && c.wingCount == 0)
			{
				c.wingCount = 2;
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 25 received data version " + data.version + " during a verification call. Wakka wakka.");
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