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
	public class SaveVersionUpgrader32 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 33;
		
		public function SaveVersionUpgrader32() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			for (var k:* in data.characters)
			{
				this.upgradeChar(data.characters[k]);
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		private function upgradeChar(char:Object):void
		{
			delete char.eyeCount;
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 32 received data version " + data.version + " during a verification call. Wakka wakka.");
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