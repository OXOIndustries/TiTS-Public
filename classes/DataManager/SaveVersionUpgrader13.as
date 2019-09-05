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
	public class SaveVersionUpgrader13 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 14;
		
		public function SaveVersionUpgrader13() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			for each (var char:Object in data.characters)
			{
				checkItems(char);
				checkLegFlags(char);
			}
			
			data.version = this._newVersionValue;
			data.minVersion = this._newVersionValue;
			
			return this.verify(data);
		}
		
		private function checkItems(char:Object):void
		{
			if (char.meleeWeapon.classInstance == "classes.Items.Miscellaneous::Empty")
				char.meleeWeapon.classInstance = "classes.Items.Miscellaneous::EmptySlot";
				
			if (char.rangedWeapon.classInstance == "classes.Items.Miscellaneous::Empty")
				char.rangedWeapon.classInstance = "classes.Items.Miscellaneous::EmptySlot";
				
			if (char.armor.classInstance == "classes.Items.Miscellaneous::Empty")
				char.armor.classInstance = "classes.Items.Miscellaneous::EmptySlot";
				
			if (char.upperUndergarment.classInstance == "classes.Items.Miscellaneous::Empty")
				char.upperUndergarment.classInstance = "classes.Items.Miscellaneous::EmptySlot";
				
			if (char.lowerUndergarment.classInstance == "classes.Items.Miscellaneous::Empty")
				char.lowerUndergarment.classInstance = "classes.Items.Miscellaneous::EmptySlot";
				
			if (char.accessory.classInstance == "classes.Items.Miscellaneous::Empty")
				char.accessory.classInstance = "classes.Items.Miscellaneous::EmptySlot";
				
			if (char.shield.classInstance == "classes.Items.Miscellaneous::Empty")
				char.shield.classInstance = "classes.Items.Miscellaneous::EmptySlot";
		}
		
		private function checkLegFlags(char:Object):void
		{
			if (char.legCount == 2)
			{
				if (InCollection(char.legType, GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_SUCCUBUS, GLOBAL.TYPE_BEE))
				{
					if (!InCollection(GLOBAL.FLAG_PLANTIGRADE, char.legFlags) && !InCollection(GLOBAL.FLAG_DIGITIGRADE, char.legFlags))
					{
						char.legFlags.push(GLOBAL.FLAG_PLANTIGRADE);
					}
				}
				
				if (InCollection(char.legType, GLOBAL.TYPE_NAGA, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_BOVINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_VULPINE,  GLOBAL.TYPE_LAPINE, GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_KANGAROO, GLOBAL.TYPE_TANUKI, GLOBAL.TYPE_DEER, GLOBAL.TYPE_PANDA, GLOBAL.TYPE_KUITAN))
				{
					if (!InCollection(GLOBAL.FLAG_DIGITIGRADE, char.legFlags) && !InCollection(GLOBAL.FLAG_PLANTIGRADE, char.legFlags))
					{
						char.legFlags.push(GLOBAL.FLAG_DIGITIGRADE);
					}
				}
			}
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 14 received data version " + data.version + " during a verification call. Wakka wakka.");
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