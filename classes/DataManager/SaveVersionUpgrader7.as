package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader7 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 8;
		
		public function SaveVersionUpgrader7() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			for (var k:* in data.characters)
			{
				trace("Upgrading " + k + " to v7...");
				upgradeCharData(data.characters[k]);
				trace("Successfully upgraded " + k + "!");
			}
			
			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			return this.verify(data); // Do sfa with the bool, we're gonna catch the throw exception in DataManager
		}
		
		public function upgradeCharData(data:Object):void
		{
			data.buttRatingRaw = data.buttRating;
			delete data.buttRating;
			
			data.hipRatingRaw = data.hipRating;
			delete data.hipRating;
			
			data.ballSizeRaw = data.ballSize;
			delete data.ballSize;
			
			// Dicks
			for (var c:int = 0; c < data.cocks.length; c++)
			{
				data.cocks[c].cLengthRaw = data.cocks[c].cLength;
				delete data.cocks[c].cLength;
				
				data.cocks[c].cThicknessRatioRaw = data.cocks[c].cThicknessRatio;
				delete data.cocks[c].cThicknessRatio;
			}
			
			// Tits
			for (var b:int = 0; b < data.breastRows.length; b++)
			{
				data.breastRows[b].breastRatingRaw = data.breastRows[b].breastRating;
				delete data.breastRows[b].breastRating;
			}
			
			// Vagoos
			for (var v:int = 0; v < data.vaginas.length; v++)
			{
				data.vaginas[v].wetnessRaw = data.vaginas[v].wetness;
				delete data.vaginas[v].wetness;
				
				data.vaginas[v].loosenessRaw = data.vaginas[v].looseness;
				delete data.vaginas[v].looseness;
			}
			
			// Butthole
			data.ass.loosenessRaw = data.ass.looseness;
			delete data.ass.looseness;
			
			data.ass.wetnessRaw = data.ass.wetness;
			delete data.ass.wetness;
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