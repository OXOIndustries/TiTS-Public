package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader6 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 7;
		
		public function SaveVersionUpgrader6() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			// Figure out the _expected_ total stats that the PC should have
			var pcLevel:int = data.characters.PC.level;
			var expectedStats:int = 15 + ((pcLevel - 1) * 13); // Start with 15, +13 per level?
			
			// Figure out the actual stats + available stats for levelup left in the flag
			var actualStats:int = 0;
			actualStats += data.characters.PC.physiqueRaw;
			actualStats += data.characters.PC.reflexesRaw;
			actualStats += data.characters.PC.aimRaw;
			actualStats += data.characters.PC.intelligenceRaw;
			actualStats += data.characters.PC.willpowerRaw;
			
			if (data.flags["LEVEL_UP_POINTS"] != undefined) actualStats += data.flags["LEVEL_UP_POINTS"];
			
			// And our survey says...
			var missingStats:int = expectedStats - actualStats;
			
			// I THINK just stuffing this value into the flag value will work... maybe.
			if (data.flags["LEVEL_UP_POINTS"] == undefined) data.flags["LEVEL_UP_POINTS"] = missingStats;
			else data.flags["LEVEL_UP_POINTS"] += missingStats;

			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			return this.verify(data); // Do sfa with the bool, we're gonna catch the throw exception in DataManager
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 6 received data version " + data.version + " during a verification call. Wakka wakka.");
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