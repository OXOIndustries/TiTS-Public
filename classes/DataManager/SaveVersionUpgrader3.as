package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import flash.net.SharedObject;
	/**
	 * ...
	 * @author Fenoxo
	 */
	public class SaveVersionUpgrader3 implements ISaveVersionUpgrader 
	{
		private const _newVersionValue:* = 4;
		
		public function SaveVersionUpgrader3() 
		{}
		
		/**
		 * Do the needful with the incoming data to transition from V1 -> V2
		 * @param	data
		 * @return
		 */
		public function upgrade(data:Object):Boolean
		{
			// We have go iterate over every character...
			for (var k:* in data.characters)
			{
				trace("Upgrading to V4 " + k + "...");
				
				this.upgradeChar(data.characters[k]);
				
				trace("Upgraded!");
			}
			data.minVersion = 4;
			data.version = this._newVersionValue;
			
			return this.verify(data); // Do sfa with the bool, we're gonna catch the throw exception in DataManager
		}
		
		private function upgradeChar(char:Object):void
		{	

			char.XPRaw = char.XP;
			delete char.XP;
		}
		/**
		 * Provide a verification method to ensure the data in the input object is as-expected
		 * @param	data
		 * @return
		 */
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 3 received data version " + data.version + " during a verification call. Wakka wakka.");
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