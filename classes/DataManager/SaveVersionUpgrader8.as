package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader8 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 9;
		
		public function SaveVersionUpgrader8() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			for (var k:* in data.characters)
			{
				trace("Upgrading " + k + " to v9...");
				upgradeCharData(data.characters[k]);
				trace("Successfully upgraded " + k + "!");
			}
			
			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			return this.verify(data); // Do sfa with the bool, we're gonna catch the throw exception in DataManager
		}
		
		public function upgradeCharData(data:Object):void
		{
			data.pregnancyMultiplierRaw = data.pregnancyMultiplier;
			delete data.pregnancyMultiplier;
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 9 received data version " + data.version + " during a verification call. Wakka wakka.");
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