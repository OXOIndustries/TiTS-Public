package classes.UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import flash.events.Event;
	/**
	 * ...
	 * @author Gedan
	 */
	public class OptionsModule extends ContentModule
	{
		
		public function OptionsModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = true;
			_moduleName = "options";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

}