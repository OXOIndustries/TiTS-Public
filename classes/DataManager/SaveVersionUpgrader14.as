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
	public class SaveVersionUpgrader14 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 15;
		
		public function SaveVersionUpgrader14() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var pc:Object = data.characters["PC"];
			
			if (pc.aimMod <= 0) pc.aimMod = 0;
			
			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 15 received data version " + data.version + " during a verification call. Wakka wakka.");
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