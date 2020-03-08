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
	public class SaveVersionUpgrader26 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 27;
		
		public function SaveVersionUpgrader26() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var c:Object = data.characters["PC"];
			
			// Convert parasitic tail cocks for detection
			if (c.tailType == GLOBAL.TYPE_COCKVINE && c.tailGenital != GLOBAL.TAIL_GENITAL_NONE)
			{
				c.tailGenital = GLOBAL.TAIL_GENITAL_NONE;
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 26 received data version " + data.version + " during a verification call. Wakka wakka.");
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