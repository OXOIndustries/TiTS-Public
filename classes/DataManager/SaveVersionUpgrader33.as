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
	public class SaveVersionUpgrader33 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 34;
		
		public function SaveVersionUpgrader33() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var pc:Object = data.characters["PC"];
			if(!pc.skinTone || pc.skinTone == undefined)
			{
				pc.skinTone = "black";
			}
			if(data.flags["DOLLMAKER_LATEX_SKIN"] != undefined && (!data.flags["DOLLMAKER_LATEX_SKIN"][3] || data.flags["DOLLMAKER_LATEX_SKIN"][3] == undefined))
			{
				data.flags["DOLLMAKER_LATEX_SKIN"][3] = "black";
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 33 received data version " + data.version + " during a verification call. Wakka wakka.");
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