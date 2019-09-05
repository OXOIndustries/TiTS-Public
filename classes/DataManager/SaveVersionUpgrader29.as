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
	public class SaveVersionUpgrader29 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 30;
		
		public function SaveVersionUpgrader29() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			for (var key:String in data.characters)
			{
				if (data.characters[key].droneTarget != null) delete data.characters[key].droneTarget;
				if (data.characters[key].concentratedFireTarget != null) delete data.characters[key].concentratedFireTarget;
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 29 received data version " + data.version + " during a verification call. Wakka wakka.");
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