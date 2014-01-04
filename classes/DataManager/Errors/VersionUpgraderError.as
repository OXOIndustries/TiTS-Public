package classes.DataManager.Errors 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class VersionUpgraderError extends Error
	{
		
		public function VersionUpgraderError(message:String, errorID:int = 0) 
		{
			super(message, errorID);
		}
		
	}

}