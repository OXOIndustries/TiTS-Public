package classes.UIComponents 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ContentModule extends Sprite
	{
		protected var _moduleName:String;
		
		public function get moduleName():String { return _moduleName; }
		
		// Determine which other parts of the UI a given content module operates with.
		private var _leftBarEnabled:Boolean;
		private var _rightBarEnabled:Boolean;
		private var _fullButtonTrayEnabled:Boolean;
		private var _minimalButtonTrayEnabled:Boolean;
		
		public function get leftBarEnabled():Boolean { return _leftBarEnabled; }
		public function set leftBarEnabled(v:Boolean):void { _leftBarEnabled = v; }
		
		public function get rightBarEnabled():Boolean { return _rightBarEnabled; }
		public function set rightBarEnabled(v:Boolean):void { _rightBarEnabled = v; }
		
		public function get fullButtonTrayEnabled():Boolean { return _fullButtonTrayEnabled; }
		public function set fullButtonTrayEnabled(v:Boolean):void { _fullButtonTrayEnabled = v; _minimalButtonTrayEnabled = !v; }
		
		public function get minimalButtonTrayEnabled():Boolean { return _minimalButtonTrayEnabled; }
		public function set minimalButtonTrayEnabled(v:Boolean):void { _minimalButtonTrayEnabled = v; _fullButtonTrayEnabled = !v; }
		
		public function ContentModule() 
		{
			
		}
		
		public function hiddenFromStage():void
		{
			
		}
	}
}