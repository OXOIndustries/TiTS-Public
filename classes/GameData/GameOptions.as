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
			bustPriority = ["ADJATHA", "CHESHIRE", "SHOU", "NOTGATS", "GATS", "OLDGATS"];
			bustsEnabled = true;
			bustFallbacks = true;
			easyMode = false;
			sillyMode = false;
			debugMode = false;
			fontSize = 18;
			combineDamageValueOutput = false;
			colourDamageValueOutput = true;
			saveNotesToggle = true;
			overwriteToggle = true;
			authorToggle = true;
			vendorToggle = true;
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
		
		// Text Settings
		
		// FontSize
		public var fontSize:int;
		
		public var combineDamageValueOutput:Boolean;
		public var colourDamageValueOutput:Boolean;
		public var saveNotesToggle:Boolean;
		public var overwriteToggle:Boolean;
		public var authorToggle:Boolean;
		public var vendorToggle:Boolean;
	}

}
