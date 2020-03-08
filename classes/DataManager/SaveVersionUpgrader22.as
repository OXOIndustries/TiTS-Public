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
	public class SaveVersionUpgrader22 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 23;
		
		public function SaveVersionUpgrader22() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var chars:Object = data.characters;
			
			for (var key:String in chars)
			{
				var char:Object = chars[key];
				char.isPlural = char.plural;
				delete char.plural;
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 22 received data version " + data.version + " during a verification call. Wakka wakka.");
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