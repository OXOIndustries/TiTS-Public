package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import flash.net.SharedObject;
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader1 implements ISaveVersionUpgrader 
	{
		public function SaveVersionUpgrader1() 
		{
			throw new VersionUpgraderError("SaveVersionUpgrader1 should never be instantiated. Bad luck bro.");
		}
		
		/**
		 * Do the needful with the incoming data to transition from V1 -> V2
		 * @param	data
		 * @return
		 */
		public static function upgrade(data:Object):Object
		{
			if (data.version != 1)
			{
				throw new VersionUpgraderError("Upgrader Version 1 recieved data version " + data.version + " during an upgrade call. Bad luck bro.");
			}
			
			data.minVersion = 1;
			
			return data;
		}
		
		/**
		 * Provide a verification method to ensure the data in the input object is as-expected
		 * @param	data
		 * @return
		 */
		public static function verify(data:Object):Boolean
		{
			if (data.version != 2)
			{
				throw new VersionUpgraderError("Upgrader Version 1 recieved data version " + data.version + " during a verification call. Wakka wakka.");
				return false;
			}
			
			if (data.minVersion == undefined || data.minVersion != 1)
			{
				throw new VersionUpgraderError("MinVersion invalid!");
				return false;
			}
			
			return true;
		}
		
	}

}