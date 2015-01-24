package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import flash.net.SharedObject;
	
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
			
			for (var i:int = 0; i < dEffects.length; i++)
			{
				if (dEffects[i].storageName != "Trip")
				{
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
				throw new VersionUpgraderError("Upgrader Version 18 recieved data version " + data.version + " during a verification call. Wakka wakka.");
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