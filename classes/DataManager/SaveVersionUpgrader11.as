package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader11 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 12;
		
		public function SaveVersionUpgrader11() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			data.gameOptions.bustPriority = ["CHESHIRE", "SHOU", "GATS", "GATSOLD"];
			
			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			return this.verify(data); // Do sfa with the bool, we're gonna catch the throw exception in DataManager
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 12 received data version " + data.version + " during a verification call. Wakka wakka.");
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