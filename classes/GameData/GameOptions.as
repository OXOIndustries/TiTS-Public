package classes.GameData 
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	/**
	 * ...
	 * @author Gedan
	 */
	public class GameOptions extends UnversionedSaveable
	{
		
		public function GameOptions() 
		{
			bustPriority = ["CHESIRE", "GATS"];
			bustsEnabled = true;
			bustFallbacks = true;
			easyMode = false;
			debugMode = false;
		}
		
		// Busts disabled
		public var bustsEnabled:Boolean;
		
		// Priority list of bust names
		public var bustPriority:Array;
		
		// Allow bust fallback images to be displayed
		public var bustFallbacks:Boolean;
		
		// Game mode settings
		
		// Easy
		public var easyMode:Boolean;
		
		// Debug
		public var debugMode:Boolean;
		
		// Silly
		public var sillyMode:Boolean;
		
	}

}