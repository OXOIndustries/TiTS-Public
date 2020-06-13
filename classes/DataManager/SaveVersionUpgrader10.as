package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader10 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 11;
		
		public function SaveVersionUpgrader10() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			// Adding the new gameOptions object
			var opts:GameOptions = new GameOptions();
			
			opts.easyMode = data.easy;
			delete data.easy;
			
			opts.sillyMode = data.silly;
			delete data.silly;
			
			opts.debugMode = data.debug;
			delete data.debug;
			
			data.gameOptions = opts.getSaveObject();
			
			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			return this.verify(data); // Do sfa with the bool, we're gonna catch the throw exception in DataManager
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 11 received data version " + data.version + " during a verification call. Wakka wakka.");
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