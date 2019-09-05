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
	public class SaveVersionUpgrader24 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 25;
		
		public function SaveVersionUpgrader24() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var o:Object = data.gameOptions;
			
			var defO:GameOptions = new GameOptions();
			o.primaryBustArtist = defO.primaryBustArtist;
			o.secondaryBustArtist = defO.secondaryBustArtist;
			o.configuredBustPreferences = { };
			delete o.bustPriority;
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 24 received data version " + data.version + " during a verification call. Wakka wakka.");
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