package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import flash.net.SharedObject;
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader1 implements ISaveVersionUpgrader 
	{
		private const _newVersionValue:int = 2;
		
		public function SaveVersionUpgrader1() 
		{}
		
		public function runUpdater(data:Object):Boolean
		{
			// Renamed props
			data.characters = data.chars;
			delete data.chars;
			
			data.daysPassed = data.days;
			delete data.days;
			
			data.currentHours = data.hours;
			delete data.hours;
			
			data.currentMinutes = data.minutes;
			delete data.minutes;
			
			data.easyMode = data.easy;
			delete data.easy;
			
			data.sillyMode = data.silly;
			delete data.silly;
			
			data.debugMode = data.debug;
			delete data.debug;
			
			data.saveNotes = data.notes;
			delete data.notes;
			
			data.playerLocation = data.locationKey;
			delete data.locationKey;
			
			data.saveLocation = data.location;
			delete data.location;
			
			data.saveName = data.short;
			delete data.short;
			
			// Removed props
			delete data.foes;
			delete data.exists;
			
			// New props
			data.minVersion = this._newVersionValue;
			data.playerGender = "?"; // We can't easily reconstitue this, and frankly I don't even want to try. So we're just going to set *something*
		
			// Move flags dict to an array
			var flags:Array = new Array();
			for (var k:* in data.flags)
			{
				if (data.flags[k] != undefined)
				{
					flags[k] = data.flags[k];
				}
			}
			
			data.flags = flags;
			
			return true;
		}
		
		/**
		 * Do the needful with the incoming data to transition from V1 -> V2
		 * @param	data
		 * @return
		 */
		public function upgrade(data:Object):Boolean
		{
			if (data.version != 1)
			{
				throw new VersionUpgraderError("Upgrader Version 1 received data version " + data.version + " during an upgrade call. Bad luck bro.");
			}
			else
			{
				trace("Upgrading save version 1 to version 2.");
			}
			
			if (!runUpdater(data))
			{
				throw new VersionUpgraderError("Upgrade failed, welp");
			}
			
			data.version = this._newVersionValue;
			
			return this.verify(data); // Do sfa with the bool, we're gonna catch the throw exception in DataManager
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
				throw new VersionUpgraderError("Upgrader Version 1 received data version " + data.version + " during a verification call. Wakka wakka.");
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