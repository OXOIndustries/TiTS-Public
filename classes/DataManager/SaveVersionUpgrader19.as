package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import flash.net.SharedObject;
	import classes.Util.InCollection;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader19 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 20;
		
		public function SaveVersionUpgrader19() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			if(data.gameOptions.debugMode) 
			{
				trace("TURNED OFF DEBUG!");
				data.gameOptions.debugMode = false;
			}
			trace("UPGRADED TO VERSION 20!");
			
			data.version = 20;
			data.minVersion = 20;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 19 received data version " + data.version + " during a verification call. Wakka wakka.");
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