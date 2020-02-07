package classes.DataManager 
{
	import classes.Characters.PlayerCharacter;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import flash.net.SharedObject;
	import classes.GLOBAL;
	import classes.Util.InCollection;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader15 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 16;
		
		public function SaveVersionUpgrader15() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var pc:Object = data.characters["PC"];
			
			if (pc.lipMod <= 0) pc.lipMod = 0;
			
			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 16 received data version " + data.version + " during a verification call. Wakka wakka.");
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