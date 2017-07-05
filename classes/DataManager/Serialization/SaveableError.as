package classes.DataManager.Serialization 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class SaveableError extends Error
	{
		
		public function SaveableError(message:String, errorId:int = 1) 
		{
			super("Serialization Subsystem Error: " + message, errorId);
		}
		
	}

}