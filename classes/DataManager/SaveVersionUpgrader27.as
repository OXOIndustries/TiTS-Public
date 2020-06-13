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
	public class SaveVersionUpgrader27 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 28;
		
		public function SaveVersionUpgrader27() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			var c:Object = data.characters["PC"];
			
			// Update "Myr Venom" perk description
			for(var i:int = 0; i < c.perks.length; i++)
			{
				if (c.perks[i].storageName == "Myr Venom") c.perks[i].tooltip = "Grants a love-bite tease ability that deals a little lust damage to your opponent.";
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 27 received data version " + data.version + " during a verification call. Wakka wakka.");
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