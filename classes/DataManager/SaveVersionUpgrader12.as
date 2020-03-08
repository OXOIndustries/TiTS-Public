package classes.DataManager 
{
	import classes.Characters.PlayerCharacter;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.GameData.GameOptions;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader12 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 13;
		
		public function SaveVersionUpgrader12() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var newArray:Array = new Array();
			for (var i:int = 0; i < data.characters["PC"].statusEffects.length; i++)
			{
				if (data.characters["PC"].statusEffects[i].storageName != "Saendra Fights4Buttes")
				{
					newArray.push(data.characters["PC"].statusEffects[i]);
				}
			}
			
			data.characters["PC"].statusEffects = newArray;
			
			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			return this.verify(data); // Do sfa with the bool, we're gonna catch the throw exception in DataManager
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 13 received data version " + data.version + " during a verification call. Wakka wakka.");
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