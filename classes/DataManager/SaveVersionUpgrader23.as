package classes.DataManager 
{
	import classes.Creature;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import classes.StorageClass;
	import flash.net.SharedObject;
	import classes.Util.InCollection;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader23 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 24;
		
		public function SaveVersionUpgrader23() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var chars:Object = data.characters;
			
			var pc:Object = chars["PC"];
			
			if (pc.characterClass == GLOBAL.CLASS_ENGINEER)
			{
				if (pc.level >= 3)
				{
					var newPerks:Array = [];
					
					// Switch out 
					for (var i:int = 0; i < pc.perks.length; i++)
					{
						if (pc.perks[i].storageName == "Enhanced Dampeners")
						{
							var newSBurst:StorageClass = new StorageClass();
							newSBurst.storageName = "Static Burst";
							newSBurst.tooltip = "Grants the ability to briefly overload your shield emitter. The burst shocks any enemies in close proximity, freeing you from grapples for a small energy cost.";
							newPerks.push(newSBurst.getSaveObject());
						}
						else if (pc.perks[i].storageName == "Static Burst")
						{
							var newEnDamp:StorageClass = new StorageClass();
							newEnDamp.storageName = "Enhanced Dampeners";
							newEnDamp.tooltip = "Grants a 50% vulnerability reduction to damage absorbed by your shield generator.";
							newPerks.push(newEnDamp.getSaveObject());
						}
						else
						{
							newPerks.push(pc.perks[i]);
						}
					}
					
					pc.perks = newPerks;
				}
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 23 received data version " + data.version + " during a verification call. Wakka wakka.");
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