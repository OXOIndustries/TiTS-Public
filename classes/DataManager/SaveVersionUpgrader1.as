package classes.DataManager 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveVersionUpgrader1 implements ISaveVersionUpgrader 
	{
		
		public function SaveVersionUpgrader1() 
		{
			
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
				throw new VersionUpgraderError("Upgrader Version 1 recieved data version " + data.version);
			}
		}
		
	}

}