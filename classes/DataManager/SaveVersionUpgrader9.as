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
		private const _newVersionValue = 10;
		
		public function SaveVersionUpgrader9() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			for (var k in data.characters)
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
			data.fertilityRaw = data.fertility;
			data.fertilityMod = 0;
			delete data.fertility;
			
			data.pregnancyMultiplierMod = 0;
			
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
				throw new VersionUpgraderError("Upgrader Version 10 recieved data version " + data.version + " during a verification call. Wakka wakka.");
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