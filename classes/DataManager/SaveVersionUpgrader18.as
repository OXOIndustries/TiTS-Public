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
	public class SaveVersionUpgrader18 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 19;
		
		public function SaveVersionUpgrader18() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var dEffects:Array = data.characters.PC.statusEffects;
			data.characters.PC.statusEffects = new Array();
			
			var hasRenvraEggPregnancy:Boolean = false;
			var hasRenvraFullPregnancy:Boolean = false;
			
			if (data.characters.PC.pregnancyData != undefined)
			{			
				for (var ii:int = 0; ii < data.characters.PC.pregnancyData.length; ii++)
				{
					if (data.characters.PC.pregnancyData[ii].pregnancyType == "RenvraEggPregnancy") hasRenvraEggPregnancy = true;
					if (data.characters.PC.pregnancyData[ii].pregnancyType == "RenvraFullPregnancy") hasRenvraFullPregnancy = true;
				}
			}
			
			if (dEffects != null)
			{
				for (var i:int = 0; i < dEffects.length; i++)
				{
					if (dEffects[i].storageName == "Tripped") continue;
					if (dEffects[i].storageName == "Renvra Eggs Messages Available" && !hasRenvraEggPregnancy) continue;
					if (!hasRenvraFullPregnancy && InCollection(dEffects[i].storageName, "Revnra Full Pregnancy Message 2", "Revnra Full Pregnancy Bellyrubs", "Revnra Full Pregnancy Message 3", "Revnra Full Pregnancy Message 4", "Revnra Milky Titties Go", "Revnra Full Pregnancy Message 5", "Revnra Full Pregnancy Almost Due", "Renvra Full Pregnancy Bellyrubs")) continue;
					
					data.characters.PC.statusEffects.push(dEffects[i]);
				}
			}
			
			data.version = 19;
			data.minVersion = 19;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 18 received data version " + data.version + " during a verification call. Wakka wakka.");
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