package classes.GameData 
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.Resources.NPCBustImages;
	/**
	 * ...
	 * @author Gedan
	 */
	public class GameOptions extends UnversionedSaveable
	{
		public function GameOptions() 
		{
			primaryBustArtist = "ADJATHA";
			secondaryBustArtist = "SHOU";
			configuredBustPreferences = { };
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
		
		public var primaryBustArtist:String = "SHOU";
		public var secondaryBustArtist:String = "ADJATHA";
		
		// p. much a key=>value store of bust name -> artist set
		public var configuredBustPreferences:Object;
		
		// Busts disabled
		public var bustsEnabled:Boolean;
		
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
