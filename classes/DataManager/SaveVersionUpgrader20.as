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
	public class SaveVersionUpgrader20 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 21;
		
		public function SaveVersionUpgrader20() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			if (data.flags["KRESSIA_SHUTTLE_UNLOCKED"] == 1)
			{
				delete data.flags["KRESSIA_SHUTTLE_UNLOCKED"];
				
				var ko:Object = { };
				
				ko.classInstance = "classes::StorageClass"
				ko.combatOnly = false;
				ko.hidden = true;
				ko.iconName = "";
				ko.minutesLeft = 0;
				ko.storageName = "Kressia Pass";
				ko.tooltip = "";
				ko.value1 = 0;
				ko.value2 = 0;
				ko.value3 = 0;
				ko.value4 = 0;
				
				data.characters.PC.keyItems.push(ko);
				
				data.characters.PC.keyItems.sortOn("storageName", Array.CASEINSENSITIVE);
			}
			
			data.version = 21;
			data.minVersion = 21;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 20 received data version " + data.version + " during a verification call. Wakka wakka.");
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