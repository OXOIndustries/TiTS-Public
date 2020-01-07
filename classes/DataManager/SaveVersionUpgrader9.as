package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader9 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 10;
		
		public function SaveVersionUpgrader9() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			for (var k:* in data.characters)
			{
				trace("Upgrading " + k + " to v10...");
				upgradeCharData(data.characters[k]);
				trace("Successfully upgraded " + k + "!");
			}
			
			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			return this.verify(data); // Do sfa with the bool, we're gonna catch the throw exception in DataManager
		}
		
		public function upgradeCharData(data:Object):void
		{
			// Tossing out all of these properties and falling back to defaults as assigned in the classes.
			// Outside of possibly Penny & the PC, I don't think this really matters atm.
			delete data.fertility;
			delete data.cumQuality;
			delete data.cumMultiplier;
			
			delete data.pregnancyIncubations;
			delete data.pregnancyTypes;
			delete data.pregnancyQuantity;
			
			delete data.canImpregnateVagina;
			delete data.canImpregnateButt;
			delete data.canFertilizeEggs;
			delete data.alwaysImpregnate;
			delete data.impregnateType;
			delete data.basePregnancyIncubation;
			delete data.basePregnancyChance;
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 10 received data version " + data.version + " during a verification call. Wakka wakka.");
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