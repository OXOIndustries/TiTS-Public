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
	public class SaveVersionUpgrader30 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 31;
		
		public function SaveVersionUpgrader30() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			for (var key:String in data.characters)
			{
				if (data.characters[key].sstdList != undefined)
				{
					delete data.characters[key].sstdList;
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
				throw new VersionUpgraderError("Upgrader Version 30 received data version " + data.version + " during a verification call. Wakka wakka.");
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