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
			_bustPriority = ["CHESIRE", "GATS"];
			_bustsDisabled = false;
			_bustFallbacks = true;
			_easyMode = false;
			_debugMode = false;
		}
		
		// Busts disabled
		private var _bustsDisabled:Boolean;
		public function get bustsDisabled():Boolean { return _bustsDisabled; }
		public function set bustsDisabled(v:Boolean):void { _bustsDisabled = v; }
		
		// Priority list of bust names
		private var _bustPriority:Array;
		public function get bustPriority():Array { return _bustPriority; }
		public function set bustPriority(v:Array):void { _bustPriority = v; }
		
		// Allow bust fallback images to be displayed
		private var _bustFallbacks:Boolean;
		public function get bustFallbacks():Boolean { return _bustFallbacks; }
		public function set bustFallbacks(v:Boolean):void { _bustFallbacks = v; }
		
		// Game mode settings
		
		// Easy
		private var _easyMode:Boolean;
		public function get easyMode():Boolean { return _easyMode; }
		public function set easyMode(v:Boolean):void { _easyMode = v; }
		
		// Debug
		private var _debugMode:Boolean;
		public function get debugMode():Boolean { return _debugMode; }
		public function set debugMode(v:Boolean):void { _debugMode = v; }
		
		// Silly
		private var _sillyMode:Boolean;
		public function get sillyMode():Boolean { return _sillyMode; }
		public function set sillyMode(v:Boolean):void { _sillyMode = v; }
		
	}

}